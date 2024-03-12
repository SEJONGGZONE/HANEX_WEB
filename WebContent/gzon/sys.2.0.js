/**
 * 로그통합관리, 추후 로그레벨 부여 또는 별도 서버전송등의 활용방안으로 확장 관리한다.
 */
 var HEX_SYS = {};
 HEX_SYS.logStr = "";
 HEX_SYS.level = "";
 
 
 HEX_SYS.initLog = function(){
     HEX_SYS.logStr = "";
     //HEX_SYS.level = "PRODUCT";
     HEX_SYS.level = "DEBUG";
 };
 
 
 HEX_SYS.log = function(strLog){
     try {
        if (HEX_SYS.level == "PRODUCT") return; // 운영모드일때는 남기지않는다..
        if (typeof strLog == "object") strLog = JSON.stringify(strLog);
        if (window.console) {
             var dt = new Date();
             var str = "[" + dt.getHours() +":"+dt.getMinutes() +":"+dt.getSeconds() +"."+dt.getMilliseconds() + "]";
             str += " " + strLog;
             console.log(str);
        }
     } catch(e) {
         ;
     }
 };
 HEX_SYS.initLog();
 