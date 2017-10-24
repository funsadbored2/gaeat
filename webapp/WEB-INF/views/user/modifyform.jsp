<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>가려서 먹자! 가릿</title>

<link
	href="${pageContext.request.contextPath}/assets/jqueryui/jquery-ui.min.css"
	rel="stylesheet" type="text/css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/jqueryui/jquery.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/jqueryui/jquery-ui.min.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script> --%>
<link
	href="${pageContext.request.contextPath}/assets/css/enrollform.css"
	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/assets/img/favicon.ico" />
</head>

<body>

	<input id="getChefNo" type="hidden" value="${modifyVo.chef_no}">
	<input id = "getRecipeNo" type = "hidden" value = "${modifyVo.recipe_no }">
	<c:import url="/WEB-INF/views/includes/headNav.jsp"></c:import>
	<div class="wrap-loading display-none">
		<div>
			<img value="${pageContext.request.contextPath}/assets/img/saving.gif"
				style="height: 50px; width: 50px;" />
		</div>
	</div>

	<div class="container"
		style="background-color: #f0f0f0; margin-top: 50px; margin-bottom: 100px; padding-bottom: 30px;">
		<h2 style="margin-top: 50px; margin-left: 30px">레시피 수정하기</h2>
		<br>

		<hr style="border: solid 0.5px #528540; margin-bottom: 50px;">

		<div class="form-horizontal" role="form">
			<div class="col-sm-8" style="margin-top: 20px">
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label"
						style="font-size: 15px;">레시피 제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="recipeTitle"
							style="background-color: white;"
							placeholder="레시피의 제목을 알려주세요 EX) 아플 때 기운이 나는 전복죽 레시피"
							value="${modifyVo.recipe_title}">
					</div>
				</div>
				<div class="form-group">
					<label for="foodName" class="col-sm-2 control-label"
						style="font-size: 15px;">요리명</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="foodTitle"
							style="background-color: white;"
							placeholder="요리명을 입력해주세요 EX) 파멸의 해장국"
							value="${modifyVo.food_name}">
					</div>
				</div>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label"
						style="font-size: 15px;">요리 소개</label>
					<div class="col-sm-10">
						<textarea type="text" class="form-control" id="introduction"
							style="resize: none; background-color: white;"
							placeholder="요리를 간단하게 설명해주세요 EX) 가볍게 구운 검은깨 두부에 매운 파무침을 얹어 만든 고소하고 매콤한 두부 요리 ">${modifyVo.introduction}</textarea>
					</div>
				</div>

				<style>
.wrap-loading { /*화면 전체를 어둡게 합니다.*/
	position: absolute;
	left: 0;
	right: 0;
	top: 0;
	bottom: 0;
	z-index: 1000;
	background: rgba(0, 0, 0, 0.3);

	/*  filter: progid:DXImageTransform.Microsoft.Gradient(startColorstr='#20000000', endColorstr='#20000000');
 */
}

.wrap-loading div { /*로딩 이미지*/
	position: fixed;
	top: 50%;
	left: 50%;
	bottom: 50%;
	right: 50%;
	/* 
    margin-left: -21px;

    margin-top: -21px; */
}

.display-none { /*감추기*/
	display: none;
}

.btn-select {
	position: relative;
	padding: 0;
	min-width: 236px;
	width: 100%;
	border-radius: 0;
	margin-bottom: 20px;
	border
}

.btn-select .btn-select-value {
	padding: 6px 12px;
	display: block;
	position: absolute;
	left: 0;
	right: 34px;
	text-align: left;
	text-overflow: ellipsis;
	overflow: hidden;
	border-top: none !important;
	border-bottom: none !important;
	border-left: none !important;
}

.btn-select .btn-select-arrow {
	float: right;
	line-height: 20px;
	padding: 6px 10px;
	top: 0;
}

.btn-select ul {
	display: none;
	background-color: #eff0f2;
	color: black;
	clear: both;
	list-style: none;
	padding: 0;
	margin: 0;
	border-top: none !important;
	position: absolute;
	left: -1px;
	right: -1px;
	top: 33px;
	z-index: 999;
}

.btn-select ul li {
	padding: 3px 6px;
	text-align: left;
}

.btn-select ul li:hover {
	background-color: #b6c98f;
}

.btn-select ul li.selected {
	color: #eff0f2;
}

/* info Start */
.btn-select.btn-info:hover, .btn-select.btn-info:active, .btn-select.btn-info.active
	{
	border-color: #b6c98f;
}

.btn-select.btn-info ul li.selected {
	background-color: #b6c98f;
	color: black;
}

.btn-select.btn-info ul {
	border: #b6c98f 1px solid;
}

.btn-select.btn-default .btn-select-value {
	background-color: #b6c98f;
	border: #eff0f2 1px solid;
}

