<?php
	if ($_POST) {
		$ids = $_POST["ids"];
		for ($idx = 0; $idx < count($ids); $idx+=1) {
			$id = $ids[$idx];
			$ordinal = $idx;
			//...
		}
		return;
	}
?>
<!DOCTYPE html>

<html>
<head>
    <title>DragSort Example</title>
	<meta charset="utf-8" />
	<style type="text/css">
		body { font-family:Arial; font-size:12pt; padding:20px; width: 800px; margin:20px auto; border:solid 1px black; }
		h1 { font-size:16pt; }
		h2 { font-size:13pt; }
		ul { width:350px; list-style-type: none; margin:0px; padding:0px; }
		li { float:left; padding:5px; width:100px; height:100px; }
		li div { width:90px; height:50px; border:solid 1px black; background-color:#E0E0E0; text-align:center; padding-top:40px; }
		.placeHolder div { background-color:white!important; border:dashed 1px gray !important; }
	</style>
</head>
<body>
    <div>
        <script type="text/javascript" src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        
		<h1>jQuery List DragSort PHP Example</h1>
	    
	    <br/>
        
        <h2>Save list order with ajax:</h2>
        
        <ul id="gallery">
			<?php
				$list = array("blue", "orange", "brown", "red", "yellow", "green", "black", "white", "purple");
				for ($idx = 0; $idx < count($list); $idx+=1) {
					echo "<li data-itemid='" . $idx . "'>";
					echo "<div>" . $list[$idx] . "</div>";
					echo "</li>";
				}
			?>
		</ul>
		
		<script type="text/javascript" src="jquery.dragsort-0.5.2.min.js"></script>
		<script type="text/javascript">
		    $("#gallery").dragsort({ dragSelector: "div", dragEnd: saveOrder, placeHolderTemplate: "<li class='placeHolder'><div></div></li>" });

		    function saveOrder() {
				var data = $("#gallery li").map(function() { return $(this).data("itemid"); }).get();
		        $.post("example.php", { "ids[]": data });
		    };
	    </script>
        
        <div style="clear:both;"></div>
    </div>
</body>
</html>
