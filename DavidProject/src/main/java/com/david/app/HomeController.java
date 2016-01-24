package com.david.app;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.david.dao.createItemsInfoDao;
import com.david.dao.createUserInfoDao;
import com.david.dao.retrieveUserInfoDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	private SqlSession sqlSession;
	
	
	
	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String main(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);	
		String formattedDate = dateFormat.format(date);		
		model.addAttribute("serverTime", formattedDate );
		
		return "main";
	}
	
	
	
	// 로그인 처리
    @RequestMapping(value="loginProcess.do", method = RequestMethod.POST)
    public ModelAndView loginProcess1(HttpSession session, HttpServletRequest request) {
       
    	ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:main.do");
 
        //logger.info("param" + ":" + request.getParameter("userid"));
        
        String userid = request.getParameter("userid");       
		
		retrieveUserInfoDao retrieveUserInfoDao = sqlSession.getMapper(retrieveUserInfoDao.class);  		
		
		String rslt = retrieveUserInfoDao.retrieveUserInfo(userid);
			     
		//logger.info("rslt" + ":" + rslt);
 
        if (rslt != null) {
            session.setAttribute("userLoginInfo", rslt);
        }
        
        return mav;
    }
    
    
    
    // 로그아웃 처리
    @RequestMapping(value="logout.do")
    public String logout(HttpSession session, HttpServletRequest request) {
       
    	session.setAttribute("userLoginInfo", null);
        return "redirect:login.do";
    }

	
	
	
	@RequestMapping(value = "/testmain.do", method = RequestMethod.GET)
	public String testmain(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);	
		String formattedDate = dateFormat.format(date);		
		model.addAttribute("serverTime", formattedDate );
		
		return "testmain";
	}
	
	
	@RequestMapping(value="createAccountInfoPage.do", method = RequestMethod.GET)
	public String createAccountInfoPage(@RequestParam Map<String, Object> paramMap) {
		
		createUserInfoDao createUserInfoDao = sqlSession.getMapper(createUserInfoDao.class);  
		
		
		System.out.println("사용자계정정보 파리미터확인 \n" + paramMap);
		
		String userId = (String)paramMap.get("userId");
		
		Integer rslt = createUserInfoDao.createUserInfo(userId);
		
		System.out.println("사용자계정정보 등록 결과 \n" + rslt); 
		
		return "createAccountInfo";
	}

	
	
	@RequestMapping(value="retrieveMyItemInfo.do", method = RequestMethod.GET)
	public String retrieveMyItemInfo() {
				
		logger.info("retrieveMyItemInfo");		
		return "retrieveMyItemInfo";
	}
	
	
//	public @ResponseBody HashMap<String, Object> retrieveItemInfo(@RequestParam HashMap<String, Object> param) {
	
	@ResponseBody 
	@RequestMapping(value="retrieveItemInfo.do", method = RequestMethod.GET)
	public ArrayList retrieveItemInfo(@RequestParam HashMap<String, Object> param) {	
		
		logger.info("retrieveItemInfo");
		LinkedHashMap<String, Object> itemMap = new LinkedHashMap<String, Object>();
		/*itemMap.put("itemNo", "10001");
		itemMap.put("itemName", "DavidCar");
		itemMap.put("price", "36,000");
		itemMap.put("scndprice", "28,000");
		itemMap.put("rate", "70%");*/
				
		//String userid = "david";
		String id = param.get("userid").toString();
		
		retrieveUserInfoDao retrieveUserInfoDao = sqlSession.getMapper(retrieveUserInfoDao.class);  		
		
		String userid = retrieveUserInfoDao.retrieveUserInfo(id);
				
		itemMap.put("userid", userid);
		
		ArrayList itemArrayList = new ArrayList();
		itemArrayList.add(itemMap);
			     
		logger.info("retrieveItemInfo" + ":" + itemArrayList);

		JSONArray jsonArray = JSONArray.fromObject(itemArrayList);
		System.out.println("itemArrayList - : " + jsonArray);
		
/*		ModelAndView mav = new ModelAndView(); 
		
		mav.addAllObjects(itemList);
        mav.setViewName("jsonView");*/
		
	    return itemArrayList;
	}
	
	@RequestMapping(value="test.do", method = RequestMethod.GET)
	public String test() {			
		logger.info("test");		
		return "test";
	}
	
	@RequestMapping(value="location.do", method = RequestMethod.GET)
	public String location() {				
		logger.info("location");		
		return "location";
	}
	
	@RequestMapping(value="mobile.do", method = RequestMethod.GET)
	public String mobile() {				
		logger.info("location");		
		return "mobile";
	}
	
	@RequestMapping(value="retrievAddItemsForm.do", method = RequestMethod.GET)
	public String retrievAddItemsForm() {				
		logger.info("retrievAddItemsForm");		
		return "createItems";
	}
	
	@RequestMapping(value="createItemsInfo.do", method=RequestMethod.POST/*, headers="content-type=multipart/*"*/)
	private String upload(@RequestParam("file") MultipartFile imageFile/*, @RequestParam Map<String, Object> paramMap*/) {
		
		logger.info("createItemsInfo");	
		return "createItems";
	}
	
	@RequestMapping(value="login.do", method = RequestMethod.GET)
	public String login() {				
		logger.info("login");		
		return "login";
	}
	
	/*@ResponseBody 
	@RequestMapping(value="loginProcess.do", method = RequestMethod.GET)
	public ArrayList loginProcess(HttpServletRequest request) {				
		
		LinkedHashMap userInfo = new LinkedHashMap();
		userInfo.put("id", request.getParameter("userid"));
		userInfo.put("pw", request.getParameter("pwd"));
		String id = (String)request.getParameter("userid");
	
		retrieveUserInfoDao retrieveUserInfoDao = sqlSession.getMapper(retrieveUserInfoDao.class);  		
		
		HashMap rsltMap = retrieveUserInfoDao.retrieveUserInfo(id);
		
		logger.info("loginProcess dataset : " + rsltMap);	
		
		ArrayList itemArrayList = new ArrayList();
		//itemArrayList.add(rsltMap);
			     
		logger.info("retrieveItemInfo" + ":" + itemArrayList);
		
	    return itemArrayList;
	}*/
	
	
	
	
	
	

    
    @ResponseBody 
	@RequestMapping(value="loginProcess.do1", method = RequestMethod.GET)
	public ArrayList loginProcess(@RequestParam HashMap<String, Object> param) {	
		
		logger.info("retrieveItemInfo");
		LinkedHashMap<String, Object> itemMap = new LinkedHashMap<String, Object>();
		
		String id = param.get("userid").toString();
		
		retrieveUserInfoDao retrieveUserInfoDao = sqlSession.getMapper(retrieveUserInfoDao.class);  		
		
		String userid = retrieveUserInfoDao.retrieveUserInfo(id);
		
		sqlSession.close();
				
		itemMap.put("userid", userid);
		
		ArrayList userInfoArrayList = new ArrayList();
		userInfoArrayList.add(itemMap);
			     
		logger.info("userInfoArrayList" + ":" + userInfoArrayList);
		
	    return userInfoArrayList;
	}
	
}

















