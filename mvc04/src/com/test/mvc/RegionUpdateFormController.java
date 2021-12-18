/*===========================
   SampleController.java
   - 사용자 정의 컨트롤러
============================*/

package com.test.mvc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

public class RegionUpdateFormController implements Controller
{
	// check~!!!
	// RegionInsertFormController 구성과는 다른 방식으로 처리~!!!
	
	private IRegionDAO regionDAO;

	public void setRegionDAO(IRegionDAO regionDAO)
	{
		this.regionDAO = regionDAO;
	}

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		ModelAndView mav = new ModelAndView();
		
		// 세션 처리 과정 추가 -----------------------------------------------------------------------
		HttpSession session = request.getSession();
		
		if (session.getAttribute("name")==null)			//-- 로그인이 되어 있지 않은 상황
		{
			mav.setViewName("redirect:login.action");
			return mav;
		}
		else if (session.getAttribute("admin")==null)	//-- 로그인은 되었지만 관리자가 아닌 상황
		{
			mav.setViewName("redirect:logout.action");
			return mav;
			//-- 로그인은 되어 있지만 이 때 클라이언트는
			//   일반 직원으로 로그인 되어 있는 상황이므로
			//   로그아웃 액션 처리하여 다시 관리자로 로그인할 수 있도록 처리
		}
		// ----------------------------------------------------------------------- 세션 처리 과정 추가
				
		
		
		ArrayList<Region> regionList = new ArrayList<Region>();
		
		try
		{
			// 데이터 수신 (RegionList.jsp 로 부터... regionId 수신)
			String regionId = request.getParameter("regionId");
			
			Region region = new Region();
			
			region = regionDAO.searchId(regionId);
			
			regionList = regionDAO.list();
			
			mav.addObject("region", region);
			
			mav.setViewName("/WEB-INF/view/RegionUpdateForm.jsp");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		return mav;
	}

}
