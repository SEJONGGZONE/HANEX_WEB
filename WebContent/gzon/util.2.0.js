/**
 * 유틸리티 모듈
 */
 var HEX_UTIL = {
    /**
     * 화면 사이즈 확인
     */
    getScreenSize : function() {
        size = {
            width: screen.availWidth,
            height: screen.availHeight
        };
        return size;
    },
    /**
     * 클라이언트 사이즈 확인
     */
    getClientSize : function() {
        size = {
            width: document.body.clientWidth,
            height: document.body.clientHeight
        };
        return size;
    },
    /**
     * 윈도우 사이즈 확인
     */
    getInnerSize : function() {
        size = {
            width: window.innerWidth,
            height: window.innerHeight
        };
        return size;
    },
    /**
     * 지정 ID하위의 입력값 추출. (AIV 플러그인 기준- '_'구분자를 활용함. aiv_controls 플러그인 작성기준)
     */
    getDivData : function(id) {
		var ret = [];
		var jsonstring = '{';
        $.each($("#"+id).find('input'), function(a, b){
            var k = b.getAttribute("id").split('_')[0] + "";
            var v = b.value;
			v = v.replace(/-/g, '');	// 하이픈(-) 제거
			v = v.replace(/ /g, '');	// 공백 제거
			v = v.replace(/:/g, '');	// 콜론(:) 제거
            //console.log(k + "/" + v);
			ret.push(JSON.parse('{"' + k + '":"' + v + '"}'));
			jsonstring +=  '"' + k + '":"' + v + '",';
		});
		jsonstring = jsonstring.substring(0, jsonstring.length-1) + '}';
		
		return jsonstring;
        //return JSON.stringify(ret);
    },
    /**
     * 널(null) 확인
     */
    isNull : function (obj) {
        // console.log("[HEX_UTIL - isNull]");
        if ((obj != null) && (typeof(obj) != "undefined")) {
            return false;
        }
        return true;
    },
    /**
     * 빈값 확인
     */
    isEmpty : function (obj) {
        // console.log("[HEX_UTIL - isEmpty]");
        if (this.isNull(obj)) {
            return true;
        }
        if (obj == "") {
            return true;
        }
        return false;
	},
	/**
	* WebStorage 체크
	*/
	checkWebStorage : function () {
		var ret = false;
		if (storageAvailable('localStorage')) {
			//HEX_SYS.log('야호!~ 우리는 localStorage를 사용할 수 있습니다.');
			ret = true;
		} else {
			//HEX_SYS.log('슬픈소식, localStorage를 사용할 수 없습니다.');
			ret = false;
		}

		if (storageAvailable('sessionStorage')) {
			//HEX_SYS.log('야호! 우리는 sessionStorage 사용할 수 있습니다.');
			ret = true;
		} else {
			//HEX_SYS.log('슬픈소식, sessionStorage 사용할 수 없습니다.');
			ret = false;
		}
		return ret;
   },
   // 파라미터값 받기(외부 호출용)
   getParam : function(title) {
		var data = getParam(title);
		return data;
   },
   setPopPage : function () {
		var popupYN = getParam('popupYN');
		var menuShowYN = getParam('menuShowYN');
		if (popupYN == "Y") {
			$(".content").css("padding-top", "0px");
			$(".header").css("display", "none");
			$(".page-sidebar").css("display", "none");
			$(".page-container").css("padding-left", "0px");
		}
   },
	date: {
		addMinutes : function (date, minutes) {
			return new Date(date.getTime() + minutes*60*1000);
		}
	},
	/**
	 * 리모트 Page 삽입
	 * @param {페이지경로} pageUrl 
	 */
	setRemotePageOnBody : function(pageUrl, callbackFunc, bAddBackbutton) {
		// console.log("[setRemotePageOnBody] 진입");
		console.log("[setRemotePageOnBody] " + pageUrl);
		$.ajax({
			dataType: 'html',
			url: pageUrl,
			async : false,
			success: function(responseData, textStatus, jqXHR) {
				try {
					
					// 기존 내비바의 이벤트를 잡을수없어 별도의 레이어를 두고 이에 이벤트 처리한다.
					//if (HEX_UTIL.isEmpty($("#divGoBackArea"))) { // 중복생성 차단
					$("#divGoBackArea").remove();
					var sHTML = '';
					sHTML += '<div id="divGoBackArea" style="width:5em; height:5em; background-color:rgba(122, 95, 95, 0.0); position:absolute; top:-1em; left:0em; z-index: 20;" ';
					sHTML += '     onClick="javascript:INDEX_PAGE.goBack();">';
					sHTML += '</div>';
					$(document.body).append(sHTML);
					//}
					// 백버튼 레이어 제거옵션이 있으면 ...
					if (typeof(bAddBackbutton) != "undefined") {
						// alert(bAddBackbutton);
						
						// false 면 보이지 않게 처리
						if(!bAddBackbutton) {
							
							$("#divGoBackArea").remove();
						}
					}

					// 수신페이지 삽입
					$(document.body).append(responseData);
					if (!HEX_UTIL.isEmpty(callbackFunc)) {
						callbackFunc();
					}
				} catch(e) {
					return;
                }
			},
			error: function (responseData, textStatus, errorThrown) {
				console.log('[setRemotePageOnBody] failed.');
				console.log(responseData);
				console.log(textStatus);
				console.log(errorThrown);
				console.log('[setRemotePageOnBody] failed - End.');
			}
		});
	}


};




