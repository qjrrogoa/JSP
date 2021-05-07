<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>View.jsp</title>

<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- IE8 에서 HTML5 요소와 미디어 쿼리를 위한 HTML5 shim 와 Respond.js -->
<!-- WARNING: Respond.js 는 당신이 file:// 을 통해 페이지를 볼 때는 동작하지 않습니다. -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style>
		/* 수정/삭제/목록 버튼 사이 간격 주기 */
		.btn-success{
			margin-right:5px;
		}
		/* 모달창 크기 조정*/
		.modal-sm{
			width:325px;
		}
	</style>
</head>
<body>
	<!-- 네비게이션 시작 -->
	<jsp:include page="/Template/DataRoomTop.jsp" />
	<!-- 네비게이션 끝 -->
	<!-- 실제 내용 시작 -->
	<div class="container">
		<div class="jumbotron">
			<h1>
				자료실<small>상세보기 페이지</small>
			</h1>
		</div>
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<table class="table table-bordered table-striped">
					<tr>
						<th class="col-md-2 text-center">번 호</th>
						<td>${dto.no }</td>
					</tr>
					<tr>
						<th class="text-center">제 목</th>
						<td>${dto.title }</td>
					</tr>
					<tr>
						<th class="text-center">작성자</th>
						<td>${dto.name}</td>
					</tr>
					<tr>
						<th class="text-center">첨부파일</th>
						<td><a class="downfile" href="<c:url value="/DataRoom/Download.kosmo?filename=${item.attachFile}&no=${item.no }"/>">${dto.attachFile}</a></td>
					</tr>
					<tr>
						<th class="text-center">다운로드</th>
						<td id="downcount">${dto.downCount}</td>
					</tr>
					<tr>
						<th class="text-center">등록일</th>
						<td>${dto.postDate}</td>
					</tr>
					<tr>
						<th class="text-center" colspan="2">내 용</th>					
					</tr>
					<tr>
						<td colspan="2">${dto.content }</td>					
					</tr>
				</table>
			</div>
		</div><!-- row -->
		<div class="row">
			<div class="col-md-offset-2 col-md-8" >
				<!-- .center-block 사용시 해당 블락의 크기를 지정하자 -->
				<ul id="pillMenu" class="nav nav-pills center-block" style="width:200px;margin-bottom:10px">
					<li><a href="#" class="btn btn-success" data-toggle="modal" data-target="#passwordModal">수정</a></li>
					<!-- confirm창에서  취소시에는 모달창이 뜨지 않도록 data-toggle="modal" 제거 그리고 자스로 제어해서 모달창을 띄운다(삭제 확인버튼 클릭시에만) -->
					<li><a href="#" class="btn btn-success" data-target="#passwordModal">삭제</a></li>
					<li><a href="<c:url value="/DataRoom/List.kosmo?nowPage=${param.nowPage}"/>" class="btn btn-success">목록</a></li>
				</ul>
			</div>
		</div><!-- row -->		
	</div><!-- container -->
	<!-- 수정/삭제시 사용할 모달 시작 -->
	<div class="modal fade" id="passwordModal" data-backdrop="static">
   		<div class="modal-dialog modal-sm">
   			<div class="modal-content">    				
   				<div class="modal-header">
   					<button class="close" data-dismiss="modal">
   						<span>&times;</span>
   					</button>   					
   					<h4 class="modal-title">비밀번호 입력창</h4>
   				</div>    
   				<div class="modal-body">
   					<form class="form-inline" id="passwordForm" method="post" action="<c:url value="/DataRoom/Password.kosmo"/>">
   						<!-- 키값 -->
   						<input type="hidden" name="no" value="${dto.no }"/>
   						<!-- 수정/삭제 판단용 -->
   						<input type="hidden" name="mode"/>
   						<!-- 업로드된 파일명:삭제메뉴 클릭시 테이블 데이타 삭제후 업로드된 기존 파일 삭제하기 위함 -->
   						<input type="hidden" name="originalFilename" value="${dto.attachFile}"/>
   						<!-- 현재 페이지번호 -->
   						<input type="hidden" name="nowPage" value="${param.nowPage}"/>
   						<div class="form-group">
   							<label><span class="glyphicon glyphicon-lock"></span></label>
   							<input type="password" class="form-control" name="password" placeholder="비밀번호를 입력하세요"/>
   						</div>
   						<div class="form-group">
   							<input type="submit" class="btn btn-info" value="확인"/>
   						</div>
   					</form>
   				</div>   							
   			</div>    		
   		</div>    	
   	</div>
	
	<!-- 수정/삭제시 사용할 모달 끝 -->
	<!-- 실제 내용 끝 -->
	
	<!--  푸터 시작 -->
	<jsp:include page="/Template/DataRoomFooter.jsp" />
	<!-- 푸터 끝 -->
	<script>
		$('#pillMenu a').click(function(){
			console.log($(this).html());
			var text =$(this).html().trim();
			if(text=='수정'){//수정버튼 클릭
				$('input[name=mode]').val('UPDATE');
				$('.modal-title').html('수정용 비밀번호 입력창');
			}
			else if(text=='삭제'){//삭제버튼 클릭
				if(confirm("정말로 삭제 하시겠습니까?")){
					$('input[name=mode]').val('DELETE');
					$('.modal-title').html('삭제용 비밀번호 입력창');					
					//모달창 자스로 띄우기
					$("#passwordModal").modal('show');
					
				}
			}
		});
		//다운로드수 증가시키기
		$('.downfile').click(function(){
			var downcount=parseInt($('#downcount').html());
			$('#downcount').html(downcount+1);
			
		});
		
	</script>
</body>
</html>