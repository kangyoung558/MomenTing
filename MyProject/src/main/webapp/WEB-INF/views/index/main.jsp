<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"  prefix="sec"%>
<jsp:include page="../includes/header.jsp" />
<jsp:include page="../includes/sidebar.jsp" />
	<div class="mobile-menu-overlay"></div>

	<div class="main-container">
		
 	  	<div class="row justify-content-md-center" >
		  	<div class="col-sm-12 col-md-6 mb-4">
			  	<div class="card card-box myp-15">
				  	<div class="card-body p-3 bg-mygray radius btn-block cursor-pointer" id="registerBoard">
					오늘의 순간들은 어떠셨나요? 당신의 순간들을 기록하세요....
				   	</div>
			  	</div>
		  	</div>
	  	</div>
	  	<sec:authentication property="principal" var="member"/>
	  	<!-- 게시글 modal -->
		<div class="modal fade boardModal" id="boardModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="myLargeModalLabel">Record Moment....</h4>
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
			    				<textarea class="form-control" rows="10" placeholder="오늘의 순간들은 어떠셨나요..." id="content" name="content" required></textarea>
			    				<div class="valid-feedback">Valid.</div>
			       				<div class="invalid-feedback">Check this checkbox to continue.</div>
			  				</div>
			                <div class="form-check mb-2 secretForm">
  								<label class="form-check-label">
   								<input type="checkbox" class="form-check-input" name="secret" id="secret" value="1">나만 보기
  								</label>
							</div>
			                <div class="form-group d-none">
			    				<input type="text" class="form-control" placeholder="작성자을 입력하세요" id="writer" name="writer" required>
			    				<div class="valid-feedback">Valid.</div>
			       				<div class="invalid-feedback">Check this checkbox to continue.</div>
			  				</div>
						</form>
						<div class="uploadDiv">
							<label for="files" class="m-0"><i class="fa fa-file-image-o fa-2x" aria-hidden="true"></i></label>
							<input id="files" class="d-none" type="file" name="files" accept="image/jpeg, image/png"  multiple> 
						</div>
						<div class="uploadResult">
							<ul class="list-group list-group-horizontal">
							</ul>
						</div>
					</div>
					<div class="modal-footer">
						<button id="modRegBtn" type="button" class="btn btn-primary btn-block ac" data-dismiss="modal">게시</button>
						<button id="modModBtn" type="button" class="btn btn-primary btn-block" data-dismiss="modal">수정</button>
					</div>
				</div>
			</div>
		</div>
		 <!-- 게시글 modal 끝 -->
		 
		<!-- 성공 모달  -->
		<div class="modal fade" id="success-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content">
					<div class="modal-body text-center font-18">
						<h3 class="mb-20">Momenting</h3>
						<div class="mb-30 text-center"><img src="${pageContext.request.contextPath}/resources/vendors/images/success.png"></div>
						<div class="text-center contentText">
						</div>
					</div>
					<div class="modal-footer justify-content-center">
						<button type="button" class="btn btn-moment" data-dismiss="modal">close</button>
					</div>
				</div>
			</div>
		</div>
		 
		 
		
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
			<button id="btnShowMore" class="btn btn-moment btn-block my-4">더보기</button>
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
		<script src="${pageContext.request.contextPath}/resources/js/board.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/reply.js"></script>
		<script type="text/javascript">
			var cp ='${pageContext.request.contextPath}';
			
			function showImage(path) {
				$("#imgModal img").attr("src", "/display?fileName="+path)
				$("#imgModal").modal("show");
			}
			
			$(function() {
				var defaultTitle = moment().format('LLL') + "의 순간";
				var replyer = '';
				var writer ='';
				
				<sec:authentication property="principal" var="principal"/>
				writer ='${principal.vo.userName}';
				replyer ='${principal.vo.userName}';
				
		 		var csrf = '${_csrf.headerName}';
				var csrfToken ='${_csrf.token}';
				
				$(document).ajaxSend(function(e, xhr){
					xhr.setRequestHeader(csrf, csrfToken);
				})
				 
				var regex = /(.*?)\.(exe|sh|jsp|php|jar)/gi;
				var maxSize = 1024 * 1024 * 8;
				var cloneObj = $(".uploadDiv").clone();
				var uploadResult = $(".uploadResult ul");
				
				//첨부파일 부
				console.log(cloneObj);
				$(".uploadDiv").on("change", "#files", function() {
					var formData = new FormData();
					var files = $("#files")[0].files;
					
					//console.log(files);
					
					for(var i in files) {
						if(!checkExtension(files[i].name, files[i].size)) {
							$(".uploadDiv").html(cloneObj.html());
							return false;
						}
						formData.append("files", files[i]);
					}
					//console.log(formData);	
					
					$.ajax({
						url : cp +'/uploadAction',
						type : 'post',
						data : formData,
						beforeSend : function(xhr) {
							xhr.setRequestHeader(csrf, csrfToken);
						},
						dataType : 'json',
						processData : false,
						contentType : false,
						success : function(result) {
							console.log(result);
							showUploadedFile(result);
							$(".uploadDiv").html(cloneObj.html());
						}
					});
				})
				
				function checkExtension(name, size) {
					if(size >= maxSize) {
						alert("파일 사이즈 초과");
						return false;
					}
					if(regex.test(name)) {
						alert("해당 종류의 파일은 업로드 할수 없습니다.");
						return false;
					}
					return true;
				}				
				
				function showUploadedFile(uploadResultArr) {
					var str = "";
					for(var i in uploadResultArr) {
						var obj = uploadResultArr[i];
						console.log(obj);
						str += "<li class='list-group-item' "
						str += " data-filename='" + obj.fileName
						str += "' data-image='" + obj.image
						str += "' data-uuid='" + obj.uuid
						str += "' data-uploadpath='" + obj.uploadPath
						str += "' >"
						if(!obj.image){
							str += "<a href='${pageContext.request.contextPath}/download?fileName="+ obj.downPath + "'><i class='fa fa-remove removeFileBtn' aria-hidden='true'></i>" + obj.fileName + "</a>" 
						}
						else {
							str += "<i class='fa fa-remove removeFileBtn' aria-hidden='true'></i>"
							str += "<a href='javascript:showImage(\""+ obj.downPath +"\")'>";
							str += "<img src = '${pageContext.request.contextPath}/display?fileName=" + obj.thumbPath + "'></a>";
						}
						str += "</li>";
					}
					uploadResult.append(str);
				}
				
				$(".uploadResult").on("click", ".removeFileBtn", function() {
					var $li = $(this).closest("li");
					var data = {
						fileName : $li.data("filename"), 
						image : $li.data("image"),
						uuid : $li.data("uuid"),
						uploadPath : $li.data("uploadpath")
					}
					//console.log(data);
					//console.log(JSON.stringify(data));
					
					$.ajax({
						url :  cp + "/deleteFile",
						type : "post",
						data : JSON.stringify(data),
						beforeSend : function(xhr) {
							xhr.setRequestHeader(csrf, csrfToken);
						},
						contentType : "application/json; charset=utf-8",
						success : function(result) {
							if(result != null){
								alert("삭제가 완료 되었습니다.");
							}
							$li.remove();
						}
					}); 
				});
				
				//게시글 부
			 	var boardDIV = $(".board");
			 	showList();
			 	showReplyList();
			 	
			 	//게시글 수정 삭세 팝오버
				boardDIV.on("click", '.boardPopover',function(){
					bno = $(this).closest(".board-content").data("bno");
					$(this).popover({
						 placement : 'bottom',
						 html : true,
						 content : 	'<div class="modify cursor-pointer moment-link">' +
					        		'	<i class="icon-copy ion-edit fa-lg"></i>' +
					        		'	<span>게시글 수정</span>' +
					       			'</div>' +
					       			'<div class="remove cursor-pointer moment-link">' +
						        	'	<i class="icon-copy ion-trash-a fa-lg"></i>' +
									'	<span class="pl-1">게시글 삭제</span>' +
					       			'</div>'
					})
				}); 
			 	
			 	//댓글 수정 삭세 팝오버
				boardDIV.on("click", '.replyPopover',function(){
					var container = $(this).parent().closest(".replyLi");
					rno = $(this).parent().closest(".replyLi").data("rno");
					$(this).popover({
						 placement : 'bottom',
						 container : container,
						 html : true,
						 content : 	'<div class="replyModify cursor-pointer moment-link">' +
					        		'	<i class="icon-copy ion-edit fa-lg"></i>' +
					        		'	<span>댓글 수정</span>' +
					       			'</div>' +
					       			'<div class="replyRemove cursor-pointer moment-link">' +
						        	'	<i class="icon-copy ion-trash-a fa-lg"></i>' +
									'	<span class="pl-1">댓글 삭제</span>' +
					       			'</div>'
					})
				}); 
				var btnShowMore = $("#btnShowMore");
			 	function showList(bno) {
			 		//목록 호출
					boardService.getList({bno:bno, writer:writer, cp:cp}, function(result) {
						var list = result;
						if(result.length < 10) {
							btnShowMore.hide();
						}
						//console.log(result);
						var str ="";
						for(var i in list) {
							var listWriter = list[i].writer;
							console.log("현재 로그인된 사용자" + writer);
							console.log(list[i].writer);
							var replyCnt = list[i].replyCnt ? list[i].replyCnt + "개" : "" ;
							str += '<div class="card card-box mb-4 postCard">';
							str += '	<div class="board-content" data-bno="' + list[i].bno + '" data=sec="'+ list[i].secret+'">';
							str += '		<div class="card-header py-3">';
							if(writer == listWriter) {
							str += '			<i class="boardPopover icon-copy fa fa-ellipsis-h cursor-pointer float-right" aria-hidden="true" data-toggle="popover"></i>';
							}
							if(list[i].secret == 1){
							str += '			<i class="fa fa-lock d-inline" aria-hidden="true"></i>';
							}
							str += '			<h5 class="m-0 font-weight-bold d-inline">'+listWriter+'</h5>';
							str += '			<h6 class="m-0 font-weight-bold">'+ boardService.displayTime(list[i].regdate) +'</h6>';
							str += '		</div>';
							str += '		<div class="card-body">';
							str += '			<h4 class="card-title d-none">'+ list[i].title +'</h4>';
							str += '			<p class="card-text">'+ list[i].content +'</p>';
							str += '		</div>';
							str += '		<div class="card-body listUploadResult">';
							str += '			<ul class="list-group list-group-horizontal">';
							for(var j in list[i].attachList) {
								var obj = list[i].attachList[j];
								str += "<li class='list-group-item' "
								str += " data-filename='" + obj.fileName
								str += "' data-image='" + obj.image
								str += "' data-uuid='" + obj.uuid
								str += "' data-uploadpath='" + obj.uploadPath
								str += "' >"
								str += "<a href='javascript:showImage(\""+ obj.downPath +"\")'>";
								str += "<img src = '${pageContext.request.contextPath}/display?fileName=" + obj.thumbPath + "'></a>";
								str += "</li>";
							} 
							str += '			</ul>';
							str += '		</div>';
							str += '		<div class="card-body float-right m-0">';
							str += '			<i class="fa fa-commenting" aria-hidden="true"></i>';
							str += '			<button type="button" class="btn btn-link mygray replyBtn p-0">댓글 보기 '+replyCnt +'</button>';
							str += '		</div>';
							str += '	</div>';
							str += '	<div class="reply-content">';
							str += '    	<div class="card-body border-top">';
							str += '    		<ul class="list-group list-group-flush chat">';
							str += '    		</ul>';
							str += '			<form action="" method="post" class="needs-validation" novalidate>';
							str += '				<div class="d-none form-group mt-1">';
							str += '					<input type="text" class="form-control form-control-lg radius cursor-pointer bg-reply"  id="replyer" name="replyer" readonly required placeholder="작성자를 입력하세요..." value="'+replyer+'">';
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
			 	function showReplyList(rno) {
					boardDIV.on("click", ".board-content .replyBtn", function() {
				 		 bno = $(this).closest(".board-content").data("bno");
				 		//console.log(bno);
				 		var replyDom = $(this).closest(".board-content").next().find(".chat");
				 		var list;
				 		//댓글 목록 불러오기
					 	replyService.getList({bno:bno, rno:rno, cp:cp}, function(result) {
							list = result;
							var str ="";
							//console.log(result);
							if(result.length < 10){
								$(".chat .replyMoreLI").hide();
							}
							for(var j in list) {
								str += '    		<li class="replyLi list-group mb-2" data-rno="'+list[j].rno+'">';
								str += '    			<div class="bg-mygray radius p-2">';
								str += '    				<strong>'+list[j].replyer+'</strong>';
								str += '    				<small class="">'+ replyService.displayTime(list[j].replyDate) +'</small>';
								if(replyer == list[j].replyer) {
								str += '					<i class="replyPopover icon-copy fa fa-ellipsis-h cursor-pointer" aria-hidden="true" data-toggle="popover" ></i>';
								}
								str += '    				<p>'+list[j].reply+'</p>';
								str += '    			</div>';
								str += '    		</li>';
							}
					 		if(result.length >= 10){
								str += '				<li class="list-group mb-2 replyMoreLI">';
								str += '					<div">';
								str += '						<p class="replyMore cursor-pointer">댓글 더보기</p>';
								str += '					</div>';
								str += '				</li>';
							}
							replyDom.html(str);
						})
				 	})
					
				}
			 	
			 	//댓글 등록 적용 이벤트
			 	boardDIV.on("click", ".reRegBtn", function() {
			 		
			 		var replyDom = $(this).closest(".reply-content").children().find(".chat");
			 		var reply = {bno:$(this).closest(".reply-content").prev().data("bno"), reply:$(this).closest(".reply-content").find("#reply").val(), replyer:$(this).closest(".reply-content").find("#replyer").val(), cp:cp}
		 			console.log(reply);
		 			replyService.add(reply, function(result) {
//		 				alert(result);
			 			//console.log(reply);
						var rno = result
						replyService.get({rno:rno, cp:cp}, function(result1) {
//							console.log(result1);
							var str ="";
							str += '    		<li class="replyLi list-group mb-2" data-rno="'+result1.rno+'">';
							str += '    			<div class="bg-mygray radius p-2">';
							str += '    				<strong>'+result1.replyer+'</strong>';
							str += '    				<small class="">'+ replyService.displayTime(result1.replyDate) +'</small>';
							if(replyer == result1.replyer){
							str += '					<i class="replyPopover icon-copy fa fa-ellipsis-h cursor-pointer" aria-hidden="true" data-toggle="popover" ></i>';
							}
							str += '    				<p>'+result1.reply+'</p>';
							str += '    			</div>';
							str += '    		</li>';
							replyDom.append(str);
						})
					});
		 			$(this).closest(".reply-content").find("#reply").val("");
		 			$(this).closest(".reply-content").find("#replyer").val(replyer);
			 	});
			 	
			 	//댓글 수정폼 띄우기 이벤트
			 	$(document).on("click", ".popover .replyModify span", function() {
			 		var replaceArea = $(this).parent().closest(".replyLi");
					replyService.get({rno:rno, cp:cp}, function(result) {
				 		//alert("hi");
				 		var str = "";
				 		str += '			<form action="" method="post" class="needs-validation replyModForm" novalidate>';
						str += '				<div class="form-group row">';
						str += '					<div class="col-sm-8">';
						str += '						<input class="rnoHidden" type="hidden" value="'+ rno +'">';	
						str += '						<input type="text" class="replyValue form-control form-control-lg radius cursor-pointer bg-reply" value="'+result.reply+'" id="reply" name="reply" required placeholder="댓글을 입력하세요....">';
						str += '						<div class="valid-feedback">Valid.</div>';
						str += '						<div class="invalid-feedback">Check this checkbox to continue.</div>';
						str += '					</div>';
						str += '					<div class="col-sm-2">';
						str += '						<button id="reModBtn" type="button" class="btn btn-light btn-block reModBtn" data-dismiss="modal">';
						str += '							<i class="icon-copy fa fa-send-o fa-2x" aria-hidden="true"></i>';
						str += '						</button>';
						str += '					</div>';
						str += '					<div class="col-sm-2">';
						str += '						<button id="reCanBtn" type="button" class="btn btn-light btn-block reCanBtn" data-dismiss="modal">';
						str += '							<i class="fa fa-remove fa-2x" aria-hidden="true"></i>';
						str += '						</button>';
						str += '					</div>';
						str += '				</div>';
						str += '			</form>';
						console.log(rno);
						replaceArea.replaceWith(str);
					});
			 		$(this).parents(".popover").popover("hide");
			 	});
			 	
			 	//댓글 수정 적용 이벤트
			 	boardDIV.on("click", ".reModBtn", function() {
			 		var replyArea = $(this).parent().parent();
			 		//alert("hi");
			 		//console.log(rno);
			 		var reply = {rno: rno, reply:$(this).parent().prev().children(".replyValue").val(), replyer:replyer, cp:cp}
			 		replyService.update(reply, function(result) {
			 			//alert(result);
			 			//var rno = result;
			 			replyService.get({rno:rno, cp:cp}, function(result1) {
			 				//console.log(result1);
							var str ="";
							str += '    		<li class="replyLi list-group mb-2" data-rno="'+result1.rno+'">';
							str += '    			<div class="bg-mygray radius p-2">';
							str += '    				<strong>'+result1.replyer+'</strong>';
							str += '    				<small class="">'+ replyService.displayTime(result1.replyDate) +'</small>';
							if(replyer == result1.replyer) {
							str += '					<i class="replyPopover icon-copy fa fa-ellipsis-h cursor-pointer" aria-hidden="true" data-toggle="popover" ></i>';
							}
							str += '    				<p>'+result1.reply+'</p>';
							str += '    			</div>';
							str += '    		</li>';
							replyArea.replaceWith(str);
			 			});
			 		})
			 	});
			 	
			 	//댓글 수정 취소 버튼 이벤트
			 	boardDIV.on("click", ".reCanBtn", function() {
			 		var replyArea = $(this).parent().parent();
			 		replyService.get({rno:rno , cp:cp}, function(result) {
		 				//console.log(result);
						var str ="";
						str += '    		<li class="replyLi list-group mb-2" data-rno="'+result.rno+'">';
						str += '    			<div class="bg-mygray radius p-2">';
						str += '    				<strong>'+result.replyer+'</strong>';
						str += '    				<small class="">'+ replyService.displayTime(result.replyDate) +'</small>';
						if(replyer == result.replyer) {
						str += '					<i class="replyPopover icon-copy fa fa-ellipsis-h cursor-pointer" aria-hidden="true" data-toggle="popover" ></i>';
						}
						str += '    				<p>'+result.reply+'</p>';
						str += '    			</div>';
						str += '    		</li>';
						replyArea.replaceWith(str);
		 			});
			 	});
			 	
			 	//댓글 삭제 적용 이벤트 
			 	$(document).on("click", ".popover .replyRemove span", function() {
			 		//alert("hi");
			 		replyService.remove({rno:rno, replyer:replyer, cp:cp}, function(result) {
			 			//alert(result);
			 			$(".replyLi").each(function() {
			 				if($(this).data("rno") == rno) {
			 					$(this).remove();
			 				}
			 			});
			 		});
			 		$(this).parents(".popover").popover("hide");
			 	});
			 	
			 	//게시글 등록 모달 띄우기
			 	$("#registerBoard").click(function() {
			 		$(".modal-title").html("Record Moment....");
			 		$("#title").val(defaultTitle);
					$("#content").val("");
			 		$("#writer").val(writer).prop("readonly", true);
		 			$("#boardModal").find("textarea").val("");
		 			uploadResult.children().remove();
		 			$(".secretForm").show();
		 			$("#modRegBtn").show();
		 			$("#modModBtn").hide();
		 			$("#boardModal").modal("show");	
		 		});
			 	
			 	//수정 모달 띄우기
				$(document).on("click", ".popover .modify span", function() {
		 			//console.log(bno);
		 			//상세글 호출
		 			
					boardService.get({bno:bno, cp:cp}, function(result) {
						//console.log(result);
						var str ="";
						for(var j in result.attachList) {
							//console.log(list[i].attachList[j]);
							var obj = result.attachList[j];
							//console.log(obj);
							str += "<li class='list-group-item' "
							str += " data-filename='" + obj.fileName
							str += "' data-image='" + obj.image
							str += "' data-uuid='" + obj.uuid
							str += "' data-uploadpath='" + obj.uploadPath
							str += "' >"
							str += "<i class='fa fa-remove removeFileBtn' aria-hidden='true'></i>"
							str += "<a href='javascript:showImage(\""+ obj.downPath +"\")'>";
							str += "<img src = '${pageContext.request.contextPath}/display?fileName=" + obj.thumbPath + "'></a>";
							str += "</li>";
						}
						uploadResult.html(str)
						$(".modal-title").html("Update Moment....");
						$("#title").val(result.title);
						$("#content").val(result.content);
						$("#writer").val(writer).prop("readonly", true);
						$("#boardModal").data("bno", bno);
						$(".secretForm").hide();
						$("#modRegBtn").hide();
			 			$("#modModBtn").show();
						$("#boardModal").modal("show");
					});
					$(this).parents(".popover").popover('hide');
		 		});
			 	
			 	//등록적용 이벤트
		 		$("#modRegBtn").click(function() {
	 				var secret;
		 			if($("#secret").is(":checked")){
		 				var secret = 1;
		 			}
		 			else{
		 				secret = 0;
		 			}
		 			var fileStr = "";
					var fileAttrs = ["fileName", "uuid", "uploadPath","image"];
					var attachList =[];
					$(this).parent().prev().children(".uploadResult").find("li").each(function(i, it) {
						var obj = {};
						for(var j in fileAttrs) {
							obj[fileAttrs[j]]= $(it).data(fileAttrs[j].toLowerCase());    
						}
						attachList.push(obj);
					}); 
					//console.log(attachList);
		 			var board = {title:$("#title").val(), content:$("#content").val(), writer:writer, secret:secret, attachList:attachList, cp:cp}
		 			console.log(board);
		 			boardService.register(board, function(result) {
						//alert(result);
						var bno = result;
						boardService.get({bno:bno, cp:cp}, function(result1) {
							//$(".RegModal").modal("hide");
							if(result1.secret == 1){
								$(".contentText").html(writer + "님의 나만 간직하고 싶은 순간이 기록되었습니다.<br>My moment에서 확인하세요.");
								$("#success-modal").modal("show");
							}
							else{
							str ="";
							var replyCnt = result1.replyCnt ? result1.replyCnt + "개" : "" ;
							str += '<div class="card card-box mb-4 postCard">';
							str += '	<div class="board-content" data-bno="' + result1.bno + '">';
							str += '		<div class="card-header py-3">';
							if(writer == result1.writer) {
								str += '			<i class="boardPopover icon-copy fa fa-ellipsis-h cursor-pointer float-right" aria-hidden="true" data-toggle="popover"></i>';
							}
							if(result1.secret == 1){
								str += '			<i class="fa fa-lock d-inline" aria-hidden="true"></i>';
							}
							str += '			<h5 class="m-0 font-weight-bold d-inline">'+result1.writer+'</h5>';
							str += '			<h6 class="m-0 font-weight-bold">'+ boardService.displayTime(result1.regdate) +'</h6>';
							str += '		</div>';
							str += '		<div class="card-body">';
							str += '			<h4 class="card-title d-none">'+ result1.title +'</h4>';
							str += '			<p class="card-text">'+ result1.content +'</p>';
							str += '		</div>';
							str += '		<div class="card-body listUploadResult">';
							str += '			<ul class="list-group list-group-horizontal">';
							for(var j in result1.attachList) {
								var obj = result1.attachList[j];
								console.log(obj);
								str += "<li class='list-group-item' "
								str += " data-filename='" + obj.fileName
								str += "' data-image='" + obj.image
								str += "' data-uuid='" + obj.uuid
								str += "' data-uploadpath='" + obj.uploadPath
								str += "' >"
								str += "<a href='javascript:showImage(\""+ obj.downPath +"\")'>";
								str += "<img src = '${pageContext.request.contextPath}/display?fileName=" + obj.thumbPath + "'></a>";
								str += "</li>";
							} 
							str += '			</ul>';
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
							str += '				<div class="d-none form-group mt-1">';
							str += '					<input type="text" class="form-control form-control-lg radius cursor-pointer bg-reply"  id="replyer" name="replyer" readonly required placeholder="작성자를 입력하세요..." value="'+replyer+'">';
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
							}
						});
					}); 
		 		});
			 	
		 		//수정적용 이벤트
		 		$("#modModBtn").click(function() {
	 				var fileStr = "";
					var fileAttrs = ["fileName", "uuid", "uploadPath","image"];
					var attachList =[];
					$(this).parent().prev().children(".uploadResult").find("li").each(function(i, it) {
						var obj = {};
						for(var j in fileAttrs) {
							obj[fileAttrs[j]]= $(it).data(fileAttrs[j].toLowerCase());    
						}	
						attachList.push(obj);
					}); 
	 				var board = {bno:bno, title:$("#title").val(), content:$("#content").val(), writer:writer, attachList:attachList, cp:cp}
	 				//console.log(board);
	 				boardService.modify(board, function(result) {
						//alert(result);
						$(".boardModal").modal("hide");
						//var bno = result;
						boardService.get({bno:bno, cp:cp}, function(result1) {
							var str = ""; 
							for(var j in result1.attachList) {
								var obj = result1.attachList[j];
								str += "<li class='list-group-item' "
								str += " data-filename='" + obj.fileName
								str += "' data-image='" + obj.image
								str += "' data-uuid='" + obj.uuid
								str += "' data-uploadpath='" + obj.uploadPath
								str += "' >"
								str += "<a href='javascript:showImage(\""+ obj.downPath +"\")'>";
								str += "<img src = '${pageContext.request.contextPath}/display?fileName=" + obj.thumbPath + "'></a>";
								str += "</li>";
							} 
							$(".board-content").each(function() {
								if($(this).data("bno") == bno) {
									console.log(this);
									$(this).find(".listUploadResult ul").html(str);
									$(this).find(".card-title").html(result1.title);
									$(this).find(".card-text").html(result1.content);
								}
							})
						})
					}); 
		 		});
		 		
		 		//삭제적용 이벤트
		 		$(document).on("click", ".popover .remove", function() {
		 			//console.log(writer);
		 			boardService.remove({bno:bno, writer:writer, cp:cp}, function(result) {
						alert(result);
						$(".board-content").each(function() {
							if($(this).data("bno") == bno) {
								$(this).parent().remove();
							}
						})
					}); 
		 			$(this).parents(".popover").popover('hide');
		 		});
		 		
				
			 	
				//btnShowMore 이벤트(댓글 10개씩 더보기)
		 		boardDIV.on("click", ".chat .replyMore", function() {
		 			//alert("hi")
					bno = $(this).closest(".reply-content").prev().data("bno");
					var replyDom = $(this).closest(".chat");
					var rno = $(this).parent().parent().prev().data("rno");
					appendReplyList(rno);
					function appendReplyList(rno) {
						//댓글 목록 불러오기
					 	replyService.getList({bno:bno, rno:rno, cp:cp}, function(result) {
							var list = result;
							var length = list.length;
							var str ="";
							//console.log(list);
							for(var j in list) {
								str += '    		<li class="replyLi list-group mb-2" data-rno="'+list[j].rno+'">';
								str += '    			<div class="bg-mygray radius p-2">';
								str += '    				<strong>'+list[j].replyer+'</strong>';
								str += '    				<small class="">'+ replyService.displayTime(list[j].replyDate) +'</small>';
								if(replyer == list[j].replyer) {
								str += '					<i class="replyPopover icon-copy fa fa-ellipsis-h cursor-pointer" aria-hidden="true" data-toggle="popover" ></i>';
								}		
								str += '    				<p>'+list[j].reply+'</p>';
								str += '    			</div>';
								str += '    		</li>';
							}
							if(length >= 10){
								str += '				<li class="list-group mb-2 replyMoreLI">';
								str += '					<div>';
								str += '						<p class="replyMore cursor-pointer">댓글 더보기</p>';
								str += '					</div>';
								str += '				</li>';
							}
							$(".chat .replyMore").hide();
							replyDom.append(str);
						});
					}
		 		});
				
				
				//btnShowMore 이벤트(게시글 10개씩 더보기)
		 		$("#btnShowMore").click(function() {
		 			// showList() 호출 
		 			var bno = $(".board .board-content:last").data("bno");
		 			showList(bno);
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