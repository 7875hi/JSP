/**
 * 
 */

window.onload = function(){  
	var te = document.getElementById('아이디');
	var idReg = /^[a-z0-9_-]{5,20}$/;
	te.onkeyup=function(){
		var text = te.value;
		var sq = document.querySelector('#sq');
		if(!idReg.test(text)){
			sq.innerHTML='5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.';
			sq.style.color='red';
		}
		else{
			sq.innerHTML='사용가능한 아이디 입니다.';
			sq.style.color='green';
		}
	}
	
	var pw = document.getElementById('비밀번호');
	var pwReg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*#?&])[a-zA-Z\d@$!%*#?&]{8,16}$/;
	pw.onkeyup=function(){
		var password = pw.value;
		var pq = document.querySelector('#pq');
		if(!pwReg.test(password)){
			pq.innerHTML='8~16자의 영문 대 소문자, 숫자, 특수문자를 사용하세요.';
			pq.style.color='red';
		}
		else{
			pq.innerHTML='사용가능한 비밀번호 입니다.';
			pq.style.color='green';
		}
	}
	
	var pwre = document.getElementById('비밀번호re');
	pwre.onkeyup=function(){
		var password = pw.value;
		var passwordre = pwre.value;
		var pqre = document.querySelector('#pqre');
		if(password == passwordre){
			pqre.innerHTML='비밀번호가 일치합니다.';
			pqre.style.color='green';
		}
		else{
			pqre.innerHTML='비밀번호가 일치하지 않습니다.';
			pqre.style.color='red'
		}
	}
	
	var e = document.getElementById('이메일');
	var eReg = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	e.onblur=function(){
		var email = e.value;
		var em = document.querySelector('#em');
		if(!eReg.test(email)){
			em.innerHTML='이메일 주소를 다시 입력하세요.';
			em.style.color='red';
		}
		else{
			em.innerHTML='이메일 주소가 확인되었습니다.';
			em.style.color='green';
		}
	}
	
	var ere = document.getElementById('이메일re');
	ere.onkeyup=function(){
		var email = e.value;
		var emailre = ere.value;
		var emre = document.querySelector('#emre');
		if(email == emailre){
			emre.innerHTML='이메일 주소가 일치합니다.';
			emre.style.color='green';
		}
		else{
			emre.innerHTML='이메일 주소가 일치하지 않습니다.';
			emre.style.color='red'
		}
	}

	var button1 = document.querySelector('#jobu');

	/*
	button1.onclick=function(){
		var text = te.value;
		var password = pw.value;
		var passwordre = pwre.value;
		//var join = confirm('가입하시겠습니까?');
		if (!idReg.test(text)){
			alert('아이디를 다시 입력하세요.');
		}
		else if (!pwReg.test(password)){
			alert('비밀번호를 다시 입력하세요.');
		}
		else if (password != passwordre){
			alert('비밀번호가 서로 일치하지 않습니다.');
		}
		else if(idReg.test(text) && pwReg.test(password) && password == passwordre){
			var join = confirm('가입하시겠습니까?');
			if(join){
			parent.location='http://naver.com';
			alert('가입이 완료되었습니다.');
			}
			else{
				alert('취소하기를 누르셨습니다.');
			}
		}
	}*/
		
		var button2 = document.querySelector('#xbu');
		
		button2.onclick=function(){
			var cancle = confirm('취소하시겠습니까?');
			if(cancle){
				parent.location='http://naver.com';
			}

		}
		
	}