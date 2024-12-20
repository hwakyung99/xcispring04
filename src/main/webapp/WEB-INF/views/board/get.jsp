<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../includes/header.jsp"%>

<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">Board Read Page</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<div class="form-group">
					<label>Bno</label> 
					<input class="form-control" name='bno' value='<c:out value="${board.bno}"/>' readonly="readonly"/>
				</div>
				<div class="form-group">
					<label>Title</label> 
					<input class="form-control" name='title' value='<c:out value="${board.title}"/>' readonly="readonly"/>
				</div>
				<div class="form-group">
					<label>Text area</label> 
					<textarea class="form-control" rows="3" name='content' readonly="readonly"><c:out value="${board.content}"/></textarea>
				</div>
				<div class="form-group">
					<label>Writer</label> 
					<input class="form-control" name='writer' value='<c:out value="${board.writer}"/>' readonly="readonly">
				</div>
				<button data-oper='modify' class="btn btn-default" >Modify</button>
				<button data-oper='list' class="btn btn-info">List</button>
				
				<form id='operForm' action="/board/modify" method="get">
					<input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>' >
					<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>' >
					<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>' >
					<input type='hidden' name='type' value='<c:out value="${cri.type}"/>'/>
					<input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'/>
				</form>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-log-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i>Reply</div>
			<!-- /.panel-heading -->
			<div class="panel-body">
				<ul class="chat">
					<li class="left clearfix" data-rno='12'>
						<div>
							<div class="header">
								<strong class="primary-font">user00</strong>
								<small class="pull-right text-muted">2018-01-01</small>
							</div>
							<p>GOOD JOB!</p>
						</div>
					</li>
				</ul>
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-log-12 -->
</div>
<!-- /.row -->
<script type="text/javascript" src="/resources/js/reply.js"></script>
<script>
	$(document).ready(function() {
		let bnoValue = '<c:out value="${board.bno}"/>';
		let replyUL = $(".chat");
		
		showList(1);
		
		function showList(page) {
			replyService.getList({bno: bnoValue, page: page || 1}, function(list){
				if(list == null || list.length == 0) {
					replyUL.html("");
					return;
				}
				let str = "";
				for(let i = 0, len = list.length || 0; i<len; i++){
					str += `<li class='left clearfix' data-rno=\${list[i].rno}>
						<div>
							<div class='header'>
								<strong class='primary-font'>\${list[i].replyer}</strong>
								<small class='pull-right text-muted'>\${list[i].replyDate}</small>
							</div>
							<p>\${list[i].reply}</p>
						</div>
					</li>`;
				}
				replyUL.html(str);
			});
		}
		/* replyService.add(
			{reply: "JS Test", replyer: "tester", bno: bnoValue},
			function(result){
				alert("RESULT: " + result);
			}
		); */
		
		/* replyService.remove(23, function(count) {
			console.log(count);
			
			if (count == "success") {
				alert("REMOVE");
			}
		}, function(err) {
			alert('ERROR...');
		}); */
		
		/* replyService.update(
			{rno: 22, bno: bnoValue, reply: "Update Test"},
			function(result){
				alert("RESULT: " + result);
			}
		); */
		
		replyService.get(10, function(data){
			console.log(data);
		})
		
		let operForm = $("#operForm");
		
		$("button[data-oper='modify']").on("click", function(e) {
			operForm.attr("action", "/board/modify");
			operForm.submit();
		});
		
		$("button[data-oper='list']").on("click", function(e) {
			operForm.find("#bno").remove();
			operForm.attr("action", "/board/list");
			operForm.submit();
		});
	})
	
</script>
<%@include file="../includes/footer.jsp"%>