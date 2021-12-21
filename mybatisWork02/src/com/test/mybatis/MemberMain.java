/*==========================
    MemberMain.java
    - 컨트롤러
===========================*/

package com.test.mybatis;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//@ 컨트롤러 어노테이션! 이제 implement Controller 이거 안해도됨
//@ 컨트롤러는 얄미운 놈. 자기는 하는 거 없으면서 남한테 엄청 시키기만 함 ㅎ
@Controller
public class MemberMain
{
	/// mybatis 객체 의존성 (자동) 주입~!!!
	@Autowired
	private SqlSession sqlSession;
	
	//@ 얘가 일을 하게 해줌! 끄적끄적 해준 것
	//@ 메소드 이름도, 매개변수도, 이제 다 우리 마음!!!
	//@ String memberList(ModelMap model) : ModelMap 유형의 model 넘겨줘~!
	@RequestMapping(value = "/memberlist.action", method = RequestMethod.GET)
	public String memberList(ModelMap model)
	{	
		//@ 편의상 그냥 String으로 지정~! 이거 뷰페이지 일케하라고넘긴거구나~ 하고 처리해줌~!
		
		//@ 미화 "진하가 곰탕 잘 끓여요!" 하기위해 모델과 뷰 붙어 있는 것!
		//IMemberDAO dao = (IMemberDAO)new MemberDAO();
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		//@ mapper 통해 IMemberDAO.class 형식으로 IMemberDAO 받아내라.
		//@ 이거 수행할 때 빈들 다 돌아감(servlet에서!)
		
		model.addAttribute("count", dao.count());
		model.addAttribute("list", dao.list());
		//@ 객체에 대한 주입
		//@ 해당 메소드(count.list) 에 오버라이딩
		
		return "WEB-INF/view/MemberList.jsp";
	}
	
	@RequestMapping(value = "/memberinsert.action", method = RequestMethod.POST)
	public String memberInsert(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.add(m);
		
		return "redirect:memberlist.action";
	}
	
	@RequestMapping(value = "/memberdelete.action", method = RequestMethod.GET)
	public String memberDelete(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.remove(m);
		
		return "redirect:memberlist.action";
	}
	
	@RequestMapping(value = "/memberupdate.action", method = RequestMethod.POST)
	public String memberUpdate(MemberDTO m)
	{
		IMemberDAO dao = sqlSession.getMapper(IMemberDAO.class);
		
		dao.modify(m);
		
		return "redirect:memberlist.action";
		//@ : 항상 붙여서 작성해주기!
		
	}
}









