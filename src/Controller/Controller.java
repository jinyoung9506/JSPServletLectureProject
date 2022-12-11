package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Command.Command;
import Command.GolfCommand;
/**
 * Servlet implementation class Controller
 */
@WebServlet("*.ctrl")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		System.out.println("run Get");
		try {
			doControl(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("run Post");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}
	
	private void doControl (HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("Control");
		request.setCharacterEncoding("UTF-8");
		String viewPage = null;
		Command command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		System.out.println("요청 접속 경로 확인:" + uri + " : " + conPath + " : " + com );
		
		if (com.equals("/Main.ctrl")) {
			System.out.println("Main");
			viewPage ="mainpage.jsp";
		} else if (com.equals("/RSP.ctrl")) {
			System.out.println("RSP");
			viewPage ="RSPinput.jsp";
		} else if (com.equals("/POLL.ctrl")) {
			System.out.println("POLL");
			viewPage ="pollInsert.jsp";
		} else if (com.equals("/GOLF1.ctrl")) {
			System.out.println("Golf강사조회");
			command = new GolfCommand(com);
			command.execute(request, response);
			viewPage ="golfteacher.jsp";
		} else if (com.equals("/GOLF2.ctrl")) {
			System.out.println("Golf수강신청");
			command = new GolfCommand(com);
			command.execute(request, response);
			viewPage ="golfregistercourse.jsp";
		} else if (com.equals("/GOLF2add.ctrl")) {
			System.out.println("Golf수강신청전송");
			command = new GolfCommand(com);
			command.execute(request, response);
			viewPage ="/Main.ctrl";
		} else if (com.equals("/GOLF3.ctrl")) {
			System.out.println("Golf회원정보조회");
			command = new GolfCommand(com);
			command.execute(request, response);
			viewPage ="golfmember.jsp";
		} else if (com.equals("/GOLF4.ctrl")) {
			System.out.println("Golf강사매출현황");
			command = new GolfCommand(com);
			command.execute(request, response);
			viewPage ="golfteacherearn.jsp";
		} else {
			System.out.println("ELSE");
			viewPage ="mainpage.jsp";
		}
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
