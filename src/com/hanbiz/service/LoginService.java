package com.hanbiz.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hanbiz.dao.CommonDao;
import com.hanbiz.domain.UserInfoDto;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;


@Service("loginService")
public class LoginService {
	@Resource(name="commonDao") private CommonDao commonDao;
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public Map<String, Object> login(Map<String, Object> map, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		
		String strMsgCd = ""; 
		String strMsgNm = "";
		
		/*
		List<Map<String, Object>> resultMap = commonDao.selectList("user.login", map);
		
		if(resultMap.size() > 0) {
			Map<String, Object> userInfoMap = resultMap.get(0);
			
	        ObjectMapper mapper = new ObjectMapper();
	        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false); //매핑되지 않는 항목은 Skip
			
	        //Map to Object 바인딩
	        UserInfoDto userInfo = mapper.convertValue(userInfoMap, UserInfoDto.class);
	        
			session.setAttribute("SESSION_ID", userInfo); //로그인 세션 저장
			
			strMsgCd = "00";
			strMsgNm = "SUCCESS";
		}else {
			strMsgCd = "01";
			strMsgNm = "FAIL";
		}
		*/
		
		strMsgCd = "00";
		strMsgNm = "SUCCESS";
		
		Map<String,Object> returnMap = new HashMap<String, Object>();
		returnMap.put("ResultCode", strMsgCd);
		returnMap.put("ResultMsg", strMsgNm);
		
		return returnMap;
	}
}
