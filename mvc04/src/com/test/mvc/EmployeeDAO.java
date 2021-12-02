/*===================================================
   #9. EmployeeDAO.java
   - 데이터베이스 액션 처리 클래스
   - 직원 정보 입력 / 출력 / 수정 / 삭제 액션
   - Connection 객체에 대한 의존성 주입을 위한 준비
     → 인터페이스 형태의 속성 구성(DataSource)
     → setter 메소드 정의
====================================================*/

package com.test.mvc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

public class EmployeeDAO implements IEmployeeDAO
{
	// 주요 속성 구성 → 인터페이스 형태
	private DataSource dataSource;

	// setter 메소드 정의(구성)
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	@Override
	public ArrayList<Employee> list() throws SQLException
	{
		/*
		ArrayList<Employee> result = new ArrayList<Employee>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT E.EMPLOYEEID, E.NAME, E.SSN, TO_CHAR(E.BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY"
				+ ", E.LUNAR, DECODE(E.LUNAR, 0, '양력', 1, '음력')  AS LUNAR, E.TELEPHONE"
				+ ", E.DEPARTMENTI, (SELECT DEPARTMENTNAME"
				+ " FROM DEPARTMENT WHERE DEPARTMENTID = E.DEPARTMENTID) AS DEPARTMENTNAME"
				+ ", POSITIONID, (SELECT POSITIONNAME"
				+ " FROM POSITION WHERE POSITIONID = E.POSITIONID) AS POSITIONNAME"
				+ ", E.REGIONID, (SELECT REGIONNAME FROM REGION WHERE REGIONID = E.REGIONID) AS REGINNAME"
				+ ", E.BASICPAY, E.EXTRAPAY, NVL(E.BASICPAY,0) + NVL(E.EXTRAPAY,0) AS PAY"
				+ " FROM EMPLOYEE E"
				+ " ORDER BY E.EMPLOYEEID";
		
		/*
				String sql = "SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY, LUNAR, LUNARNAME"
				+ " , TELEPHONE, DEPARTMENTID, DEPARTMENTNAME"
				+ " , POSITIONID, POSITIONNAME, REGIONID, REGIONNAME"
				+ " , BASICPAY, EXTRAPAY, PAY, GRADE"
				+ " FROM EMPLOYEEVIEW"
				+ " ORDER BY EMPLOYEEID"; 
		*/
		
		/*
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			Employee employee = new Employee();
			
			employee.setEmployeeId(rs.getString("EMPLOYEEID"));
			employee.setName(rs.getString("NAME"));
			employee.setSsn("SSN");
			employee.setBirthday("BIRTHDAY");
			
			
		}
		
		
		return result;
	*/

		
		ArrayList<Employee> result = new ArrayList<Employee>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT EMPLOYEEID, NAME, SSN, BIRTHDAY"
				+ ", LUNAR, LUNARNAME, TELEPHONE"
				+ ", DEPARTMENTID, DEPARTMENTNAME"
				+ ", POSITIONID, POSITIONNAME"
				+ ", REGIONID, REGIONNAME"
				+ ", BASICPAY, EXTRAPAY, PAY, GRADE"
				+ " FROM EMPLOYEEVIEW"
				+ " ORDER BY EMPLOYEEID";
				
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			Employee employee = new Employee();
			
			employee.setEmployeeId(rs.getString("EMPLOYEEID"));
			//@ resultSet으로부터 얻어와야 해서 rs.getSting 추가
			employee.setName(rs.getString("NANE"));
			employee.setSsn(rs.getString("SSN"));
			employee.setBirthday(rs.getString("BIRTHDAY"));
			employee.setLunar(rs.getShort("LUNAR"));
			employee.setLunarName(rs.getString("LUNARNAME"));
			employee.setTelephone(rs.getString("TELEPHONE"));
			employee.setDepartmentId(rs.getString("DEPARTMENTID"));
			employee.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			employee.setPositionId(rs.getString("POSITIONID"));
			employee.setPositionName(rs.getString("POSITIONNAME"));
			employee.setRegionId(rs.getString("REGIONID"));
			employee.setRegionName(rs.getString("REGIONNAME"));
			employee.setBasicPay(rs.getInt("BASICPAY"));
			employee.setExtraPay(rs.getInt("EXTRAPAY"));
			employee.setPay(rs.getInt("PAY"));
			employee.setGrade(rs.getInt("GRADE"));
			
			result.add(employee);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public ArrayList<Region> regionList() throws SQLException
	{
		ArrayList<Region> result = new ArrayList<Region>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT POSITIONID, POSITIONNAME, MINBASICPAY, DELCHECK"
				+ " FROM POSITIONVIEW"
				+ " ORDER BY POSITIONID";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			Region region = new Region();
			region.setRegionId(rs.getString("REGIONID"));
			region.setRegionName(rs.getString("REGIONNAME"));
			region.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(region);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
		
	}

	@Override
	public ArrayList<Department> departmentList() throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Position> positionList() throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getMinBasicPay(String positionId) throws SQLException
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int employeeAdd(Employee employee) throws SQLException
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int remove(String employeeId) throws SQLException
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modify(Employee employee) throws SQLException
	{
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Employee searchId(String employeeId) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String login(String id, String pw) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String logAdmin(String id, String pw) throws SQLException
	{
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
	
}
