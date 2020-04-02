<%@ Page Language="C#" AutoEventWireup="true" CodeFile="example.aspx.cs" Inherits="example" %><!DOCTYPE html>

<html>
<head runat="server">
    <title>DragSort Example</title>
	<meta charset="utf-8" />
	<style type="text/css">
		body { font-family:Arial; font-size:12pt; padding:20px; width: 800px; margin:20px auto; border:solid 1px black; }
		h1 { font-size:16pt; }
		h2 { font-size:13pt; }
		ul { width:350px; list-style-type: none; margin:0px; padding:0px; }
		li { float:left; padding:5px; width:100px; height:100px; }
		li div { width:90px; height:50px; border:solid 1px black; background-color:#E0E0E0; text-align:center; padding-top:40px; }
		.placeHolder div { background-color:white !important; border:dashed 1px gray !important; }
	</style>
</head>
<body>
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<form id="form1" runat="server">
    <div>
        
        <h1>jQuery List DragSort ASP.NET Example</h1>
	    
	    <a href="https://github.com/agavazov/dragsort/">Homepage</a><br/>
	    <br/>
        
        <h2>Save list order with ajax:</h2>
        
        <ul id="gallery">
            <asp:Repeater ID="Gallery" runat="server">
                <ItemTemplate>
                    <li data-itemid='<%# Container.ItemIndex %>'>
                        <div><%# Container.DataItem %></div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
		</ul>
		
		<script type="text/javascript" src="jquery.dragsort-0.5.2.min.js"></script>
		<script type="text/javascript">
		    $("#gallery").dragsort({ dragSelector: "div", dragEnd: saveOrder, placeHolderTemplate: "<li class='placeHolder'><div></div></li>" });
            
		    function saveOrder() {
				var data = $("#gallery li").map(function() { return $(this).data("itemid"); }).get();
				$.ajax({ url: "example.aspx/SaveListOrder", data: '{ids:["' + data.join('","') + '"]}', dataType: "json", type: "POST", contentType: "application/json; charset=utf-8" });
		    };
	    </script>
        
        <div style="clear:both;"></div>
    </div>
    </form>
</body>
</html>
