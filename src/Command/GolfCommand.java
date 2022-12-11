package Command;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

public class GolfCommand implements Command {
	private String command;
	private String query;
	
	public GolfCommand() {
		// TODO Auto-generated constructor stub
	}
	
	public GolfCommand(String command) {
		// TODO Auto-generated constructor stub
		this.command = command;
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		Context context = new InitialContext();
		DataSource dataSource = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
	    
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		ResultSet resultSet1 = null;
		ResultSet resultSet2 = null;
		ResultSet resultSet3 = null;
		connection = dataSource.getConnection();
		
		
		
		switch (this.command) {
			case "/GOLF1.ctrl":
				this.query = "SELECT * FROM TBL_TEACHER_202201";
				preparedStatement = connection.prepareStatement(this.query);
				resultSet = preparedStatement.executeQuery();
				request.setAttribute("result", resultSet );
				break;
			
			case "/GOLF2.ctrl":
				this.query = "select c_no, c_name from tbl_member_202201";
				preparedStatement = connection.prepareStatement(this.query);
				resultSet = preparedStatement.executeQuery();
				this.query = "select c_no, c_name from tbl_member_202201";
				preparedStatement = connection.prepareStatement(this.query);
				resultSet1 = preparedStatement.executeQuery();
				request.setAttribute("members", resultSet );
				request.setAttribute("members2", resultSet1 );
				
				this.query = "select distinct class_area from tbl_class_202201";
				preparedStatement = connection.prepareStatement(this.query);
				resultSet2 = preparedStatement.executeQuery();
				request.setAttribute("classarea", resultSet2 );
				
				this.query = "select class_name, teacher_code from tbl_teacher_202201";
				preparedStatement = connection.prepareStatement(this.query);
				resultSet3 = preparedStatement.executeQuery();
				request.setAttribute("classnameandtccode", resultSet3 );
				break;
				
			case "/GOLF2add.ctrl":
				this.query = "insert into tbl_class_202201(regist_month, c_no, class_area, tutition, teacher_code) values(?,?,?,?,?)";
				preparedStatement = connection.prepareStatement(this.query);
				preparedStatement.setString(1, request.getParameter("regist_month"));
				preparedStatement.setString(2, request.getParameter("member_number"));
				preparedStatement.setString(3, request.getParameter("class_area"));
				preparedStatement.setInt(4, Integer.parseInt(request.getParameter("class_tutition")));
				preparedStatement.setInt(5, Integer.parseInt(request.getParameter("teacher_code")));
				try {
					preparedStatement.executeUpdate();
					
				} catch (SQLIntegrityConstraintViolationException e) {
					// TODO: handle exception
					response.getWriter().write("중복으로 신청하실 수 없습니다.");
				}

				
				break;
			
			case "/GOLF3.ctrl":
				this.query = "select c.regist_month, c.c_no, m.c_name, t.class_name, c.class_area, c.tutition, m.grade from TBL_CLASS_202201 c, TBL_MEMBER_202201 m, TBL_TEACHER_202201 t where c.C_NO = m.C_NO and c.TEACHER_CODE = t.TEACHER_CODE";
				preparedStatement = connection.prepareStatement(this.query);
				resultSet = preparedStatement.executeQuery();
				request.setAttribute("result", resultSet );
				break;
	
			case "/GOLF4.ctrl":
				this.query = "select t.teacher_code, t.class_name, t.teacher_name, sum(c.TUTITION) as SUM from TBL_TEACHER_202201 t, TBL_CLASS_202201 c where t.TEACHER_CODE = c.TEACHER_CODE group by t.teacher_code, t.class_name, t.teacher_name order by t.TEACHER_CODE asc";
				preparedStatement = connection.prepareStatement(this.query);
				resultSet = preparedStatement.executeQuery();
				request.setAttribute("result", resultSet );
				break;
		default:
			break;
		}
	}

}
