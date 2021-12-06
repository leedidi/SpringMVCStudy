/*=========================
   #5. IEmployeeDAO.java
   - 인터페이스
==========================*/

package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

public interface IEmployeeDAO
{
	public ArrayList<Employee> list() throws SQLException;
	
	public ArrayList<Region> regionList() throws SQLException;
	public ArrayList<Department> departmentList() throws SQLException;
	public ArrayList<Position> positionList() throws SQLException;
	
	public int getMinBasicPay(String positionId) throws SQLException;
	public int employeeAdd(Employee employee) throws SQLException;
	public int remove(String employeeId) throws SQLException;
	public int modify(Employee employee) throws SQLException;
	//@ modify: 찾는 거 찾아서 수정하는건 id 아니고 전체 받아와야함!
	public Employee searchId(String employeeId) throws SQLException;
	
	public String login(String id, String pw) throws SQLException;
	public String logAdmin(String id, String pw) throws SQLException;
}
