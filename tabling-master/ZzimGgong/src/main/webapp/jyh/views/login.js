/**
 * 
 */
//로그인 유효성 체크 
var inputEmail = document.querySelector("[name = email]");
var inputPass = document.querySelector("[name = pws]");
function userLoginCheck(){
	if(inputEmail.value==""||inputEmail.value==null){
		alert("이메일을 입력해주세요.");
		inputEmail.focus();
		return false;
	}
	if(inputPass.value==""||inputPass.value==null){
		alert("비밀번호를 입력해주세요.");
		inputPass.focus();
		return false;
	}
}

// 카카오 SNS 
function kakaoLogin(){
    Kakao.Auth.login({
    	//카카오 로그인 성공 
    	success: function(authObj) {
			Kakao.API.request({
         	    url: '/v2/user/me',
	  			success: function(res) {
	  				// 만약 카카오 로그인이 되어있을 때 
	  				// 카카오 id를 가져옴. k는 카카오 아이디 
	  				var uid = res.id;
	  				var email = res.kakao_account.email;
	  				var nik = res.properties.nickname;
	  				console.log(email);
	  				// 아이디 중복 체크 
	  				var xhr = new XMLHttpRequest();
	  				xhr.open("get","/checkIDservice?email="+email,true);
	  				xhr.send();
	  				// 만약 계정번호도 불러와야함. 낼 계정번호 정리해서 유효성검사 마무리하기.
	  				xhr.onreadystatechange=function(){
	  					if(xhr.readyState==4 && xhr.status==200){
		                    console.log(email);
	  					    var ck = xhr.responseText;
	  						if(ck =="kakao_auth"){
	  							 //만약 DB 아이디 설정이 있을 때 카카오 아이디가 바뀔수 있어서 
	  							 //db 값을 불러옴 ㅇㅋ? 
	  							 alert("카카오 인증되었습니다.");
	  							 loginform(email);
	  						}else if(ck == "naver_auth" || ck == "zzim_auth"){
	  							alert("다른 연동 계정이 있습니다.");
	  							location.href = "/jyh/views/login.jsp";
	  						}else{
	  							alert("회원가입 실행");
	  							createHiddenLoginForm(uid,email,nik);
	  						}
	  					}
	  				}
	  			}
	  		})
	  	},
		fail: function(err) {
		  alert(JSON.stringify(err))
      },
    })
  }
  
  
 // hidden form  
function loginform(kakaoId){
		var frm = document.createElement('form');
		frm.setAttribute('method', 'post');
		frm.setAttribute('action', '/makeSession');
		var hiddenInput = document.createElement('input');
		hiddenInput.setAttribute('type','hidden');
		hiddenInput.setAttribute('name','email');
		hiddenInput.setAttribute('value',kakaoId);
		frm.appendChild(hiddenInput);
		document.body.appendChild(frm);
		frm.submit();
}

// 카카오 hidden form 
function createHiddenLoginForm(kakaoId,email,nik){
	
	var frm = document.createElement('form');
	frm.setAttribute('method', 'post');
	frm.setAttribute('action', '/kakaoController');
	var hiddenInput = document.createElement('input');
	hiddenInput.setAttribute('type','hidden');
	hiddenInput.setAttribute('name','id');
	hiddenInput.setAttribute('value',kakaoId);
	frm.appendChild(hiddenInput);
	var hiddenInput1 = document.createElement('input');
	hiddenInput1.setAttribute('type','hidden');
	hiddenInput1.setAttribute('name','email');
	hiddenInput1.setAttribute('value',email);
	frm.appendChild(hiddenInput1)
	var hiddenInput2 = document.createElement('input');
	hiddenInput2.setAttribute('type','hidden');
	hiddenInput2.setAttribute('name','nik');
	hiddenInput2.setAttribute('value',nik);
	frm.appendChild(hiddenInput2);
	document.body.appendChild(frm);
	frm.submit();
}

