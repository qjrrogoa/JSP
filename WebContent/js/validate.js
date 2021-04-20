    /*
    <script>태그는 제외하고 순수 쟈스코드만 작성
    모든 페이지에서 공통으로 사용하는 변수나 함수를 .js로 외부파일로 보통 작성한다
    페이지에서는 <script>태그로 Embeding한다.
    */
    /*
    [form객체 얻는 방법]

    가정]form의 하위 객체로
    아이디: <input type="text" name="choi"/>
   
    ※form객체를 이용해서 form의 하위객체 얻기
    원칙]form객체.name속성에 지정한 값 :form객체.choi

    1]<form>:form에 id및 name속성 지정 안한 경우
    -document.forms(HTMLCollection) 이용
    예]해당 HTML문서에서 첫번째
    form태그인 경우:document.forms[0].choi

    2]<form name="폼이름">:form에 name속성 지정한 경우(가장 코드가짧고 많이 씀)
    -바로 폼이름이 form객체가 됨 
    <form name="frmObj">
    예]폼이름.name속성에 지정한 값
    frmObj.choi

    3]<form id="id명">:form에 id속성 지정한 경우
    - document.getElementById("id명").choi

    4]document객체의 getElementsByTagName("form")[인덱스].이름 혹은
    getElementsByName("폼이름")[인덱스].이름

    5]this.form키워드로 form객체를 얻어 올 수 있다.
    <input type="button" onclick="fnSubmit(this.form)"/>

    ※ 자바스크립트 코드로 submit시 submit이벤트는 발생하지 않는다.
    form객체.submit() 호출했다고 발생 X
    */

    function isValidate(obj){
        if(obj.id.value==""){
            alert("아이디를 입력하세요.")
            obj.id.focus();
            return false;
        }

        if(frmObj.pwd.value.length=0){
            alert("비밀번호를 입력하세요.");
            frmoObj.pwd.focus(); // 2번
            return false;
        }

        if(obj.pwd2.value==""){
            alert("비밀번호 확인을 입력하세요");
            obj.pwd2.focus();
            return false;
        }
        else{
            if(obj.pwd.value != obj.pwd2.value){
                alert("비밀번호와 일치하지 않아요");
                obj.pwd2.focus();
                return false;
            }
        }

        //라디오 버튼 선택여부 판단하기]
        var isGender = false;
        console.log("%O",frmObj.gender); // RadioNodeList
        console.log("%O",obj); // RadioNodeList
        
        //일반 for문
        /*
        for(var i=0;i<frmObj.gender.length;i++){
            if(frmObj.gender[i].checked){
                isGender = true;
                break;
            }
        }/////*/
        //확장 for문
        
        obj.gender.forEach(function(e){
            if(e.checked){
                isGender=true;
                return false; //break와 같다,,
            }
        });
        if(!isGender){
            alert("성별을 선택하세요");
            obj.gender[0].focus();
            return false;
        }

        //문 체크박스 3개이상 선택되도록 유효성 검사
        var count=0;
        //체크안된 체크 박스중 처음꺼에 포커스를 주기위한 코드 추가
        var notChecked = [];//체크 안된 체크박스들의 인덱스 저장
        obj.inter.forEach(function(e,index){
            if(e.checked){
                count++;
            }
            else notChecked.push(index);
        });

        if(count<3){
            alert("관심사항 3개 이상 선택하세요");
            obj.inter[notChecked[0]].focus(); //체크 안된 가장 빠른 인덱스에 포커스 주기
            return false;
        }
        if(obj.grade.selectedIndex==0){
            alert("학력을 선택하세요");
            obj.grade.focus();
            return false;
        }
        if(obj.file.value==""){
            alert("파일을 첨부하세요");
            obj.file.focus();
            return false;
        }
        if(obj.self.value==""){
            alert("자기소개를 입력하세요");
            obj.self.focus();
            return false;
        }

        return true;

    }/////isValidate

    function fnNoSubmitButton(obj){
        console.log(obj);
        if(obj == undefined){
            obj = document.forms[0];
        }
        /* 
            form객체의 submit()함수로 전송
            단, submit()함수를 호출하더라도 submit이벤트는 발생 안한다.
        */
        if(isValidate(obj)){
            obj.submit();   //쟈스코드로 전송하는 함수
        }

    }
