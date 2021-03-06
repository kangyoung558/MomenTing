/**
 *  board module
 */

console.log("board module....");

var boardService = (function(){
	return{
		register: function(board, callback, error) { //start register
			console.log("board.register().....");
				
			$.ajax({
				type : "post",
				url : board.cp + "/index/register",
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
		}, //end register
		getList: function(param, callback, error) { //start getList
			var writer = param.writer;
			var bnoStr = param.bno ? "/" + param.bno : "";
			console.log(bnoStr);
			var url = param.cp + "/index/more" + bnoStr + "/" + writer;
			
			
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
		getListMyBoard: function(param, callback, error) { //start getListMyBoard
			var writer = param.writer;
			var bnoStr = param.bno ? "/" + param.bno : "";
			
			//console.log(bnoStr);
			//console.log(writer);
			var url = param.cp + "/index/my" + bnoStr + "/" + writer;
			
			$.getJSON(url, function(result) {
				if(callback) {
					callback(result);
				}
			}).fail( function(xhr, status, err) {
				if(error) {
					error(err);
				}
			});
			
		}, //end getListMyBoard
		remove: function(board, callback, error) { //start remove
			//console.log(board);
			var url = board.cp + "/index/" + board.bno + "/" + board.writer;
			
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
		modify: function(board, callback, error) {
			var url = board.cp + "/index/" + board.bno;
			
			$.ajax({
				type : "put",
				url : url,
				data : JSON.stringify(board),
				contentType : "application/json; charset = utf-8",
				success : function(result, status, xhr) {
					if(callback) {
						callback(result);
					}
					return this;
				},
				error : function(xhr, status, err) {
					if(error) {
						error(err);
					}
				}
			});
		}, //end modify
		get: function(param, callback, error) {
			var url = param.cp + "/index/" + param.bno;
			
			$.getJSON(url, function(result) {
				if(callback) {
					callback(result);
				}
			}).fail( function(xhr, status, err) {
				if(error) {
					error(err);
				}
			});
		}, //end get
		displayTime: function(timeValue) {
			//var today = moment(new Date());
			//var dateObj = moment(timeValue);
			
			//return today.diff(dateObj, 'days') < 1 ? dateObj.format("hh:mm:ss") : dateObj.format("yy/MM/DD") 
			return moment(timeValue).fromNow();
		}
	};
})(); 