<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>문제</title>
<link rel="shortcut icon" type="image/x-icon" href="/resources/img/favicon.png">
<style>
.modal-header, h4, .close {
  background-color: #5cb85c;
  color:white !important;
  text-align: center;
  font-size: 30px;
}
.modal-footer {
  background-color: #f9f9f9;
}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var storage = [];
	var i = 1;
	$("form").submit(function(e){
		
		$("#myModal").modal("hide");
		
		
	});
	
	
	$("#edit button:button").on("click", function(){
		$("#update").addClass("disabled");
		$("#delete").addClass("disabled");
		switch ($("#edit button:button").index(this)) {
		case 0: // 추가 버튼 클릭 이벤트
			createEvent();
			break;
		case 1: // 수정 버튼 클릭 이벤트
			console.log($("#edit button:button").index(this));
			editEvent("update");
			break;
		case 2: // 삭제 버튼 클릭 이벤트
			editEvent("delete");
			break;
		default: // 나머지 case가 발생한 경우 경고 내용 알려주는 이벤트
			alert("오류가 발생 하였습니다.");
			break;
		}
	});
	
	/************************************************************************************************
	 * @공통 부분
	 * createHtml()    : 리스트 내용 화면에 출력 하기 위한 함수
	 * createEvent()   : 추가 클릭 했을때 "입력하세요." 입력창의 내용을 저장하기 위한 함수
	 * editEvent()     : 수정 및 삭제를 클릭 했을 때 이벤트 처리 하는 함수
	 * checkboxIndex() : 체크박스 중 선택 되었는지 확인 후 true면 해당 index값 리턴하고 false면 -1 값을 받기 위한 함수
	 * set()           : localStorage.setItem()을 이용하여 데이터를 입력하기 위한 함수
	 * get()           : localStorage.getItem()을 이용하여 저장 되어 있는 데이터를 가져오기 위한 함수
	 ************************************************************************************************/
	
	function createHtml(){
		get();
		$("tbody").empty();
		$("#text").val("");
		for(var j = 0; j < storage.length; j++){
			var tag = '<tr>' +
					    '<td><input type="checkbox"></td>' +
					    '<td>' + (j+1) + '</td>' +
							'<td>' + storage[j].text + '</td>' +
					  '</tr>';
					  
			$("tbody").append(tag);		  
		}
		
		
		if(storage.length > 0){
			i = storage.length + 1;
			
			$("input:checkbox").off();
			$("input:checkbox").click(function(){ // 리스트에 있는 체크박스의 이벤트 처리
				$("button:button").removeClass("disabled");
				var index = $("input:checkbox").index(this);
				var tr = $("tbody tr").eq(index);
				var tds = tr.find("td");
				var text = "";
				
				if($(this).prop("checked")){ // 현재 선택한 체크박스의 값이 true인지 확인
					$("input:checkbox").prop("checked",false); // 전체 체크박스의 값을 false로 변경
					$(this).prop("checked",true); // 현재 선택한 체크박스의 값만 true로 변경
					
					text = tds.eq(2).text();
					$("#text").val(text);
				}else{
					$("input:checkbox").prop("checked",false); // 전체 체크박스의 값을 false로 변경
					
					$("#text").val("");
				}
			});
		}else {
			i = 1;
		}
	}
	 
	function createEvent(){ // 추가버튼 누를시 이벤트 생성 부분!!
		var text = $("#text").val();
		if(text){
			var newData = {"no": i, "text": text};
			storage.push(newData);
			set(storage);
			createHtml();
			$("#text").val("");
		}else{
			alert("한줄평 입력 후 다시 시도해주세요.");
		}
	}

	function editEvent(type){
		var index = checkboxIndex();
		if(index > -1){
			if(type == "update"){
				var newData = storage[index];
				var text = $("#text").val();
				
				newData.text = text;
				console.log("변경데이터"+newData.text);
				storage[index] = newData;
				console.log(storage[index]);
				createHtml();
			}else if(type == "delete"){
				storage.splice(index, 1);
				createHtml();
			}
			set(storage);
			console.log(storage[0]);
		}else{
			alert("선택 후 다시 시도해주세요.");
		}
	}

	function checkboxIndex(){
		var index = -1;
		for(var i = 0; i < $("input:checkbox").length; i++){
			if($("input:checkbox").eq(i).prop("checked")){
				index = i;
				break;
		    }
		}
		return index;
	}

	function set(data){
		localStorage.setItem("data", JSON.stringify(data));
	}

	function get(){
		if(JSON.parse(localStorage.getItem("data"))){
			storage = JSON.parse(localStorage.getItem("data"));
		}
	}
	
	createHtml();
});
</script>
</head>
<body>
<div class="container">
	<h3>웹 문제</h3>
	<p>
		위의 버튼 3개만 이용하여 추가, 수정, 삭제 이벤트를 구현 하시오.<br>
		1) 추가 : "입력하세요" 입력창을 이용하여 데이터 생성 할 것.<br>
		2) 수정 : 선택(체크박스)를 선택된 내용만 "입력하세요" 입력창으로 데이터를 가져온 후 수정 할 것.<br>
		3) 삭제 : 선택(체크박스)를 선택된 내용만 데이터를 삭제 할 것<br>
		4) 유저 : 추가 시 사용자가 누군지 myModal를 이용하여 정보를 받아서 데이터 처리 하시오.<br>
		5) 기능 : localStorage 에서 처리 하던 부분를 Spring (Controller)를 이용하여 처리하시오.<br>
		참조 : 체크박스 이벤트는 위에 있는 script의 이벤트를 같이 이용하여 처리 할것.
	</p>
