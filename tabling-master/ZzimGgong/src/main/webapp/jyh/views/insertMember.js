// 이메일 유효성 검사 기능 정규식을 통하여 test 진행 
 var email = document.querySelector("[name=email]");
 var emailReg = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;;
 var emailCheck = document.querySelector("[name = emailCheck]");
 var emailflag = false;
 var sflag = false;
 email.onkeyup = function(){
	if(!emailReg.test(email.value)){
		emailCheck.innerText = "이메일 형식에 맞게 작성해주세요.";
		emailflag = false;
	}else{
		emailCheck.innerText = "";
		emailflag = true;
	}
}

var openWin;
 var new_window_width = 400;
      var new_window_height = 300;
      var positionX = ( window.screen.width / 2 ) - ( new_window_width / 2 );
      var positionY = ( window.screen.height / 2 ) - ( new_window_height / 2 );
     function new_window() {
        openWin = window.open(
          "authEmail.jsp",
          "Child",
          "width=" + new_window_width + ", height=" + new_window_height + ", top=" + positionY + ", left=" + positionX
        );
      }
var openCheck = false;
console.log(openCheck);

// 이메일 중복 체크 ajax
var checkBtn = document.querySelector("checkBtn");
function checkingEmail(){
	var xhr = new XMLHttpRequest();
	xhr.open("get","/checkIDservice?email="+email.value,true);
	xhr.send();
	xhr.onreadystatechange=function(){
		if(xhr.readyState==4 && xhr.status==200){
			 var ck = xhr.responseText;
			 if(ck == "no_auth"){
				alert("등록가능합니다.");
				sflag = true;
			}else{
				alert("등록한 이메일이 있습니다.\n다시 입력해주세요");
			    email.value = "";
				email.focus();
				sflag = false;
			}
		}
	}
}
	
// 비밀번호 유효성 검사 기능 
var pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
var pws = document.querySelector("[name=pws]");
const pwCheck = document.querySelector("[name=pwCheck");
var pwflag = false;
// 정규식을 통한 숫자 문자 특수문자 유효성 검사 
// 최소 8자는 minlength를 통하여 유효성 검사 
pws.onkeyup = function(){
    if(!pwReg.test(pws.value)){
        pwCheck.innerText = "최소8자, 1개 이상 숫자,문자 포함, 특수문자 1개 포함이여야합니다.";
        pwflag = false;
    }else{
        pwCheck.innerText = "";
        pwflag = true;
    }
}

// 비밀번호 재확인 유효성 검사 
const pwRe = document.querySelector("[name=pwRe]");
const rePwCheck = document.querySelector("[name = rePwCheck]");
var reflag = false;

pwRe.onkeyup = function(){
    if(pws == "" || pwflag == false){
       alert("비밀번호 재설정부터 해주세요");
       pwRe.value = "";
       pws.focus();
    }else{
        if(pws.value == pwRe.value){
             rePwCheck.innerText = "";
             reflag = true;
        }else{
            rePwCheck.innerText = "일치하지 않습니다.";
            reflag = false;
        }
    }
}
//폰 유효성검사
var regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
var pnum = document.querySelector("[name=pnum]");
var pCheck = document.querySelector("[name=pCheck]");
var pflag = false;

pnum.onkeyup = function(){
	if(!regPhone.test(pnum.value)){
		pCheck.innerText = "전화번호 형식으로 입력해주세요.(-없어도가능)";
		pflag = false;
	}else{
		pCheck.innerText = "";
		pflag = true;
	}
}

// 닉네임 유효성 검사 
// 3 이상 10 이하, 영어 또는 숫자 또는 한글 구성 
var nikReg = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,8}$/;
const nik = document.querySelector("[name = nik]");
const nikCheck = document.querySelector("[name = nikCheck]");
var nikflag = false;
nik.onkeyup = function(){
    if(!nikReg.test(nik.value)){
        nikCheck.innerText = "2자 이상 8자 이하 영어,숫자,한글로 구성해주세요."
        nikflag = false;
    }else{
        nikCheck.innerText = "";
        nikflag = true;
    }
}
//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
const addr = document.querySelector("[name=addr]");
const detailaddr = document.querySelector("[name = detailaddr]");
const addrCheck = document.querySelector("[name = addrCheck]");
var addrflag = false;
// 주소 입력 유효성 검사 
detailaddr.onkeyup = function(){
	if(detailaddr.value == ""){
		addrCheck.innerText = "상세 주소 입력이 되지 않았습니다.";
		addrflag = false;
	}
	else{
		addrCheck.innerText = "";
		addrflag = true;
	}
}
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_post').value = data.zonecode;
            if(roadAddr !== ''){
                document.getElementById("member_addr").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("member_addr").value = jibunAddr;
            }
        }
    }).open();
}
// 상세주소 유효성 검사 




// 전체 선택, 전체 선택 해제 
const agreeChkAll = document.querySelector('input[name=check_all]');
    agreeChkAll.addEventListener('change', (e) => {
    let agreeChk = document.querySelectorAll('input[name=agree]');
    for(let i = 0; i < agreeChk.length; i++){
      agreeChk[i].checked = e.target.checked;
    }
});


// checkform 함수로 제출전에 최종 유효성 검사 
// onsubmit -> action 일어나기전에 일어나는 이벤트 처리 
// false 해주면 이벤트 강제종료되서 action 처리안됨.
function joinform_check(){
    const vital1 = document.getElementById("agree01");
    const vital2 = document.getElementById("agree02");
    //아이디 최종 유효성
    if(email.value == "" || emailflag==false){
        alert("이메일 다시 확인하세요.");
        email.focus();
        return false;
    };
    //비밀번호 최종 유효성검사
    if(pws.value == "" || pwflag==false){
        alert("비밀번호를 다시 확인하세요.");
        pws.focus();
        return false;
    };

    if(pwRe.value==""|| reflag==false){
        alert("비밀번호 재확인 입력을 확인하세요");
        pwRe.focus();
        return false;
    }

    if(nik.value == "" || nikflag == false){
        alert("닉네임 입력을 확인하세요");
        nik.focus();
        return false;
    }

    if(!vital1.checked || !vital2.checked){
        alert("필수 항목을 체크하세요!");
        vital1.focus();
        return false; 
    }
    if(pnum.value=="" || pflag == false){
    	alert("핸드폰 입력을 확인하세요.");
    	pnum.focus();
    	return false;
    }
    
    if(sflag==false){
	alert("이메일 중복검사 진행해주세요.");
	return false;
	}
	if(openCheck==false){
	alert("이메일 인증 진행해주세요.");
	return false;
	}
	if(addr.value == ""){
	alert("주소 입력이 되지 않았습니다.");
	return false;	
	}	
	// 상세주소 
	if(addrflag == false){
		alert("주소입력을 해주세요.");
		return false;
	}
	return true;
}
    