/* info End */
}
</style>
				<div class="form-group">
					<label for="title" class="col-sm-2 control-label"
						style="font-size: 15px;">레시피북</label>
					<div class="col-sm-5">
						<a class="btn btn-default btn-select"> <input type="hidden"
							class="btn-select-input" id="" name="" value="" /> <span
							class="btn-select-value" style="color: white">${modifyVo.recipebook_name}</span>
							<span class='btn-select-arrow glyphicon glyphicon-chevron-down'
							style="background-color: #b6c98f; color: white"></span>
							<ul>
								<c:forEach items="${rbList}" var="vo">
									<li>${vo.recipebookName}</li>
								</c:forEach>
							</ul>
						</a>
					</div>
				</div>
			</div>


			<!--  사진 첨부를 위한 제이쿼리 메소드  -->
			<script>
				function broseMainFile() {

					$(".main_photo").click();

					$(".main_photo").on("change", handleImageFile);

					function handleImageFile(e) {

						var files = e.target.files;
						var filesArr = Array.prototype.slice.call(files);

						filesArr.forEach(function(f) {
							if (!f.type.match("image.*")) {
								alert("확장자는 이미지 확장자만 가능합니다.");
								return;
							}

							sel_file = f;

							var reader = new FileReader();
							reader.onload = function(e) {

								$(".main_image").attr("src", e.target.result);

								return false;

							}
							reader.readAsDataURL(f);
						});

					}

				};
			</script>


			<div class="form-group">
				<div class="col-sm-4">
					<form id="send_main_image" enctype="multipart/form-data"
						action="${pageContext.request.contextPath}/enrollform/enrollPhoto"
						method="post">
						<input type="file" id="main_photo" class="main_photo" name="file"
							style="display: none;" /> <img class="main_image"
							src="${modifyVo.food_img}" onclick="broseMainFile();"
							style="margin-left: 50px; width: 300px; height: 300px; cursor: pointer;" />
					</form>
				</div>
			</div>

			<hr style="border: solid 0.5px #528540; margin-bottom: 50px;">

			<%-- <div class="form-group">
				<label for="category" class="col-sm-2 control-label"
					style="font-size: 15px;">세부사항</label>
				<div class="col-sm-3" style="floar: left;">
					<select style="background-color: white;"
						class="form-control foodGenre" name="종류별">
						<option value="">종류별</option>
						<option value="밑반찬"<c:if test="${modifyVo.cooking_type == '밑반찬'}">selected</c:if>>밑반찬</option>
                  <option value="메인반찬" <c:if test="${modifyVo.cooking_type == '메인반찬'}">selected</c:if>>메인반찬</option>
                  <option value="국/탕" <c:if test="${modifyVo.cooking_type == '국/탕'}">selected</c:if>>국/탕</option>
                  <option value="찌개" <c:if test="${modifyVo.cooking_type == '찌개'}">selected</c:if>>찌개</option>
                  <option value="디저트" <c:if test="${modifyVo.cooking_type == '디저트'}">selected</c:if>>디저트</option>
                  <option value="면/만두" <c:if test="${modifyVo.cooking_type == '면/만두'}">selected</c:if>>면/만두</option>
                  <option value="밥/죽/떡" <c:if test="${modifyVo.cooking_type == '밥/죽/떡'}">selected</c:if>>밥/죽/떡</option>
                  <option value="퓨전" <c:if test="${modifyVo.cooking_type == '퓨전'}">selected</c:if>>퓨전</option><selected>
                  <option value="김치/젓갈/장류" <c:if test="${modifyVo.cooking_type == '김치/젓갈/장류'}">selected</c:if>>김치/젓갈/장류</option>
                  <option value="양념/소스/잼" <c:if test="${modifyVo.cooking_type == '양념/소스/잼'}">selected</c:if>>양념/소스/잼</option>
                  <option value="양식" <c:if test="${modifyVo.cooking_type == '양식'}">selected</c:if>>양식</option>
                  <option value="샐러드" <c:if test="${modifyVo.cooking_type == '샐러드'}">selected</c:if>>샐러드</option>
                  <option value="스프" <c:if test="${modifyVo.cooking_type == '스프'}">selected</c:if>>스프</option>
                  <option value="빵" <c:if test="${modifyVo.cooking_type == '빵'}">selected</c:if>>빵</option>
                  <option value="과자" <c:if test="${modifyVo.cooking_type == '과자'}">selected</c:if>>과자</option>
                  <option value="차/음료/술" <c:if test="${modifyVo.cooking_type == '차/음료/술'}">selected</c:if>>차/음료/술</option>
                  <option value="기타" <c:if test="${modifyVo.cooking_type == '기타'}">selected</c:if>>기타</option>
               </select> 
			</div>
            <div class = "col-sm-3 howtocook" style = "float:left">
               <select style="background-color: white;" class = "form-control howTo" name="방법별">
                  <option value="">방법별</option>
                  <option value="볶음" <c:if test="${modifyVo.cooking_method == '볶음'}">selected</c:if>>볶음</option>
                  <option value="끓이기" <c:if test="${modifyVo.cooking_method == '끓이기'}">selected</c:if>>끓이기</option>
                  <option value="부침" <c:if test="${modifyVo.cooking_method == '부침'}">selected</c:if>>부침</option>
                  <option value="조림" <c:if test="${modifyVo.cooking_method == '조림'}">selected</c:if>>조림</option>
                  <option value="무침" <c:if test="${modifyVo.cooking_method == '무침'}">selected</c:if>>무침</option>
                  <option value="비빔" <c:if test="${modifyVo.cooking_method == '비빔'}">selected</c:if>>비빔</option>
                  <option value="찜" <c:if test="${modifyVo.cooking_method == '찜'}">selected</c:if>>찜</option>
                  <option value="절임" <c:if test="${modifyVo.cooking_method == '절임'}">selected</c:if>>절임</option>
                  <option value="튀김" <c:if test="${modifyVo.cooking_method == '튀김'}">selected</c:if>>튀김</option>
                  <option value="삶기" <c:if test="${modifyVo.cooking_method == '삶기'}">selected</c:if>>삶기</option>
                  <option value="굽기" <c:if test="${modifyVo.cooking_method == '굽기'}">selected</c:if>>굽기</option>
                  <option value="데치기" <c:if test="${modifyVo.cooking_method == '데치기'}">selected</c:if>>데치기</option>
                  <option value="회" <c:if test="${modifyVo.cooking_method == '회'}">selected</c:if>>회</option>
                  <option value="기타" <c:if test="${modifyVo.cooking_method == '기타'}">selected</c:if>>기타</option>
               </select>
			</div>
         </div>
         <div class="form-group">
			<label for="category" class="control-label col-sm-2" style = "float:left; font-size:15px;">카테고리</label>
			<div class = "col-sm-3" style = "float:left">
               <select style="background-color: white;" name="인원 " class="form-control howMany">
                  <option value="">인원</option>
                  <option value="1인분" <c:if test="${modifyVo.amount == '1인분'}">selected</c:if>>1인분</option>
                  <option value="2인분" <c:if test="${modifyVo.amount == '2인분'}">selected</c:if>>2인분</option>
                  <option value="3인분" <c:if test="${modifyVo.amount == '3인분'}">selected</c:if>>3인분</option>
                  <option value="4인분" <c:if test="${modifyVo.amount == '4인분'}">selected</c:if>>4인분</option>
                  <option value="5인분" <c:if test="${modifyVo.amount == '5인분'}">selected</c:if>>5인분</option>
                  <option value="6인분이상" <c:if test="${modifyVo.amount == '6인분이상'}">selected</c:if>>6인분이상</option>
               </select>
			</div>
            <div class = "col-sm-3" style = "float:left">
                <select style="background-color: white;" name="시간" class="cookingTime form-control">
                  <option value="">시간</option>
                  <option value="5분이내" <c:if test="${modifyVo.cooking_time == '5분이내'}">selected</c:if>>5분이내</option>
                  <option value="10분이내" <c:if test="${modifyVo.cooking_time == '10분이내'}">selected</c:if>>10분이내</option>
                  <option value="15분이내" <c:if test="${modifyVo.cooking_time == '15분이내'}">selected</c:if>>15분이내</option>
                  <option value="30분이내" <c:if test="${modifyVo.cooking_time == '30분이내'}">selected</c:if>>30분이내</option>
                  <option value="60분이내" <c:if test="${modifyVo.cooking_time == '60분이내'}">selected</c:if>>60분이내</option>
                  <option value="90분이내" <c:if test="${modifyVo.cooking_time == '90분이내'}">selected</c:if>>90분이내</option>
                  <option value="2시간이내" <c:if test="${modifyVo.cooking_time == '2시간이내'}">selected</c:if>>2시간이내</option>
                  <option value="2시간이상" <c:if test="${modifyVo.cooking_time == '2시간이상'}">selected</c:if>>2시간이상</option>
               </select> 
            </div>
            <div class = "col-sm-3" style = "float:left">
               <select style="background-color: white;" name="난이도" class="cookingLevel form-control">
                  <option value="">난이도</option>
                  <option value="아무나" <c:if test="${modifyVo.cooking_level == '아무나'}">selected</c:if>>아무나</option>
                  <option value="초급" <c:if test="${modifyVo.cooking_level == '초급'}">selected</c:if>>초급</option>
                  <option value="중급" <c:if test="${modifyVo.cooking_level == '중급'}">selected</c:if>>중급</option>
                  <option value="고급" <c:if test="${modifyVo.cooking_level == '고급'}">selected</c:if>>고급</option>
                  <option value="신의 경지" <c:if test="${modifyVo.cooking_level == '신의 경지'}">selected</c:if>>신의 경지</option>
               </select>
            </div>
         </div>
          
 --%>
         <!-- 재료와 양 입력 -->
         
         <c:forEach items = "${ingreVoList }" var = "ingreVoList" >
	         <div class="form-group ${ingreVoList.div_name }">
				<label for="title" class="col-sm-2 control-label"  style = "float:left; font-size:15px;">재료</label>
				<div class = "foodInfo" style = "margin-bottom:10px;">
					<div class = "col-sm-3">
						<input type="text" class="form-control" name = "${ingreVoList.ingre_name }" style = "margin-right:20px; float:left; background-color: white;" placeholder="재료를 적어주세요." value = "${ingreVoList.material_name }">
					</div>
					<div class = "col-sm-3">
						<input type="text" class="form-control" name = "${ingreVoList.amount_name }" style = "margin-right:20px; float:left; background-color: white;" placeholder = "수량을 적어주세요." value = "${ingreVoList.amount }" >
			        </div>
		            <div class="btn-group col-sm-3">
		               <button class="btn addIngre" name = "${ingreVoList.div_name }" style="background-color: #b6c98f; color: white;">재료추가</button> 
		            	<c:if test = "${ingreVoList.div_name != 'ingreDiv_1'}">
		            		 <button class='btn btn-danger removeIngre' name ="${ingreVoList.div_name }" style = 'margin-left:5px; background-color: #ed9a89; color:white; border:0px'>재료 삭제</button>
		            	</c:if>
		            </div>
				</div>
	         </div>
         </c:forEach>
         <input id = "ingreIdentifier" type = "hidden" value = "${last_ingre_no}">
         
         <hr style = "border: solid 0.5px #528540; margin-top:50px;">
         

		<!--  사진 첨부를 위한 제이쿼리 메소드  -->
		<%-- <img class = "emptyImage" src = "${pageContext.request.contextPath}/assets/img/uploadspace.gif" onclick="broseMainFile();" style = "margin-left:50px; width:300px; height:300px; cursor:pointer;"/> --%>
		
 
	<c:forEach items = "${contentVoList}" var = "contentVoList">
		 <div class="${contentVoList.div_name} form-group"
				style="float: left; width: 1099px; margin-top: 10px; margin-bottom: 30px; margin-left:20px ">
			<label class="col-sm-2 ${contentVoList.order_name}" name="${contentVoList.order_name}"
				style="border-right: 0.5px solid green; color: #528540; margin-top: 20px; font-weight: bold; font-size: 25px;">${contentVoList.order_no} 단계</label>
			<div class="promo-flex col-sm-8" style="margin-top: 10px; margin-bottom: 10px; ">
		
				<div data-ix="blog-card" class="promo-card" style="float: left">
					<img class="orderEmptyImage" name="${contentVoList.div_name}" src="${contentVoList.img_content}"
						style="cursor: pointer; width: 100%"> 
						<input id="${contentVoList.order_name}" type="file" class="order_photo" name="${contentVoList.div_name}" style="display: none;"/>
				</div>
				<div class="blog-description" style="width: 320px; height: 350px; float: left;">
					<textarea class="${contentVoList.content_name}"
							style="width: 100%; height: 100%; border: 1px solid grey; background-color: #eff0f2; padding:10px; resize: none; border-top-right-radius: 10px; border-bottom-right-radius: 10px; font-size:15px;"
							value="";>${contentVoList.text_content}</textarea>
				</div>
			</div>
			<div class="btn-group col-sm-1" style="padding-right: 6px; padding-top: 15px;">
				<button class="orderAddBtn btn btn-success addOrder" name="${contentVoList.div_name}" style="border: 0; background-color: #b6c98f; color: white;">단계 추가</button>
				<input id="${contentVoList.div_name}" type="text" name="${contentVoList.order_name}" value="${contentVoList.order_no}" style="display: none;" />
				<c:if test = "${contentVoList.order_no} != 1">
				<button class="orderRemoveBtn btn btn-danger addOrder" name = "${contentVoList.div_name}" style = "float:bottom; border:0; background-color: #ed9a89; color: white; margin-top:10px">단계 제거</button>" 
				</c:if>
			</div>
		</div>
		<input id = "orderIdentifier" type = "hidden" value = "${last_order_no}">
	</c:forEach>

		<style>
		 .tagInsert {
		 	float:left;
		 }
		</style>
		
		<div class="form-group" style = "margin-left:10px">    
            <div class="col-sm-offset-2 col-sm-7" style = "margin-bottom:20px; margin-top:30px;">
	               <label for="title" style = "font-size:15px">태그를 작성해주세요</label><br>
	               <ul style = "list-style:none; margin:0px; padding:0px; border: 1px solid #a1a1a1;
	               				padding: 1px 5px; overflow: auto; background:white;">
	               	 <li class = "tagInsert tagInsert_1" style = " display: block; float: left;  margin: 2px 5px 2px 0;">
	               	 	<input class = "tagInsertInput" type = "text" style = "border:0px;  outline: none;">
	               	</li>
	               </ul>
            </div>
           
            <div class="col-sm-3" style="float:right; margin-left:30px;">
               <button id ="form-deliver" type="submit" class="btn btn-default" style="border: 0; background-color: #b6c98f; color: white;">레시피 작성 완료</button>
            </div>
        </div>
        </div>
   </div>
   
   <input id = "userNo" type ="hidden" value = "${chef_no}" style = "display:none">

  
   <c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>

