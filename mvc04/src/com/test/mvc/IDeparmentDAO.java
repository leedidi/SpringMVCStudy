/*==========================
   #6. IDeparmentDAO.java
   - 인터페이스
==========================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IDeparmentDAO
{
	public ArrayList<Department> list() throws SQLException;
	
	public int add(Department department) throws SQLException;
	public int remove(String department) throws SQLException;
	public int modify(Department department) throws SQLException;
}
