/*=======================================================
	EmployeeUpdateFormController.java
	- 사용자 정의 컨트롤러 클래스
	- 직원 데이터 수정 폼 요청에 대한 액션 처리
	- DAO 객체의 대한 의존성 주입(DI)을 위한 준비 필요
	  → 인터페이스 형태의 자료형을 속성으로 구성
	  → setter 메소드 구성	
======================================================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;


public class EmployeeUpdateFormController implements Controller
{
	// check~!!!
	// EmployeeInsertFormController 구성과는 다른 방식으로 처리~!!!
	
	private IEmployeeDAO employeeDAO;
	private IRegionDAO regionDAO;
	private IDepartmentDAO departmentDAO;
	private IPositionDAO positionDAO;
	
	public void setEmployeeDAO(IEmployeeDAO employeeDAO)
	{
		this.employeeDAO = employeeDAO;
	}
	public void setRegionDAO(IRegionDAO regionDAO)
	{
		this.regionDAO = regionDAO;
	}
	public void setDepartmentDAO(IDepartmentDAO departmentDAO)
	{
		this.departmentDAO = departmentDAO;
	}
	public void setPositionDAO(IPositionDAO positionDAO)
	{
		this.positionDAO = positionDAO;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		ArrayList<Region> regionList = new ArrayList<Region>();
		ArrayList<Department> departmentList = new ArrayList<Department>();
		ArrayList<Position> positionList = new ArrayList<Position>();
		
		try
		{
			// 데이터 수신 (EmployeeList.jsp 로 부터... employeeId 수신)
			String employeeId = request.getParameter("employeeId");
			
			Employee employee = new Employee();
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

}
