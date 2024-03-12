<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html lang="ko-KR">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HanExpress</title>

	<script src="/gzon/include.2.0.js?202403061413"></script>
	<script>
	
		//날짜조절
		var currentDate = new Date();
		var month = currentDate.getMonth() + 1;
		var day = currentDate.getDate();
		var newDateString = currentDate.getFullYear() + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
				
		$(document).ready(function () {
			
			//뒤로가기 버튼
			$(".back_btn").click(function () {
				location.href = "/main";
			})
			
			//새로고침
			$(".refresh_btn").click(function () {
				updateDate();
			})			

			
			
			//tab
			$('.tab_nav').click(function () {
				let index = $(this).data('index');

				$('.gaplist_cont').removeClass('active');
				$('.tab_nav').removeClass('on');

				// 선택한 탭과 해당 컨텐츠 보이기
				$('.hex_gaplist_wrap #gaplist_cont' + index).addClass('active');
				$(this).addClass('on');
			});

			$('.minus_btn').click(function () {
				updateDate(-2);
			});

			$('.minus_btn2').click(function () {
				updateDate(-1);
			});

			$('.plus_btn').click(function () {
				updateDate(1);
			});

			$('.plus_btn2').click(function () {
				updateDate(2);
			});
			
			
			//detail
			$('.info').click(function () {
				location.href = "/vDetail";
			});
			$('.state').click(function () {
				location.href = "/vDetail";
			});
			
			
			function updateDate(days) {
				if (days != null) {
					currentDate.setDate(currentDate.getDate() + days);
				}
				month = currentDate.getMonth() + 1; // Month starts from 0
				day = currentDate.getDate();
				newDateString = currentDate.getFullYear() + '-' + (month < 10 ? '0' : '') + month + '-' + (day < 10 ? '0' : '') + day;
				
				//var dateSelbox = $('.hex_gaplist_wrap .date_selbox');
				//var dateText = $('.hex_gaplist_wrap .date_txt');
				//var dateString = dateSelbox.data('date');
				
				$('.date_selbox').data('date');
				$('.date_selbox').attr('data-date', newDateString);
				$('.date_txt').text((month < 10 ? '0' : '') + month + '/' + (day < 10 ? '0' : '') + day);
				
				//alert("배차목록 초기화 > " + newDateString);
			}
			
			updateDate();
						
		});		
		
    </script>
