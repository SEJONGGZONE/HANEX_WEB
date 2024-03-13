<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HanExpress</title>

    <script src="/gzon/include.2.0.js?202403061413"></script>
    <script src="/js/Sortable.min.js"></script>
    <script src="/js/sweetalert.min.js"></script>
    <script>  
		$(document).ready(function () {
			var timer       = null;
			var timerCnt    = 5;
		
			$(".start").hide();
			
			//뒤로가기 버튼
			$(".back_btn").click(function () {
				location.href = "/vList";
			})
			
			//새로고침
			$(".refresh_btn").click(function () {
				alert('새로고침');
			})		
			
			//logo
			$(".h_logo").click(function () {
				showMessage('로고입니다.');
			})
			
			
			// 배차상세 다중배송처 팝업
			$(".multi_btn").click(function () {
				$("body").addClass("hidden2");
				$(".hex_gapview_multi_popup").addClass("show");
			})
		
			$(".close_btn").click(function () {
				$("body").removeClass("hidden2");
				$(".hex_gapview_multi_popup").removeClass("show");
			})
			
			
			// [임시작업] 배차상세 다중배송처 팝업 - 출발/도착
			$(".btn").click(function () {
				$(this).parent().toggleClass("on");
			})
			//출발
			$("#stBtn").click(function () {
				$("#stTime").html("- "+getTime());						
			})
			//도착
			$("#endBtn").click(function () {
				$("#endTime").html("- "+getTime());								
			})
			
			
			
			// 센터 출발 보고 팝업
			$(".gapview_go").click(function () {
				$("body").addClass("hidden");
				$(".hex_gapview_go_popup").addClass("show");
				timerCnt = 5;
				fnGoTimer("go");
			})
		
			//취소버튼
			$(".cancel_btn").click(function () {
				$("body").removeClass("hidden");
				$(".hex_gapview_go_popup").removeClass("show");
			})	
			
			//출발
			$("#yBtn").click(function () {
				$("body").removeClass("hidden");
				$(".hex_gapview_go_popup").removeClass("show");
				
				$(".inner").hide();
				$(".gapview_go").hide();
				
				$(".start").show();
			})
			//출발+길안내
			$("#nvBtn").click(function () {
				$("body").removeClass("hidden");
				$(".hex_gapview_go_popup").removeClass("show");
				
				$(".inner").hide();
				$(".gapview_go").hide();
				
				$(".start").show();
			})
			
			/**
			 * @description Timer 실행
			 */
			function fnGoTimer(id){
			    if(timer != null) {
			    	clearInterval(timer);
			    }

			    $("#yBtn").html("예 (" + timerCnt + "초)");
			    timer = setInterval(function(){
			        timerCnt--;
			        if(timerCnt > 0){
			        	$("#yBtn").html("예 (" + timerCnt + "초)");
			        }else{
						$("body").removeClass("hidden");
						$(".hex_gapview_go_popup").removeClass("show");
						
						$(".inner").hide();
						$(".gapview_go").hide();
						
						$(".start").show();
			        }
			    }, 1000);
			}			
		});

    </script>
