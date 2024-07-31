"use strict";

const changePwd = document.querySelector('.changePwd');
changePwd.addEventListener('click', (btn)=>{
	const getPwdInput = siblings(btn.currentTarget)[0];
	const getNewPassword = siblings(btn.currentTarget)[1];
	const getNewPasswordRe = siblings(btn.currentTarget)[2];
	if(getPwdInput.value.trim() === ""){
		alert('비밀번호를 입력하세요');
		getPwdInput.value = '';
		getPwdInput.focus();
	}else{
		const userId = getPwdInput.closest('.memberForm').querySelector('.userId');
		changePassword(getPwdInput.value.trim(), userId.value, getNewPassword, getNewPasswordRe);
	}
});

const siblings = (ele) => [...ele.parentElement.children].filter(e => e != ele);

const changePassword = (getPw, getId, newPassword, newPasswordRe) => {
	
	if(newPassword.value.trim() === '' || newPasswordRe.value.trim() === ''){
		alert('비밀번호를 입력하세요');
		newPassword.value = '';
		newPasswordRe.value = '';
		newPassword.focus();
	}else if(newPassword.value.trim() !== newPasswordRe.value.trim()){
		alert('새로 입력하신 비밀번호가 서로 다릅니다. 다시 입력해 주세요');
		newPassword.value = '';
		newPasswordRe.value = '';
		newPassword.focus();
	}else if(newPassword.value.trim() === getPw){
		alert('이전 비밀번호와 같습니다. 다시 입력해 주세요');
		newPassword.value = '';
		newPasswordRe.value = '';
		newPassword.focus();
	}else{
		fetch('/member/changePassword', { // 요청을 보낼 URL
			method: 'POST', // HTTP 요청 메서드 지정
			headers: {
				'Content-Type': 'application/json', // 컨텐츠 타입을 JSON으로 지정
			},
			body: JSON.stringify({ // 서버로 보낼 데이터
				userId: getId,
				userPw: getPw,
				newPassword: newPassword.value.trim()
			})
		})
		.then(response => {
			if (!response.ok) {
				throw new Error('Network response was not ok');
			}
			return response.json(); // 응답을 JSON으로 변환
		})
		.then(data => {
			if(data.message === 'SUCCESSFULLY'){
				alert('비밀번호가 변경이 완료되었습니다. 로그앗됩니다. 다시 로그인 바랍니다.');
				location.href='/member/logout.jsp';
			}else if(data.message === 'WRONG-PASSWORD'){
				alert('이전 비밀번호가 틀립니다. 비밀번호를 확인 후 다시 시도해 주세요');
				return false;
			}else{
				alert('비밀번호를 병경하지 못했습니다. 잠시 후 다시 시도해 주세요');
				return false;
			}
		})
		.catch(error => {
			console.error('There was a problem with your fetch operation:', error);
		});
	}
};

const fnReset = (form) => {
	alert('입력필드를 재작성합니다.');
	form.reset();
}

const fnCancel = () => {
	if(confirm('입력을 취소하고 home로 돌아갑니다.')){
		location.href = '/';
	}
}