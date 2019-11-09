{*
This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*}

<!DOCTYPE html>
<html lang="en">
<head>
	<title>Gift Registry - My Items</title>
 	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="js/jquery.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script>
    <link href="lightbox/css/jquery.lightbox-0.5.css" rel="stylesheet">
    <script src="lightbox/js/jquery.lightbox-0.5.min.js"></script>

    <script language="JavaScript" type="text/javascript">
        function printPage() {
            window.print();
        }

        $(document).ready(function() {
            $('a[rel=lightbox]').lightBox({
                imageLoading: 'lightbox/images/lightbox-ico-loading.gif',
                imageBtnClose: 'lightbox/images/lightbox-btn-close.gif',
                imageBtnPrev: 'lightbox/images/lightbox-btn-prev.gif',
                imageBtnNext: 'lightbox/images/lightbox-btn-next.gif'
            });
            $('a[rel=popover]').removeAttr('href').popover();
        });
	</script>
</head>
<body>
	{include file='navbar.tpl' isadmin=$isadmin}

	 <div class="container" style="padding-top: 60px;">
	 	{if $opt.show_helptext}
			<div class="row">
				<div class="col-md-12">
					<div class="alert alert-info">
						<ul>
							<li>You can click the column headers to sort by that attribute.</li>
							<li>Once you've bought or decided not to buy an item, remember to return to the recipient's gift lists and mark it accordingly.</li>
							<li><strong>Please login to the Gift Registry site to get the most recent version of this list.</strong></li>
							<li>For better printing results, please change your print orientation to "Landscape" mode.</li>
						</ul>
					</div>
				</div>
			</div>
		{/if}

		<div class="row">
			<div class="col-md-12">
				<div class="well">
					<h1>My Items</h1>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th><a href="mylist.php?sort=ranking">Ranking</a></th>
								<th><a href="mylist.php?sort=source">Source</a></th>
								<th><a href="mylist.php?sort=description">Description</a></th>
								<th><a href="mylist.php?sort=category">Category</a></th>
								<th><a href="mylist.php?sort=price">Price</a></th>
								<th>&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$shoplist item=row}
								<tr>
									<td>{$row.rendered}</td>
									<td>{$row.source|escape:'htmlall'}</td>
									<td>
                                        {$row.description|escape:'htmlall'}
                                        {if $row.comment != ''}
                                            <a class="glyphicon glyphicon-comment no-color" rel="popover" href="#" data-placement="right" data-trigger="hover" data-original-title="Comment" data-content="{$row.comment|escape:'htmlall'}"></a>
                                        {/if}
                                        {if $row.url != ''}
                                            <a class="glyphicon glyphicon-link no-color" href="{$row.url|escape:'htmlall'}" target="_blank"></a>
                                        {/if}
                                        {if $row.image_filename != '' && $opt.allow_images}
                                            <a class="glyphicon glyphicon-picture no-color" rel="lightbox" href="{$opt.image_subdir}/{$row.image_filename}" title="{$row.description|escape:'htmlall'}"></a>
                                        {/if}
                                    </td>
									<td>{$row.category|escape:'htmlall'}</td>
									<td>{$row.price}</td>
									<td align="right" nowrap>
                            			<a href="receive.php?itemid={$row.itemid}"><img alt="Mark Item Received" src="images/return.png" border="0" title="Mark Item Received" /></a>&nbsp;
                            			<a href="item.php?zone=mylist&action=edit&itemid={$row.itemid}"><img alt="Edit Item" src="images/pencil.png" border="0" title="Edit Item" /></a>&nbsp;
                            			<a rel="confirmitemdelete" data-content="{$row.description|escape:'htmlall'}" href="item.php?zone=mylist&action=delete&itemid={$row.itemid}"><img alt="Delete Item" src="images/bin.png" border="0" alt="Delete" title="Delete Item" /></a>
                        			</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
					<h5>{$itemcount} item(s), {$totalprice} total.</h5>
					<h5><a href="item.php?zone=mylist&action=add">Add a new item</a></h5>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-md-6">
				<div class="well">
					<a onClick="printPage()" href="#">Send to printer</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
