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
 * Servlet implementation class UserSignInSvl
 */
@WebServlet("/view/UserSignInSvl")
public class UserSignInSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserSignInSvl() {
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
			UserDto user = new UserDto();
			user.setName(request.getParameter("name"));
			user.setPassword_hash(request.getParameter("password"));

			UserDao userdao = new UserDao();

			if (userdao.login(user)!=null) {

				session.setAttribute("userInfo", user);
				request.getRequestDispatcher("/yourAccount.jsp").forward(request, response);

			} else {
				request.setAttribute("error", "We cannot find an account with that name and password.");
				request.getRequestDispatcher("/signin.jsp").forward(request, response);
			}

		} catch (NotUserException e) {
			request.getRequestDispatcher("/500.jsp").forward(request,
					response);
		}
	}
}