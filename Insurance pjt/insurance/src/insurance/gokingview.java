package insurance;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/gokingview")
public class gokingview extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		DTO king = DAO.findking();
		System.out.print(king.getSname()+"\n");
		List<DTO> list = DAO.kinglist(king.getSname());
		System.out.print(list);
		request.setAttribute("list2", list);
		request.setAttribute("king", king);
		
		request.setAttribute("target", "kingview");
		RequestDispatcher d =request.getRequestDispatcher("template.jsp");
		d.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