</div>
<div class="container">
	<h1 class="text-center">구디아카데미</h1>
	<form id="edit">
	  <div class="form-group row">
	    <div class="col-xs-2">
	    	<label for="text">한줄평  :</label>
	    </div>
	    <div class="col-xs-7">
	    	<input type="text" class="form-control" id="text" name="text" placeholder="입력하세요." autocomplete="off">
	    </div>
	    <div class="col-xs-1">
	    	<button type="button" class="btn btn-primary" id="submit">추가</button>
	    </div>
	    <div class="col-xs-1">
	    	<button type="button" class="btn btn-success disabled" id="update">수정</button>
	    </div>
	    <div class="col-xs-1">
	    	<button type="button" class="btn btn-danger disabled" id="delete">삭제</button>
	    </div>
	  </div>
	</form>
</div>
<div class="container">
	<table class="table table-striped">
	  <thead>
	    <tr>
	      <th>선택</th>
	      <th>번호</th>
	      <th>한줄평</th>
	    </tr>
	  </thead>
	  <tbody>
	    <tr>
	      <td><input type="checkbox"> </td>
	      <td>1</td>
	      <td>JQuery 너무 어렵 ;)</td>
	    </tr>
	    <tr>
	      <td><input type="checkbox"> </td>
	      <td>2</td>
	      <td>LocalStorage 너무 좋아 :)</td>
	    </tr>
	  </tbody>
	</table>
</div>
<!-- Modal -->
<div class="container">
  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4><span class="glyphicon glyphicon-lock"></span> Login</h4>
        </div>
        <div class="modal-body" style="padding:40px 50px;">
          <form role="form">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Username</label>
              <input type="text" class="form-control" id="usrname" placeholder="Enter email" required="required" autocomplete="off">
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="text" class="form-control" id="psw" placeholder="Enter password" required="required" autocomplete="off">
            </div>
              <button type="submit" id="login" class="btn btn-success btn-block"><span class="glyphicon glyphicon-off"></span> Login</button>
          </form>
        </div>
      </div>
      
    </div>
  </div> 
</div>
</body>
</html>