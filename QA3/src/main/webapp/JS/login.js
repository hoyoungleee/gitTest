/**
 * 로그인 기능 관련 자바스크립트 함수 모음
 */
function loginForm() {

	var id = document.getElementById("id").value;
	var idInput = document.getElementById("id");
	var pw = document.getElementById("pw").value;
	var pwInput = document.getElementById("pw").value;

	if (id.trim().length == 0) {
		document.getElementById("btn").disabled = true;
		alert("아이디를 입력해주세요.");
		idInput.focus();
		return false;
	}
	if (pw.trim() == "" || pw == null) {
		document.getElementById("btn").disabled = true;
		alert("비밀번호를 입력해주세요.");
		pwInput.focus();
		return false;
	}
	else {
		$.ajax({
			anync: true,
			type: "POST",
			url: "/checkMember.do" + "?id=" + id + "&&pw=" + pw,
			contentType: 'text',
			dataType: "text",
			success: function(result) {
				if (result == "1") {

					alert("로그인 성공! 환영합니다.");
					window.location.reload();
					location.href = "/boardlist.do";
				}
				else {
					alert("회원정보가 맞지않습니다.");
				}
			}
		});
		return false;
	}
}

//아이디찾기 값처리
function findIdForm(){
	if (!!document.getElementById("name")) {
		var name = document.getElementById("name").value;
		var nameInput = document.getElementById("name");
		if (name.trim().length == 0) {
			alert("이름을 입력해주세요.");
			nameInput.focus();
			return false;
		}
	}
	if (!!document.getElementById("birth")) {
		var birth = document.getElementById("birth").value;
		var birthInput = document.getElementById("birth");
		if (birth.trim().length == 0) {
			alert("생년월일을 입력해주세요.");
			birthInput.focus();
			return false;
		}
		var today = new Date();

		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		
		var dateString = year + '-' + month  + '-' + day;
		var birthDate = new Date(birth);
		var nowDate = new Date(dateString);
		if(birthDate > nowDate){
			alert("생년월일을 미래로 입력할 수 없습니다.");
			birthInput.focus();
			return false;
		}
	}
	
	var data = $("#findInfo").serialize();
	
	console.log(data);
	$.ajax({
		anync: true,
		type: "POST",
		url: "/findInfo.do",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: data,
		success: function(result) {
			if (result == "정보없음") {
				alert("일치하는 정보가 없습니다. 다시 확인해주세요.");
				return false;
			}
			else {
				console.log("아이디찾기성공");
				console.log(result);
				var space = document.getElementById("result");
				
				$("#resultId").html(result);
				space.style.display = 'block';
				return false;
			}
		}
	});
	return false;
}

//비밀번호 수정 전 회원정보 인증
function userForm(){
	
	if (!!document.getElementById("id")) {
		var id = document.getElementById("id").value;
		var idInput = document.getElementById("id");
		if (id.trim().length == 0) {
			alert("아이디를 입력해주세요.");
			idInput.focus();
			return false;
		}
	}
	if (!!document.getElementById("name")) {
		var name = document.getElementById("name").value;
		var nameInput = document.getElementById("name");
		if (name.trim().length == 0) {
			alert("이름을 입력해주세요.");
			nameInput.focus();
			return false;
		}
	}
	
	var data = $("#userInfo").serialize();
	
	$.ajax({
		anync: true,
		type: "POST",
		url: "/userCheck.do",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: data,
		success: function(result) {
			var id = document.getElementById("id").value;
			if (result == 1) {
				console.log("아이디인증성공");
				var checkingForm = document.getElementById("checkingForm");
				var updPassForm = document.getElementById("updPassForm");
				var hiddenID = document.getElementById("hiddenID");
				checkingForm.style.display = 'none';
				updPassForm.style.display = 'block';
				hiddenID.value = id;
			}
			else {
				alert("일치하는 정보가 없습니다. 다시 확인해주세요.");
				return false;
			}
		}
	});
	return false;
} 
function passCheck() {
	var pw = document.getElementById("pw").value;
	var confirmPw = document.getElementById("confirmPw").value;

	if (pw === confirmPw) {

		document.getElementById("passStatus").innerHTML = "비밀번호가 확인 되었습니다.";
	}
	else {
		document.getElementById("passStatus").innerHTML = "비밀번호가 위와 다릅니다.";
		document.getElementById("confirmPw").focus();
	}
}
function passNullCheck(){
	if (!!document.getElementById("pw") && document.getElementById("confirmPw")) {
		var pw = document.getElementById("pw").value;
		var pwInput = document.getElementById("pw");
		var confirmPw = document.getElementById("confirmPw").value;
		var confirmPwInput = document.getElementById("confirmPw");
		if (pw.trim() == "" || pw == null) {
			alert("비밀번호를 입력해주세요.");
			pwInput.focus();
			return false;
		}
		if (confirmPw == "" || confirmPw == null) {
			alert("비밀번호를 확인해주세요.");
			confirmPwInput.focus();
			return false;
		}
		if (pw !== confirmPw) {
			alert("비밀번호를 다시 확인해 주세요.");
			confirmPwInput.focus();
			return false;
		}
		else {
			return true;
		}
	}
}

function updatePass(){
	var flag = passNullCheck();
	if(flag){
		var data = $("#passForm").serialize();
		$.ajax({
		type: "POST",
		url: "/passUdt.do",
		contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		data: data,
		success: function(result) {
			console.log("결과"+result);
			if (result == "1") {
				console.log("결과성공"+result);
				alert("비밀번호 수정 성공 로그인해주세요.");
				location.replace("/login.do");
			}
			else {
				alert("비밀번호 수정 실패");
				return false;
			}
		}
		});
		}
}

