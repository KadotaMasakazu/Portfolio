package view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.UserDao;
import model.UserDto;

/**
 * Servlet implementation class UserCreateSvl
 */
@WebServlet("/view/UserCreateSvl")
public class UserCreateSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	* @see HttpServlet#HttpServlet()
	*/
	public UserCreateSvl() {
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

			/*
			 * 同ユーザーネームがいるか確認する
			 * いた場合->Error(既に作成済みのユーザー名)
			 */

			ArrayList<UserDto> userList = userdao.getList();
			boolean isSameUserName = false;
			for (UserDto userChk : userList) {
				if (userChk.getName().equals(user.getName())) {
					isSameUserName = true;
				}
			}
			if (isSameUserName == true) {
				request.setAttribute("error",
						"Same detailed account has been created.Please retry it.");
				request.getRequestDispatcher("/signup.jsp").forward(
						request, response);
				return;
			} else {
				session=request.getSession(true);
				session.setAttribute("userInfo", userdao.insert(user));
				request.getRequestDispatcher("/yourAccount.jsp")
						.forward(request, response);
				return;
			}

		} catch (Exception e) {
			request.getRequestDispatcher("/500.jsp").forward(request,
					response);
		}
	}
}
