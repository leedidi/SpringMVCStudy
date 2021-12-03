/*======================================================
   #17. EmployeeListController.java
   - 사용자 정의 컨트롤러
   - 리스트 페이지 요청에 대한 액션 처리
   - DAO 객체에 대한 의존성 주입(DI)을 위한 준비
     → 인터페이스 형태의 자료형을 속성으로 구성
     → setter 메소드 준비
=====================================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class EmployeeListController implements Controller
{
	// 주요 속성 구성
	// → 인터페이스 형태의 자료형을 속성으로 구성
	private IEmployeeDAO dao;
	
	// setter 구성
	public void setDao(IEmployeeDAO dao)
	{
		this.dao = dao;
	}


	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Employee> employeeList = new ArrayList<Employee>();
		
		try
		{
			employeeList = dao.list();
			
			mav.addObject("employeeList", employeeList);
			
			mav.setViewName("/WEB-INF/view/EmployeeList.jsp");
			
		}catch (Exception e) 
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}
	
}
