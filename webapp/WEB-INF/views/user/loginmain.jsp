<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">

<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<link href="${pageContext.request.contextPath}/assets/css/main.css"rel="stylesheet" type="text/css">
 <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">

   <style type="text/css">
        /* #####################################################################
   #
   #   Project       : Modal Login with jQuery Effects
   #   Author        : Rodrigo Amarante (rodrigockamarante)
   #   Version       : 1.0
   #   Created       : 07/28/2015
   #   Last Change   : 08/02/2015
   #
   ##################################################################### */
   
@import url(http://fonts.googleapis.com/css?family=Roboto);

* {
    font-family: 'Roboto', sans-serif;
}
	@font-face{
	font-family:'squareRoundEB';
	src:url(${pageContext.request.contextPath}/assets/fonts/NanumSquareRoundEB.ttf) format('truetype') ;
	}

	@font-face{
		font-family:'squareRoundL';
		src:url(${pageContext.request.contextPath}/assets/fonts/NanumSquareRoundL.ttf) format('truetype') ;
	}
	
#login-modal .modal-dialog {
    width: 350px;
}

#login-modal input[type=text], input[type=password] {
	margin-top: 10px;
}


/* #########################################
   #    override the bootstrap configs     #
   ######################################### */

.modal-backdrop.in {
    filter: alpha(opacity=50);
    opacity: .8;
}

.modal-content {
    background-color: #fffefe;
    border: 1px solid #bdc3c7;
    border-radius: 10px;
    outline: 0;
}

.modal-header {
    min-height: 16.43px;
    padding: 15px 15px 15px 15px;
    border-bottom: 0px;
}

.modal-body {
    position: relative;
    padding: 5px 15px 5px 15px;
}

.modal-footer {
    padding: 15px 15px 15px 15px;
    text-align: left;
    border-top: 0px;
}

.checkbox {
    margin-bottom: 0px;
}

.btn {
    border-radius: 10px;
}

.btn:focus,
.btn:active:focus,
.btn.active:focus,
.btn.focus,
.btn:active.focus,
.btn.active.focus {
    outline: none;
}

.btn-lg, .btn-group-lg>.btn {
    border-radius: 0px;
}

.btn-link {
    padding: 5px 10px 0px 0px;
    color: #95a5a6;
}

.btn-link:hover, .btn-link:focus {
    color: #0c5899;
    text-decoration: none;
}

.glyphicon {
    top: 0px;
}

.form-control {
  border-radius: 10px;
}





.bg{
position: absolute; top:0; left: 0;
width: 100%;
height: 100%;
}
.startlogin{
	background-color:white;
     position: absolute;
     height:400px;
     width:600px;
     top:50%;
     left:50%;
     transform: translate(-50%, -50%);                                                                   
     font-size:5rem;
     color: #5e5c5c;
     z-index: 2;
     text-align: center;
}

div#container{
position:relative;
}


.tit_start{
font-family:'squareRoundEB';
font-size:50px;
color:#5e5c5c;
}
.text_start{
font-family:'squareRoundL';
font-size:20px;
color:#5e5c5c;
}

