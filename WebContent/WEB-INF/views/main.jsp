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
		$(document).ready(function () {
			//  메인 - 출근/퇴근
			$(".start_btn").click(function () {
				$(".hex_main_wrap .detail_info").addClass("working")
				$(".hex_main_wrap .detail_info").addClass("working")
			})
		
			$(".end_btn").click(function () {
				$(".hex_main_wrap .detail_info").removeClass("working")
			})	
			
			//배차조회
			$(".vList").click(function () {
				location.href = "/vList";
			})
			
		});
    </script>    
</head>
<body>

    <div class="wrap hex_main_wrap">

        <!-- header -->
        <header class="hex_header">
            <div class="h_logo"><img src="/img/logo.png" alt=""></div>
        </header>

        <!-- contents -->
        <div class="contents main_contents">
            <div class="main_location">서울 세종대로 1677-7번길</div>
            <div class="main_cont1 inner">
                <div class="detail_top">
                    <p class="date">2024년 02월 08일 (목)</p>
                    <p class="time">오후 01:07분</p>
                </div>
                <div class="detail_info">
                    <div class="topbox">
                        <div class="user">
                            <div class="user_thum"></div>
                            <div class="user_txt">
                                <p class="txt">
                                    홍길동 <span class="small">담당</span>
                                </p>
                                <p class="txt">
                                    18루 1653 (856954)
                                </p>
                            </div>
                        </div>
                        <div class="km_h">
                            <div class="num">20</div>
                            <div class="unit">km/h</div>
                        </div>
                    </div>
                    <div class="reportbox">
                        <div class="item">
                            <p class="sub">최근 보고 이력</p>
                            <div class="descbox">
                                <p class="desc_place">
                                    <span class="place">이천센터</span>
                                    <span class="txt">출 발</span>
                                </p>
                                <p class="desc_info">
                                    <span class="date">02/08</span>
                                    <span class="time">12:30</span>
                                </p>
                                <p class="desc_none">없음</p>
                            </div>
                        </div>
                        <div class="item">
                            <p class="sub">다음 보고 이력</p>
                            <div class="descbox">
                                <p class="desc_place">
                                    <span class="place">이천센터</span>
                                    <span class="txt">점 착</span>
                                </p>
                                <p class="desc_info">
                                    <span class="date">02/08</span>
                                    <span class="time">06:00</span>
                                </p>
                                <p class="desc_none">없음</p>
                            </div>
                        </div>
                    </div>
                    <div class="btnbox">
                        <button type="button" class="btn start_btn">
                            <div class="icon"><img src="/img/ic_start.png" alt=""></div>
                            <span class="txt"><span>출</span><span>근</span></span>
                        </button>
                        <div class="btn work_on">
                            <div class="icon"><img src="/img/ic_start.png" alt=""></div>
                            <span class="txt">업무중</span>
                            <span class="time">출근 08:15</span>
                        </div>
                        <button type="button" class="btn end_btn">
                            <div class="icon"><img src="/img/ic_end_on.png" alt=""></div>
                            <span class="txt"><span>퇴</span><span>근</span></span>
                        </button>
                    </div>
                </div>
                <div class="noti_box">
                    <div class="item">
                        <p class="sub">공지사항</p>
                        <p class="desc">안전운전하세요. 요금상향</p>
                        <p class="date">2024.01.25</p>
                    </div>
                </div>
            </div>
            <div class="main_cont2 inner">
                <div class="hex_m_titbox">
                    <p class="hex_m_title">날씨정보</p>
                    <p class="update">업데이트 : 2024.03.25 오후 01:07분</p>
                </div>
                <div class="contbox">
                    <div class="top_cont">
                        <div class="region">구로구</div>
                        <div class="state">
                            <img src="/img/ic_weather1.png" alt="">
                        </div>
                        <div class="info">
                            <div class="info_txt">
                                <p class="txt">
                                    <span class="temperature">2’C</span>
                                    체감(1’C)
                                </p>
                                <p class="txt">
                                    어제보다 1’C 낮아요
                                </p>
                            </div>
                            <div class="sunbox">
                                <div class="sunitem sunrise">일출 07:20</div>
                                <div class="sunitem sunset">일몰 17:57</div>
                            </div>
                        </div>
                    </div>
                    <div class="bottom_cont">
                        <div class="item"><span class="bold">습도</span> 65%</div>
                        <div class="item"><span class="bold">바람</span> 서 2.3m/s</div>
                        <div class="item"><span class="bold">강수량</span> 1시간 -mm</div>
                    </div>
                </div>
            </div>
            <div class="main_cont3 inner">
                <div class="hex_m_titbox">
                    <p class="hex_m_title">업무보고</p>
                </div>
                <div class="contbox">
                    <div class="item vList">
                        <div class="icon">
                            <img src="/img/main_cont3_icon1.png" alt="">
                        </div>
                        <div class="txt">배차조회</div>
                    </div>
                    <div class="item">
                        <div class="icon">
                            <img src="/img/main_cont3_icon2.png" alt="">
                        </div>
                        <div class="txt">알림등록</div>
                    </div>
                    <div class="item">
                        <div class="icon">
                            <img src="/img/main_cont3_icon3.png" alt="">
                        </div>
                        <div class="txt">주유정보입력</div>
                    </div>
                    <div class="item">
                        <div class="icon">
                            <img src="/img/main_cont3_icon4.png" alt="">
                        </div>
                        <div class="txt">추가운행등록</div>
                    </div>
                </div>
            </div>
            <div class="main_cont4 inner">
                <div class="contbox">
                    <div class="item item1">
                        <div class="icon">
                            <img src="/img/main_cont4_icon1.png" alt="">
                        </div>
                        <div class="tit">주유정보</div>
                        <div class="info">
                            <span class="gsicon">
                                <img src="/img/ic_gs.png" alt="">
                            </span>
                            <span class="badge">GS칼텍스</span>
                            <span class="desc">1,400원</span>
                        </div>
                    </div>
                    <div class="item item2">
                        <div class="icon">
                            <img src="/img/main_cont4_icon2.png" alt="">
                        </div>
                        <div class="tit">운행점수</div>
                        <div class="info">
                            <div class="left">
                                <span class="score">
                                    <span class="num">90</span>점
                                </span>
                            </div>
                            <div class="right">
                                <div class="km_infobox">
                                    <div class="item">
                                        <span class="bold">주간</span>100km
                                    </div>
                                    <div class="item">
                                        <span class="bold">월간</span>980km
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="item item3">
                        <div class="icon">
                            <img src="/img/main_cont4_icon3.png" alt="">
                        </div>
                        <div class="tit">숙박/식당</div>
                        <div class="info">
                            <div class="left">필그린호텔</div>
                            <div class="right">376km</div>
                        </div>
                    </div>
                    <div class="item menuadd">
                        <div class="icon">
                            <img src="/img/ic_menuadd.png" alt="">
                        </div>
                        <div class="tit">메뉴추가</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>