<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 모달 팝업 창 삽입 부분 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModallabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModallabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label> <input class="form-control"
						name='reply' value=' NewReply!'>
				</div>
				<div class="form-group">
					<label>Replyer</label> <input class="form-control"
						name='replyer' value='replyer'>
				</div>
				<div class="form-group">
<!-- 									<label >Reply Date</label>  -->
					<input class="form-control" 
						name='replyDate' value='2024-04-01 13:13'>   <!-- type='hidden' -->
				</div>
			</div>
			<div class="modal-footer">
				<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
				<button id='modalRegisterBtn' type="button" class="btn btn-primary">Register</button>
				<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(function(){
		
		//showList 코드 시작
		var bnoValue='<c:out value="${board.bno}"/>';
//	 	var bnoValue='100';
		var replyUL=$(".chat");
		
		showList(1);
		
		function showList(page){
			
			
			replyService.getList({bno:bnoValue,page : page || 1}, function(list){
				
				var str = "";
				if(list == null || list.length == 0){
					replyUL.html("");
					
					return;
				}
				for(var i =0, len = list.length || 0; i<len; i++){
					str += "<li class  = 'left clearfix' data-rno = '"+list[i].rno+"'>";
					str += "	<div><div class = 'header'><strong class = 'primary-font'>"+list[i].replyer+"</strong>";
					str += "		<small class = 'pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
					str += "			<p>"+list[i].reply+"</p></div></li>";
				}
				replyUL.html(str);
				
				
			}); // end function
		} // end showList 끝
		
		
		
		
		var modal=$(".modal");

		var modalInputReply=modal.find("input[name='reply']");
		var modalInputReplyer=modal.find("input[name='replyer']");
		var modalInputReplyDate=modal.find("input[name='replyDate']");
		
		var modalModBtn=$("#modalModBtn");
		var modalRemoveBtn=$("#modalRemoveBtn");
		var modalRegisterBtn=$("#modalRegisterBtn");
		
		$("#addReplyBtn").on("click", function(e){
			
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id!='modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		$("#modalCloseBtn").on("click", function(e){
			
			modal.modal('hide')
		});
		
		var bnoValue='<c:out value="${board.bno}"/>';
		
		modalRegisterBtn.on("click", function(e){
			
			var reply={
						reply:modalInputReply.val(),
						replyer:modalInputReplyer.val(),
						bno:bnoValue
					  };
			replyService.add(reply, function(result){
			
				alert(result);
				
				modal.find("input").val("");
				modal.modal("hide");
				
				showList(1);
			});
		});
		
		//댓글 조회 클릭 이벤트 처리
		$(".chat").on("click", "li", function(e){
			
			var rno=$(this).data("rno");
			
			replyService.get(rno, function(reply){
				
				modalInputReply.val(reply.reply);
				modalInputReplyer.val(reply.replyer);
				modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
									.attr("readonly", "readonly");
				modal.data("rno", reply.rno);
				
				modal.find("button[id !='modalCloseBtn']").hide();
				modalModBtn.show();
				modalRemoveBtn.show();
				
				$(".modal").modal("show");
			});
		});
		
		modalModBtn.on("click", function(e){
			var reply={
					   rno:modal.data("rno"), 
					   reply: modalInputReply.val()
					   };
			
			replyService.update(reply, function(result){
				
				alert(result);
				modal.modal("hide");
				showList(1);
				
			});
		});
		
		modalRemoveBtn.on("click", function(e){
			
			var rno = modal.data("rno");
			modal.modal("hide");
			replyService.remove(rno, function(result){
				
				alert(result);
// 				modal.modal("hide");    //여기서 하면 이미 제거되어있는걸 실행하게 돼서 에러가 남 그래서 위로 옮김
				showList(1);
				
			});
		});
	});
</script>




