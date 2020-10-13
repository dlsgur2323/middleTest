package test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

@WebServlet("/CheckMail.do")
public class CheckMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("authnum")==null) {
			request.setAttribute("result", "null");
		} else {
			String authnum = (String) session.getAttribute("authnum");
			String check = request.getParameter("check");
			if(authnum.equals(check)) {
				request.setAttribute("result", "success");
			} else {
				request.setAttribute("result", "fail");
			}
		}
		request.getRequestDispatcher("/emailCheck.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
