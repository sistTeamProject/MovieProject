<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Anime Template">
    <meta name="keywords" content="Anime, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>회원가입</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Mulish:wght@300;400;500;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/plyr.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="../shadow/css/shadowbox.css">
    
    <!-- Script -->
    <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
    <script type="text/javascript">
    $(function(){
    	$('#logBtn').click(function(){
    		let id=$('#log_id').val();
    		if(id.trim()==""){
    			$('#log_id').focus();
    			return;
    		}
    		let pwd=$('#log_pwd').val();
    		if(pwd.trim()==""){
    			$('#log_pwd').focus();
    			return;
    		}
    		//입력된 경우 데이터 전송
    		
    		$.ajax({
    			type:'post',
    			url:'../member/login_result.do',
    			data:{"id":id,"pwd":pwd},
    			success:function(res){
    				let result=res.trim();
    				if(result=='NOID'){
    					alert("아이디가 존재하지 않습니다\n다시 입력하세요");
    					$('#log_id').val("");
    					$('#log_pwd').val("");
    					$('#log_id').focus();
    				}else if(result=='NOPWD'){
    					alert("비밀번호가 존재하지 않습니다\n다시 입력하세요");
    					$('#log_pwd').val("");
    					$('#log_pwd').focus();
    				}else{
    					//로그인 성공
    					location.href="../main/main.do";
    				}
    			}
    		})
    		
    	})
    })
</script>
</head>
<body>
     <!-- Normal Breadcrumb Begin -->
    <section class="normal-breadcrumb set-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="normal__breadcrumb__text">
                        <h2>로그인</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->


    <!-- Login Section Begin -->
    <section class="login spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="login__form">
                        <h3>Login</h3>
                        
                            <div class="input__item">
                                <span class="icon_mail" style="color:white"></span>
                                <input type="text" placeholder="ID" name="id" id="log_id">
                            </div>
                            <div class="input__item">
                                <span class="icon_lock" style="color:white"></span>
                                <input type="password" placeholder="Password" name="pwd" id="log_pwd" style="margin-top:10px">
                            </div>
                            <button type="button" class="site-btn" id="logBtn" style="margin-top:10px">로그인</button>
                       
                        <a href="#" class="forget_pass">ID/비밀번호 찾기</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="login__register">
                        <h3>계정이 없으십니까?</h3>
                        <a href="join.do" class="primary-btn">회원가입</a>
                    </div>
                </div>
            </div>
            <div class="login__social">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-6">
                        <div class="login__social__links">
                            <span>or</span>
                            <ul>
                                <li><a href="#" class="facebook"><i class="social_facebook"></i> Sign in With Facebook</a></li>
                                <li><a href="#" class="google"><i class="social_googleplus"></i> Sign in With Google</a></li>
                                <li><a href="#" class="twitter"><i class="social_twitter"></i> Sign in With Twitter</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Login Section End -->
    
 
</body>
</html>