</head>
<body>

    <div class="wrap hex_gaplist_wrap">

        <!-- header -->
        <header class="hex_header">
            <div class="h_logo"><img src="img/logo.png" alt=""></div>
        </header>

        <!--page top -->
        <div class="hex_page_top">
            <button type="button" class="back_btn">
                <i class="xi-angle-left"></i>
            </button>
            <div class="page_title">배차조회</div>
            <button type="button" class="refresh_btn">새로고침</button>
        </div>

        <!-- contents -->
        <div class="contents gaplist_contents">
            <div class="gaplist_navbox">
                <div class="tab_nav" data-index="1">어제(8)</div>
                <div class="tab_nav on" data-index="2">오늘(6)</div>
                <div class="tab_nav" data-index="3">날짜선택</div>
            </div>
            <div class="gaplist_contbox">
                <div id="gaplist_cont1" class="gaplist_cont"></div>
                <div id="gaplist_cont2" class="gaplist_cont active">
                    <div class="date_selbox" data-date="2024-03-15">
                        <button type="button" class="button minus_btn">-2일</button>
                        <button type="button" class="button minus_btn2">-1일</button>
                        <span class="date_txt"></span>
                        <button type="button" class="button plus_btn">+1일</button>
                        <button type="button" class="button plus_btn2">+2일</button>
                    </div>
                    <div class="listbox">
                        <div class="item">
                            <div class="number">
                                1회차<br>배송
                            </div>
                            <div class="cont">
                                <div class="info">
                                    <div class="badge">화성센터</div>
                                    <div class="tit">강원 영월점</div>
                                </div>
                                <div class="depart">
                                    <div class="item">
                                        <sub class="sub">출 발</sub>
                                        <div class="time">09:00</div>
                                    </div>
                                    <div class="item">
                                        <sub class="sub">배송처</sub>
                                        <div class="time">11건</div>
                                    </div>
                                </div>
                                <div class="map">
                                    <img src="img/icon_navi_tmap.png" alt="">
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="change_btn"></button>
                            </div>
                        </div>
                        <div class="item ing">
                            <div class="number">
                                6회차<br>이고
                            </div>
                            <div class="cont">
                                <div class="state">
                                    <div class="item">
                                        <p class="name">동이천</p>
                                        <p class="txt">13:00 상</p>
                                    </div>
                                    <div class="item arrow">
                                        <i class="xi-long-arrow-right"></i>
                                    </div>
                                    <div class="item">
                                        <p class="name">대구</p>
                                        <p class="txt">16:30 하</p>
                                    </div>
                                </div>
                                <div class="info2">
                                    <div class="tit">PLT</div>
                                    <div class="num">30</div>
                                </div>
                                <div class="map">
                                    <img src="img/icon_navi_tmap.png" alt="">
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="change_btn"></button>
                            </div>
                        </div>
                        <div class="item">
                            <div class="number">
                                2회차<br>배송
                            </div>
                            <div class="cont">
                                <div class="info">
                                    <div class="badge">이천센터</div>
                                    <div class="tit">비어밸트코리아</div>
                                </div>
                                <div class="depart">
                                    <div class="item">
                                        <sub class="sub">출 발</sub>
                                        <div class="time">10:00</div>
                                    </div>
                                    <div class="item">
                                        <sub class="sub">배송처</sub>
                                        <div class="time">2건</div>
                                    </div>
                                </div>
                                <div class="map">
                                    <img src="img/icon_navi_tmap.png" alt="">
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="change_btn"></button>
                            </div>
                        </div>
                        <div class="item">
                            <div class="number">
                                3회차<br>배송
                            </div>
                            <div class="cont">
                                <div class="info">
                                    <div class="badge">이천센터</div>
                                    <div class="tit">한국타이어</div>
                                </div>
                                <div class="depart">
                                    <div class="item">
                                        <sub class="sub">출 발</sub>
                                        <div class="time">09:00</div>
                                    </div>
                                    <div class="item">
                                        <sub class="sub">배송처</sub>
                                        <div class="time">3건</div>
                                    </div>
                                </div>
                                <div class="map">
                                    <img src="img/icon_navi_tmap.png" alt="">
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="change_btn"></button>
                            </div>
                        </div>
                        <div class="item">
                            <div class="number">
                                4회차<br>배송
                            </div>
                            <div class="cont">
                                <div class="info">
                                    <div class="badge">이천센터</div>
                                    <div class="tit">맨소래담아시아퍼시픽</div>
                                </div>
                                <div class="depart">
                                    <div class="item">
                                        <sub class="sub">출 발</sub>
                                        <div class="time">09:00</div>
                                    </div>
                                    <div class="item">
                                        <sub class="sub">배송처</sub>
                                        <div class="time">6건</div>
                                    </div>
                                </div>
                                <div class="map">
                                    <img src="img/icon_navi_tmap.png" alt="">
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="change_btn"></button>
                            </div>
                        </div>
                        <div class="item">
                            <div class="number">
                                5회차<br>배송
                            </div>
                            <div class="cont">
                                <div class="info">
                                    <div class="badge">이천센터</div>
                                    <div class="tit">헨켈홈케어코리아</div>
                                </div>
                                <div class="depart">
                                    <div class="item">
                                        <sub class="sub">출 발</sub>
                                        <div class="time">09:00</div>
                                    </div>
                                    <div class="item">
                                        <sub class="sub">배송처</sub>
                                        <div class="time">0건</div>
                                    </div>
                                </div>
                                <div class="map">
                                    <img src="img/icon_navi_tmap.png" alt="">
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="change_btn"></button>
                            </div>
                        </div>
                        <div class="item ing done">
                            <div class="number">
                                6회차<br>이고
                            </div>
                            <div class="cont">
                                <div class="state">
                                    <div class="item">
                                        <p class="name">동이천</p>
                                        <p class="txt">13:00 상</p>
                                    </div>
                                    <div class="item arrow">
                                        <i class="xi-long-arrow-right"></i>
                                    </div>
                                    <div class="item">
                                        <p class="name">대구</p>
                                        <p class="txt">16:30 하</p>
                                    </div>
                                </div>
                                <div class="info2">
                                    <div class="tit">PLT</div>
                                    <div class="num">30</div>
                                </div>
                                <div class="map">
                                    <img src="img/icon_navi_tmap.png" alt="">
                                </div>
                            </div>
                            <div class="btnbox">
                                <button type="button" class="change_btn"></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="gaplist_cont3" class="gaplist_cont"></div>
            </div>
        </div>

        <!-- map popup -->
        <div class="hex_map_popup">
            <div class="popup_head">
                <p class="title">길안내 앱 선택</p>
            </div>
            <div class="popup_body">
                <div class="popup_cont">
                    설정이후 <br>
                    <span class="big">'내정보'</span> 화면에서 <br>
                    <span class="under">수정/변경</span> 하실 수 있습니다.
                </div>
                <div class="btnbox">
                    <a href="#none" class="link">
                        <div class="icon">
                            <img src="img/icon_navi_tmap.png" alt="">
                        </div>
                        <div class="txt">TMAP</div>
                    </a>
                    <a href="#none" class="link">
                        <div class="icon">
                            <img src="img/icon_navi_kakao.png" alt="">
                        </div>
                        <div class="txt">카카오 내비</div>
                    </a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>