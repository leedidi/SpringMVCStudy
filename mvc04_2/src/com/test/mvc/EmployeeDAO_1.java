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
/*
public class EmployeeDAO_1 implements IEmployeeDAO
{
	// 주요 속성 구성 → 인터페이스 형태
	private DataSource dataSource;

	// setter 메소드 정의(구성)
	public void setDataSource(DataSource dataSource)
	{
		this.dataSource = dataSource;
	}

	// 직원 리스트
	@Override
	public ArrayList<Employee_1> list() throws SQLException
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

/*		
		ArrayList<Employee_1> result = new ArrayList<Employee_1>();
		
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
			Employee_1 employee = new Employee_1();
			
			employee.setEmployeeId(rs.getString("EMPLOYEEID"));
			//@ resultSet으로부터 얻어와야 해서 rs.getSting 추가
			employee.setName(rs.getString("NANE"));
			employee.setSsn(rs.getString("SSN"));
			employee.setBirthday(rs.getString("BIRTHDAY"));
			employee.setLunar(rs.getInt("LUNAR"));
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

	// 지역 리스트
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

	// 부서 리스트
	@Override
	public ArrayList<Department> departmentList() throws SQLException
	{
		ArrayList<Department> result = new ArrayList<Department>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT DEPARTMENTID, DEPARTMENTNAME, DELCHECK"
				+ " FROM DEPARTMENTVIEW"
				+ " ORDER BY DEPARTMENTID";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			Department department = new Department();
			department.setDepartmentId(rs.getString("DEPARTMENTID"));
			department.setDepartmentName(rs.getString("DEPARTMENTNAME"));
			department.setDelCheck(rs.getInt("DELCHECK"));
			
			result.add(department);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 직위 리스트
	@Override
	public ArrayList<Position> positionList() throws SQLException
	{
		ArrayList<Position> result = new ArrayList<Position>();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT POSITIONID, POSITIONNAME,"
				+ " MINBASICPAY, DELCHECK"
				+ " FROM POSITIONVIEW"
				+ " ORDER BY POSITIONID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			Position position = new Position();
			position.setPositionId(rs.getString("POSITIONID"));
			position.setPositionName(rs.getString("POSITIONNAME"));
			position.setMinBasicPay(rs.getInt("MINBASICPAY"));
			position.setDelCheck(rs.getInt("DELHECK"));
			
			result.add(position);
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 직위 아이디에 따른 최소 기본급 확인/검색
	@Override
	public int getMinBasicPay(String positionId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT MINBASICPAY"
				+ " FROM POSITION"
				+ " WHERE POSITIONID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1,  Integer.parseInt(positionId));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
			result = rs.getInt("MINBASICPAY");
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 직원 데이터 추가
	@Override
	public int employeeAdd(Employee_1 employee) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "INSERT INTO EMPLOYEE"
				+ "( EMPLOYEEID, NAME, SSN1, SSN2, BIRTHDAY"
				+ ", LUNAR, TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID"
				+ ", BASICPAY, EXTRAPAY )"
				+ " VALUES( EMPLOYEESEQ.NEXTVAL"
				+ ", '?', '?', CRYPTPACK.ENCRYPT(?, ?), TO_DATE(?, 'YYYY-MM-DD'), ?, ?"
				+ ", ?, ?, ?"
				+ ", ?, ?)";
				
		// name, ss1, ssn2, ssn2
		// birthday, lunar, telephone
		// departmentId, positionId, regionId
		// basicPay, extraPay
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, employee.getName());
		pstmt.setString(2, employee.getSsn1());
		pstmt.setString(3, employee.getSsn2());
		pstmt.setString(4, employee.getSsn2());
		pstmt.setString(5, employee.getBirthday());
		pstmt.setInt(6, employee.getLunar());
		pstmt.setString(7, employee.getTelephone());
		//pstmt.setString(8, employee.getDepartmentId());
		pstmt.setInt(8, Integer.parseInt(employee.getDepartmentId()));
		//pstmt.setString(9, employee.getPositionId());
		pstmt.setInt(9, Integer.parseInt(employee.getPositionId()));
		//pstmt.setString(10, employee.getRegionId());
		pstmt.setInt(10, Integer.parseInt(employee.getRegionId()));
		pstmt.setInt(11, employee.getBasicPay());
		pstmt.setInt(12, employee.getExtraPay());
		
		return result;
	}

	// 직원 데이터 삭제
	@Override
	public int remove(String employeeId) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "DELETE FROM EMPLOYEE WHERE EMPLOYEEID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(employeeId));
		//@ 오라클에서 넘버로 구성. 오라클안에서 쿼리로 실행되게 넘겨줌. 그러니까 오라클에서 실행되는 타입대로 넘겨주는게 좋음
		//@ 변환 안하면 '20' 이렇게 들어가니까 parseInt 해준 것
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}

	// 직원 데이터 수정
	@Override
	public int modify(Employee_1 employee) throws SQLException
	{
		int result = 0;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "UPDATE EMPLOYEE"
				+ " SET NAME=?, BIRTHDAY=TO_DATE(?, 'YYYY-MM-DD'), LUNAR=?"
				+ ", TELEPHONE=?, DEPARTMENTID=?, POSITIONID=?, REGIONID=?"
				+ ", BASICPAY=?, EXTRAPAY=?, SSN1=?, SSN2=CRYPTPACK.ENCRYPT(?, ?)"
				+ " WHERE EMPLOYEEID=?";
	
		// name, bithday, lunar
		// telephone, departmentId, positionId, regionId
		// basicPay, extraPay
		// ssn1, ssn2, ssn2, grade
		// employeeId
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, employee.getName());
		pstmt.setString(2, employee.getBirthday());
		pstmt.setInt(3, employee.getLunar());
		pstmt.setString(4, employee.getTelephone());
		pstmt.setInt(5, Integer.parseInt(employee.getDepartmentId()));
		pstmt.setInt(6, Integer.parseInt(employee.getPositionId()));
		pstmt.setInt(7, Integer.parseInt(employee.getRegionId()));
		pstmt.setInt(8, employee.getBasicPay());
		pstmt.setInt(9, employee.getExtraPay());
		pstmt.setString(10, employee.getSsn1());
		pstmt.setString(11, employee.getSsn2());
		pstmt.setString(12, employee.getSsn2());
		pstmt.setInt(13, Integer.parseInt(employee.getEmployeeId()));
		//@ GETGRADE 한거 빼버림!
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	// 아이디로 직원 검색
	@Override
	public Employee_1 searchId(String employeeId) throws SQLException
	{	
		Employee_1 employee = new Employee_1();
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT EMPLOYEEID, NAME, SSN1"
				+ ", TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') AS BIRTHDAY, LUNAR"
				+ ", TELEPHONE, DEPARTMENTID, POSITIONID, REGIONID"
				+ ", BASICPAY, EXTRAPAY"
				+ " FROM EMPLOYEE"
				+ " WHERE EMPLOYEEID=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(employeeId));
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next())
		{
			employee.setEmployeeId(rs.getString("EMPLOYEEID"));
			employee.setName(rs.getString("NAME"));
			employee.setSsn1(rs.getString("SSN1"));
			employee.setBirthday(rs.getString("BIRTHDAY"));
			employee.setLunar(rs.getInt("LUNAR"));
			employee.setTelephone(rs.getString("TELEPHONE"));
			employee.setDepartmentId(rs.getString("DEPARTMENTID"));
			employee.setPositionId(rs.getString("POSITIONID"));
			employee.setRegionId(rs.getString("REGIONID"));
			employee.setBasicPay(rs.getInt("BASICPAY"));
			employee.setExtraPay(rs.getInt("EXTRAPAY"));
		}
		rs.close();
		pstmt.close();
		conn.close();

		return employee;
	}

	
	//@ 영상보고 다시하기
	@Override
	public String login(String id, String pw) throws SQLException
	{
		String result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NAME"
				+ " FROM EMPLOYEE"
				+ " WHERE EMPLOYEEID=?"
				+ " AND SSN2=CRYPTPACK.ENCRYPT(?, ?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(id));
		pstmt.setString(2, pw);
		pstmt.setString(3, pw);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getString("NAME");
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}

	@Override
	public String logAdmin(String id, String pw) throws SQLException
	{
		String result = null;
		
		Connection conn = dataSource.getConnection();
		
		String sql = "SELECT NAME"
				+ " FROM EMPLOYEE"
				+ " WHERE EMPLOYEEID=?"
				+ " AND SSN2=CRYPTPACK.ENCRYPT('?', '?')"
				+ " AND GRADE=0";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(id));
		pstmt.setString(2, pw);
		pstmt.setString(3, pw);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next())
			result = rs.getString("NAME");
		rs.close();
		pstmt.close();
		conn.close();
		
		return result;
	}
	
	
	
	
}
*/