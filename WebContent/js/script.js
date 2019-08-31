var counter = document.getElementById("counter");

function next() {
	if(counter.value<15){
		counter.value++;
		if (document.getElementById("answer1").checked) {
			window.location.href = "Question.jsp?counter=" + (counter.value)
			+ "&answer=1";
		} else if (document.getElementById("answer2").checked) {
			window.location.href = "Question.jsp?counter=" + (counter.value)
			+ "&answer=2";
		} else if (document.getElementById("answer3").checked) {
			window.location.href = "Question.jsp?counter=" + (counter.value)
			+ "&answer=3";
		} else if (document.getElementById("answer4").checked) {
			window.location.href = "Question.jsp?counter=" + (counter.value)
			+ "&answer=4";
		}else{
			window.location.href = "Question.jsp?counter=" + (counter.value);
		}
	}
}
function prev() {
	if(counter.value >=1){
		counter.value--;
		if (document.getElementById("answer1").checked) {
			window.location.href = "Question.jsp?counter=" + (counter.value)
			+ "&answer=1";
		} else if (document.getElementById("answer2").checked) {
			window.location.href = "Question.jsp?counter=" + (counter.value)
			+ "&answer=2";
		} else if (document.getElementById("answer3").checked) {
			window.location.href = "Question.jsp?counter=" + (counter.value)
			+ "&answer=3";
		} else if (document.getElementById("answer4").checked) {
			window.location.href = "Question.jsp?counter=" + (counter.value)
			+ "&answer=4";
		}else{
			window.location.href = "Question.jsp?counter=" + (counter.value);
		}
	}
}