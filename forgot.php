<?php
/// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

require_once(dirname(__FILE__) . "/includes/funcLib.php");
require_once(dirname(__FILE__) . "/includes/funcMail.php");
require_once(dirname(__FILE__) . "/includes/MySmarty.class.php");
$smarty = new MySmarty();
$opt = $smarty->opt();

if (isset($_POST["action"]) && $_POST["action"] == "forgot") {
	$username = $_POST["username"];

	try {
		// make sure that username is valid 
		$stmt = $smarty->dbh()->prepare("SELECT email FROM {$opt["table_prefix"]}users WHERE username = ?");
		$stmt->bindParam(1, $username, PDO::PARAM_STR);
			
		$stmt->execute();
		if ($row = $stmt->fetch()) {
			$email = $row["email"];
		
			if ($email == "")
				$error = "The username '" . $username . "' does not have an e-mail address, so the password could not be sent.";
			else {
                $pwd = generateStrongPassword($opt["password_length"]);
                $hashPwd = generateHashedPassword($pwd, $opt["password_hasher"]);
				$stmt = $smarty->dbh()->prepare("UPDATE {$opt["table_prefix"]}users SET password = ? WHERE username = ?");
				$stmt->bindParam(1, $hashPwd, PDO::PARAM_STR);
				$stmt->bindParam(2, $username, PDO::PARAM_STR);

                $stmt->execute();
                sendMail($opt["email_reply_to"],$email,"Gift Registry password reset",sprintf("Your Gift Registry account information:\r\nYour username is '%s' and your new password is '%s'",$username,$pwd),$opt);
			}
		}
		else {
			$error = "The username '" . $username . "' could not be found.";
		}

		if (!empty($error)) {
			$smarty->assign('error', $error);
		}
		$smarty->assign('action', $_POST["action"]);
		$smarty->assign('username', $username);
		$smarty->display('forgot.tpl');
	}
	catch (PDOException $e) {
		die("sql exception: " . $e->getMessage());
	}
}
else {
	$smarty->display('forgot.tpl');
}
?>
