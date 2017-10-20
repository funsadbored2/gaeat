<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
    <title>Profile - Bootsnipp.com</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
        
    <link href="${pageContext.request.contextPath}/assets/jqueryui/jquery-ui.min.css"  rel="stylesheet" type="text/css">
	
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
    <script type = "text/javascript" src ="${pageContext.request.contextPath}/assets/jqueryui/jquery-ui.min.js"></script>
    <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    
  	
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> 
 	<style type="text/css">
 	
 	
 	@font-face{
	font-family:'squareRoundEB';
	src:url(${pageContext.request.contextPath}/assets/fonts/NanumSquareRoundEB.ttf) format('truetype') ;
	}

	@font-face{
		font-family:'squareRoundL';
		src:url(${pageContext.request.contextPath}/assets/fonts/NanumSquareRoundL.ttf) format('truetype') ;
	}
     .col-lg-3 ,.control-label  {
     font-family:'squareRoundEB'
     size: 20px;
   	 color: #44623e;
     margin-top:10px;
     }  
     .col-lg-8,.form-group{
      font-family:'squareRoundL';
      font-size:20px;
     margin-top:10px;
     
     } 
     
     .img-circle{
     border:1px solid #44623e; 
     border-radius:100px;
     padding:5px;
     }
     h1{
      font-family:'squareRoundEB'
     }
    input[type=file] {
    margin-top:50px;
	font-family:'squareRoundL';
	font-size:20px;
	color:#8d9679;
	background-color: transparent;
	border:1px solid transparent; 
	}
	input[type=text] {
	font-family:'squareRoundL';
	font-size:20px;

	border:1px solid #b4bbb2; 
	}
	.lookdislikebtn{
	width:475px;margin-bottom:5px;background-color:#b6c98f;border:0px;color:#fafcf9
	}
	input[type=button] {
	font-family:'squareRoundL';
	background-color:#b6c98f;
	border:1px solid #b4bbb2; 
	color:#fafcf9;
	}
	input[type=submit] {
	font-family:'squareRoundL';
	width:150px;
	margin-bottom:20px ;
	margin-top:60px ;
	background-color:#8d9679;
	border:0px;
	color:#fafcf9;
	margin-left:79%
	}
	
	.disableinput {
   color:#852706 !important;
   background-color:#ffffff !important;
   border:1px solid #852706 !important; 
}
    </style>