function SetPosCenter(obj) {
	var objWidth = obj.css('width');
	objWidth = objWidth.replace("px","");
	var leftMargin = -1* objWidth/2;
	
	obj.css('position', 'absolute');
	obj.css('left', '50%');
	obj.css('margin-left', leftMargin+"px");
}

function getInternetExplorerVersion() {    
	 var rv = -1; // Return value assumes failure.    
	 if (navigator.appName == 'Microsoft Internet Explorer') {        
		  var ua = navigator.userAgent;        
		  var re = new RegExp("MSIE ([0-9]{1,}[\.0-9]{0,})");        
		  if (re.exec(ua) != null)            
			  rv = parseFloat(RegExp.$1);    
		 }    
	 return rv; 
}



/*
* getCookieInfo() : 쿠키 조회	
*/
function getCookieInfo(key){

	//sys.log("<br><br>========== Cookie Info (JavaScript) ==========");

	var cookies = document.cookie;
	var returnVal = "";

	if(cookies == null || cookies == undefined || cookies == ""){
		//sys.log("<br>cookie is null.");

	}else{
		//sys.log("<br>cookies : " + cookies);

		splitCookies = cookies.split(";");

		//sys.log("<br>cookies.length : " + splitCookies.length);

		for(var i=0; i<splitCookies.length; i++){

			//sys.log("<br>cookies[" + i + "] : " + splitCookies[i]);

			var keyval = splitCookies[i].split("=");
			keyval[0] = keyval[0].replace(/^\s+|\s+$/g,"");

			//sys.log("<br>cookies[" + i + "] : " + keyval[0] + " : " + decodeURIComponent(keyval[1]));

			if(keyval[0] == key){
				returnVal = decodeURIComponent(keyval[1]);
				break;
			}
		}
	}

	return returnVal;
}


/**
 * 자릿수 앞자리 0 채우기
 * leadingZeros([num], [자릿수]) 
 * > leadingZeros(12, 3) -> '012'
 */
function leadingZeros(n, digits) {
 
  var zero = '';
  
  n = n.toString();


  if (n.length < digits) {
    for (i = 0; i < digits - n.length; i++) {
      
      zero += '0';
    }
  }
  
  return zero + n;
}

/**
 * YYYY-MM-DD 형태로 리턴해준다.
 * @param {날짜스트링} dateString  // YYYYMMDD
 */
