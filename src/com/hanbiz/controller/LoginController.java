package com.hanbiz.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hanbiz.service.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired private LoginService loginService;
	
    /**
     * 로그인 컨트롤러(json을 body로 받는 방법)
     * @param request
     * @param data
     * @return 로그인 결과
     * @throws Exception
     * 
     */
	//@CrossOrigin("*")    
	@RequestMapping(value = {"/login-action"}, method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> login(HttpServletRequest request, @RequestBody Map<String, Object> data) throws Exception{
    	
		logger.info(String.format("==> 요청 수신 : %s", data.toString()));
		Map<String, Object> resultMap = loginService.login(data, request);
		logger.info(String.format("==> 처리 결과: %s", resultMap.toString()));
        return resultMap;
    }
}
