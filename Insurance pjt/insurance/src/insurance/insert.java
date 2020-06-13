package insurance;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/insert")
public class insert extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			System.out.println("서블릿으로 넘어옴");
			DTO u = new DTO();
			u.setIno(request.getParameter("ino"));
			System.out.println(request.getParameter("ino"));
			
			u.setIname(request.getParameter("iname"));
			System.out.println(request.getParameter("iname"));
			
			u.setIamount(request.getParameter("iamount"));
			System.out.println(request.getParameter("iamount"));
			
			u.setSno(request.getParameter("sno"));
			System.out.println(request.getParameter("sno"));
			
			
			int rs = DAO.insert(u);
			System.out.println(rs);
			if(rs <0) {
				request.setAttribute("result","false");
			}else {
				request.setAttribute("result", "true");
			}
			request.setAttribute("target", "insert");
			RequestDispatcher d =request.getRequestDispatcher("template.jsp");
			d.forward(request, response);
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
