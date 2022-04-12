
    function checkAll() {
        if (!checkUserId(form.uid.value)) {
            return false;
        }
        if (!checkPassword(form.uid.value, form.pwd.value)) {
            return false;
        }
        if (!checkMail(form.email.value)) {
            return false;
        }
        if (!checkName(form.name.value)) {
            return false;
        }
       
    
        return true;
    }
 
    // 공백확인 함수
    function checkExistData(value, dataName) {
        if (value == "") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        return true;
    }
 
    function checkUserId(uid) {
        //Id가 입력되었는지 확인하기
        if (!checkExistData(uid, "아이디를"))
            return false;
 
        var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
        if (!idRegExp.test(uid)) {
            /*alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");*/
            form.uid.value = "";
            form.uid.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
 
    function checkPassword(id, password) {
        //비밀번호가 입력되었는지 확인하기
        if (!checkExistData(password, "비밀번호를"))
            return false;
      
 
        var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
        if (!password1RegExp.test(password)) {
            alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
            form.pwd.value = "";
            form.pwd.focus();
            return false;
        }
        
 
        //아이디와 비밀번호가 같을 때..
        if (id == password) {
            alert("아이디와 비밀번호는 같을 수 없습니다!");
            form.password.value = "";
           
            form.password.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
 
    function checkMail(mail) {
        //mail이 입력되었는지 확인하기
        if (!checkExistData(mail, "이메일을"))
            return false;
 
        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        if (!emailRegExp.test(mail)) {
            alert("이메일 형식이 올바르지 않습니다!");
            form.email.value = "";
            form.email.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
 
    function checkName(name) {
        if (!checkExistData(name, "이름을"))
            return false;
 
        var nameRegExp = /^[가-힣]{2,4}$/;
        if (!nameRegExp.test(name)) {
            alert("이름이 올바르지 않습니다.");
            return false;
        }
        return true; //확인이 완료되었을 때
    }
 
    
        


