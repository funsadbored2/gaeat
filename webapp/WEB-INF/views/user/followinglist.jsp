<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico"/>
<title>가릿 - 가려서 먹자</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- css, bootstrap, js 적용 -->
	<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/assets/css/userpage.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/assets/css/followerlist.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.min.js"></script>
	
<style type="text/css">

.art-title a {
 font-family:'squareRoundEB';
     size: 20px;
 margin-left:40px;
}
.counter-middle{
 font-family:'squareRoundL';
   font-size: 12px;
}
.counter-bottom{
 font-family:'squareRoundL';
   font-size: 20px;
 margin-left:25px;
}


body {
   margin: 20px;
}

#spacer {min-height:3em;}

.box {
    margin:auto; 
    width: 80%; 
}
    
.followintro {
	
    overflow: hidden;
    position: relative;
    line-height: 1em;
    max-height: 2em;
    text-align: justify;
    margin-right: -1em;
    padding-right: 1em;
    text-align: right;
}
          
.followintro:before {
    content: '...';
    position: absolute;
    right: 0;
    bottom: 0;
}
          
.followintro:after {
  content: '';
  position: absolute;
  right: 0;
  width: 1em;
  height: 1em;
  margin-top: 0.2em;
}
.badge-info{
	margin-top:2px;
}
.followed,.following{
margin-top:10px;
 border-radius: 5px;
}

</style>	
	
	
</head>


<body>

	<c:import url="/WEB-INF/views/includes/headNav.jsp"></c:import>

	<div class="mainbody container">
		<div class="row">

			<div style="padding-top: 30px;"></div>
			<div class="col-lg-2 col-md-2 hidden-sm hidden-xs">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="media">
							<div align="center">
								<img class="thumbnail img-responsive" src="${chef.profile }" width="300px" height="300px">
							</div>

							<!--  왼쪽부분 -->
							<div class="media-body">
								<a href="${pageContext.request.contextPath }/userpage/main?chef_no=${chef.chef_no }" style="font-size:18px; color:black;"><strong>${chef.nickname }</strong></a>
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
													
													<a href = "#" type = "button" class="followed btn btn-xs btn-success" name = "${chef.chef_no}"> <span class="glyphicon glyphicon-heart"></span>팔로우 중</a>
													
												</c:if>
												
												<c:if test = "${followcheck != 1}">
													
													<a href = "#" type = "button" class="following btn btn-xs btn-success" name = "${chef.chef_no}"><span class="glyphicon glyphicon-heart-empty"></span> 팔로우하기</a>
												
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
										
										str = "<a href='#' class='btn btn-xs btn-success followed' name = '"+chef_no+"'> <span class='glyphicon glyphicon-heart'></span> 팔로우 중</a>";
										
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
								
								<c:forEach items="${recipebookList }" var="list">
									<tr>
										<a href="#" style="font-size:11px; color:black;">${list.recipebook_name }</a>
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
			<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">

				<!-- 카테고리 -->
				<div class="panel panel-default">
					<div class="panel-body">
						<h4>
							<h style="color:black;"><strong>${chef.nickname }님의 팔로우</strong></h>
						</h4>
						<hr>

						<!-- 프로필 섬네일 -->
						<div class="container-fluid">
				    		<div class="row">
					    		<c:forEach items="${followingList }" var="followingList">
					                <div class="col-md-4">
					                	<div class="artist-data pull-left">
					                    	<div class="artst-pic pull-left">
					                    		<a href="${pageContext.request.contextPath}/userpage/main?chef_no=${followingList.chef_no}">
					                    			<img src="${followingList.profile}" alt="" class="img-responsive" width="100px" height="100px" style = "border-radius: 10px;"/>
					                    		</a>
					                    	</div>
					                        <div class="artst-prfle pull-right">
					                        	<div class="art-title">
					                            	<a href="${pageContext.request.contextPath}/userpage/main?chef_no=${followingList.chef_no}" style="font-size:12px; color:black;"><Strong>${followingList.nickname }</Strong></a>
					                            	<br>
					                            </div>
					                         <div class="counter-middle ">
						                          <div id="spacer">
							                          <div class= "box">
								                          <div class="followintro">
								                          ${following.self_intro }
								                          </div>
							                            </div>
						                          </div>
					                          </div>  
					                            
					                             <div class="counter-bottom">
					                           	<a href="${pageContext.request.contextPath}/userpage/followinglist?chef_no=${followingList.chef_no}">
						                            <span class=" badge badge-info">followers : ${followingList.followed_count}</span>
						                        </a>
						                        <c:choose>
						                        <c:when test="${authUser.chef_no==followingList.chef_no}">
						                        
						                        </c:when>
						                        <c:otherwise>
							                        <c:choose>
													<c:when test = "${followingList.followingcheck2==1}">
														<a href = "#" type = "button" class="followed btn btn-xs btn-success" style="border-radius:10px;" name = "${followingList.chef_no}"> 
																<span class="glyphicon glyphicon-heart">
																</span>팔로우 중
															</a>
													</c:when>
													<c:otherwise>
													<a href = "#" type = "button" class="following btn btn-xs btn-success"style="background-color:#eef5ee;color:#689068;border-radius:10px;" name = "${followingList.chef_no}">
															<span class="glyphicon glyphicon-heart-empty">
															</span> 팔로우하기
														</a>
													
												
													</c:otherwise>
													</c:choose>
						                        
						                        </c:otherwise>
						                        </c:choose>
					                     		
					                     
					                     		
					                           </div>
					                            
					                            
					                        </div>
					                        
					                    </div><!-- artist-data pull-left" -->
					                </div>
					            </c:forEach>
				            </div>
						</div>
						
						<hr>
						<div class="media"></div>
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
	<br>
	<br>
	<br>
	<br>
	<br>	
		
	<c:import url="/WEB-INF/views/includes/userModal.jsp"></c:import>
	
	<c:import url="/WEB-INF/views/includes/footer.jsp"></c:import>