</head>
<body>
<c:import url="/WEB-INF/views/includes/headNav.jsp"></c:import>


	
	<div class="container" style="padding-top: 60px;margin-bottom:150px">
	  <h1 class="page-header" style="font-family:'squareRoundEB'">내 정보 수정 </h1>
	  <div class="row">
	    <!-- left column -->
	   <form id="join-form" name="joinForm" method="post" action="${pageContext.request.contextPath}/user/modifyUser" enctype="multipart/form-data" >
	 		<div class="col-md-4 col-sm-6 col-xs-12">
	      		<div class="text-center" >
					<!--세션에있는 프로필사진 / 바꿀이미지 보여질 이미지 창 -->
					<h6>바꿀 프로필 사진을 선택 하세요 . </h6>
					<div id="image_preview1" >
					<img src="${authUser.profile}" width="150" class=" img-circle" alt="avatar" >
					</div>
					<div >
					
		        	<input type="file" class="text-center center-block well well-sm upload" id="images" name = "file"  onchange="preview_images1();">
					</div>
		        	
		        	
	      		</div>
	   		</div>
	   	<input type="text"  name="socialcheck" style="display:none" value="${authUser.socialcheck}">
	  	<input type="text"  name="Id" style="display:none" value="${authUser.id}">
	  	<input type="text"  name="chef_no" style="display:none" value="${authUser.chef_no}">
	  	<input type="text"  name="profile" style="display:none" value="${authUser.profile}">
	   	<!-- edit form column -->
	    <div class="col-md-8 col-sm-6 col-xs-12 personal-info">
	     	<div class="alert alert-info alert-dismissable" style=" color: #3f3f35;
    background-color: #e8e7d5;
    border-color: #e8e7d5;width:700px;font-family:'squareRoundEB';font-size:18px">
	        	<a class="panel-close close" data-dismiss="alert">×</a> 
	       		<i class="fa fa-coffee"></i>
	     	  	 소셜 회원 (kakao/facebook) 은 email/password 변경이 불가능 합니다. 
	     	 </div>
	       			<div class="form-group">
		          		<label class="col-lg-3 control-label">Email :</label>
		          		<div class="col-lg-8">
		            	<input class="form-control disableinput" value="${authUser.id}" type="text" disabled>
		            	
		         		 </div>
		       		</div>
		        	
					<c:choose>
						<c:when test="${authUser.socialcheck=='s'}">
						<div class="form-group">
						          <label class="col-lg-3 control-label">password:</label>
						          <div class="col-lg-8">
						            <input class="form-control disableinput"name="password" value="소셜 회원은 비밀번호를 변경하실수 없습니다." type="text" disabled>
						          </div>
						        </div>
						</c:when>
						<c:otherwise>
					        <div class="form-group">
					          <label class="col-lg-3 control-label">password:</label>
					          <div class="col-lg-8">
					            <input class="form-control"name="password" value="" type="text"   required="required">
					          </div>
					        </div>
						</c:otherwise>
					</c:choose>
			        <div class="form-group">
			          <label class="col-lg-3 control-label">UserName :</label>
			          <div class="col-lg-8">
			            <input class="form-control"name="name" value="${authUser.name}" type="text">
			          </div>
			        </div>
			       
			        <div class="form-group">
			          <label class="col-lg-3 control-label">Nick_Name :</label>
			          <div class="col-lg-8">
			          <c:if test="${authUser.nickname==null}">
			           <input class="form-control" name="nickname" value="" placeholder="닉네임을 설정해 주세요." type="text" required="required"/>
			          </c:if>
			           <c:if test="${authUser.nickname!=null}">
			           <input class="form-control" name="nickname" value="${authUser.nickname}" type="text" required="required"/>
			         	</c:if>
			          </div>
			        </div>
			        <div class="form-group">
			          <label class="col-lg-3 control-label">Self_Intro :</label>
			          <div class="col-lg-8">
			          	 <input class="form-control" name="userintro" style="height:200px"value="${authUser.userintro}" type="text">
			          </div>
			        </div>
			    
			   		<div class="form-group">  
			   		<label class="col-lg-3 control-label">채식주의자 단계 :</label>
			   			<div class="col-lg-8">
			   				<select name="type" id="selBox" style="width:100x; height:30px">
							    <option value="none">해당사항 없음 </option>
							    <option value="프루테리언"> Fruitrarian(프루테리언) </option>
							    <option value="비건">Vegan (비건)</option>
							    <option value="락토">Lacto-vegetarian (락토)</option>
							    <option value="오보">Ovo-vegetarian 	(오보)</option>
							    <option value="락토오보">Lacto-ovo-vegetarian(락토오보)</option>
							    <option value="피스코">Pesco-vegetarian (피스코)</option>
							    <option value="폴로">Pollo-vegetarian  (폴로)</option>
							</select>
			   			</div>
					</div>
					
			   		<div class="form-group" style="clear: both;">  
			   		<label class="col-lg-3 control-label">제외된 재료 : </label>
			   		
			   			<div class="col-lg-8" id = "dislist" >
			   				<input type= "button" name= "" class = "lookdislikebtn" value="제외된 재료 보기" onclick="a()" style="">
			   			</div>
			   			<input type= "text" type="hidden" style="border:0px;height:2px;">
					</div>
					<div class="form-group">
		          		<label class="col-lg-3 control-label">추가로 제외할것 :  </label>
		       
		         		 <div class="col-lg-8" id="pre_set" >
		          		 <input type="text" name="hatefood" class="hatefood" value=""  placeholder="비워두셔도 괜찮습니다."
		          		 style="width:200px;margin-bottom:5px ;font-family:'squareRoundL';font-size:20px;" > 
		          	 	 <input type="button" value="삭제 " onclick="remove_item(this)" style="color:#fafcf9;">
		          	 	 	<input  type="button" value="추가 " class="addhatefood">
		          		 </div>
			          	
		       	 	</div>
					<div class="form-group">  
			   		<label class="col-lg-3 control-label" ><!-- 하는일없지만 지우면 안됨~~ -->
			   		
			   		</label>
			   			<div class="col-lg-8" id="field" ><!-- onclick="add_item()" -->
			   				<input type= "text"  style="display:none"> 
			   			</div>
					</div>
		   		
			</div><!--  <div class="col-md-8 col-sm-6 col-xs-12 personal-info"> -->
			<input type="submit" value="저장하기 " onclick="alert('저장되었습니다.')">
			
	  </form>								
	</div>
