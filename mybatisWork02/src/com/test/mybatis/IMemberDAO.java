/*======================
  IMemberDAO.java
  - 인터페이스
=======================*/

package com.test.mybatis;

import java.util.ArrayList;

public interface IMemberDAO
{
	//@ throws IOException 이 여기 존재X!
	public int add(MemberDTO m);
	// ArayList가 아닌 MemerDTO들을 넘겨줌...
	
	public int count();
	public ArrayList<MemberDTO> list();
	public int remove(MemberDTO m);
	public int modify(MemberDTO m);
	
}
