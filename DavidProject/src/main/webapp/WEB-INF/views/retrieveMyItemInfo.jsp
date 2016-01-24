<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>  
<html>
<head>
<title>MyPage</title>
<script type="text/javascript" src="./resources/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="./resources/lib/RGraph.common.core.js"></script>
<script type="text/javascript" src="./resources/lib/RGraph.common.dynamic.js"></script>
<script type="text/javascript" src="./resources/lib/RGraph.common.tooltips.js"></script>
<script type="text/javascript"src="./resources/lib/RGraph.pie.js"></script>
<style>
article{border:1px solid black;}
.dashboard1{position:fixed;top:100px;left:200px;width:450px;height:250px;border:1px solid #aaaaaa;}
.dashboard2{position:fixed;top:100px;left:750px;width:450px;height:250px;border:1px solid #aaaaaa;}
.dashboard3{position:fixed;top:400px;left:200px;width:450px;height:250px;border:1px solid #aaaaaa;}
.dashboard4{position:fixed;top:400px;left:750px;width:450px;height:250px;border:1px solid #aaaaaa;}
.myItemList{margin : 5px;/* border:1px solid black; */}
.myItemStatic{margin : 5px/* ; border:1px solid black */}
table{margin : 15px;}
th {border: 1px solid black;background-color:gray;}
td {border: 1px solid black;}
table tr:hover {background-color:orange;}
</style>

</head>

<body onload="fnLoad()">
	<article>
		<div id="dashboard1" class="dashboard1" ondrop="drop(event)" ondragover="allowDrop(event)" >
			<div id="myItemList" class="myItemList" draggable="true" ondragstart="drag(event)"></div>
		</div>
		<div id="dashboard2" class="dashboard2" ondrop="drop(event)" ondragover="allowDrop(event)" >
			<canvas id="myItemStatic" class="myItemStatic" draggable="true" ondragstart="drag(event)" width="250" height="200">
			</canvas>
		</div>
			
		<div id="dashboard3" class="dashboard3" ondrop="drop(event)" ondragover="allowDrop(event)" ></div>
		<div id="dashboard4" class="dashboard4" ondrop="drop(event)" ondragover="allowDrop(event)" ></div>
	</article> 
</body>

<script>
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("source", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("source");
    ev.target.appendChild(document.getElementById(data));
}

function fnLoad(){
	
	var sendInfo = {
	 		userId: "david",
	        pwd: "1234",
	     };
	
	
	$.ajax({
		type : "GET"
		, dataType : "json"
		, data : sendInfo
		, url : "retrieveItemInfo.do"
		, success : function(data){
			//alert("성공:"+data);
			var ItemList=data;            
             
            var myItemList = document.getElementById("myItemList");
         	myItemList.innerHTML = '';	
         	var html = "<table>";
         	html += "<tr><th>ItemNo</th><th>ItemName</th><th>Price</th><th>2nd-Price</th><th>Rate</th></tr>";
         	
         	for(var i in ItemList)
            {
         		html +='<tr><td>'+ItemList[i].itemNo+'</td><td>'+ItemList[i].itemName+'</td><td>'+ItemList[i].price+'</td><td>'+ItemList[i].scndprice+'</td><td>'+ItemList[i].rate
         		+'</td></tr>';
            }
            
         	html += "</table>";
         	myItemList.innerHTML += html;
		}
		, error:function(request, status, error){
			alert("실패:" + request.status + "\n" + "error" + error);
		}
	});
	
	 var data = [564,155,499,611,322];
	    
     var pie = new RGraph.Pie({
         id: 'myItemStatic',
         data: data,
         options: {
             labels: ['Abc', 'Def', 'Ghi', 'Jkl', 'Mno'],
             linewidth: 2,
             strokestyle: 'white'
         }
     }).draw();
}
</script>

</html> 