function getDateFormatString(dateString) {
	var data = dateString +"";
	var yyyy = data.substring(0,4);
	var mm = data.substring(4,6);
	var dd = data.substring(6,8);
	return yyyy + "-" + mm + "-" + dd;
}
// ------------------------------------------------------------------------------------
// 현재 시간정보 호출
// ------------------------------------------------------------------------------------
function getCurTimeStamp(style) {
	var d = new Date();
	var s = '';
	if (typeof(style) == "undefined") {
		// yyyy-mm-dd hh:mm:ss 형식으로 리턴
		s =
			leadingZeros(d.getFullYear(), 4) + '-' +
			leadingZeros(d.getMonth() + 1, 2) + '-' +
			leadingZeros(d.getDate(), 2) + ' ' +

			leadingZeros(d.getHours(), 2) + ':' +
			leadingZeros(d.getMinutes(), 2) + ':' +
			leadingZeros(d.getSeconds(), 2);

	} else if ((typeof(style) != "undefined") && (style == 1)) {
		// yyyymmddhhmmss 형식으로 리턴
		s =
			leadingZeros(d.getFullYear(), 4) + 
			leadingZeros(d.getMonth() + 1, 2) + 
			leadingZeros(d.getDate(), 2) + 

			leadingZeros(d.getHours(), 2) + 
			leadingZeros(d.getMinutes(), 2) + 
			leadingZeros(d.getSeconds(), 2);
	} else if ((typeof(style) != "undefined") && (style == 2)) {
		// yyyymmdd 형식으로 리턴
		s =
			leadingZeros(d.getFullYear(), 4) + 
			leadingZeros(d.getMonth() + 1, 2) + 
			leadingZeros(d.getDate(), 2);
	} else if ((typeof(style) != "undefined") && (style == 3)) {
		// hhmmss 형식으로 리턴
		s =
			leadingZeros(d.getHours(), 2) + 
			leadingZeros(d.getMinutes(), 2) + 
			leadingZeros(d.getSeconds(), 2);
	} else if ((typeof(style) != "undefined") && (style == 4)) {
		// mm/dd hh:mm 형식으로 리턴
		s =
			leadingZeros(d.getMonth() + 1, 2) + '/' +
			leadingZeros(d.getDate(), 2) + ' ' +

			leadingZeros(d.getHours(), 2) + ':' +
			leadingZeros(d.getMinutes(), 2);
	} else if ((typeof(style) != "undefined") && (style == 5)) {
		// mm/dd hh:mm 형식으로 리턴
		s =
		leadingZeros(d.getFullYear(), 4) + '-' +
		leadingZeros(d.getMonth() + 1, 2) + '-' +
		leadingZeros(d.getDate(), 2);
	} else if ((typeof(style) != "undefined") && (style == 6)) {
		// yyyy-mm-dd 형식으로 리턴
		s =
		leadingZeros(d.getFullYear(), 4) + '-' +
			leadingZeros(d.getMonth() + 1, 2) + '-' +
			leadingZeros(d.getDate(), 2);
	} else if ((typeof(style) != "undefined") && (style == 7)) {
		// yyyy년mm월dd일 형식으로 리턴
		s =
		leadingZeros(d.getFullYear(), 4) + '년' +
			leadingZeros(d.getMonth() + 1, 2) + '월' +
			leadingZeros(d.getDate(), 2) + '일';
	}
	return s;
}


// ------------------------------------------------------------------------------------
// 천단위 콤마(,) 찍기
// ------------------------------------------------------------------------------------
function numberWithCommas(x) {
	if ((x != '') && (x > 0) && (x != 'null')) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	} else {
		return 0;
	}
}

// ------------------------------------------------------------------------------------
// 객체 효과주기(fadein/fadeout)
// ------------------------------------------------------------------------------------
function divEffectRepeat(id) {
	var $element = $('#'+id);
	var nCnt = 0;

	$element.bind('cusfadeOut',function() {
			$(this).fadeOut(500,function() {
					$(this).trigger('cusfadeIn');
			});
			$(this).css('filter', 'none');
	});
	$element.bind('cusfadeIn',function() {
			$(this).fadeIn(1000, function() {
					nCnt++;
//					if (nCnt>3) {
//						return;
//					}
					$(this).trigger('cusfadeOut');
			});
			$(this).css('filter', 'none');
	});
	$element.trigger('cusfadeOut');

	
}



/**
 * WebStorage 확인함수
 * @param {WebStorage 객체유형} type 
 */
function storageAvailable(type) {
    try {
        storage = window[type],
            x = '__storage_test__';
        storage.setItem(x, x);
        storage.removeItem(x);
        return true;
    }
    catch(e) {
        return e instanceof DOMException && (
            // Firefox를 제외한 모든 브라우저
            e.code === 22 ||
            // Firefox
            e.code === 1014 ||
            // 코드가 존재하지 않을 수도 있기 때문에 테스트 이름 필드도 있습니다.
            // Firefox를 제외한 모든 브라우저
            e.name === 'QuotaExceededError' ||
            // Firefox
            e.name === 'NS_ERROR_DOM_QUOTA_REACHED') &&
            // 이미 저장된 것이있는 경우에만 QuotaExceededError를 확인하십시오.
            storage.length !== 0;
    }
}


