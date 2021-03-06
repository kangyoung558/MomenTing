<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebar.jsp" />
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		<div class="col-sm-12 col-md-6">
			<div class="card card-box mb-4 postCard"id="postCard" data-bno="bno">
		     	<div class="board-content" data-bno="bno">
					<div class="card-header py-3">
						<i class="icon-copy fa fa-ellipsis-h cursor-pointer float-right" aria-hidden="true" data-toggle="popover" id="boardpopover"></i>
						<h5 class="m-0 font-weight-bold w-25">강영훈</h5>
						<h6 class="m-0 font-weight-bold w-25">3분전</h6>
					</div>		       		
			        <div class="card-body">
						<h4 class="card-title">제목제목</h4>
						<p class="card-text">내용내용</p>
			        </div>
			        <div class="card-body">
						<button type="button" class="btn btn-link float-right mygray replyBtn">댓글 보기</button>
					</div>
			    </div>
		     	<div class="reply-content">
					<div class="card-body border-top">
						<ul class="list-group list-group-flush chat">
							<li class="list-group mb-2" data-rno="rno">
								<div class="bg-mygray radius p-2">
									<strong>강영훈</strong>
									<small class="">4분전</small>
									<i class="icon-copy fa fa-ellipsis-h cursor-pointer" aria-hidden="true" data-toggle="popover" id="boardpopover"></i>
									<p>댓글내용 댓글내용</p>
								</div>
							</li>
							<li class="list-group mb-2">
								<div class="bg-mygray radius p-2">
									<strong>강영훈</strong>
									<small class="">4분전</small>
									<p>댓글내용 댓글내용</p>
								</div>
							</li>
							<!-- <li class="list-group mb-2">
							</li> -->
							
						</ul>
						<div>
							<p class="replyMore">댓글 더보기</p>
						</div>
						
						<form action="" method="post" class="needs-validation" novalidate>
			        		<div class="form-group mt-1">
		    					<input type="text" class="form-control form-control-lg radius cursor-pointer bg-mygray"  id="replyer" name="replyer" required placeholder="작성자를 입력하세요...">
		    					<div class="valid-feedback">Valid.</div>
		       					<div class="invalid-feedback">Check this checkbox to continue.</div>
			  				</div>
							<div class="form-group row">
								<div class="col-sm-10">
				    				<input type="text" class="form-control form-control-lg radius cursor-pointer bg-mygray"  id="reply" name="reply" required placeholder="댓글을 입력하세요....">
				    				<div class="valid-feedback">Valid.</div>
				       				<div class="invalid-feedback">Check this checkbox to continue.</div>
								</div>
								<div class="col-sm-2">
					  				<button id="reRegBtn" type="submit" class="btn btn-light btn-block reRegBtn" data-dismiss="modal">
					  					<i class="icon-copy fa fa-send-o fa-2x" aria-hidden="true"></i>
					  				</button>
								</div>
			  				</div>
		  				</form>
					</div>
		     	</div>
		    </div>
		</div>
		<!-- <div class="modify cursor-pointer">
			<i class="icon-copy ion-edit fa-lg"></i>
			<span>게시글 수정</span>
		</div>
		<div class="popover-wrapper">
	        <i class="icon-copy fa fa-ellipsis-h cursor-pointer" aria-hidden="true" data-toggle="popover" id="boardpopover"></i>   
	    </div> -->
	  	<div class="row justify-content-md-center" >
		  	<div class="col-sm-12 col-md-6 mb-4">
		  	<div class="card card-box myp-15">
			  	<div class="card-body p-3 bg-mygray radius btn-block cursor-pointer" id="registerBoard">
				오늘의 순간들은 어떠셨나요? 당신의 순간들을 기록하세요....
			   	</div>
		  	</div>
		  	</div>
	  	</div>
	  	<!-- 게시글 modal -->
		<div class="modal fade boardModal" id="boardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myLargeModalLabel">게시글 등록</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					</div>
					<div class="modal-body">
						<form action="" method="post" class="needs-validation" novalidate>
			            	<div class="form-group">
			    				<input type="text" class="form-control" placeholder="게시글 제목을 입력하세요" id="title" name="title" required>
			    				<div class="valid-feedback">Valid.</div>
			       				<div class="invalid-feedback">Check this checkbox to continue.</div>
			  				</div>
			                <div class="form-group">
			    				<textarea class="form-control" rows="10" placeholder="게시글 내용을 입력하세요" id="content" name="content" required></textarea>
			    				<div class="valid-feedback">Valid.</div>
			       				<div class="invalid-feedback">Check this checkbox to continue.</div>
			  				</div>
			                <div class="form-group">
			    				<input type="text" class="form-control" placeholder="작성자을 입력하세요" id="writer" name="writer" required>
			    				<div class="valid-feedback">Valid.</div>
			       				<div class="invalid-feedback">Check this checkbox to continue.</div>
			  				</div>
						</form>
					</div>
					<div class="modal-footer">
						<button id="modRegBtn" type="button" class="btn btn-primary btn-block ac" data-dismiss="modal">게시</button>
						<button id="modModBtn" type="button" class="btn btn-primary btn-block" data-dismiss="modal">수정</button>
					</div>
				</div>
			</div>
		</div>
		 <!-- 게시글 modal 끝 -->
		 
		
	  	<div class="row justify-content-md-center" id="boardArea">
			<div class="board col-sm-12 col-md-6">
				<!-- <div class="card card-box mb-4 postCard" data-bno="' + list[i].bno + '" id="postCard">
			     	<div class="card-header py-3">
			       		<h5 class="m-0 font-weight-bold">'+list[i].writer+'</h5>
						<h6 class="m-0 font-weight-bold">'+ boardService.displayTime(list[i].regdate) +'</h6>
			        </div>
			        <div class="card-body">
						<h4 class="card-title">'+ list[i].title +'</h4>
						<p class="card-text">'+ list[i].content +'</p>
			        </div>
			    </div> -->
			</div>
	  	</div>
	  	<div class="row justify-content-md-center">
		<div class="col-sm-12 col-md-6">
			<button id="btnShowMore" class="btn btn-primary btn-block my-4">더보기</button>
  		</div>
  		</div>
  		<script>
			// Disable form submissions if there are invalid fields
			(function() {
			  'use strict';
			  window.addEventListener('load', function() {
			    // Get the forms we want to add validation styles to
			    var forms = document.getElementsByClassName('needs-validation');
			    // Loop over them and prevent submission
			    var validation = Array.prototype.filter.call(forms, function(form) {
			      form.addEventListener('submit', function(event) {
			        if (form.checkValidity() === false) {
			          event.preventDefault();
			          event.stopPropagation();
			        }
			        form.classList.add('was-validated');
			      }, false);
			    });
			  }, false);
			})();
		</script>
		<script src="/resources/js/board.js"></script>
		<script src="/resources/js/reply.js"></script>
		<script>
			
			 $(function() {
				 
			 	var boardDIV = $(".board");
			 	var pageNum = 1; 
			 	//var replyPageNum = 1;
			 	showList(1);
			 	showReplyList(1);
			 	
			 	//게시글 수정 삭세 팝오버
				boardDIV.on("click", '[data-toggle="popover"]',function(){
					console.log($(this).closest(".board-content").data("bno"));
					bno = $(this).closest(".board-content").data("bno");
					$(this).popover({
						 placement : 'bottom',
						 html : true,
						 content : 	'<div class="modify cursor-pointer">' +
					        		'	<i class="icon-copy ion-edit fa-lg"></i>' +
					        		'	<span>게시글 수정</span>' +
					       			'</div>' +
					       			'<div class="remove cursor-pointer">' +
						        	'	<i class="icon-copy ion-trash-a fa-lg"></i>' +
									'	<span class="pl-1">게시글 삭제</span>' +
					       			'</div>'
					})
				}); 
				 
			 	
			 	
			 	function showList(page) {
			 		console.log(page)
			 		//목록 호출
					boardService.getList({page:page}, function(result) {
						
						var list = result.list;
						//console.log(result);
						console.log(list);
						
						if(page == -1) showList(result.realEnd);
						
						var str ="";
						//boardDIV.html("");
						for(var i in list) {
							var replyCnt = list[i].replyCnt ? list[i].replyCnt + "개" : "" ;
							str += '<div class="card card-box mb-4 postCard">';
							str += '	<div class="board-content" data-bno="' + list[i].bno + '">';
							str += '		<div class="card-header py-3">';
							str += '			<i class="icon-copy fa fa-ellipsis-h cursor-pointer float-right" aria-hidden="true" data-toggle="popover" id="boardpopover"></i>';
							str += '			<h5 class="m-0 font-weight-bold">'+list[i].writer+'</h5>';
							str += '			<h6 class="m-0 font-weight-bold">'+ boardService.displayTime(list[i].regdate) +'</h6>';
							str += '		</div>';
							str += '		<div class="card-body">';
							str += '			<h4 class="card-title">'+ list[i].title +'</h4>';
							str += '			<p class="card-text">'+ list[i].content +'</p>';
							str += '		</div>';
							str += '		<div class="card-body">';
							str += '			<button type="button" class="btn btn-link float-right mygray replyBtn">댓글 보기 '+replyCnt +'</button>';
							str += '		</div>';
							str += '	</div>';
							str += '	<div class="reply-content">';
							str += '    	<div class="card-body border-top">';
							str += '    		<ul class="list-group list-group-flush chat">';
							str += '    		</ul>';
							str += '			<form action="" method="post" class="needs-validation" novalidate>';
							str += '				<div class="form-group mt-1">';
							str += '					<input type="text" class="form-control form-control-lg radius cursor-pointer bg-reply"  id="replyer" name="replyer" required placeholder="작성자를 입력하세요...">';
							str += '					<div class="valid-feedback">Valid.</div>';
							str += '					<div class="invalid-feedback">Check this checkbox to continue.</div>';
							str += '				</div>';
							str += '				<div class="form-group row">';
							str += '					<div class="col-sm-10">';
							str += '						<input type="text" class="form-control form-control-lg radius cursor-pointer bg-reply"  id="reply" name="reply" required placeholder="댓글을 입력하세요....">';
							str += '						<div class="valid-feedback">Valid.</div>';
							str += '						<div class="invalid-feedback">Check this checkbox to continue.</div>';
							str += '					</div>';
							str += '					<div class="col-sm-2">';
							str += '						<button id="reRegBtn" type="button" class="btn btn-light btn-block reRegBtn" data-dismiss="modal">';
							str += '							<i class="icon-copy fa fa-send-o fa-2x" aria-hidden="true"></i>';
							str += '						</button>';
							str += '					</div>';
							str += '				</div>';
							str += '			</form>';
							str += '    	</div>';
							str += '	</div>';
							str += '</div>';
						}
						boardDIV.html(boardDIV.html()+str);
					})
					
			 	}
			 	
			 	//댓글 보기 버튼 
			 	function showReplyList(page) {
					boardDIV.on("click", ".board-content .replyBtn", function() {
						replyPageNum = 2;
						console.log(replyPageNum);
				 		console.log(page)
				 		bno = $(this).closest(".board-content").data("bno");
				 		console.log(bno);
				 		var replyDom = $(this).closest(".board-content").next().find(".chat");
				 		//댓글 목록 불러오기
					 	replyService.getList({bno:bno, page:page}, function(result) {
							var replylist = result.replylist;
							var str ="";
							console.log(result);
							console.log(replylist);
							 
							for(var j in replylist) {
								str += '    		<li class="list-group mb-2" data-rno="'+replylist[j].rno+'">';
								str += '    			<div class="bg-mygray radius p-2">';
								str += '    				<strong>'+replylist[j].replyer+'</strong>';
								str += '    				<small class="">'+ replyService.displayTime(replylist[j].replyDate) +'</small>';
								str += '    				<p>'+replylist[j].reply+'</p>';
								str += '    			</div>';
								str += '    		</li>';
								
								//console.log(replylist[j].rno);
							}
							str += '				<li class="list-group mb-2">';
							str += '					<div>';
							str += '						<p class="replyMore cursor-pointer">댓글 더보기</p>';
							str += '					</div>';
							str += '				</li>';
							//console.log(str);
							replyDom.html(str);
							if(result.endPage==page){
								$(".chat .replyMore").hide();
							}
						})
				 	})
					
				}
			 	
			 	//댓글 등록 적용 이벤트
			 	boardDIV.on("click", ".reRegBtn", function() {
			 		console.log($(this).closest(".reply-content").prev().data("bno"));
			 		console.log($(this).closest(".reply-content").children().find(".chat"));
			 		var replyDom = $(this).closest(".reply-content").children().find(".chat");
			 		var reply = {bno:$(this).closest(".reply-content").prev().data("bno"), reply:$(this).closest(".reply-content").find("#reply").val(), replyer:$(this).closest(".reply-content").find("#replyer").val()}
		 			console.log(reply);
		 			replyService.add(reply, function(result) {
						alert(result);
			 			console.log(reply);
						
						replyService.get(result, function(result1) {
							console.log(result1);
							var str ="";
							
							str += '    		<li class="list-group mb-2" data-rno="'+result1.rno+'">';
							str += '    			<div class="bg-mygray radius p-2">';
							str += '    				<strong>'+result1.replyer+'</strong>';
							str += '    				<small class="">'+ replyService.displayTime(result1.replyDate) +'</small>';
							str += '    				<p>'+result1.reply+'</p>';
							str += '    			</div>';
							str += '    		</li>';
								
							
							replyDom.append(str);
						})
					});
		 			$(this).closest(".reply-content").find("#reply").val("");
		 			$(this).closest(".reply-content").find("#replyer").val("");
			 		
			 	});
			 	
			 	
			 	//게시글 등록 모달 띄우기
			 	$("#registerBoard").click(function() {
			 		$(".modal-title").html("게시글 등록");
		 			$("#boardModal").find("input").val("").prop("readonly", false);
		 			$("#boardModal").find("textarea").val("");
		 			
		 			$("#modRegBtn").show();
		 			$("#modModBtn").hide();
		 			$("#boardModal").modal("show");	
		 		});
			 	
			 	//수정 모달 띄우기
				$(document).on("click", ".popover .modify span", function() {
		 			console.log(bno);
		 			//상세글 호출
					boardService.get(bno, function(result) {
						console.log(result);
						$(".modal-title").html("게시글 수정");
						$("#title").val(result.title);
						$("#content").val(result.content);
						$("#writer").val(result.writer).prop("readonly", true);
						$("#boardModal").data("bno", bno);
						$("#modRegBtn").hide();
			 			$("#modModBtn").show();
						$("#boardModal").modal("show");
						//console.log(bno);
					});
					$(this).parents(".popover").popover('hide');
		 		});
			 	
			 	//등록적용 이벤트
		 		$("#modRegBtn").click(function() {
		 			var board = {title:$("#title").val(), content:$("#content").val(), writer:$("#writer").val()}
		 			console.log(board);
		 			boardService.register(board, function(result) {
						alert(result);
						boardService.get(result, function(result1) {
							//$(".RegModal").modal("hide");
							str ="";
							var replyCnt = result1.replyCnt ? result1.replyCnt + "개" : "" ;
							str += '<div class="card card-box mb-4 postCard">';
							str += '	<div class="board-content" data-bno="' + result1.bno + '">';
							str += '		<div class="card-header py-3">';
							str += '			<i class="icon-copy fa fa-ellipsis-h cursor-pointer float-right" aria-hidden="true" data-toggle="popover" id="boardpopover"></i>';
							str += '			<h5 class="m-0 font-weight-bold">'+result1.writer+'</h5>';
							str += '			<h6 class="m-0 font-weight-bold">'+ boardService.displayTime(result1.regdate) +'</h6>';
							str += '		</div>';
							str += '		<div class="card-body">';
							str += '			<h4 class="card-title">'+ result1.title +'</h4>';
							str += '			<p class="card-text">'+ result1.content +'</p>';
							str += '		</div>';
							str += '		<div class="card-body">';
							str += '			<button type="button" class="btn btn-link float-right mygray replyBtn">댓글 보기 '+replyCnt +'</button>';
							str += '		</div>';
							str += '	</div>';
							str += '	<div class="reply-content">';
							str += '    	<div class="card-body border-top">';
							str += '    		<ul class="list-group list-group-flush chat">';
							str += '    		</ul>';
							str += '			<form action="" method="post" class="needs-validation" novalidate>';
							str += '				<div class="form-group mt-1">';
							str += '					<input type="text" class="form-control form-control-lg radius cursor-pointer bg-mygray"  id="replyer" name="replyer" required placeholder="작성자를 입력하세요...">';
							str += '					<div class="valid-feedback">Valid.</div>';
							str += '					<div class="invalid-feedback">Check this checkbox to continue.</div>';
							str += '				</div>';
							str += '				<div class="form-group row">';
							str += '					<div class="col-sm-10">';
							str += '						<input type="text" class="form-control form-control-lg radius cursor-pointer bg-mygray"  id="reply" name="reply" required placeholder="댓글을 입력하세요....">';
							str += '						<div class="valid-feedback">Valid.</div>';
							str += '						<div class="invalid-feedback">Check this checkbox to continue.</div>';
							str += '					</div>';
							str += '					<div class="col-sm-2">';
							str += '						<button id="reRegBtn" type="button" class="btn btn-light btn-block reRegBtn" data-dismiss="modal">';
							str += '							<i class="icon-copy fa fa-send-o fa-2x" aria-hidden="true"></i>';
							str += '						</button>';
							str += '					</div>';
							str += '				</div>';
							str += '			</form>';
							str += '    	</div>';
							str += '	</div>';
							str += '</div>';
							boardDIV.prepend(str);
						});
					}); 
		 		});
			 	
		 		//수정적용 이벤트
		 		$("#modModBtn").click(function() {
		 			var board = {bno:bno, title:$("#title").val(), content:$("#content").val(), writer:$("#writer").val()}
		 			console.log(board);
		 			boardService.modify(board, function(result) {
						alert(result);
						$(".boardModal").modal("hide");
						boardService.get(bno, function(result1) {
							console.log(result1);
							$(".board-content").each(function() {
								if($(this).data("bno") == bno) {
									console.log(this);
									$(this).find(".card-title").html(result1.title);
									$(this).find(".card-text").html(result1.content);
								}
							})
						})
						//location.reload(true);
					}); 
		 		});
		 		
		 		//삭제적용 이벤트
		 		$(document).on("click", ".popover .remove", function() {
		 			boardService.remove(bno, function(result) {
						alert(result);
						//console.log(result);
						$(".board-content").each(function() {
							if($(this).data("bno") == bno) {
								$(this).parent().remove();
							}
						})
						//location.reload(true);
					}); 
		 			$(this).parents(".popover").popover('hide');
		 		});
		 		
				
			 	var replyPageNum = 2;
				//btnShowMore 이벤트(댓글 10개씩 더보기)
		 		boardDIV.on("click", ".chat .replyMore", function() {
		 			//alert("hi")
					console.log("더보기 눌렀을때 repltPageNum = " + replyPageNum);
					bno = $(this).closest(".reply-content").prev().data("bno");
					var replyDom = $(this).closest(".chat");
					//console.log(bno);
					//console.log(replyDom);
					appendReplyList(replyPageNum);
		 			replyPageNum = 1 + replyPageNum;
					console.log("더보기 눌렀을때2 replyPageNum = " + replyPageNum);
					function appendReplyList(replyPageNum) {
						//댓글 목록 불러오기
					 	replyService.getList({bno:bno, page:replyPageNum}, function(result) {
							var replylist = result.replylist;
							var str ="";
							console.log(result);
							//console.log(replylist);
							 
							for(var j in replylist) {
								str += '    		<li class="list-group mb-2" data-rno="'+replylist[j].rno+'">';
								str += '    			<div class="bg-mygray radius p-2">';
								str += '    				<strong>'+replylist[j].replyer+'</strong>';
								str += '    				<small class="">'+ replyService.displayTime(replylist[j].replyDate) +'</small>';
								str += '    				<p>'+replylist[j].reply+'</p>';
								str += '    			</div>';
								str += '    		</li>';
								
								//console.log(replylist[j].rno);
							}
							str += '				<li class="list-group mb-2">';
							str += '					<div>';
							str += '						<p class="replyMore cursor-pointer">댓글 더보기</p>';
							str += '					</div>';
							str += '				</li>';
							//console.log(str);
							replyDom.append(str);
							if(result.endPage == replyPageNum){
								$(".chat .replyMore").hide();	
								replyPageNum = 2;
								console.log(" 어팬드 리스트 호출후 replyPageNum = " + replyPageNum);
							}
						})
					}
					//$(this).hide();
		 		});
				//btnShowMore 이벤트(게시글 10개씩 더보기)
		 		$("#btnShowMore").click(function() {
		 			// showList() 호출 
		 			
		 			showList(++pageNum);
		 		});
				
		 		/* //스크롤 바닥 감지
				window.onscroll = function(e) {
				    //추가되는 임시 콘텐츠
				    //window height + window scrollY 값이 document height보다 클 경우,
				    if((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
				    	// showList() 호출 
			 			showList(pageNum++);
				    }
				}; */
			}); 
			
		</script>
	</div>
<jsp:include page="../includes/footer.jsp" />	