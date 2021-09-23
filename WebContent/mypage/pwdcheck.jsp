<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/*  ================================================================================   ㅠ_____ㅠ
$(function(){
	$('#pwdcheckBtn').click(function(){
		let pwd=$('#pwd_check').val();
		if(pwd.trim()==""){
			$('#pwd_check').focus();
			return;
		}
	
	$.ajax({
		type:'post',
		url:'../member/pwdcheck_result.do',
		data:{"pwd":pwd},
		success:function(res){
			let result=res.trim();			
			if(result=='NOPWD'){
				alert("비밀번호가 존재하지 않습니다\n다시 입력하세요");
				$('#log_pwd').val("");
				$('#log_pwd').focus();
			}
			else{
				//로그인 성공
				location.href="mypage/edit_info.do";
			}
		}
	})
	})

})
==============================================================================*/
//▼ 임시 코딩
$(function(){
	$('#pwdcheckBtn').click(function(){
		let pwd=$('#pwd_check').val();
		if(pwd.trim()==""){
			alert('비밀번호를 입력하세요');
			$('#pwd_check').focus();
			return;
		}
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
                    <div class="normal__breadcrumb__text" >
                      <p>비밀번호 확인</p>
                     	<div class="input__item" style="padding:10px 0px 10px 0px">
	                      <input type="password" placeholder="password" id="pwd_check">
	                    </div>
                      	<!-- <input type=button value="확인" class="btn btn-sm btn-danger" id=pwdcheckBtn> 
                      	▼ 임시 코딩 																		-->
	                    <a href="../mypage/edit_info.do" class="btn btn-sm btn-dark" id=pwdcheckBtn>확인</a>
			          	<a href="../main/main.do" class="btn btn-sm btn-dark">취소</a>
                	</div>
            	</div>
        	</div>
       </div>
    </section>
    <!-- Normal Breadcrumb End -->
</body>
</html>