<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico"/>
<title>가릿 - 가려서 먹자</title>

<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="${pageContext.request.contextPath}/assets/css/number.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/main.css"	rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/userpage.css"	rel="stylesheet" type="text/css">
<script type="text/javascript"	src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript"	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>

<body>

	<c:import url="/WEB-INF/views/includes/headNav.jsp"></c:import>

	<div class="mainbody container" style="margin-top:30px; padding-top:30px;">
		<div class="row">
			<div class="col-lg-2 col-md-2 hidden-sm hidden-xs">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="media">
							<div align="center">
								<img class="thumbnail img-responsive " src="${chef.profile }" width="300px" height="300px">
							</div>

							<!--  왼쪽부분 -->
							<input id= "authUserFinder" type = "hidden" name = "${user_chef_no }">
							<div class="media-body">
								<a href="${pageContext.request.contextPath }/userpage/main?chef_no=${chef.chef_no }" style="font-size:18px; color:black;"><strong>${readformVo2.nickname }</strong></a>
								<br>
								<br>
								
								
								<a href = "${pageContext.request.contextPath }/userpage/followinglist?chef_no=${chef.chef_no }" style="font-size:13px; color:green;" style = "float:left">팔로우</a>
								<a class = "followingNo" href="${pageContext.request.contextPath }/userpage/followinglist?chef_no=${chef.chef_no }" style="font-size:13px; color:green;" value = "${chef.following_count }">${chef.following_count }</a>
								<br>
								<a href = "${pageContext.request.contextPath }/userpage/followedlist?chef_no=${chef.chef_no }" style="font-size:13px; color:green;" style = "float:left">팔로워</a>
								<a class = "followerNo" href="${pageContext.request.contextPath }/userpage/followedlist?chef_no=${chef.chef_no }" style="font-size:13px; color:green;" value = "${chef.followed_count }">${chef.followed_count }</a>
								<br>
								<br>
								<br>
								<input id= "authUserFinder" type = "hidden" name = "${authUser.chef_no }">
								 <c:choose>
				 					<c:when test = "${authUser.chef_no == null}">
				 						<br>
				 					</c:when>
				 					<c:when test = "${authUser.chef_no == chef.chef_no}">
				 						<br>
				 					</c:when>
				 					<c:when test = "${authUser.chef_no != chef.chef_no}">
											
												<c:if test = "${followcheck == 1}">
													
													<a href="#" class="btn btn-xs btn-success followed" name = "${chef.chef_no}"> <span class="glyphicon glyphicon-heart"></span>팔로우 중</a>
													
												</c:if>
												
												<c:if test = "${followcheck != 1}">
													
													<a href="#" class="btn btn-xs btn-success following" name = "${chef.chef_no}"><span class="glyphicon glyphicon-heart-empty following"></span> 팔로우하기</a>
												
												</c:if>
											
									</c:when>
									
								</c:choose>
								
								<script>
								$(document).on("click",".followed",function(){
									
									console.log("들어왔다.");
									
									var chef_no = $(this).attr("name");
									
									str = "<a href='#' class='btn btn-xs btn-success following' name = '"+chef_no+"'><span class='glyphicon glyphicon-heart-empty following'></span> 팔로우하기</a>";
									
									$(this).replaceWith(str);
									
									var user_no = $("#authUserFinder").attr("name"); 
									
									var followVo = {
											chef_no:chef_no,
											user_no:user_no
									}
									
									$.ajax({
										url: "${pageContext.request.contextPath}/userpage/followRemove",
										type : "post",
										contentType : "application/json",
										data: JSON.stringify(followVo),
										dataType : "json",
										success : function() {
										
											console.log("follow 삭제 보내기 성공");
											
											var followingNo = $(".followerNo").val();
											
											console.log(followingNo);

											followingNo = followingNo - 1;
											
											str = "<a class = 'followerNo' href='${pageContext.request.contextPath }/userpage/followedlist?chef_no=${chef.chef_no }' style='font-size:13px; color:green;'>"+ followingNo +"</a>"
											
											$(".followerNo").replaceWith(str);
										
										}, 
										error : function(XHR, status, error) {
											console.error(status + " : " + error);
										}
									});
									
								})
									
									$(document).on("click",".following",function(){
										
										var chef_no = $(this).attr("name");
										
										str = "<a href='#' class='btn btn-xs btn-success followed'> <span class='glyphicon glyphicon-heart'></span> 팔로우 중</a>";
										
										$(this).replaceWith(str);
										
										var user_no = $("#authUserFinder").attr("name"); 
										
										console.log(user_no);
										
										var followVo = {
												user_no:user_no,
												chef_no:chef_no
										}
										
										$.ajax({
											url: "${pageContext.request.contextPath}/userpage/followAdd",
											type : "post",
											contentType : "application/json",
											data: JSON.stringify(followVo),
											dataType : "json",
											success : function(no) {
											
												console.log("follow 추가 보내기 성공");
												
												var followingNo = $(".followerNo").val();
												
												console.log(followingNo);
												followingNo = followingNo + 1;
												
												str = "<a class = 'followerNo' href='${pageContext.request.contextPath }/userpage/followedlist?chef_no=${chef.chef_no }' style='font-size:13px; color:green;'>"+ followingNo +"</a>"
												
												$(".followerNo").replaceWith(str);
											
											}, 
											error : function(XHR, status, error) {
												console.error(status + " : " + error);
											}
										});
										
									})
									
									$(document).on("click",".subscription",function(){
										
										var subNo = $(this).attr("name");
										console.log(subNo);
										
										var authUserNo = $("#authUserFinder").attr("name");
										
										var subVo = {
												
												subNo:subNo,
												authUserNo:authUserNo
										}
											
										
										$(".subscription").replaceWith(str);
										
										$.ajax({
											url: "${pageContext.request.contextPath}/userpage/subscription",
											type : "post",
											contentType : "application/json",
											data: JSON.stringify(subVo),
											dataType : "json",
											success : function(no) {
											
												console.log("sub 추가 보내기 성공");
												
												var str = "<a class='btn btn-xs btn-default subscribRemove' name = '"+subNo+"'>구독중</a>"
												
												$(".followerNo").replaceWith(str);
											
											}, 
											error : function(XHR, status, error) {
												console.error(status + " : " + error);
											}
										});
										
									})
								</script>
								
								
								<br>
								<br>
								<p style="font-size:12px; color:gray;">${chef.self_intro }</p>
								<hr>
								<a href="${pageContext.request.contextPath }/userpage/scraplist?chef_no=${chef.chef_no }" style="font-size:12px; color:black;">스크랩한 글 모아보기</a>
								<hr>
								<h5>
									<strong>카테고리</strong>
									<c:choose>
										<c:when test = "${authUser.chef_no == chef.chef_no}">
											<a href="#" class="btn btn-xs btn-default"><span class="glyphicon glyphicon-wrench" data-toggle="modal" data-target="#companyPositionModal" data-backdrop="false"></span>  </a>
										</c:when>
										<c:otherwise>
											<a></a>
										</c:otherwise>
									</c:choose>
								</h5>
								
								<c:forEach items="${recipebookList }" var="recipebookList">
									<tr>
										<p style="font-size:11px; color:black; text-decoration:none">${recipebookList.recipebook_name }</p>
										<br>
									</tr>
								</c:forEach>
								<br>
								<hr>
								<br>
								<br>
								<br>
								<br>
									<c:choose>
										 <c:when test = "${authUser.chef_no == chef.chef_no}">
											<a href="${pageContext.request.contextPath }/enrollform/enrollmentform?chef_no=${chef.chef_no }" class="btn btn-xs btn-default"><span class="glyphicon glyphicon-pencil"></span> 글쓰기</a>
										</c:when>
										<c:otherwise>
											<a></a>
										</c:otherwise>
									</c:choose>
								<br>
							</div>

						</div>
					</div>
				</div>
			</div>
	
		
		<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12" style="width:950px;">

			<!-- 카테고리 -->
			<div class="panel panel-default">
				<div class="panel-body">
					<h4>
						<a href="#" style="color:black; font-size:20px;"><strong>${readformVo2.recipe_title}</strong></a>
						<a id ="scrap">
						<c:choose>
						<c:when test = "${authUser.chef_no != chef.chef_no}">
							<c:if test="${check=='canuse'}">
								<a class="btn btn-xs btn-default scrapButton" name = "${readformVo2.recipe_no }" style = "float:right; margin-right:100px;"><span class="glyphicon glyphicon-book"></span>  스크랩하기</a>
							</c:if>
							<c:if test="${check=='aladyused'}">
								<a class='btn btn-xs btn-default scrapRemoveButton' style = 'float:right; margin-right:15px;'><span class='glyphicon glyphicon-bookmark'></span> 스크랩한 레시피</a>
							</c:if>
						</c:when>
						<c:otherwise>
							<a></a>
						</c:otherwise>
					</c:choose>
					</a>
					<input id = "authuserNoFinder" type = "hidden" value = "${authUser.chef_no}">
				
					<a id= "likearea2">
						<c:choose>
						<c:when test = "${authUser.chef_no != chef.chef_no}">
							<c:if test="${likecheck=='notlike'}">
							<button class="btn btn-xs btn-default likeButton" name = "${readformVo2.recipe_no }" style = "float:right; margin-right:15px;color:grean;"><span class="glyphicon glyphicon-book"></span> 좋아요</button>
							</c:if>
							<c:if test="${likecheck=='like'}">
							<button class="btn btn-xs btn-default unlikeButton" name = "${readformVo2.recipe_no }" style = "float:right; margin-right:15px;"><span class="glyphicon glyphicon-book"></span> 좋아요 해제 </button>
							</c:if>
						</c:when>
						<c:otherwise>
							<a></a>
						</c:otherwise>
					</c:choose>
					</a>
					<script>
					$(".scrapButton").on("click",function(){
						
						var username = $("#authuserNoFinder").val();
						var recipe_no = $(this).attr("name");
						
						var str = "<a class='btn btn-xs btn-default scrapRemoveButton'  style = 'float:right; margin-right:15px;'><span class='glyphicon glyphicon-bookmark'></span>  스크랩한레시피</a>";
						
						$(this).replaceWith(str);
						
						var ScrapVo = {
								userNo:username,
								recipe_no:recipe_no
						}
						
						console.log(ScrapVo);
						
						$.ajax({
							url: "${pageContext.request.contextPath}/read/scrap",
							type : "post",
							contentType : "application/json",
							data: JSON.stringify(ScrapVo),
							dataType : "json",
							success : function() {
								console.log("성공");							
							}, 
							error : function(XHR, status, error) {
								console.error(status + " : " + error);
							}
						});
					})
					
						$(".scrapRemoveButton").on("click",function(){
						var userNo = ${authUser.chef_no};
						var recipe_no = '${readformVo2.recipe_no }';
						$("#scrap").empty();
						var str = "<button class='btn btn-xs btn-default unlikeButton' name = '${readformVo2.recipe_no }' style = 'float:right; margin-right:15px;'><span class='glyphicon glyphicon-book'></span> 좋아요 해제 </button>";
						
						$(this).replaceWith(str);
						
						var ScrapVo = {
								recipe_no:recipe_no,
								userNo:userNo
						}
						console.log(ScrapVo);
						
						$.ajax({
							url: "${pageContext.request.contextPath}/read/scrapremove",
							type : "post",
							contentType : "application/json",
							data: JSON.stringify(ScrapVo),
							
							success : function() {
								console.log("성공");							
							}, 
							error : function(XHR, status, error) {
								console.error(status + " : " + error);
							}
						});
						
						
					})
					
				
					$(".likeButton").on("click",function(){
						
						var chef_no = ${authUser.chef_no};
						var recipe_no = '${readformVo2.recipe_no }';
						$("#likearea2").empty();
						var str1 = "<button class='btn btn-xs btn-default unlikeButton' name = '${readformVo2.recipe_no}likebtn' style = 'float:right; margin-right:15px'><span class='glyphicon glyphicon-book'></span> 좋아요 해제 </button>";
						
						$("#likearea2").append(str1);
						var LikeVo = {
								chef_no:chef_no,
								recipe_no:recipe_no
						}
						console.log(LikeVo);
						
						$.ajax({
							url: "${pageContext.request.contextPath}/read/addlike",
							type : "post",
							contentType : "application/json",
							data: JSON.stringify(LikeVo),
							success : function() {
								console.log("성공");							
							}, 
							error : function(XHR, status, error) {
								console.error(status + " : " + error);
							}
						});
					})
					
					
					$(".unlikeButton").on("click",function(){
						var chef_no = ${authUser.chef_no};
						var recipe_no = '${readformVo2.recipe_no }';
						$("#likearea").empty();
						var str2 = "<button class='btn btn-xs btn-default unlikeButton' name = '${readformVo2.recipe_no }likebtn' style = 'float:right; margin-right:15px'><span class='glyphicon glyphicon-book'></span> 좋아요 </button>";
						
						$("#likearea").append(str2);
						
						var LikeVo = {
								recipe_no:recipe_no,
								chef_no:chef_no
						}
						console.log(LikeVo);
						
						$.ajax({
							url: "${pageContext.request.contextPath}/read/dellike",
							type : "post",
							contentType : "application/json",
							data: JSON.stringify(LikeVo),
							success : function() {
								console.log("성공");							
							}, 
							error : function(XHR, status, error) {
								console.error(status + " : " + error);
							}
						});
					})
					
					</script>
					<!-- <h6 class="line-title">댓글</h6> -->
					<br>
					<br>
					<br>
					
					
					
						
						
						
					</h4>
					<hr>
					<table border="0" width="860px" style="margin-top:20px; margin-left:10px;">
					  <tr height="160">
					    <td rowspan="2">
					    	<img src="${readformVo2.food_img}" alt="post img" class="foodsample" width="420px" height = "280px">
					    </td>
					    <td >
						   	<div class="container" style = "width: 380px;">
								<div class="row">                   
							        <div class="progress">
							           <c:if test="${readformVo2.cooking_time=='5분이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 12.5%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='10분이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 25%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='15분이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 37.5%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='30분이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 50%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='60분이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 62.5%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='90분이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 75%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='2시간이내' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 87.5%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <c:if test="${readformVo2.cooking_time=='2시간이상' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							           </c:if>
							            <span class="progress-type" style="font-size:10px;">조리시간</span>
							            <span class="progress-completed" style="font-size:10px;">${readformVo2.cooking_time }</span>
							        </div>
							        
							        <div class="progress">
							          <c:if test="${readformVo2.cooking_level=='아무나' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
							                <span class="sr-only">100% Complete (success)</span>
							            </div>
							          </c:if>
							          <c:if test="${readformVo2.cooking_level=='초급' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
							                <span class="sr-only">100% Complete (success)</span>
							            </div>
							          </c:if>
							          <c:if test="${readformVo2.cooking_level=='중급' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
							                <span class="sr-only">100% Complete (success)</span>
							            </div>
							          </c:if>
							          <c:if test="${readformVo2.cooking_level=='고급' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
							                <span class="sr-only">100% Complete (success)</span>
							            </div>
							          </c:if>
							          <c:if test="${readformVo2.cooking_level=='신의 경지' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
							                <span class="sr-only">100% Complete (success)</span>
							            </div>
							          </c:if>
							            <span class="progress-type" style="font-size:10px;">난이도</span>
							            <span class="progress-completed" style="font-size:10px;">${readformVo2.cooking_level }</span>
							        </div>
							        
							        <!-- 인분 -->
							        <div class="progress">
							          <c:if test="${readformVo2.amount=='1인분' }">
							           <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 16%">
							                <span class="sr-only">20% Complete (success)</span>
							           </div>
							          </c:if>
							          <c:if test="${readformVo2.amount=='2인분' }">
							           <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 32%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							          </c:if>
							          <c:if test="${readformVo2.amount=='3인분' }">
							           <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 48%">
							                <span class="sr-only">20% Complete (success)</span>
							           </div>
							          </c:if>
							          <c:if test="${readformVo2.amount=='4인분' }">
							            <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 64%">
							                <span class="sr-only">20% Complete (success)</span>
							            </div>
							          </c:if>
							          <c:if test="${readformVo2.amount=='5인분' }">
							           <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
							                <span class="sr-only">20% Complete (success)</span>
							           </div>
							          </c:if>
							          <c:if test="${readformVo2.amount=='6인분이상' }">
							           <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
							                <span class="sr-only">20% Complete (success)</span>
							           </div>
							          </c:if>
							            <span class="progress-type" style="font-size:10px;">양</span>
							            <span class="progress-completed" style="font-size:10px;">${readformVo2.amount }</span>
							        </div>
								</div>
							</div>
						</td>
					  </tr>
					  <tr height="100">
					    <td style="padding-left:20px; padding-right:20px; background-color: #e8e8e8; font-size:15px">${readformVo2.introduction}</td>
					  </tr>
					</table>
					<br>
					<br>
					<br>
					
					<div class="content-fluid">
					  <div>
					  
					    <div style="margin-top:100px; margin-bottom: 80px; margin-left:30px; margin-right:30px;">
				     		<h6 class="line-title">재료 내역</h6> 
				    	</div>
					    
					    <div>
							<!-- 재료,양이 나오는 메소드 -->
							<div class="container-fluid">
								<div class="row" align="center" >
									<div>
										<!-- 재료,양이 나오는 메소드 -->
										<div class="container-fluid">
											<div class="row" align="center">
												<div align="center">
													<div class="alert alert-success" style="font-size:15px; width: 600px; padding:50px; background-color: ivory; border:0px;">
														<table class="table">
															<thead>
																<tr>
																	<th>재료</th>
																	<th>양</th>
																</tr>
															</thead>
															<tbody>
																<c:forEach items="${list3}" var="vo">
																	<div class="row">
																		<div class="col-md-5ths col-sm-5ths black"></div>
																	</div>
																	<tr>
																		<td>${vo.material_name}</td>
																		<td>${vo.amount}</td>
																	</tr>
																</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
											</div>
										</div>	
									</div>
								</div>
							</div>							
					    </div>
					  </div>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					
					<div>
						<div style="margin-top:100px; margin-bottom: 80px; margin-left:30px; margin-right:30px;">
				     		<h6 class="line-title">조리 순서</h6> 
				    	</div>
						
						<div>
							<div class="container">
								<div class="row">
									<!-- 조리 순서 리스트 -->
									<c:set var="no" value="0"/>
									<c:forEach items="${list}" var="vo">
									
										
										<table border="0" width="880px" style = "margin-bottom:60px;">
											<tr>
												<td colspan = "2" style = "margin-bottom:10px;">
													<label
													style="float:left; color: #528540; font-weight: bold; font-size: 40px;">${no+1 }</label>
													<p style = "float:left; color: #528540; font-weight: bold; font-size: 20px;">&nbsp 단계</p>
													<c:set var="no" value="${no+1}"/>
												<br>
												<br>
												</td>
											</tr>
											<tr>
												<td align="center" style="background-color:black;">
													<div>
														<img src="${vo.img_content}" width="780px" height = "520px">
													</div>
												</td>
											<tr>
												<td valign="top" style=" height:130px; font-size: 15px; padding:15px; background-color:white; margin-right:10px;">
													<br>
													<p class="list-group-item-text">${vo.text_content}</p>
												</td>
											</tr>
										</table>
										<br> 
									</c:forEach>
								</div>
							</div>
						</div>
					</div>	
					<br>
					<br>
					<br>
					<!-- 레시피 수정, 삭제 -->
               <c:if test="${authUser.chef_no == chef.chef_no}">
               
               <div style = "margin-bottom:20px">
               <a href="${pageContext.request.contextPath }/read/delete?recipe_no=${readformVo2.recipe_no}&chef_no=${readformVo2.chef_no}" class="btn btn-default btn-sm" style="color:white;background-color:#b6c98f; border-style:none; float:right; margin-right:10px;" onclick="alert('삭제되었습니다.')"><span class="glyphicon glyphicon-trash"></span> 삭제</a>
               </a>
               
               
               <a href="${pageContext.request.contextPath }/read/modify?recipe_no=${readformVo2.recipe_no}" class="btn btn-sm btn-default" style="color:white; background-color:#b6c98f; border-style:none; float:right; margin-right:20px;"><span class="glyphicon glyphicon-wrench"></span>  수정</a>
               </c:if>
               </div>
               
               <br>
               <br>
               <br>
					
	

							<!-- 댓글 쓰는창 -->
					<div class="panel panel-default widget" style="width: 880px;">
						<div class="panel-heading">
							<span class="glyphicon glyphicon-comment" style="font-size: 15px;">  댓글</span>
						</div>
						<div class="panel-body">
							<ul class="list-group">
								<li class="list-group-item">
									<div class="row">
										<div class="col">
											<div class="panel-body">
												<!-- 댓글 창 -->
												<form id="write_form" method="post" action="${pageContext.request.contextPath}/read/insert">
													<fieldset>
														<div class="form-group">
															<textarea name="user_comment" class="form-control" rows="3" placeholder="댓글을 입력해주세요." style = "width:720px; resize:none; float:left"></textarea>
															<button type="submit" style="float:right; background-color:#b6c98f; border-style:none;" class="[ btn btn-success ]" data-loading-text>댓글 달기</button>
														</div>
													</fieldset>
												</form>

											</div>
										</div>
									</div>
								</li>
							</ul>
								<ul id="dat_list"></ul>
								<div id="pager" class="active" align=center></div>
						</div>
					</div>
				</div>

					  <br>
					  <br>
					  <br>
					  <div>
					  
					  	<div style="margin-top:100px; margin-bottom: 80px; margin-left:30px; margin-right:30px;">
				     		<h6 class="line-title">연관된 다른 레시피</h6> 
				    	</div>
						  
						  	<!-- 추천레시피 -->
								<div class="container-fluid">
									<div class="row">
										<div class="col-md-4">
											<div class="single-blog-item">
												<div class="blog-thumnail">
													<a href="${pageContext.request.contextPath}/user/readform"><img src="${pageContext.request.contextPath}/assets/img/2.png" class ="foodimage" alt="blog-img"></a>
												</div>
												<div class="blog-content">
													<h4>
														<a href="${pageContext.request.contextPath}/user/readform">제육볶음</a>
														<h style="font-size:6px; color:green;">by </h>
														<a href="${pageContext.request.contextPath }/userpage/main?chef_no=${chef.chef_no }" style="font-size:12px; color:black;">Kim Tae Hee</a>
													</h4>
													<p>정말 맛있는 제육볶음 소개~</p>
												</div>
												<span class="blog-date">좋아요 99</span>
											</div>
										</div>
										<div class="col-md-4">
											<div class="single-blog-item">
												<div class="blog-thumnail">
													<a href="${pageContext.request.contextPath}/user/readform"><img src="${pageContext.request.contextPath}/assets/img/2.png" class ="foodimage" alt="blog-img"></a>
												</div>
												<div class="blog-content">
													<h4>
														<a href="${pageContext.request.contextPath}/user/readform">제육볶음</a>
														<h style="font-size:6px; color:green;">by </h>
														<a href="${pageContext.request.contextPath }/userpage/main?chef_no=${chef.chef_no }" style="font-size:12px; color:black;">Kim Tae Hee</a>
													</h4>
													<p>정말 맛있는 제육볶음 소개~</p>
												</div>
												<span class="blog-date">좋아요 99</span>
											</div>
										</div>
										<div class="col-md-4">
											<div class="single-blog-item">
												<div class="blog-thumnail">
													<a href="${pageContext.request.contextPath}/user/readform"><img src="${pageContext.request.contextPath}/assets/img/2.png" class ="foodimage" alt="blog-img"></a>
												</div>
												<div class="blog-content">
													<h4>
														<a href="${pageContext.request.contextPath}/user/readform">제육볶음</a>
														<h style="font-size:6px; color:green;">by </h>
														<a href="${pageContext.request.contextPath }/userpage/main?chef_no=${chef.chef_no }" style="font-size:12px; color:black;">Kim Tae Hee</a>
													</h4>
													<p>정말 맛있는 제육볶음 소개~</p>
												</div>
												<span class="blog-date">좋아요 99</span>
											</div>
										</div>
									</div>
								</div>
								
						  </div>
					  </div>
					<br>
					<br>
					<br>
				<div class="media"></div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>	
		
	<c:import url="/WEB-INF/views/includes/userModal.jsp"></c:import>
	
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>
	
</body>


<!-- 댓글의 ajax -->

<script type="text/javascript">
	$(document).ready(function() {
		fetchlist();//list를 그려라 라는 명령

		//저장버튼 클릭
		$("#write_form").on("submit", function() {//위에 있는 write_form 즉, 전에 사용하던 write_Form의 기능을 막아준다.
			event.preventDefault();//원래 기능을 막아준다.
			console.log("전송완료");
			
			
			var user_comment = $("[name=user_comment]").val();
			
			console.log(user_comment);
			
			$('#dat_list').empty();
			$('#pager').empty();
			

			//ajax의 형식
			$.ajax({
				url : "${pageContext.request.contextPath }/read/add",
				type : "post",//데이터 형식
				/*contentType : "application/json",*/
				data : {
					user_comment : user_comment,
					recipe_no : '${readformVo2.recipe_no}',
					chef_no :'${chef.chef_no}'
				},//앞의 name은 앞쪽에서의 name 뒤에서는 넘기고 싶은 값

				dataType : "json",//json으로 받는다.
				success : function(datVo) {
					
					fetchlist();
					
					
					/*성공시 처리해야될 코드 작성*/},

				error : function(XHR, status, error) {
					console.error(status + " : " + error);

				}

			});

		});
		
		
		//목록
		$('#pager').on('click', 'button', function(){
			
			$('#dat_list').empty();
			
			
			
			var page=$(this).val()*1;
				
			var start=(page-1)*3;
			var end=(3*page);
		
		$.ajax({
			url : "${pageContext.request.contextPath }/read/list",
			type : "post",//데이터 형식
			/*contentType : "application/json",*/
			data : {recipe_no : '${readformVo2.recipe_no}'},

			//dataType : "json",
			success : function(datlist) {
				
								
				for (var i=start; i <end; i++) {
					reader(datlist[i], "down");//한번씩 List값을 가져오라는 얘기
				}
				

				
				/*성공시 처리해야될 코드 작성*/},

			error : function(XHR, status, error) {
				console.error(status + " : " + error);

			}

		});
		
		
		
		});//number의 마무리 괄호
		

		$('#dat_list').on('click', 'button', function(){
			
			
			console.log(this);
			var comment_no = $(this).val();
			console.log(comment_no);
			
			$('#dat_list').empty();
			$('#pager').empty();
			
			console.log(comment_no);
				
		
		$.ajax({
			url : "${pageContext.request.contextPath }/read/delete",
			type : "post",//데이터 형식
			/*contentType : "application/json",*/
			data : {comment_no: comment_no},

			//dataType : "json",
			success : function(datlist) {
				
				fetchlist();

				
				/*성공시 처리해야될 코드 작성*/},

			error : function(XHR, status, error) {
				console.error(status + " : " + error);

			}

		});
		
		
		
		});//number의 마무리 괄호
		
		
		
		

	});//ready를 마무리 하는 괄호

	
	
	function fetchlist() {

		//ajax의 형식
		$.ajax({
			url : "${pageContext.request.contextPath }/read/list",
			type : "post",//데이터 형식
			/*contentType : "application/json",*/
			data : {recipe_no : '${readformVo2.recipe_no}' },

			//dataType : "json",
			success : function(datlist) {
				
				
				for (var i =0; i < 3; i++) {
					reader(datlist[i], "down");//한번씩 List값을 가져오라는 얘기
				}
				if(datlist.length%3==0){
					var pageNo=datlist.length/3;
					for(var j=1; j<=pageNo; j++){
						paging(j);
					}
				}
				else{
					var pageNo2=(datlist.length/3)+1;
					for(var k=1; k<=pageNo2; k++){
						paging(k);
					}
				}

				
				/*성공시 처리해야될 코드 작성*/},

			error : function(XHR, status, error) {
				console.error(status + " : " + error);

			}

		});

	}
	
	

	function reader(datVo, updown) {

		var str = "";//여기에 문자열을 담는다.

		str += "   <ul class='list-group'>";
		str += "      <li class='list-group-item'>";
		str += "          <div class='row'>";
		str += "            <div class='col-xs-10 col-md-11'>";
		str += "               <div>";
		str += "                  <a href='#' style='margin-left: 150px;'>"+ datVo.nickname +"</a>";
		str += "                    <div class='col'>";
		str += "                      <div class='panel-body'>";
		str += "                         <div class='col-xs-2 col-md-1' style='width: 120px;'>";
		str += "                           <img src='"+ datVo.profile +"' class='img-circle img-responsive' alt='' />";
		str += "                         </div> ";
		str += "                              <fieldset>";
		str += "                                 <div class='form-group'>";
		str += "                                   <p class='form-control'>"+ datVo.user_comment +"</p>";
		str += "                                 </div>";
		str += "                              </fieldset>";
		str += "                      </div>";
		str += "                    </div>";
		str += "                   </div>";
		str += "               </div>";
		str += "            </div>";
		str += "          </div>";
		str += "                <div align=right>";
		
		if(datVo.chef_no==1){
			str += "             <button class='[ btn btn-success ]' style='background-color:#b6c98f; border-style:none;' name='comment_no' id='comment_no' value="+datVo.comment_no+">삭제</button>"
		}
	    str += "                </div>";
		str += "          </li>";
		str += "   </ul>";
		

		if (updown == "down") {
			$("#dat_list").append(str);//javascript는 ()를 이용

		} else if (updown == "up") {
			$("#dat_list").prepend(str);
		} else {
			$("#dat_list").append(str);
		}

	}
	
	function paging(length){
		
		var str="";
		
		
		str+="<button class='[ btn btn-success ]' style='background-color:#b6c98f; border-style:none;' value="+length+">"+length+"</button> ";
		
		$("#pager").append(str);
		
	}

	function readURL(input) {

	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#blah').attr('src', e.target.result);
	        }

	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$("#imgInp").change(function(){
	    readURL(this);
	});
	
</script>

	<!-- progress bar -->
    <style type="text/css">
        body {
    margin: 30px 0px;
}
.progress {
    position: relative;
	height: 25px;
}
.progress > .progress-type {
	position: absolute;
	left: 0px;
	padding: 3px 30px 2px 10px;
	color: rgb(255, 255, 255);
	background-color: rgba(25, 25, 25, 0.2);
}
.progress > .progress-completed {
	position: absolute;
	right: 0px;
	padding: 3px 10px 2px;
}



/* text box */
body, html {
  height: 100%;
}

body {
  font-size: 0.6em;
  line-height: 1.4em;
  color: #6F7C80;
}

.content {
  padding-top: 100px;
}

section {
  width: 500px;
  margin: auto;
  text-align: center;
  margin-bottom: 3em;
}

.line-title {
  margin-top:1.3em;
  margin-bottom: 1.3em;
  font-size: 18px;
  text-align: center;
  display: block;
  position: relative;
  overflow: hidden;
  color: #6F7C80;
}
.line-title:before, .line-title:after {
  content: '';
  display: inline-block;
  height: 1px;
  background: #6F7C80;
  width: 50%;
  position: relative;
  vertical-align: middle;
}
.line-title:before {
  left: -0.5em;
  margin-left: -50%;
}
.line-title:after {
  right: -0.5em;
  margin-right: -50%;
}




    </style>
    
    
    

</html>
