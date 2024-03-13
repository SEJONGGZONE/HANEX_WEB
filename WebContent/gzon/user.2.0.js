/**
 * 사용자 정보관리 (로그인/아웃 등 사용자 환경정보 관리)
 */
var HEX_USER = {};

HEX_USER.info = {
	userNm : "",
    phoneNo : "",	//전화번호
    vhclNo : "",	//차량번호
    lat : "",		//lat
    lon : ""		//lon
};
 
HEX_USER.init = function(){
	HEX_USER.info.userNm = "";
	HEX_USER.info.phoneNo = "";
	HEX_USER.info.vhclNo = "";
	HEX_USER.info.lat = "";
	HEX_USER.info.lon = "";
};
 
/**
 * 이름 세팅할때 사용
 * @param {이름} userNm 
 */
HEX_USER.setUserNm = function(userNm) {
	HEX_USER.info.userNm = userNm;
};

/**
 * 전화번호를 세팅할때 사용
 * @param {전화번호} phoneNo 
 */
HEX_USER.setPhoneNo = function(phoneNo) {
	HEX_USER.info.phoneNo = phoneNo;
};

/**
 * 차량번호를 세팅할때 사용
 * @param {차량번호} vhclNo 
 */
HEX_USER.setVhclNo = function(vhclNo) {
	HEX_USER.info.vhclNo = vhclNo;
};

/**
 * 위도를 세팅할때 사용
 * @param {위도} lat 
 */
HEX_USER.setLat = function(lat) {
	HEX_USER.info.lat = lat;
};

/**
 * 경도를 세팅할때 사용
 * @param {경도} lon 
 */
HEX_USER.setLon = function(lon) {
	HEX_USER.info.lon = lon;
};

HEX_USER.init(); 
 