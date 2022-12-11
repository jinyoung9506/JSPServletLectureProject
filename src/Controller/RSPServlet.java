package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RSPServlet
 */
@WebServlet("/RSPResult")
public class RSPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RSPServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet()..");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost()..");
		request.setCharacterEncoding("UTF-8");
		
		String userInput = null;
		String cpuInput = null;
		String result = null;
		
		userInput = request.getParameter("userInput");
		cpuInput = RSPspan();
		
		if (userInput.equals(cpuInput))
			result = "draw";
		else if ((userInput.equals("scissor") && cpuInput.equals("paper") ) ||
				 (userInput.equals("rock") && cpuInput.equals("scissor") ) ||
				 (userInput.equals("paper") && cpuInput.equals("rock") ) )
			result = "win";
		else
			result = "lose";
		
		request.setAttribute("userInput", userInput);
		request.setAttribute("cpuInput", cpuInput);
        request.setAttribute("result", result);
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/RSPoutput.jsp");
		dispatcher.forward(request, response);
	}

	public String RSPspan() {
		String value = null;
		int num = (int)(Math.random()*3);
		switch (num) {
		case 0:
			value = "scissor";
			break;
		case 1:
			value = "rock";
			break;
		case 2:
			value = "paper";
			break;
		}
		return value;
	}
}
