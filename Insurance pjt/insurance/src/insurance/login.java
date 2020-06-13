package insurance;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;


@WebServlet("/login")
public class login extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			String sno = request.getParameter("sno");
			String spass = request.getParameter("spass");
			
			int rs = DAO.login(sno,spass);
			
			HttpSession session= request.getSession();

			/*로그인정보 출력시*/
				if (rs>0) {
					request.setAttribute("result","true");
					session.setAttribute("name", "good");
				}else {
					request.setAttribute("result","false");
				}
				
				request.setAttribute("target", "login");
				RequestDispatcher d = request.getRequestDispatcher("template.jsp");
				d.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