String.prototype.toHHMMSS = function () {
    sec_num = parseInt(this, 10); // don't forget the second param
    var hours   = Math.floor(sec_num / 3600);
    var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
    seconds = sec_num - (hours * 3600) - (minutes * 60);

//    if (hours   < 10) {hours   = "0"+hours;}
//    if (minutes < 10) {minutes = "0"+minutes;}
//    if (seconds < 10) {seconds = "0"+seconds;}
	var hours_txt, minutes_txt, seconds_txt;
	
	if (hours == 0) hours_txt = ''; else hours_txt = hours+'시간';
	if (minutes == 0) minutes_txt = ''; else minutes_txt = minutes+'분';
	if (seconds == 0) seconds_txt = ''; else seconds_txt = seconds+'초';

    var time_txt    = hours_txt+minutes_txt+seconds_txt;
    return time_txt;
}


String.prototype.toMDHHMM = function () {
	var ret = this.replace(/-/g,'').replace(/ /g,'');
	return ret.substring(6,4)+"월"+ret.substring(8,6)+"일 "+ret.substring(8);
}


// 파라미터 값 받아오기
var getParam = function(key){
	var _parammap = {};
	document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
		function decode(s) {
			return decodeURIComponent(s.split("+").join(" "));
		}

		_parammap[decode(arguments[1])] = decode(arguments[2]);
	});

	return _parammap[key];
};



// ------------------------------------------------------------------------------------
// 현재 시간정보 호출
// ------------------------------------------------------------------------------------
Date.prototype.format = function (formatter) {
	var d = this;
	var yyyy = leadingZeros(d.getFullYear(), 4);
	var mm = leadingZeros(d.getMonth() + 1, 2);
	var dd = leadingZeros(d.getDate(), 2);
	var hh = leadingZeros(d.getHours(), 2);
	var mi = leadingZeros(d.getMinutes(), 2);
	ss = leadingZeros(d.getSeconds(), 2);

	formatter = formatter.replace('yyyy', yyyy);
	formatter = formatter.replace('mm', mm);
	formatter = formatter.replace('dd', dd);
	formatter = formatter.replace('hh', hh);
	formatter = formatter.replace('mi', mi);
	formatter = formatter.replace('ss', ss);
	return formatter;
}




function fnMove(divID){
	var offset = $("#" + divID).offset();
	$('html, body').animate({scrollTop : offset.top}, 400);
}

// 기본 - 페이드아웃처리
function activeButtonObj (obj) {
    // 버튼 효과 시작
    obj.fadeOut(800).delay(100).fadeIn(500).delay(100);
    var v_timer = setInterval( function () {
        obj.fadeOut(800).delay(100).fadeIn(500).delay(100);
    }, 1800);
    return v_timer;
}

// 배경색의 알파값을 조절...
function activeButton (obj) {
    
    var start = 1, maxAlpha = 1, minAlpha=0.2, diffAlpha = 0.1;
    var bDown = true;
    var v_timer = setInterval( function () {

        if (bDown) {
            start = start - diffAlpha;
            if (start <= minAlpha) bDown = false;
        } else {
            start = start + diffAlpha;
            if (start >= maxAlpha) bDown = true;
        }
        //console.log("activeButton, start = " + start);
        obj.css('background-color', 'rgba(32, 135, 252, ' + start + ')');
    }, 80);
    return v_timer;
}



// 배경색의 알파값을 조절...
function activeButton_eb_pop (obj) {
    
    var start = 0.9, maxAlpha = 0.9, minAlpha=0.05, diffAlpha = 0.03;
    var bDown = true;
    var v_timer = setInterval( function () {

        if (bDown) {
            start = start - diffAlpha;
            if (start <= minAlpha) bDown = false;
        } else {
            start = start + diffAlpha;
            if (start >= maxAlpha) bDown = true;
        }
        //console.log("activeButton, start = " + start);
        obj.css('background-color', 'rgba(130, 184, 255, ' + start + ')');
    }, 40);
    return v_timer;
}