</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
</head>
<body>

	<div class ="loginmain container-fluid " >
		<img src="${pageContext.request.contextPath}/assets/img/loginimg/signupback.jpg"  class="bg" style="opacity: 1;">
		<div class ="startlogin">
			<h3 class ="tit_start"> 가릿 . 시작하기 </h3>
			<p class ="text_start"> "복잡한 절차없이 SNS 계정으로 
			<br>
			 GaEat 을 시작해 보세요 ! "
			</p>
			
			<div class ="list_start">
				<a id="custom-login-btn" href="javascript:loginWithKakao()">
					<img src="${pageContext.request.contextPath}/assets/img/loginimg/kastart.png"/>
				</a>
									
				<a class="btn-facebook "  id="fbLoginBtn" >
					<img src="${pageContext.request.contextPath}/assets/img/loginimg/fbstart.png"/>
				</a>
									
				<a href="#login-modal" id="modalBtn" role="button" data-toggle="modal" data-backdrop="false" >
					<img src="${pageContext.request.contextPath}/assets/img/loginimg/gaeatstart.png"/>
					
				</a>
				
				
				
			</div>
		</div>
			<!-- 최초 로그인 폼 -->
		<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none; background-color: rgba(0, 0, 0, 0.5); z-index: 2;">
			<div class="modal-dialog" style="left: 0%">
							<div class="modal-content">
								<div class="modal-header" align="center">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span class="glyphicon glyphicon-remove" aria-hidden="true">
										</span>
									</button>
								</div>
								<!-- Begin # DIV Form -->
								<div id="div-forms">

									<!-- 로그인 폼 시작  -->
									<form id="login-form" method="post"
										action="${pageContext.request.contextPath}/user/login">
										<div class="modal-body">
											<div id="div-login-msg">
												<div id="icon-login-msg"
													class="glyphicon glyphicon-chevron-right"></div>
												<span id="text-login-msg">이메일/비밀번호를 입력하세요.</span>
											</div>
											<input id="login_username" name="Id" class="form-control"
												type="text" placeholder="가입하신 이메일 아이디를 입력하세요." value="">
											<input id="login_password" name="password"
												class="form-control" type="password"
												placeholder="비밀번호를 입력하세요 " value="">
											<div class="checkbox">
												<label> <input type="checkbox"> 내 입력내용 기억
												</label>
											</div>
										</div>
										<div class="modal-footer">
											<div>
												<button type="submit"
													class="btn btn-primary btn-lg btn-block" style=" border-radius: 10px;">로그인</button>
											</div>
											<div>
												<button id="login_lost_btn" type="button"
													class="btn btn-link">비밀번호찾기</button>
												<button id="login_register_btn" type="button"
													class="btn btn-link">회원가입</button>
											</div>
										</div>
									</form>
									<!-- End # Login Form -->

									<!-- 비밀번호 찾기 -->
									<form id="lost-form" style="display: none;">
										<div class="modal-body">
											<div id="div-lost-msg">
												<div id="icon-lost-msg"
													class="glyphicon glyphicon-chevron-right"></div>
												<span id="text-lost-msg">이메일을 입력하세요.</span>
											</div>
											<input id="lost_email" class="form-control" type="text"
												placeholder="E-Mail (type ERROR for error effect)" required>
										</div>
										<div class="modal-footer">
											<div>
												<button type="submit"
													class="btn btn-primary btn-lg btn-block">찾기</button>
											</div>
											<div>
												<button id="lost_login_btn" type="button"
													class="btn btn-link">로그인</button>
												<button id="lost_register_btn" type="button"
													class="btn btn-link">회원가입</button>
											</div>
										</div>
									</form>
									<!-- 비밀번호 찾기 끝 -->

									<!-- 회원가입폼 시작 -->
									<form id="register-form" method="post" style="display: none;"
										action="${pageContext.request.contextPath }/user/join"
										enctype="multipart/form-data">
										<div class="modal-body" style="height: 400px">
											<div id="image_preview">
												<img src="" width="100"
													class="avatar img-circle img-thumbnail" alt="avatar"
													id="LoadImg">
											</div>

											<input name="file" type="file" id="images"
												onchange="preview_images();"> <input name="Id"
												class="form-control" type="text"
												placeholder="aaa@naver.com 의 형식으로 입력해주세요. " required>
											<input name="name" class="form-control" type="text"
												placeholder="사용자 이름을 입력해 주세요 . " required> <input
												name="nickname" class="form-control" type="text"
												placeholder="사용하실 닉네임을 입력해 주세요 . " required> <input
												name="password" class="form-control" type="password"
												placeholder="사용자 비밀번호를 입력해 주세요. " required> <input
												name="userintro" class="form-control" type="text"
												height="20px" placeholder="사용자 홈에 표시될 간단한 자기 소개를 작성해 주세요."
												required> <input name="socialcheck"
												style="display: none" value="none" id="imgchange">
										</div>
										<div class="modal-footer">
											<div>
												<input type="submit">
											</div>
											<div>
												<button id="register_login_btn" type="button"
													class="btn btn-link">로그인</button>
												<button id="register_lost_btn" type="button"
													class="btn btn-link">비밀번호찾기</button>
											</div>
										</div>
							</form><!-- End | Register Form -->
									
						</div>
					
					</div><!-- End # DIV Form -->
				</div>
			</div>
		</div>

<!-- 최초 로그인 폼 끝 -->
<script type="text/javascript">
				function preview_images() {
					$("#image_preview").empty();
					var total_file = document.getElementById("images").files.length;
					for (var i = 0; i < total_file; i++) {
						$('#image_preview')
								.append(
										"<img  width='100' class='avatar img-circle img-thumbnail' src='"
												+ URL
														.createObjectURL(event.target.files[i])
												+ "'> ");
					}
				}
			</script>


