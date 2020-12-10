package view;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.NotUserException;
import model.UserDao;
import model.UserDto;

/**
 * Servlet implementation class UserCloserSvl
 */
@WebServlet("/view/UserCloseSvl")
public class UserCloseSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserCloseSvl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");

		try {
			HttpSession session = request.getSession();
			UserDto userInfo = (UserDto) session.getAttribute("userInfo");
			if (userInfo == null) {
				request.getRequestDispatcher("/portfolio.jsp")
						.forward(request, response);
			}
			UserDto user = new UserDto();

			user.setId(Integer.parseInt(request.getParameter("userId")));
			user.setName(request.getParameter("name"));
			user.setPassword_hash(request.getParameter("oldpassword"));


			UserDao userdao = new UserDao();
			if(userdao.login(user)!=null) {
			userdao.delete(user);
			session.invalidate();
			request.getRequestDispatcher("/portfolio.jsp").forward(request,response);
			}else {
				request.setAttribute("error", "Your password is wrong.");
				request.getRequestDispatcher("/closeAccount.jsp").forward(request,response);
			}
		} catch (NotUserException e) {
			request.getRequestDispatcher("/500.jsp").forward(request,
					response);
		}
	}

}
