package com.hanbiz.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hanbiz.util.DateUtil;

@Controller
public class MainController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	@RequestMapping(value = {"/", "index"})
	private String index(HttpServletRequest request) {
		return "/index";
	}
	
	/**
	 * jsp view를 사용하는 경우
	 * @param request
	 * @return
	 */
	@RequestMapping(value = {"/main"})
	private ModelAndView main(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("/main");
		view.addObject("timestamp", DateUtil.getCurrentDate("yyyy/MM/dd/ HH:mm:ss:SSS"));
		return view;
	}	
	
	/**
	 * jsp view를 사용하는 경우
	 * @param request
	 * @return
	 */
	@RequestMapping(value = {"/vList"})
	private ModelAndView vList(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("/vList");
		view.addObject("timestamp", DateUtil.getCurrentDate("yyyy/MM/dd/ HH:mm:ss:SSS"));
		return view;
	}	
		
	/**
	 * jsp view를 사용하는 경우
	 * @param request
	 * @return
	 */
	@RequestMapping(value = {"/vDetail"})
	private ModelAndView vDetail(HttpServletRequest request) {
		ModelAndView view = new ModelAndView("/vDetail");
		view.addObject("timestamp", DateUtil.getCurrentDate("yyyy/MM/dd/ HH:mm:ss:SSS"));
		return view;
	}
	
    /**
     * 컨트롤러(json을 body로 받는 방법)
     * @param request
     * @param data
     * @return 로그인 결과
     * @throws Exception
     * 
     */
	@CrossOrigin("*")    
	@RequestMapping(value = {"/ajax"}, method = RequestMethod.POST)
    public @ResponseBody Map<String, Object> ajax(HttpServletRequest request, @RequestBody Map<String, Object> data) throws Exception{
    	//logger.info(String.format("==> 요청 수신 : %s", data.toString()));
		//Map<String, Object> resultMap = loginService.login(data, request);
    	
    	Map<String, Object> resultMap = new HashMap();
    	resultMap.put("resultCode", "00");
    	resultMap.put("resultMsg", "SUCCESS");
    	resultMap.put("resultData", "null");
    	
		logger.info(String.format("==> 처리 결과: %s", resultMap.toString()));
        return resultMap;		
		
		/*
		String api_key = "1Bb6wI6DnVL8S8LQAbvAO+pSnKXCf7HwQ7GEn+FnrJk=";
        String hostUrl = "http://sjwas.gzonesoft.co.kr:32223/api/"+(String)data.get("API");

        try {
        	
            HttpURLConnection con = null;

            URL url = new URL(hostUrl);
            con = (HttpURLConnection) url.openConnection();
        	
            JSONObject param = new JSONObject();
            param.put("partOid", "664451010");
        	
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application-json");
            con.setRequestProperty("api_key", api_key);
        	
        	//POST방식으로 JSON 보내기
            con.setDoOutput(true);
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
            bw.write(param.toString());
            bw.flush();
            bw.close();

            //서버에서 보낸 응답 데이터 수신
            BufferedReader reader = new BufferedReader(new InputStreamReader(con.getInputStream()));
            String returnMsg = reader.readLine();

            JSONObject jObj = new JSONObject(returnMsg.toString());

            System.out.println("jObj = " + jObj);


        } catch (Exception e) {
            e.printStackTrace();
        }

        return resultMap;
        */
				
    }	
}