<!-- 최초 로그인 폼 끝 -->
<script type="text/javascript">
	$(function() {

		var $formLogin = $('#login-form');
		var $formLost = $('#lost-form');
		var $formRegister = $('#register-form');
		var $divForms = $('#div-forms');
		var $modalAnimateTime = 300;
		var $msgAnimateTime = 150;
		var $msgShowTime = 2000;

		$('#login_register_btn').click(function() {
			modalAnimate($formLogin, $formRegister)
		});
		$('#register_login_btn').click(function() {
			modalAnimate($formRegister, $formLogin);
		});
		$('#login_lost_btn').click(function() {
			modalAnimate($formLogin, $formLost);
		});
		$('#lost_login_btn').click(function() {
			modalAnimate($formLost, $formLogin);
		});
		$('#lost_register_btn').click(function() {
			modalAnimate($formLost, $formRegister);
		});
		$('#register_lost_btn').click(function() {
			modalAnimate($formRegister, $formLost);
		});

		function modalAnimate($oldForm, $newForm) {
			var $oldH = $oldForm.height();
			var $newH = $newForm.height();
			$divForms.css("height", $oldH);
			$oldForm.fadeToggle($modalAnimateTime, function() {
				$divForms.animate({
					height : $newH
				}, $modalAnimateTime, function() {
					$newForm.fadeToggle($modalAnimateTime);
				});
			});
		}

		function msgFade($msgId, $msgText) {
			$msgId.fadeOut($msgAnimateTime, function() {
				$(this).text($msgText).fadeIn($msgAnimateTime);
			});
		}

		function msgChange($divTag, $iconTag, $textTag, $divClass, $iconClass,
				$msgText) {
			var $msgOld = $divTag.text();
			msgFade($textTag, $msgText);
			$divTag.addClass($divClass);
			$iconTag.removeClass("glyphicon-chevron-right");
			$iconTag.addClass($iconClass + " " + $divClass);
			setTimeout(function() {
				msgFade($textTag, $msgOld);
				$divTag.removeClass($divClass);
				$iconTag.addClass("glyphicon-chevron-right");
				$iconTag.removeClass($iconClass + " " + $divClass);
			}, $msgShowTime);
		}
	});
</script>
	
	
	<!-- facebook -->
<script type="text/javascript">
	//1준비하는 메소드 	        
	window.fbAsyncInit = function() {
		//SDK loaded, initialize it
		FB.init({
			appId : '1903977823198887',
			cookie : true, 
			xfbml : true, 
			version : 'v2.10' 
		});
		//2check user session and refresh it 로그인 여부를 확인합니다. 
		FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
				console.log("커넥트되어있음 ");
				getUserData();
			} else {//로그인 하지않은 상태
				console.log("커넥트 되어 있지 않음  ");
			}
		});
	};

	//load the JavaScript SDK
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.com/ko_KR/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	
	//add event listener to fbLoginBtn
	var fa1 = document.getElementById('fbLoginBtn');
	if (fa1) {
		fa1.addEventListener('click', function() {//do the login
			FB.login(function(response) {
				if (response.authResponse) {
					fbgetUserData();
				}
			}, {
				scope : 'email,public_profile',
				return_scopes : true
			});

		}, false);
	}
	//3데이타를 받아오는 메소드 
	function fbgetUserData() {
		FB.api('/me',
				{ fields : 'name,email,id,picture'},
						function(response) {
							var facebookvo = {
								name : response.name,
								profile : response.picture.data.url,
								id : response.id
							}
							$.ajax({
										url : "${pageContext.request.contextPath }/user/facebook/add",
										type : "POST",
										contentType : "application/json",
										data : JSON.stringify(facebookvo),
										dataType : "json",
										success : function(authUser) {
											FB.logout(function(response) {
											});
												window.location.href = "${pageContext.request.contextPath}/main/index";
										},
										error : function(XHR, status, error) {
											console.error(status + " : "+ error);
										}
									});
						});
	}

</script>
<script type="text/javascript">
/*  카카오톡   */

Kakao.init('e7164519a5043bff4a23dce18aedf1cf');
	
function loginWithKakao() {
		Kakao.Auth.login({
		success : function(authObj) {
			// 로그인 성공시 api호출합니다. 
			access_token = authObj.access_token;
			Kakao.API.request({
				url : '/v1/user/me',
				success : function(resultObj) {
					getUserDataKakao(resultObj);
					
					/* window.location.replace ('${pageContext.request.contextPath}/main/index'); */ 
					
					
				},
				fail : function(error) {
					alert(JSON.stringify(error));
				}
			});
		},
		fail : function(err) {
			alert(JSON.stringify(err));
		}
		});
		
		}
function pagemovetomain(){
location.replace('${pageContext.request.contextPath}/main/index');
}
function getUserDataKakao(res) {
		var kakaovo = {
			name : res.properties.nickname,
			profile : res.properties.profile_image,
			id : res.kaccount_email
		}
		$.ajax({
					url : "${pageContext.request.contextPath }/user/kakao/add",
					type : "POST",
					contentType : "application/json",
					data : JSON.stringify(kakaovo),
					dataType : "json",
					success : function(authUser) {
						console.log("유저 : "+authUser.name);
						Kakao.Auth.logout(function() {pagemovetomain(); });  //자동으로 카카오톡과의 연결을 끊고 메인으로 넘긴다. 
					
					},
					error : function(XHR, status, error) {
						alert("로그인에 실패했습니다. "); 
					}
				});

	}
	
	
</script>

</body>
</html>