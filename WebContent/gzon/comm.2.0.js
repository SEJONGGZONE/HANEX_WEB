/**
 * 통신모듈
 */
var HEX_COMM = {};

HEX_COMM.HOST_URL = "http://sjwas.gzonesoft.co.kr:32223/api/";
HEX_COMM.API_KEY = "1Bb6wI6DnVL8S8LQAbvAO+pSnKXCf7HwQ7GEn+FnrJk=";


// 최종 호출 옵션 저장.
HEX_COMM.lastOptions = "";
/**
 * Ajax 통신처리
 * @param {String} api
 * @param {Json} data 
 * @param {function} fn_callBack 
 */
HEX_COMM.getAjax = function (data, fn_callBack) {

    //var reqURL = HEX_COMM.HOST_URL + api + '?data=' + encodeURIComponent(JSON.stringify(data));
    //HEX_SYS.log("reqURL=" + reqURL);    
    $.ajax({
        type: 'POST',
        url: "/ajax",
        crossDomain: true,
        data: JSON.stringify(data),
        dataType: 'json',
        contentType: "application/json; charset=utf-8",
		accept: "application/json",
        beforeSend: function (xhr) {
            //xhr.setRequestHeader("api_key", HEX_COMM.API_KEY);
        },
        success: function (responseData, textStatus, jqXHR) {
            var json_str = JSON.stringify(responseData);
            HEX_SYS.log("수신데이타=" + json_str);
            fn_callBack(responseData);
        },
        error: function (responseData, textStatus, errorThrown) {
            HEX_SYS.log('[HEX_COMM.getAjax] POST failed.', responseData, textStatus, errorThrown);
        }
    });

};

/**
 * 서버 서비스 호출 에러처리
 *  : 에러코드에 대한 서버쪽 추가 정의 내용은, /common/error 서비스를 호출해서 참조할수 있다.
 * 
 * 2018-07-04 기준
[
  {
    "Cause": "정의되지 않은 예외",
    "Error": "GLOBAL",
    "Code": 2
  },
  {
    "Cause": "유효하지않은토큰",
    "Error": "INVALID_TOKEN",
    "Code": 9
  },
  {
    "Cause": "권한없음",
    "Error": "AUTHENTICATION",
    "Code": 10
  },
  {
    "Cause": "토큰만료",
    "Error": "JWT_TOKEN_EXPIRED",
    "Code": 11
  }
]

 * @param {수신데이터} responseData 
 */
HEX_COMM.errorThrown = function (responseData, options) {
    HEX_SYS.log("[HEX_COMM.errorThrown] HEX_COMM.errorThrown 진입");

    var errLoc = "ERR_START";
    var errCallbackID = HEX_COMM.lastOptions.serviceURL + "," + HEX_COMM.lastOptions.callbackID;
    try {
        errLoc = "ERR_JSON_PARSE";
        // var errorObj = responseData.responseJSON;
        if (HEX_UTIL.isEmpty(responseData.responseText)) {
            //HEX_NATIVE.ToastShortMsg("수신된 데이타가 없습니다.");
        } else {
            HEX_SYS.log("[HEX_COMM.errorThrown] " + responseData.responseText);
            var errorObj = JSON.parse(responseData.responseText);
            HEX_SYS.log("[HEX_COMM.errorThrown] " + JSON.stringify(errorObj));

            errLoc = "ERR_JSON_INFO";
            var status = errorObj.status;
            var message = errorObj.message;
            var error = errorObj.error;
            var errorCode = errorObj.errorCode;
            var timestamp = errorObj.timestamp;
            var path = errorObj.path;

            errLoc = "ERR_STATUS_CHECK";
            
            if (status == 401) {
                errLoc = "ERR_STATUS_" + status;
                // 세션만료..
                if (errorCode == 2) {   // 정의되지 않은 예외
                    HEX_SYS.log("[" + status + "-" + errorCode + "][" + errCallbackID + "] " + message);
                } else if (errorCode == 9) {   // 유효하지않은토큰
                    HEX_SYS.log("[" + status + "-" + errorCode + "][" + errCallbackID + "] " + message);
                } else if (errorCode == 10) {   // 권한없음
                    HEX_SYS.log("[" + status + "-" + errorCode + "][" + errCallbackID + "] " + message);
                } else if (errorCode == 11) {   // 토큰만료

                    // 토큰 리프레쉬 서비스 호출 - 이전최종요청도 자동호출됨.
                    HEX_COMM.tokenRefresh();
                }
                HEX_SYS.log("[" + status + "] " + message);
                
                HEX_ALERT.open({
                    title : "서울우유2CH",
                    message : "[" + status + "] " + message,
                    btnTitle1 : "확인",
                    btnTitle2 : null,
                    callBack : null
                });

            } else if (status == 404) {
                errLoc = "ERR_STATUS_" + status;
                HEX_SYS.log("[" + status + "] " + message);
            } else if (status == 400) {
                errLoc = "ERR_STATUS_" + status;
                
                HEX_ALERT.open({
                    title : "서울우유2CH",
                    message : "[" + status + "] " + message,
                    btnTitle1 : "확인",
                    btnTitle2 : null,
                    callBack : null
                });
            } else if (status == 500) {
                errLoc = "ERR_STATUS_" + status;
                

            } else {
                errLoc = "ERR_STATUS_ELSE";
                HEX_SYS.log("[" + errCallbackID + "]정의되지 않은 오류.");
            }
        }

        // 본요청 콜백으로 되돌려준다.
        //options.fnCallBack(options.caID, responseData);

    } catch (e) {
        HEX_SYS.log('[HEX_COMM.errorThrown, ' + errCallbackID + '] errLoc=' + errLoc + ',' + e);
        HEX_SYS.log(responseData);
    }
};


/**
 * 토큰 리프레쉬 서비스 호출, 호출후 최종요청 다시 호출한다.
 */
HEX_COMM.tokenRefresh = function () {
    HEX_SYS.log("HEX_COMM.tokenRefresh 진입");
    // 이전요청 저장
    var curOptions = HEX_COMM.lastOptions;
    // 서비스
    HEX_COMM.getAjaxService({
        method: "POST",
        callbackID: "TOKEN_REFRESH",
        serviceURL: HEX_USER.SVC_REFRESH_TOKEN_URL,
        data: { "authorization": HEX_USER.getUserInfo("REFRESH_TOKEN") },
        fnCallBack: function (callBackID, data) {
            // 데이타 저장
            var returnObj = JSON.parse(JSON.stringify(data));

            // 토큰다시저장
            HEX_USER.setUserInfo("TOKEN", returnObj.token);

            // 이전 요청 재처리
            HEX_COMM.getAjaxService(curOptions);
        }
    });
};