$(document).ready(function () {
	
	// 길안내 앱 선택 팝업
	$(".hex_gaplist_wrap .gaplist_cont .listbox > .item .cont .map").click(function () {
		$("body").addClass("hidden")
		$(".hex_map_popup").addClass("show")
	})
		
});


// 빈화면 클릭시 팝업 닫기
$(document).mouseup(function (e) {

	if ($(".hex_map_popup").has(e.target).length === 0 
		&& $(".hex_gapview_go_popup").has(e.target).length === 0) {
		$("body").removeClass("hidden");
		$(".hex_map_popup").removeClass("show");
		$(".hex_gapview_go_popup").removeClass("show");
	}

});

// 현재 시간 출력 > 시:분
function getTime() {
  var today = new Date();
  var hh = today.getHours();
  if (hh.toString().length < 2) {
	  hh = "0"+hh;
  }
  var mm = today.getMinutes();
  if (mm.toString().length < 2) {
	  mm = "0"+mm;
  }

  return hh + ":" + mm;
}