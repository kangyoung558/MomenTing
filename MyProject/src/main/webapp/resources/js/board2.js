/**
 *  board2 module
 */

console.log("board module....");

var boardService = (function(){
	return{
		add: function(board, callback, error) { //start add
			console.log("board.add().....");
				
			$.ajax({
				type : "post",
				url : "/board/register",
				data : JSON.stringify(board),
				contentType : "application/json; charset = utf-8",
				success : function(result, status, xhr) {
					if(callback) {
						callback(result);
					}
				},
				error : function(xhr, status, err) {
					if(error) {
						error(err);
					}
				}
			});
		}, //end add
		getList: function(param, callback, error) { //start getList
			console.log(param);
			var bnoStr = param.bno ? param.bno : "";
			var url = "/index/more/" + bnoStr;
			
			$.getJSON(url, function(result) {
				if(callback) {
					callback(result);
				}
			}).fail( function(xhr, status, err) {
				if(error) {
					error(err);
				}
			});
		}, //end getList
		remove: function(rno, callback, error) { //start remove
			var url = "/replies/" + rno;
			
			$.ajax({
				type : "delete",
				url : url,
				success : function(result) {
					if(callback) {
						callback(result);
					}
				},
				error : function(xhr, status, err) {
					if(error) {
						error(err);
					}
				}
			});
		}, //end remove
		update: function(reply, callback, error) {
			var url = "/replies/" + reply.rno;
			
			$.ajax({
				type : "put",
				url : url,
				data : JSON.stringify(reply),
				contentType : "application/json; charset = utf-8",
				success : function(result, status, xhr) {
					if(callback) {
						callback(result);
					}
				},
				error : function(xhr, status, err) {
					if(error) {
						error(err);
					}
				}
			});
		},
		get: function(rno, callback, error) {
			var url = "/replies/" + rno;
			
			$.getJSON(url, function(result) {
				if(callback) {
					callback(result);
				}
			}).fail( function(xhr, status, err) {
				if(error) {
					error(err);
				}
			});
		},
		displayTime: function(timeValue) {
			//var today = moment(new Date());
			//var dateObj = moment(timeValue);
			
			//return today.diff(dateObj, 'days') < 1 ? dateObj.format("hh:mm:ss") : dateObj.format("yy/MM/DD") 
			return moment(timeValue).fromNow();
		}
	};
})(); 