</div>

<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>	

<script>
$("[name=nickname]").attr("required",true)

var ingreAuto= new Array();
$(document).ready(function(){
	$("#selBox").val("${authUser.type}");
	
			$.ajax({   
              url : "${pageContext.request.contextPath }/user/autoIngre",      
              type : "POST",
    		  dataType : "json",
              success : function(ingreList){
              	console.log("Aa");
              	for (var i = 0; i < ingreList.length; i++) {
              		ingreAuto[i] = ingreList[i];
              	}
              	console.log(ingreAuto);
					$(".hatefood").autocomplete({
						source: ingreAuto
					}); 
              }, //succ
              error : function(XHR, status, error) {
                 console.error(status + " : " + error);
              } //err
              
           });

});
</script>

<script type="text/javascript">
/* 동적인풋 추가  */
 $(document).on("click",".addhatefood",function(){

	console.log("aa");
	 var strb ="";
	 strb +="<div>";
	strb +="<input type='text' name='hatefood' class='hatefood' value=''  placeholder='비워두셔도 괜찮습니다.' style='width:200px;margin-bottom:5px';autocomplete='on';'> "; 
	strb +=" <input type='button' value='삭제' onclick='remove_item(this)'style='color:#fafcf9;'>" ;
	strb +="</div>";
	$(".hatefood").autocomplete({ source: ingreAuto }); //자동완성 
	
	$("#field").append(strb);
		  
	$(".hatefood").autocomplete({ source: ingreAuto });	  
	
}); 

 // 동적으로 추가된 input 삭제 (저장전 )
function remove_item(obj){
   
    document.getElementById('field').removeChild(obj.parentNode);
}

</script>

<script type="text/javascript">
/* 제외된 재료 보기  */
function render1(hatelist){
	$("#dislist").empty();
	var dislist = [];
	var hatefood=hatelist.hatefood;
	console.log(hatefood);
	if (hatefood != null && hatefood!=""){
	 dislist = hatefood.split(',')
	for(var i=0;i<dislist.length;i++) {
		var str = "";
		str +="<div id ='dislist"+i+"'  value='"+dislist[i]+"' >"
		str += "<input type='text' name='hatefood'  value='"+dislist[i]+"' style='width:100px;margin-bottom:5px'> ";
		str +=" <input type='button'  id ='dislist"+i+"' value='삭제' onclick='dislist_remove(this)'> "
		$("#dislist").append(str);
	} 
	}else{
		var str = "";
		str +="<input type='text' value='제외된 재료가 없습니다.'style='width:200px;margin-bottom:5px'>";
		$("#dislist").append(str);
	}
	
}


function a(){
	 $("#hatefoodlist").empty();
	var chef_no =${authUser.chef_no};
	 $.ajax({   
           url : "${pageContext.request.contextPath }/user/seldislist",      
           type : "POST",
           /* contentType : "application/json", */
           data : {chef_no: chef_no},
 			dataType : "json",
           success : function(hatelist){
           		render1(hatelist); 
           	 console.log("프로필의 렌더 실행 ");
           },
           error : function(XHR, status, error) {
              console.error(status + " : " + error);
           }
        });
	}
/* 저장한 리스트의 삭제  */
function dislist_remove(obj){
	var delete_id = obj.getAttribute('id');
	var value_by_id = $('#'+delete_id+'').attr('value');
	console.log(delete_id);
	document.getElementById(delete_id).remove();
	console.log("bb");
            $.ajax({   
                url : "${pageContext.request.contextPath }/user/dellist",      
                type : "POST",
                /* contentType : "application/json", */
                data : {hatefood: value_by_id},
      			dataType : "json",
                success : function(hatelist){
                	console.log("Aa");
                	render1(hatelist);
                	
                },
                error : function(XHR, status, error) {
                   console.error(status + " : " + error);
                }
             });

	 
}

</script>



<script type="text/javascript">
function preview_images1(){      
	$("#image_preview1").empty();
    var total_file=document.getElementById("images").files.length;
    for(var i=0;i<total_file;i++){
    	$('#image_preview1').append("<img  width='150' class='img-circle ' name = 'profile' src='"+URL.createObjectURL(event.target.files[i])+"'> ");
       } 
    }
</script>


</body>
</html>