</head>
<body>

    <div class="wrap hex_gapview_wrap">

        <!-- header -->
        <header class="hex_header">
            <div class="h_logo"><img src="img/logo.png" alt=""></div>
            <div id="info-toast"></div>
        </header>

        <!--page top -->
        <div class="hex_page_top">
            <button type="button" class="back_btn">
                <i class="xi-angle-left"></i>
            </button>
            <div class="page_title">
                강원 영월점 <span class="small">외</span>
                11<span class="small">건</span>
            </div>
            <button type="button" class="refresh_btn">새로고침</button>
        </div>

        <!-- contents -->
        <div class="contents gapview_contents">
        
            <div class="gapview_top inner">
                <div class="left">
                    <div class="location">화성센터</div>
                    <div class="distance">- 반경 <span class="num">2.3</span>km</div>
                </div>
                <div class="right">
                    <div class="item">
                        <p class="tit">BOX</p>
                        <p class="desc">15</p>
                    </div>
                    <div class="item">
                        <p class="tit">PLT</p>
                        <p class="desc">1.25</p>
                    </div>
                </div>
            </div>
            <div class="gapview_go">
                <div class="go_circle">Go</div>
                <div class="go_txt">
                    <span class="destination">화성센터</span>로 출발(이동) 하시겠습니까?
                </div>
            </div>
            
            
            <div class="gapview_top inner start">
                <div class="left2">
                    <div class="depart">
                        <span class="time"> 10시20분</span>
                        <span>출 발</span>
                    </div>
                    <div class="distance">
                        <span>반경3km</span>
                        <div class="arrow"></div>
                    </div>
                    <div class="arrive">
                        <span class="location">화성센터</span>
                        <span>이동중</span>
                    </div>
                </div>
                <div class="right">
                    <div class="item">
                        <p class="tit">BOX</p>
                        <p class="desc">15</p>
                    </div>
                    <div class="item">
                        <p class="tit">PLT</p>
                        <p class="desc">1.25</p>
                    </div>
                </div>
            </div>
            
            
            

            
            
            <div class="gapview_cont" id="list">
                <div class="item" value="강원 영월점">
                    <div class="left">
                        <div class="top">
                            <div class="titbox">
                                <p class="title">강원 영월점</p>
                                <div class="infobox">
                                    <div class="info">
                                        <p class="sub">BOX </p>
                                        <p class="desc">1</p>
                                    </div>
                                    <div class="info">
                                        <p class="sub">PLT</p>
                                        <p class="desc">0.02</p>
                                    </div>
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="btn depart_btn disabled">출발</button>
                                <button type="button" class="btn arrive_btn disabled">도착</button>
                            </div>
                        </div>
                        <div class="bottom">
                            <button type="button" class="btn btn1">
                                <div class="icon">
                                    <img src="img/ic_navi.png" alt="">
                                </div>
                                <div class="txt">길안내</div>
                            </button>
                            <button type="button" class="btn btn2">
                                <div class="icon">
                                    <img src="img/ic_call.png" alt="">
                                </div>
                                <div class="txt">전화걸기</div>
                            </button>
                            <button type="button" class="btn btn3 disabled">
                                <div class="icon">
                                    <img src="img/ic_camera.png" alt="">
                                </div>
                                <div class="txt">사진촬영</div>
                            </button>
                            <button type="button" class="btn btn4 disabled">
                                <div class="icon">
                                    <img src="img/ic_note.png" alt="">
                                </div>
                                <div class="txt">종이 명세서</div>
                            </button>
                        </div>
                    </div>
                    <div class="right">
                        <div class="distance"><span class="num">1</span>km</div>
                        <div class="scroll_icon"></div>
                    </div>
                </div>
                <div class="item">
                    <div class="left">
                        <div class="top">
                            <div class="titbox">
                                <p class="title">TOLL(레고)</p>
                                <div class="infobox">
                                    <div class="info">
                                        <p class="sub">BOX </p>
                                        <p class="desc">39</p>
                                    </div>
                                    <div class="info">
                                        <p class="sub">PLT</p>
                                        <p class="desc">0.82</p>
                                    </div>
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="btn depart_btn disabled">출발</button>
                                <button type="button" class="btn arrive_btn disabled">도착</button>
                            </div>
                        </div>
                        <div class="bottom">
                            <button type="button" class="btn btn1">
                                <div class="icon">
                                    <img src="img/ic_navi.png" alt="">
                                </div>
                                <div class="txt">길안내</div>
                            </button>
                            <button type="button" class="btn btn2">
                                <div class="icon">
                                    <img src="img/ic_call.png" alt="">
                                </div>
                                <div class="txt">전화걸기</div>
                            </button>
                            <button type="button" class="btn btn3 disabled">
                                <div class="icon">
                                    <img src="img/ic_camera.png" alt="">
                                </div>
                                <div class="txt">사진촬영</div>
                            </button>
                            <button type="button" class="btn btn4 disabled">
                                <div class="icon">
                                    <img src="img/ic_note.png" alt="">
                                </div>
                                <div class="txt">전자 명세서</div>
                            </button>
                        </div>
                    </div>
                    <div class="right">
                        <div class="distance"><span class="num">63</span>km</div>
                        <div class="scroll_icon"></div>
                    </div>
                </div>
                <div class="item returned">
                    <div class="left">
                        <div class="top">
                            <div class="titbox">
                                <p class="title">
                                    유니레버 코리아
                                    <span class="return_badge">반품</span>
                                </p>
                                <div class="infobox">
                                    <div class="info">
                                        <p class="sub">BOX </p>
                                        <p class="desc">2</p>
                                    </div>
                                    <div class="info">
                                        <p class="sub">PLT</p>
                                        <p class="desc">0.01</p>
                                    </div>
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="btn depart_btn disabled">출발</button>
                                <button type="button" class="btn arrive_btn disabled">도착</button>
                            </div>
                        </div>
                        <div class="bottom">
                            <button type="button" class="btn btn1">
                                <div class="icon">
                                    <img src="img/ic_navi.png" alt="">
                                </div>
                                <div class="txt">길안내</div>
                            </button>
                            <button type="button" class="btn btn2">
                                <div class="icon">
                                    <img src="img/ic_call.png" alt="">
                                </div>
                                <div class="txt">전화걸기</div>
                            </button>
                            <button type="button" class="btn btn3 disabled">
                                <div class="icon">
                                    <img src="img/ic_camera.png" alt="">
                                </div>
                                <div class="txt">사진촬영</div>
                            </button>
                            <button type="button" class="btn btn4 disabled">
                                <div class="icon">
                                    <img src="img/ic_note.png" alt="">
                                </div>
                                <div class="txt">종이 명세서</div>
                            </button>
                        </div>
                    </div>
                    <div class="right">
                        <div class="distance"><span class="num">13</span>km</div>
                        <div class="scroll_icon"></div>
                    </div>
                </div>
                <div class="item">
                    <div class="left">
                        <div class="top">
                            <div class="titbox">
                                <p class="title">TS 단양점</p>
                                <div class="infobox">
                                    <div class="info">
                                        <p class="sub">BOX </p>
                                        <p class="desc">11</p>
                                    </div>
                                    <div class="info">
                                        <p class="sub">PLT</p>
                                        <p class="desc">1.25</p>
                                    </div>
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="btn multi_btn">다중배송처</button>
                            </div>
                        </div>
                        <div class="bottom">
                            <button type="button" class="btn btn1">
                                <div class="icon">
                                    <img src="img/ic_navi.png" alt="">
                                </div>
                                <div class="txt">길안내</div>
                            </button>
                            <button type="button" class="btn btn2">
                                <div class="icon">
                                    <img src="img/ic_call.png" alt="">
                                </div>
                                <div class="txt">전화걸기</div>
                            </button>
                            <button type="button" class="btn btn3 disabled">
                                <div class="icon">
                                    <img src="img/ic_camera.png" alt="">
                                </div>
                                <div class="txt">사진촬영</div>
                            </button>
                            <button type="button" class="btn btn4 disabled">
                                <div class="icon">
                                    <img src="img/ic_note.png" alt="">
                                </div>
                                <div class="txt">종이 명세서</div>
                            </button>
                        </div>
                    </div>
                    <div class="right">
                        <div class="distance"><span class="num">35</span>km</div>
                        <div class="scroll_icon"></div>
                    </div>
                </div>
                <div class="item">
                    <div class="left">
                        <div class="top">
                            <div class="titbox">
                                <p class="title">강원 정선점</p>
                                <div class="infobox">
                                    <div class="info">
                                        <p class="sub">BOX </p>
                                        <p class="desc">2</p>
                                    </div>
                                    <div class="info">
                                        <p class="sub">PLT</p>
                                        <p class="desc">0.01</p>
                                    </div>
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="btn depart_btn disabled">출발</button>
                                <button type="button" class="btn arrive_btn disabled">도착</button>
                            </div>
                        </div>
                        <div class="bottom">
                            <button type="button" class="btn btn1">
                                <div class="icon">
                                    <img src="img/ic_navi.png" alt="">
                                </div>
                                <div class="txt">길안내</div>
                            </button>
                            <button type="button" class="btn btn2">
                                <div class="icon">
                                    <img src="img/ic_call.png" alt="">
                                </div>
                                <div class="txt">전화걸기</div>
                            </button>
                            <button type="button" class="btn btn3 disabled">
                                <div class="icon">
                                    <img src="img/ic_camera.png" alt="">
                                </div>
                                <div class="txt">사진촬영</div>
                            </button>
                            <button type="button" class="btn btn4 disabled">
                                <div class="icon">
                                    <img src="img/ic_note.png" alt="">
                                </div>
                                <div class="txt">종이 명세서</div>
                            </button>
                        </div>
                    </div>
                    <div class="right">
                        <div class="distance"><span class="num">108</span>km</div>
                        <div class="scroll_icon"></div>
                    </div>
                </div>

                <div class="item">
                    <div class="left">
                        <div class="top">
                            <div class="titbox">
                                <p class="title">강원 영월점</p>
                                <div class="infobox">
                                    <div class="info">
                                        <p class="sub">BOX </p>
                                        <p class="desc">1</p>
                                    </div>
                                    <div class="info">
                                        <p class="sub">PLT</p>
                                        <p class="desc">0.02</p>
                                    </div>
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="btn depart_btn disabled">출발</button>
                                <button type="button" class="btn arrive_btn disabled">도착</button>
                            </div>
                        </div>
                        <div class="bottom">
                            <button type="button" class="btn btn1">
                                <div class="icon">
                                    <img src="img/ic_navi.png" alt="">
                                </div>
                                <div class="txt">길안내</div>
                            </button>
                            <button type="button" class="btn btn2">
                                <div class="icon">
                                    <img src="img/ic_call.png" alt="">
                                </div>
                                <div class="txt">전화걸기</div>
                            </button>
                            <button type="button" class="btn btn3 disabled">
                                <div class="icon">
                                    <img src="img/ic_camera.png" alt="">
                                </div>
                                <div class="txt">사진촬영</div>
                            </button>
                            <button type="button" class="btn btn4 disabled">
                                <div class="icon">
                                    <img src="img/ic_note.png" alt="">
                                </div>
                                <div class="txt">종이 명세서</div>
                            </button>
                        </div>
                    </div>
                    <div class="right">
                        <div class="distance"><span class="num">1</span>km</div>
                        <div class="scroll_icon"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- map popup -->
        <div class="hex_gapview_go_popup">
            <div class="popup_head">
                <p class="title">센터로 이동</p>
            </div>
            <div class="popup_body">
                <div class="popup_cont">
                    <span class="big">‘화성센터’</span>(으)로 <br>
                    <span class="under">출발</span> 하시겠습니까?
                </div>
                <div class="popup_bottom">
                    <div class="titbox">
                        배송처 출발 09:00 요청
                    </div>
                    <div class="infobox">
                        <div class="item">
                            <p class="sub">BOX</p>
                            <p class="desc">15</p>
                        </div>
                        <div class="item">
                            <p class="sub">PLT</p>
                            <p class="desc">1.25</p>
                        </div>
                    </div>
                </div>
                <div class="btnbox">
                    <button type="button" id="yBtn" class="btn btn1">
                        예 (5초)
                    </button>
                    <button type="button" id="nvBtn" class="btn btn2">
                        예 <br> + 길안내
                    </button>
                    <button type="button" class="btn btn3 cancel_btn">
                        취 소
                    </button>
                </div>
            </div>
        </div>

        <!-- multi popup -->
        <div class="hex_gapview_multi_popup">
            <div class="top">
                <div class="top_box">
                    <div class="icon">
                        <img src="img/icon_navi_tmap.png" alt="">
                    </div>
                    <div class="txt">길안내</div>
                </div>
                <div class="close_btn">
                    <i class="xi-close"></i>
                </div>
            </div>
            <div class="content">
                <div class="titbox">
                    <div class="left">
                        <div class="location">강원 영월점</div>
                        <div class="distance">- 반경 <span class="num">1</span>km</div>
                    </div>
                    <div class="right">
                        <div class="item">
                            <p class="tit">BOX</p>
                            <p class="desc">11</p>
                        </div>
                        <div class="item">
                            <p class="tit">PLT</p>
                            <p class="desc">1.25</p>
                        </div>
                    </div>
                </div>
                <div class="address">강원도 영월 영월로 787</div>
                <div class="listwrap">
                    <div class="listbox">
                        <div class="item head">
                            <ul class="top">
                                <li class="customer">고객사</li>
                                <li class="box">BOX</li>
                                <li class="plt">PLT</li>
                                <li class="shipping">배송처</li>
                            </ul>
                        </div>
                        <div class="item">
                            <ul class="top">
                                <li class="customer">인삼공사</li>
                                <li class="box">9</li>
                                <li class="plt">0.20</li>
                                <li class="shipping">강원 영월점</li>
                            </ul>
                            <div class="bottom">
                                <button type="button" class="btn btn3">
                                    <div class="icon">
                                        <img src="img/ic_camera.png" alt="">
                                    </div>
                                    <div class="txt">사진촬영</div>
                                </button>
                                <button type="button" class="btn btn2">
                                    <div class="icon">
                                        <img src="img/ic_call.png" alt="">
                                    </div>
                                    <div class="txt">전화걸기</div>
                                </button>
                                <button type="button" class="btn btn4">
                                    <div class="icon">
                                        <img src="img/ic_note.png" alt="">
                                    </div>
                                    <div class="txt">종이 명세서</div>
                                </button>
                            </div>
                        </div>
                        <div class="item">
                            <ul class="top">
                                <li class="customer">서브원</li>
                                <li class="box">1</li>
                                <li class="plt">0.03</li>
                                <li class="shipping">영월점 강월1</li>
                            </ul>
                            <div class="bottom">
                                <button type="button" class="btn btn3">
                                    <div class="icon">
                                        <img src="img/ic_camera.png" alt="">
                                    </div>
                                    <div class="txt">사진촬영</div>
                                </button>
                                <button type="button" class="btn btn2">
                                    <div class="icon">
                                        <img src="img/ic_call.png" alt="">
                                    </div>
                                    <div class="txt">전화걸기</div>
                                </button>
                                <button type="button" class="btn btn4">
                                    <div class="icon">
                                        <img src="img/ic_note.png" alt="">
                                    </div>
                                    <div class="txt">종이 명세서</div>
                                </button>
                            </div>
                        </div>
                        <div class="item">
                            <ul class="top">
                                <li class="customer">네이처</li>
                                <li class="box">1</li>
                                <li class="plt">0.02</li>
                                <li class="shipping">영월점 강월1</li>
                            </ul>
                            <div class="bottom">
                                <button type="button" class="btn btn3">
                                    <div class="icon">
                                        <img src="img/ic_camera.png" alt="">
                                    </div>
                                    <div class="txt">사진촬영</div>
                                </button>
                                <button type="button" class="btn btn2">
                                    <div class="icon">
                                        <img src="img/ic_call.png" alt="">
                                    </div>
                                    <div class="txt">전화걸기</div>
                                </button>
                                <button type="button" class="btn btn4">
                                    <div class="icon">
                                        <img src="img/ic_note.png" alt="">
                                    </div>
                                    <div class="txt">종이 명세서</div>
                                </button>
                            </div>
                        </div>
                        <div class="item">
                            <ul class="top">
                                <li class="customer">인삼공사</li>
                                <li class="box">9</li>
                                <li class="plt">0.20</li>
                                <li class="shipping">강원 영월점</li>
                            </ul>
                            <div class="bottom">
                                <button type="button" class="btn btn3">
                                    <div class="icon">
                                        <img src="img/ic_camera.png" alt="">
                                    </div>
                                    <div class="txt">사진촬영</div>
                                </button>
                                <button type="button" class="btn btn2">
                                    <div class="icon">
                                        <img src="img/ic_call.png" alt="">
                                    </div>
                                    <div class="txt">전화걸기</div>
                                </button>
                                <button type="button" class="btn btn4">
                                    <div class="icon">
                                        <img src="img/ic_note.png" alt="">
                                    </div>
                                    <div class="txt">종이 명세서</div>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="btnbox_pop">
                    <p class="msg_txt">
                        선택한 배송처의 업무보고를 <br>
                        하시겠습니까?
                    </p>
                    <div class="btnbox">
                        <div class="btnitem">
                            <button type="button" class="btn depart_btn" id="stBtn">
                                <span class="icon">
                                    <img src="img/ic_start_on.png" alt="">
                                </span>
                                <span class="txt">출발보고</span>
                            </button>
                            <span class="btn depart_on">
                                <span class="icon">
                                    <img src="img/ic_start.png" alt="">
                                </span>
                                <span class="txt">
                                    출발
                                    <span class="time" id="stTime"></span> 
                                </span>
                            </span>
                        </div>
                        <div class="btnitem">
                            <button type="button" class="btn arrive_btn" id="endBtn">
                                <span class="icon">
                                    <img src="img/ic_end_on.png" alt="">
                                </span>
                                <span class="txt">도착보고</span>
                            </button>
                            <span class="btn arrive_on">
                                <span class="icon">
                                    <img src="img/ic_end.png" alt="">
                                </span>
                                <span class="txt">
                                    도착
                                    <span class="time" id="endTime"></span>
                                </span>                                
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<script>
		//sortable list
	    var list = document.getElementById('list');
	    var sortable = Sortable.create(list, {
	        animation: 200,
            handle: '.scroll_icon',
            group: 'handler',
            ghostClass: 'gu-transit',
            onEnd: function (e) {  //드롭했을때 이벤트 실행
            	if (e.oldIndex == e.newIndex) {
            		return;
            	}
            	var itemEl = e.item;  // dragged HTMLElement
            	//console.log(itemEl.textContent);
            	showMessage("순서변경 : " + itemEl.getAttribute("value") + " [" + (e.oldIndex+1) + " > " + (e.newIndex+1) + "]");
            	
            	/*
            	$('#list .title').each(function(){
            		//var day= $(this).find('td').eq(8).html();
            		//$(this).find('td').eq(8).html(day);
            		console.log($(this).text().trim().replaceAll('반품',''));
            	});
            	*/
            } 
	    });
	    
	    //toast
        showMessage = (msg = 'notification text', position = 'bottom', showCloseButton = true, closeButtonHtml = '', duration = 3000) => {
            const toast = window.Swal.mixin({
                toast: true,
                position: position || 'bottom',
                showConfirmButton: false,
                timer: duration,
                showCloseButton: showCloseButton,
            });
            toast.fire({
                title: msg,
            });
        };
	</script>
</body>
</html>