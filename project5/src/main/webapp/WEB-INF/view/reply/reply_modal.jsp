<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 모달 팝업 창 삽입 부분 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModallabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 classs="modal-title id=myModallabel">REPLY MODAL</h4>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label>Reply</label> <input class="form-control"
						name='reply value=' NewReply!'>
				</div>
				<div class="form-group">
					<label>Replyer</label> <input class="form-control"
						name='replyer' value='replyer'>
				</div>
				<div class="form-group">
<!-- 									<label >Reply Date</label>  -->
					<input type='hidden' class="form-control"
						name='replyDate' value='2024-04-01 13:13'>
				</div>
			</div>
			<div class="modal-footer">
<!-- 								<button id='modalModBtn' type="button" class="btn btn-warning">Modify</button> -->
<!-- 								<button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button> -->
				<button id='modalRegisterBtn' type="button"
					class="btn btn-primary">Register</button>
				<button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
			</div>
		</div>
	</div>
</div>

<script>
	$(function(){
		
		var modal=$(".modal");
		
		var modalInputReply=modal.find("input[name='reply']");
		var modalInputReplyer=modal.find("input[name='replyer']");
		var modalInputReplyDate=modal.find("input[name='replyDate']");
		
		var modalModBtn=$("#modalModBtn");
		var modalRemoveBtn$("#modalRemoveBtn");
		var modalRegisterBtn=$("#modalRegisterBtn");
		
		$("addReplyBtn").on("click", function(e){
			
			modal.find("input").val("");
			modalInputReplyDate.closet("div").hide();
			modal.find("button[id!='modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		$("#modalCloseBtn").on("click", function(e){
			modal.modal('hide')
		});
	})
</script>