</body>
<script>
//재료와 요리 순서에 새로운 div를 붙이기 위해 만든 전역변수
var ingreNo = 1; 
var divNo = 1; 
var tagNo = 0;
var orderArray = new Array();
orderArray[0] = 1;
var ingreArray = new Array();
ingreArray[0] = 1;
var ingreAuto = new Array();
var tagArray = new Array(); 

//orderArray조정


//자바 스크립트 시작 
$(document).ready(function(){
	
	$(document).on("keydown",".tagInsert",function (key) {
		 
	    if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	    
		    var tag = $(".tagInsertInput").val();
		    tagArray[tagNo] = tag;
		    
	    	console.log(tag);
	    	console.log(tagArray[tagNo]);
	    	
		    tagName = "tagInsert_" + tagNo;
		    
			var str = ""; 
		    
			str += "<li class = 'tagInsert' style = 'display:block; float: left;  margin: 2px 5px 2px 0;'>";
			str += "<input class = 'tagInsertInput' type = 'text' style = 'border:0px;  outline: none;' autofocus>";
			str += "</li>";
		    
		    $(this).after(str);
		    
		    $(this).replaceWith("<li class = '"+ tagName +"' style = 'display: block; float: left;  margin: 2px 5px 2px 0;'> <a id = '"+tagName+"' class='btn btn-default'><span name = '"+tagName+"' class='glyphicon glyphicon-remove'></span>" + tag + "</a></li>");

		    tagNo = tagNo + 1;
		   
		    console.log(tagArray);
		    
	    }
	    
	   if(key.keyCode == 8){
		   
		     var deleteName = tagArray.pop();
			
			 if ($(this).closest("li").prev().length) {
                 $(this).closest("li").prev().remove();
             }
		   
	   }
	    
	});
		

	$(document).on("click",".glyphicon-remove",function(){

			 var tagname = $(this).attr("name");
			 
			 console.log(tagname);
			 
			 var strArray = tagname.split("_");
			 var no = strArray[1];
				 
			 tagArray.splice(no,1);
				 
			 console.log(tagArray);
			 
			 $("." + tagname).remove();
			 
	})
	
	
		 orderSetting();
	
		function orderSetting(){
		
			var orderNo = $("#orderIdentifier").val();
	
					console.log(orderNo);
	
					divNo = orderNo;
	
					console.log(divNo);
	
					for(var i = 1; i < orderNo; i++){
						
						orderArray[i] = i + 1;
	
					}
	
					var ingreOrderNo = $("#ingreIdentifier").val();
	
					ingreNo = ingreOrderNo;
	
					for(var i = 1; i < ingreOrderNo; i++){
						ingreArray[i] = i + 1;
					}
			}
	
		///시작시 ingre1도 자동 완성 가능하도록 해주는 부분
	
		$.ajax({

			url : "${pageContext.request.contextPath}/enrollform/autoIngre",
			type : "post",
			//contentType : "",
			//data : {},

			dataType : "json",
			success : function(ingreList) {

				for (var i = 0; i < ingreList.length; i++) {

					ingreAuto[i] = ingreList[i];

				}
				
				console.log(ingreAuto);
				
				$("input[name = ingre_1").autocomplete({
					source: ingreAuto
				}); 
				/*성공시 처리해야될 코드 작성*/
			
			},

			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
	///////버튼 클릭해 요리순서 추가될 위치 지정해서 출력 함수로 보내버림
	$(document).on("click",".orderAddBtn",function(){
		
		
		console.log("추가");
		
		var location = $(this).attr("name");
		var orderNo = $("#" + location).val();
	
		//숫자변환
		orderNo *= 1;
		
		orderNo += 1; 
		
		console.log("orderNo은: " + orderNo);
		
		orderGetReady(location, orderNo);
			
	});
	///////////////////////////////////////////////////////////
	
	//div이름 재설정 후 위에서 받은 요리 순서참고해 출력할 위치에 갖다 밖는 부분
	//////////////////////////////////////////////////////////
	function orderGetReady(location, orderNo){
		
		var arrayLastNo = orderArray.length - 1;
		
		var arrayLocation = orderNo - 1;
		
		console.log("arrayLocation:" + arrayLocation);
		
		console.log("arrayLastNo : " + arrayLastNo);
		
		 if(!orderArray[arrayLocation]){
		
			console.log("비어 있어서 if문 들어옴");
			
			 orderArray[arrayLocation] = orderNo;
			 
			 console.log("if문 나가기 전 : " + orderArray);
			 
		
		} else {
			
			
			 for(var i = arrayLastNo; i >= arrayLocation; i--){
				
				 console.log("for문 들어옴");
				 console.log("현재 i의 값은 " + i);
				 console.log("더하기 전 배열 상태 : " + orderArray);
				 
				 //바꿀 order의 위치 찾기
				 var name = "order_" + orderArray[i];
				 console.log("바꿀 order위치:" + name);
				 
				 //찾은 위치에 넣어줄 order값을 1올려줌
				 orderArray[i] = orderArray[i] + 1;
				 console.log("찾은 위치에 넣어줄 order값을 1올려줌:"+ orderArray[i]);
				 
				 //올려준 값을 반영해 새로운 label값을 만들어줌
				 var newStep = orderArray[i] + " 단계";
				 console.log("올려준 값을 반영해 새로운 label값을 만들어줌:"+ newStep);
				 
				//찾은위치에 새로 반영한 label값 넣어줌
				 $("." + name).text(newStep);
				
				//새로운 이름
				var newName = "order_" + orderArray[i];
				console.log("새로운 이름:" +newName);
				
				//label name바꿔줌
				$("." + name).attr("name", ""+newName);	
				
				//찾은 위치의 order_no 바꿔줌 (클래스)
				$("." + name).attr("class","col-sm-2 "+newName);	
				
				//찾은 위치의 image id 값 바꿔줌
				$("input[id = " + name + "]").attr("id",""+newName);
				
				//name으로 찾은 인풋의 value값을 올려줌
				$("input[name=" + name + "]").val(orderArray[i]); 
	
				//name으로 찾을 name을 새로운 이름으로 바꿔줌
				$("input[name =" + name + " ]").attr("name",""+newName);
				
				//바꾼 값을 배열 하나 위에 넣어줌
				 orderArray[i + 1] = orderArray[i];
				 orderArray[i] = orderArray[i] - 1;
				
				 console.log("바꾼 값을 배열 하나 위에 넣어줌:" +orderArray[i + 1]);
				 
				 console.log("넣은 후  배열 체크 : " + orderArray);
				
			 	}
			 
		} 
	
		divNo += 1;
		
		console.log(divNo);
		console.log(orderNo);
		
		 var divName = "div_" + divNo;
		 var contentName = "textContent_" + divNo;
		 var orderName = "order_" + orderNo;
		 var str = " ";
		 
		 str += " <div class='"+divName+ " form-group' style = 'float:left; width: 1099px; margin-top:10px; margin-bottom:30px; margin-left:20px;'>"
	     str += "<label class='col-sm-2 "+ orderName +"' name = '"+ orderName +"' style = 'margin-left:60x; border-right:0.5px solid green; color:#528540; margin-top:20px;font-weight: bold; font-size: 25px; '>"
	     str += "  	" + orderNo + " 단계"
	     str += "     </label>"
	     str += "            <div class='promo-flex col-sm-8' style = 'margin-top:10px; margin-bottom:10px;'>"
		 str += "        <div data-ix='blog-card' class='promo-card' style = 'float:left'>"
	     str += "     	<img class = 'orderEmptyImage' name = '"+divName+ "' src='${pageContext.request.contextPath}/assets/img/photobox.png' style = 'cursor:pointer; width:100%'>"
	     str += "    	<input id = '"+ orderName +"' type='file' class='order_photo' name='"+divName+ "' style = 'display:none;'/>"
	     str += "  </div>"
	   	 str += "				         <div class='blog-description' style ='width:330px; height:350px; float:left;'>"
	     str += "		           	<textarea class = '" +contentName+ "' style = 'border: 1px solid grey; width:100%; height:100%; background-color: #eff0f2; padding:10px; "
	     str += "    										resize:none;  border-top-right-radius:10px; border-bottom-right-radius:10px;font-size:15px;' "
	     str += "					value = '';></textarea></div> </div>"
	     str += "	   			 <div class='btn-group col-sm-2' style='padding-right:6px; padding-top: 15px;'>"
	     str += "	                     <button class='orderAddBtn btn btn-success addOrder' name = '"+divName+ "' style = 'border:0; background-color: #b6c98f; color: white;'>단계 추가</button> "
	     str += "	                     <input id = '"+divName+"' type = 'text' name = '"+ orderName +"'  value = '"+ orderNo +"' style = 'display:none;'/>"
	     str += "	                     <button class='orderRemoveBtn btn btn-danger addOrder' name = '"+divName+ "' style = 'float:bottom; border:0; background-color: #ed9a89; color: white; margin-top:10px'>단계 제거</button>" 
		 str += "	             </div>"
		 str += "</div>"
	
		 
		/* $("." + currentLocation).fadeIn("normal", function() {
			        $("." + currentLocation).remove();
			 }); */
		 
		 $("."+location).after(str);
		 
	};
	//////////////////////////////////////////////////////////
	
	
	/////////요리순서 지우기
	$(document).on("click",".orderRemoveBtn",function(){
		
		console.log("삭제");
		
		var currentLocation = $(this).attr("name");
		
		var orderNo = $("#" + currentLocation).val();
	
		//숫자변환
		orderNo *= 1;
		
		console.log("orderNo은: " + orderNo);
		
		orderRemoveGetReady(currentLocation, orderNo);
	
	});
	//////////////////////////////////////////////////////////
	
	//order지우는 함수
	function orderRemoveGetReady(currentLocation, orderNo){
		
		var arrayLastNo = orderArray.length - 1;
		
		arrayLocation = orderNo - 1;
		
		console.log("arrayLocation:" + arrayLocation);
		
		console.log("arrayLastNo : " + arrayLastNo);
		
		 if(arrayLocation == arrayLastNo){
		
			console.log("마지막 order라서 아무 작업 없이 그냥 삭제 가능");
			
			orderArray.splice(arrayLocation);
			 
		} else {
			
			var deleteOrderNo = arrayLocation + 1;
			
			 for(var i = deleteOrderNo; i <= arrayLastNo; i++){
				
				 console.log("for문 들어옴");
				 console.log("현재 i의 값은 " + i);
				 console.log("빼기 전 배열 상태 : " + orderArray);
				 
				 //바꿀 order의 위치 찾기
				 var name = "order_" + orderArray[i];
				 console.log("바꿀 order위치:" + name);
				 
				 //찾은 위치에 넣어줄 order값을 1빼줌
				 orderArray[i] = orderArray[i] - 1;
				 console.log("찾은 위치에 넣어줄 order값을 1 빼줌:"+ orderArray[i]);
				 
				 //올려준 값을 반영해 새로운 label값을 만들어줌
				 var newStep = orderArray[i] + " 단계";
				 console.log("뺀 값을 반영해 새로운 label값을 만들어줌:"+ newStep);
				 
				//찾은위치에 새로 반영한 label값 넣어줌
				 $("." + name).text(newStep);
				
				//새로운 이름
				var newName = "order_" + orderArray[i];
				console.log("새로운 이름:" +newName);
				
				//label name바꿔줌
				$("." + name).attr("name", ""+newName);	
				
				//찾은 위치의 order_no 바꿔줌 (클래스)
				$("." + name).attr("class","col-sm-2 "+newName);	
				
				//찾은 위치의 image id 값 바꿔줌
				$("input[id = " + name + "]").attr("id",""+newName);
				
				//name으로 찾은 인풋의 value값을 올려줌
				$("input[name=" + name + "]").val(orderArray[i]); 
	
				//name으로 찾을 name을 새로운 이름으로 바꿔줌
				$("input[name =" + name + " ]").attr("name",""+newName);
				
				//바꾼 값을 배열 하나 아래에 넣어줌
				 orderArray[i - 1] = orderArray[i];
				 
				 console.log("넣은 후  배열 체크 : " + orderArray);
				
			 	}
			
			 orderArray.splice(arrayLastNo);
			 
			 console.log("최종  배열 체크 : " + orderArray);
			 
			 console.log(orderArray.length);
			 
		} 
		
		//removeOrder
		 $("." + currentLocation).fadeOut("normal", function() {
			        $("." + currentLocation).remove();
			    });
		
	}
	
	/////버튼 클릭해 재료 추가될 위치 지정해서 출력 함수로 보내버림
	$(document).on("click",".addIngre",function(){
				
				var location = $(this).attr("name");
				
				ingreGetReady(location);
		
	});
	///////////////////////////////////////////////////////////
	
	
	//div이름 재설정 후 위에서 받은 재료추가 위치 참고해 출력할 위치에 갖다 밖는 부분
	/////////////////////////////////////////////////////////
	function ingreGetReady(location) {
	    	
	    	console.log(ingreNo);
	    	
	    	ingreNo += 1;
	    	
	    	console.log(ingreNo);
	    	
	    	ingreArray[ingreNo - 1] = ingreNo;
	    	
	    	console.log(ingreArray);
	    	
	    	var divName = "ingreDiv_" + ingreNo;
	    	var amount = "amount_" + ingreNo;
	    	var ingre = "ingre_" + ingreNo;
	    	
	    	var str = "";
	    	 
	         str += "<div class='form-group "+ divName +"'>";
	         str += "<div class = 'title col-sm-2'>";
	         str += "</div>";
	         str += "<div class = 'foodInfo' style = 'margin-bottom:10px;'>";
	         str += "   <div class = 'col-sm-3'>";
	         str += "      <input type='text' class='form-control' name = '"+ ingre +"' style = 'margin-right:20px; float:left; background-color:white;' placeholder='재료를 적어주세요' value = ''>";
	         str += "   </div>";
	         str += "   <div class = 'col-sm-3'>";
	         str += "      <input type='text' class='form-control' name = '"+ amount +"' style = 'margin-right:20px; float:left; background-color:white;' placeholder = '수량을 적어주세요' value = ''>";
	         str += "   </div>  ";
	         str += "	<div class = 'col-sm-3'>";
	         str += "    <button class='btn addIngre' name = '"+ divName +"'style = 'background-color: #b6c98f; border:0px; color:white'>재료추가</button>"
	         str += "    <button class='btn btn-danger removeIngre' name ='"+ divName +"' style = 'margin-left:5px; background-color: #ed9a89; color:white; border:0px'>재료 삭제</button>" 
	         str += "   </div>";
	         str += "</div>";
	         str += "</div>";
	         
	         $("."+location).after(str);
	         
	         autoIngre(ingre);
	         
	};
	//////////////////////////////////////////////////////////
	
	function autoIngre(ingre){
		
	 	//자동 완성 실험중
		$("input[name = "+ ingre +"]").autocomplete({
			source: ingreAuto
		}); 
	}
	
	
	
	//insert
	/////////////////////////////////////////////////////////
	$(document).on("click", "#form-deliver", function(){
		
	 		event.preventDefault();
			
	 		console.log("딜리버리 들어옴");
	 		
	 		var recipe_no = $("#getRecipeNo").val();
		    var userNo = $("#getChefNo").val();
			var	recipeTitle= $("#recipeTitle").val();
			var	foodName= $("#foodTitle").val();
			var	introduction = $("#introduction").val();
			var	cookingType= $(".foodGenre").val();
			var cookingMethod = $(".howTo").val();
			var amount = $(".howMany").val();
			var cookingTime = $(".cookingTime").val();
			var cookingLevel = $(".cookingLevel").val();
			var recipebookName = $(".btn-select-input").val();
		    
			var formData = new FormData();
			
			formData.append("userNo", userNo);
			formData.append("recipeTitle", recipeTitle);
			formData.append("foodName", foodName);
			formData.append("introduction", introduction);
			formData.append("cookingType", cookingType);
			formData.append("cookingMethod", cookingMethod);
			formData.append("amount", amount);
			formData.append("cookingTime", cookingTime);
			formData.append("cookingLevel", cookingLevel);
			formData.append("recipebookName", recipebookName); 
			
			console.log(userNo + recipeTitle + foodName);

			var data = $("#main_photo")[0].files[0];
			
			if(data == null){
				console.log("이미지 변화 없는 곳으로 들어옴");
				data = "이미지 변화 없음";
				formData.append("NoPhotoChange", data);
			} else{
				console.log("이미지 변화 있음");
				formData.append("mainFile", data);
			}
		
			  $.ajax({
        		 url: "${pageContext.request.contextPath}/enrollform/updateRecipeInfo",
                 processData: false,
                 contentType: false,
                 data: formData,
                 type: "POST",
                 success: function(recipeNo){
                	 
                	console.log("성공");
                	orderSave(recipeNo);
                	
                 }
         });
			 
		});
	
	//요리 순서 저장//////////////////////////////////////////////
	function orderSave(recipeNo){
		
		console.log("orderSave들어옴");
		var no = 0;
		for(var i = 0; i < orderArray.length; i++){
				
				no = no + 1;
			
				console.log(orderArray[i]);
				
				var orderNo = orderArray[i];
				var orderName = "order_" + orderNo;
				
				var divName = $("input[name = " + orderName + "]").attr("id");
				var data = $("input[id =" + orderName + "]")[0].files[0];
				var divSplitName = divName.split("_");
				
				console.log(divName);
				console.log(divSplitName);
				
				var divNo = divSplitName[1];
				
				var contentName = "textContent_" + divNo;
				
				var textContent = $("." + contentName).val();
				
				var formData = new FormData();
				
				formData.append("imgContent",data);
				formData.append("orderNo",orderNo);
				formData.append("recipeNo",recipeNo);
				formData.append("textContent",textContent);
				 
				 $.ajax({
	        		 url: "${pageContext.request.contextPath}/enrollform/enrollOrder",
	                 processData: false,
	                 contentType: false,
	                 data: formData,
	                 type: "POST",
	                 success: function(){
	                	
	                	 console.log("order 성공");
	                	 
	            		 /* if(no == orderArray.length){ */
	            		 /* } */
	                 }
	         });
			
			};
			
			console.log(no);
			if(no == orderArray.length){
				console.log("인그리 이프문으로 들어옴" + recipeNo);
				
				ingreSave(recipeNo);
			}
				
		};
	
	
function ingreSave(recipeNo){
		
		console.log("////////////////////ingre"+recipeNo);
	
		console.log("ingre들어옴");
		console.log("ingreRECIPE  " + recipeNo);
		
		var ingreData= [];
		var amountData = [];
		
		for(var i = 0;i < ingreArray.length; i++){
			
			var ingreNo = ingreArray[i];
			var recipeNo = recipeNo;
			var materialName = "ingre_" + ingreNo;
			var amountName = "amount_" + ingreNo;
			
			var material = $("input[name =" + materialName + "]").val();
			var amount = $("input[name =" + amountName + "]").val();
			
			ingreData.push(material);
			amountData.push(amount);
			
		}
		
		var allData = {
				"recipeNo":recipeNo,
				"ingredients":ingreData,
				"amounts":amountData
		}
		
		$.ajax({
			url: "${pageContext.request.contextPath}/enrollform/enrollIngre",
			type : "post",
			data: allData,
			success : function(recipeNo) {
				
				console.log("ingre 성공");
				console.log(recipeNo);
				tagSave(recipeNo);
			}, 
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}
		});
		
	};
	
	//////////////////////////////////////////////////////////
	
	/////////////////////////tag저장
	function tagSave(recipeNo){
		
		console.log("///////////tag recipeno" + recipeNo);
		
		var tagData= [];
		
			for(var i = 0; i < tagArray.length; i++){
				
				if(tagArray[i]){
					
					tagData.push(tagArray[i]);
					
					};
			}
			
			var allData = {
					
					"recipeNo":recipeNo,
					"tagData":tagData
					
			}
					$.ajax({
						url: "${pageContext.request.contextPath}/enrollform/saveTag",
						type : "post",
						data: allData,
						success : function() {
							
								console.log("tag성공");
								 savingImage(recipeNo);
								
						}, 
						error : function(XHR, status, error) {
							console.error(status + " : " + error);
						}
					});
			
			}
	
	////////////////////////////////////////////////////////////
	function savingImage(recipeNo){
		
		var Height = $(document).height(); 
		var Width = $(window).width();
		
		console.log("///////////////"+recipeNo);
		
		$(".wrap-loading").css({'width':Width,'height':Height}); 

		$('.wrap-loading').removeClass('display-none');
		
		setTimeout(function(){finalEnroll(recipeNo)},1500);
		
	}
	
	
	////////////////////////////////////////////////////////////
	
	function finalEnroll(recipeNo){
		
		console.log("//////////////////////////////////"+recipeNo);
		
		location.href = "${pageContext.request.contextPath}/read/readform?recipe_no="+recipeNo;
	}
	
	
	/////////////////////////////////////////////////////////
	
			
	////////////////////////////////////order이미지 추가하는 함수
	$(document).on("click",".orderEmptyImage",function broseOrderFile(){
		
	 var name = $(this).attr("name"); 
		
	 $("input[name = " + name + "]").click(); 
	 
	 $("input[name = " + name + "]").on("change",handleOrderImageFile);
	 
		 function handleOrderImageFile(e){
				
				var files = e.target.files;
				var filesArr = Array.prototype.slice.call(files);
		
				filesArr.forEach(function(f){
					if(!f.type.match("image.*")){
						alert("확장자는 이미지 확장자만 가능합니다.");
						return;
					}
					
					sel_file = f;
					
					var reader = new FileReader();
				 	reader.onload = function(e) {
				 		
				 	var str = "";
			  
			  		str += "<img class = 'orderEmptyImage' src = '"+ e.target.result +"' name = '"+ name +"' style = 'max-width:360px; height:350px; cursor:pointer; '/>"
		
			     	 $("img[name =" + name + "]").replaceWith(str);
			     
				 	/* return false; */
				 	
				 	}
				
				 	reader.readAsDataURL(f);
				
				});
			};
		});
	///////////////////////////////////////////////////////////
});
//document.ready끝


//////빼기 버튼 눌러 재료 지우기
$(document).on("click",".removeIngre", function(){
    	
      var currentLocation = $(this).attr("name");
      
      $("." + currentLocation).remove();

});
//////////////////////////////////////////////////////////


//레시피북 select 구현
//////////////////////////////////////////////////////////
$(document).on('click', '.btn-select', function (e) {
    e.preventDefault();
    var ul = $(this).find("ul");
    if ($(this).hasClass("active")) {
        if (ul.find("li").is(e.target)) {
            var target = $(e.target);
            target.addClass("selected").siblings().removeClass("selected");
            var value = target.html();
            $(this).find(".btn-select-input").val(value);
            $(this).find(".btn-select-value").html(value);
        }
        ul.hide();
        $(this).removeClass("active");
    }
    else {
        $('.btn-select').not(this).each(function () {
            $(this).removeClass("active").find("ul").hide();
        });
        ul.slideDown(300);
        $(this).addClass("active");
    }
});

$(document).on('click', function (e) {
    var target = $(e.target).closest(".btn-select");
    if (!target.length) {
        $(".btn-select").removeClass("active").find("ul").hide();
    }
});
//////////////////////////////////////////////////////////

</script>
</html>