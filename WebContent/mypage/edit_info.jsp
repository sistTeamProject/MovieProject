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
    <title>마이페이지_회원정보수정</title>

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
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
});
$(function(){
/* 	// ▼ 아이디 중복체크
	$('#idBtn').click(function(){
		 Shadowbox.open({
			content:'../member/idcheck.jsp',
			player:'iframe',
			title:'아이디 중복체크',
			width:340,
			height:200
		}); 
	});
	
	// ▼ 비밀번호 체크
	$('#pwdcheck').click(function(){
		// ▼ id입력 확인
		let id=$("#id").val();
		if(id.trim()=="")
		{
			$('#id').focus();
			return;
		}
		
		// ▼ 요청처리 , 응답처리 
			$.ajax({
			type:'POST',
			url:'../member/pwdcheck.do',
			data:{"id":id}, // 데이터 전송 idcheck.do?id=hong
			success:function(res) //정상수행시에 => res는 실행된 모든 데이터를 읽어온다 
			{
				let count=res.trim();// 출력된 숫자를 받는다 (0,1)
				if(count==0) //id가 없는 경우
				{
					$('#result').html('<span style="color:blue">사용 가능한 ID입니다</span>');
					$('#ok').show(); // 확인 버튼 출력 
				}
				else //id가 있는 경우
				{
					$('#result').html('<span style="color:red">사용 중인 ID입니다</span>');
				}
			}
		})
	})
	$('#okBtn').click(function(){
		parent.joinFrm.id.value=$('#id').val();// 사용가능한 id를 회원가입창에 전송
		parent.Shadowbox.close();// Shadowbox 닫기 
	})
		
	})
	 */
	// ▼ 우편번호 찾기 
	$('#postBtn').click(function(){
		 Shadowbox.open({
			content:'../member/postfind.jsp',
			player:'iframe',
			title:'우편번호 찾기',
			width:530,
			height:350
		}); 
	});
	
	// ▼ 필수입력
	$('#sendBtn').click(function(){
		/* 
		let pwdcheck=$('#pwdcheck').val();
		if(pwdcheck.trim()==""){
			alert('비밀번호를 확인해주세요');
			$('#pwdcheck').focus();
			return;
		} 
		*/
		
		let pwd=$('#pwd').val();
		if(pwd.trim()=="")
		{
			$('#pwd').focus();
			return;
		}
		let pwd1=$('#pwd1').val();
		if(pwd!=pwd1)
		{
			$('#pwd1').focus();
			alert('비밀번호를 다시 입력해주세요');
			return;
		}
		
		// 이름 
		let name=$('#name').val();
		if(name.trim()=="")
		{
			$('#name').focus();
			return;
		}
		// 생년월일
		let birth=$('#birthday').val();
		if(birth.trim()=="")
		{
			$('#birthday').focus();
			return;
		}
		// 이메일
		let email=$('#email').val();
		if(email.trim()=="")
		{
			$('#email').focus();
			return;
		}
		// 주소 
		/* let addr1=$('#addr1').val();
		if(addr1.trim()=="")
		{
			$('#addr1').focus();
			return;
		} */
		
		// 전화번호
		let tel2=$('#tel2').val();
		if(tel2.trim()=="")
		{
			$('#tel2').focus();
			return;
		}
		let tel3=$('#tel3').val();
		if(tel3.trim()=="")
		{
			$('#tel3').focus();
			return;
		}
		
		// 정상수행 
		$('#editInfo').submit();
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
                        <h2>회원정보수정</h2>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Normal Breadcrumb End -->

<!-- Signup Section Begin --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="container clear">
    <div class="row">
    <div class="col-lg-9" style="padding-left:50px">
    <form method="post" action="../mypage/edit_info_ok.do" id="editInfo" name="editInfo">
     <table class="table"  style="color: white">
      <!--
       <tr>
         <th class="text-center" width=20%>프로필사진</th>
         <td width=30% height=80%>
           <input type=file value="사진업로드" id=profileBtn class="btn btn-sm">
         </td>
       </tr>-->
       <tr style="color: white">
         <th class="text-center" width=20%>ID</th>
         <td width=85% class="inline">${sessionScope.id }</td>
       </tr>
       <!-- ===================================================================================================== 
       <tr>
         <th class="text-center" width=20%>기존 비밀번호</th>
         <td width=85% class="inline">
           <input type=password placeholder="기존 비밀번호 입력" name=pwd size=20 class="input-sm" id=pwdcheck >
           <input type=button value="비밀번호 확인" class="btn btn-sm btn-primary" id="pwdcheckBtn">
         </td>
      </tr>
      ============================================================================================================= -->
      <tr>
         <th class="text-center" width=20%>변경할 비밀번호</th>
         <td width=85%>
           <input type=password placeholder="변경할 비밀번호 입력" name=pwd size=20 class="input-sm" id=pwd><br>
           <input type=password name=pwd1 size=20 class="input-sm" placeholder="변경할 비밀번호 재입력" id=pwd1 style="margin-top:5px">
         </td>
       </tr>
       <tr>
         <th class="text-center" width=20%>이름</th>
         <td width=85% class="inline">
           <input type=text name=name size=20 class="input-sm" id=name required value="${sessionScope.name }">
         </td>
       </tr>
       <tr>
         <th class="text-center" width=20%>성별</th>
         <td width=85% class="inline">
           <c:if test="${vo.sex eq '남자' }">
	           <input type="radio" value="남자" name=sex checked>남자
	           <input type="radio" value="여자" name=sex>여자
           </c:if>
           <c:if test="${vo.sex eq '여자' }">
	           <input type="radio" value="남자" name=sex>남자
	           <input type="radio" value="여자" name=sex checked>여자
           </c:if>
         </td>
       </tr>
       <tr>
         <th class="text-center" width=20%>생년월일</th>
         <td width=85%>
           <input type="date" size=30 name=birthday id=birthday required value="${vo.birthday }">
         </td>
       </tr>
       <tr>
         <th class="text-center" width=20%>이메일</th>
         <td width=85%>
           <input type=text name=email size=30 class="input-sm" id=email required value="${vo.email }">
         </td>
       </tr>
       <tr>
         <th class="text-center" width=20%>우편번호</th>
         <td width=85% class="inline">
           <input type=text name=post1 size=7 class="input-sm" readonly id="post1" value="${post1 }">-
           <input type=text id=post2 name=post2 size=7 class="input-sm" readonly value="${post2 }">
           <input type=button value="우편번호검색" class="btn btn-sm btn-primary" id=postBtn>
         </td>
       </tr>
       <tr>
         <th class="text-center" width=20%>주소</th>
         <td width=85%>
           <input type=text name=addr1 size=55 class="input-sm" id=addr1 readonly value="${vo.addr1 }">
         </td>
       </tr>
       <tr>
         <th class="text-center" width=20%>상세주소</th>
         <td width=85%>
           <input type=text name=addr2 size=55 class="input-sm" value="${vo.addr2 }">
         </td>
       </tr>
       <tr>
         <th class="text-center" width=20%>전화번호</th>
         <td width=85% class="inline"  style="color: black">
           <select name=tel1 class="input-sm">
            <option>010</option>
           </select>-
           <input type=text name=tel2 size=7 class="input-sm" id=tel2 required value="${tel2 }">-
           <input type=text name=tel3 size=7 class="input-sm" id=tel3 required value="${tel3 }">
         </td>
       </tr>
       <tr>
         <td colspan="2" class="text-center inline">
           <input type=submit value="수정" class="btn btn-sm btn-info" id=sendBtn>
           <input type=button value="취소" class="btn btn-sm btn-success" 
             onclick="javascript:history.back()"
           >
         </td>
       </tr>
     </table>
     </form>
    </div>
    </div>
  </main>
 </div>
 <!-- Signup Section End -->
 
</body>
</html>
