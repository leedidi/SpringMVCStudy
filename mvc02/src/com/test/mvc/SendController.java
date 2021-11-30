/*=========================
   SendController.java
   - 사용자 정의 컨트롤러
==========================*/

package com.test.mvc;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

//@ implements 로 인해 스프링컨테이너가 얘를 컨트롤러로 인식!!
//@ 웹컨테이너 뭐 써보셨어요? -> 톰캣 이라고 대답하면 됨
// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
//    사용자 정의 컨트롤러 클래스를 구성한다.

//@ send.do → web.xml → dispatcherServlet → send.jsp → receive.do → web.xml → dispatcherServlet → receive.jsp
public class SendController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/WEB-INF/view/Send.jsp");
		
		return mav;
	}
	
}


















