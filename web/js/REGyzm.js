//设置一个全局的变量，便于保存验证码
var REGcode;


function REGcreateCode() {
	//首先默认code为空字符串
	REGcode = '';
	//设置长度，这里看需求，我这里设置了4
	var REGcodeLength = 4;
	var REGcodeV = document.getElementById('REGcode');
	
	//设置随机字符
	var REGrandom = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M',
		'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '!', '@', '#', "$", '%');
	//循环codeLength 我设置的4就是循环4次
	for (var i = 0; i < REGcodeLength; i++) {
		//设置随机数范围,这设置为0 ~ 36
		var REGindex = Math.floor(Math.random() * 36);
		//字符串拼接 将每次随机的字符 进行拼接
		REGcode += random[REGindex];
	}
	//将拼接好的字符串赋值给展示的Value
	REGcodeV.value = REGcode;
}


//下面就是判断是否== 的代码，无需解释


function REGvalidate() {
	var REGoValue = document.getElementById('REGinput').value.toUpperCase();
	if (REGoValue == 0) {
		swal('请输入验证码!');
	} else if (REGoValue != code) {
		swal('验证码不正确，请重新输入!');
		REGoValue = ' ';
		REGcreateCode();
	} else {
		var REGyzm = document.getElementById("REGcode");
		REGyzm.style.backgroundColor="greenyellow";
		
		var REGbtn = document.getElementById("entry_REGbtn");
		REGbtn.disabled=false;
	}
}

//设置此处的原因是每次进入界面展示一个随机的验证码，不设置则为空
window.onload = function() {

	REGcreateCode();
}