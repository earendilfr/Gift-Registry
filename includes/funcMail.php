<?php
// This program is free software; you can redistribute it and/or modify
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

function sendMail($sender,$recipient,$title,$message,$opt) {
    if (strtolower($opt["email_type"] | '') === "smtp") {
        require_once "Mail.php";
		$smtp_params = array('host' => $opt["email_smtp_host"] | 'localhost');
		if ($opt["email_smtp_auth"] == "yes") {
			$smtp_params['auth'] = true;
			$smtp_params['username'] = $opt["email_smtp_username"] | '';
			$smtp_params['password'] = $opt["email_smtp_password"] | '';
		} else {
			$smtp_params['auth'] = false;
		}
		$smtp = Mail::factory('smtp',$smtp_params);
		$ret = $smtp->send($recipient,
			array(
				'From' => $opt["email_from"],
				'Reply-To' => $sender,
				'X-Mailer' => $opt["email_xmailer"],
				'To' => $recipient,
				'Subject' => $title),
			$message);
        if (PEAR::isError($ret)) {
            error_log("Mail not accepted for " . $recipient . ": ".$ret->getMessage());
            die("Mail not accepted for " . $recipient);
        }
	} else {
		mail(
			$recipient,
			$title,
			$message,
			"From: {$opt["email_from"]}\r\nReply-To: " . $sender . "\r\nX-Mailer: {$opt["email_xmailer"]}\r\n"
		) or die("2:Mail[".$opt["email_type"]."] not accepted for " . $recipient);
	}
}
