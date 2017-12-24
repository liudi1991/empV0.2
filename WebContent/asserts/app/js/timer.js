

$(document).ready(showTime());

function showTime(){
	var curTime = new Date();
	$("#timer").html(curTime.toLocaleString());
	setTimeout("showTime()", 1000);
}