// 배경색의 알파값을 조절...
// function activeButtonObj (obj) {    
//     var start = 1, maxAlpha = 1, minAlpha=0.2, diffAlpha = 0.1;
//     var bDown = true;
//     var v_timer = setInterval( function () {
//         if (bDown) {
//             start = start - diffAlpha;
//             if (start <= minAlpha) bDown = false;
//         } else {
//             start = start + diffAlpha;
//             if (start >= maxAlpha) bDown = true;
//         }
//         //console.log("activeButtonObj, start = " + start.toFixed(1));
//         obj.attr('style','background-color:rgba(32, 135, 252, ' + start.toFixed(1) + '); color:#ffffff;');
//     }, 50);
//     return v_timer;
// }

function removeElementByClassName(className) {
	// k-calendar-container

	//var bFind = $(document.body).hasClass(className);
	var bFind = $(document.body).find(className);
	HEX_NATIVE.ToastShortMsg(bFind);
}


jQuery.fn.center = function () {
    this.css("position","absolute");
    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + 
                                                $(window).scrollTop()) + "px");
    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + 
                                                $(window).scrollLeft()) + "px");
    return this;
}

/**
 * 지정 태그 하위의, 지정ID의 값을 변경해준다.
 */
function setElementData(targetTagString, targetID, newValue) {
	if ((targetTagString == 'input') || (targetTagString == 'textarea')) {
		$.each($(targetTagString), function(a, element) {
			if (element.id == targetID) {
				element.value = newValue;
			}			
		});
	} 
}


// 슬라이더 동적 리프레쉬 함수
function refreshSlider () {
  // Categories Slider
  $(".categories-slider").slick({
    slidesToScroll: 3,
    slidesToShow: 8,
    arrows: true,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: "40px",
          slidesToShow: 3,
        },
      },
      {
        breakpoint: 480,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: "40px",
          slidesToShow: 3,
        },
      },
    ],
  });

  // Categories Slider
  $(".promo-slider").slick({
    slidesToShow: 3,
    arrows: true,
    dots: true,
    infinite: true,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: "40px",
          slidesToShow: 1,
        },
      },
      {
        breakpoint: 480,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: "40px",
          slidesToShow: 1,
        },
      },
    ],
  });

  // Osahan Slider
  $(".osahan-slider").slick({
    centerMode: false,
    slidesToShow: 1,
    arrows: false,
    dots: true,
  });

  // Recommend Slider
  $(".recommend-slider2").slick({
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    adaptiveHeight: true,
    centerMode: true,
    arrows: false,
    dots: true,
    autoplay: true,
  });

  // Recommend Slider
  $(".recommend-slider").slick({
    infinite: true,
    speed: 300,
    slidesToShow: 1,
    adaptiveHeight: true,
    arrows: false,
    dots: true,
    autoplay: true,
  });

  // Trending Slider
  $(".trending-slider").slick({
    centerPadding: "30px",
    slidesToShow: 4,
    arrows: true,
    autoplay: true,
    responsive: [
      {
        breakpoint: 768,
        settings: {
          arrows: true,
          centerMode: true,
          centerPadding: "40px",
          slidesToShow: 1,
        },
      },
      {
        breakpoint: 480,
        settings: {
          arrows: true,
          centerMode: true,
          centerPadding: "40px",
          slidesToShow: 1,
        },
      },
    ],
  });
}


function getTextLength(str) {
  var len = 0;
  for (var i = 0; i < str.length; i++) {
    if (escape(str.charAt(i)).length == 6) {
      len++;
    }

    len++;
  }

  return len;
}

function cutStr(str, start, size) {
  var i = 0;
  var lim = 0;
  var pos = 0;
  var beg = 0;
  var minus = 0;
  var len = getTextLength(str);

  for (var i = 0; pos < start; i++) {
    pos += str.charCodeAt(i) > 128 ? 2 : 1;
  }

  beg = i;

  for (i = beg; i < len; i++) {
    lim += str.charCodeAt(i) > 128 ? 2 : 1;

    if (lim > size) {
      break;
    }
  }

  return str.substring(beg, i);
}

//page 이동
function goPage(url, param){
	window.location.href = url + "?" + UNIQUE_STRING;
}