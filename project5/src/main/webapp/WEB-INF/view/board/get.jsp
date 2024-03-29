<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">

<%@include file="../include/header.jsp"%>

<!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script> -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<body class="bg-gradient-primary">

	<script type="text/javascript">
// 		$(function() {

// 			const fromObj = $("form");

// 			$('button').on("click", function(e) {
// 				e.preventDefault();

// 				const operation = $(this).data("operForm");

// 				console.log(operation);

// 				if (operation === 'remove') {
// 					formObj.attr("action", "/board/remove");
// 				} else if (operation === 'list') {
// // 					self.location = "/board/list";
// 					formObj.find("#bno").remove();
// 					formObj.attr("action","/board/list");
// 					return;
// 				}

// 				fromObj.submit();
// 			});

// 		});


		$(function() {
			
			var operForm=$("#operForm");
			$("button[data-oper='modify']").on("click",function(e){
// 				alert("modify");
				operForm.attr("action", "/board/modify");
				operForm.submit();
			});
			$("button[data-oper='list']").on("click", function(e){
				operForm.find("#bno").remove();
				operForm.attr("action", "/board/list");
				operForm.submit();
			});
		});
		
		
		
	</script>

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-5">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">게시글 1개 조회</h1>
					</div>
				</div>

				<div class="panel-heading">Board Read Page</div>
				<div class="panel-body">
					<div class="form-group">
						<label>Bno</label> <input class="form-control" name='bno'
							value='<c:out value="${board.bno }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Title</label> <input class="form-control" name='title'
							value='<c:out value="${board.title }"/>' readonly="readonly">
					</div>

					<div class="form-group">
						<label>Text area</label>
						<textarea class="form-control" rows="3" name='content'
							readonly="readonly"><c:out value="${board.content }" />
   						</textarea>
					</div>

					<div class="form-group">
						<label>Writer</label> <input class="form-control" name='writer'
							value='<c:out value="${board.writer }"/>' readonly="readonly">
					</div>

					<!--    					<button data-oper='modify' class="btn btn-default"> -->
					<%--    						<a href="/board/modify?bno=<c:out value="${board.bno }"/>">Modify</a> --%>
					<!--    					</button> -->
					<!--    					<button data-oper='remove' class="btn btn-danger"> -->
					<%--    						<a href="/board/remove?bno=<c:out value="${board.bno }"/>">Remove</a> --%>
					<!--    					</button> -->
					<!--    					<button data-oper='list' class="btn btn-info"> -->
					<!--    						<a href="/board/list">List</a> -->
					<!--    					</button>	 -->

					<!-- 					<button type="submit" data-oper='modify' class="btn btn-default">Modify</button> -->
					<!-- 					<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button> -->
					<!-- 					<button type="submit" data-oper='list' class="btn btn-info">List</button> -->

					<button type="submit" form="operForm" data-oper='modify' class ="btn btn-default">Modify</button>
<!-- 					<button type="submit" form="operForm" data-oper='remove' class ="btn btn-default">Remove</button> -->
					<button type="submit" form="operForm" data-oper='list' class ="btn btn-info">List</button>
					<p></p>
					
					<form id="operForm" method="get">
						<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno }"/>'> 
						<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'> 
						<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'> 
						<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>' /> 
						<input type='hidden' name='type' value='<c:out value="${cri.type}"/>' />
					</form>
				</div>
				<!-- 	ppt15-2에 적힌 코드 위치랑 동일하진 않으므로 유의 -->
				<div class='row'>
					<div class="col-lg-12">
						<div class="panel panel-default">
							<!-- 패널 머리 -->
							<div class="panel-heading">
								<i class="fa fa-comment fa-fw"></i>Reply
								
								<button id='addReplyBtn' type="button" class="btn btn-primary btn-xs pull-right" 
								data-toggle="modal" data-target="#myModal">새 댓글</button>
								
								<button id='addReplyBtn'
									class='btn btn-primary btn-xs pull-right'>New Reply</button>
							</div>
							<!-- 패널 머리 끝 -->
							<div class="panel-body">
								<ul class="chat">
								</ul>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
				<!--  row의 끝 -->
				
				<%@include file="../reply/reply_modal.jsp" %>
				
				<%@include file="../reply/reply_list.jsp" %>

				<script type="text/javascript" src="/resources/js/reply_ajax.js"></script>
				
<%-- 				<%@include file="../reply/reply_ajax_test.jsp" %> --%>
				
			</div>

		</div>
	</div>
</body>
</html>