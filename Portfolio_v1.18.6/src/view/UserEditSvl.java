package view;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class UserEditSvl
 */
@WebServlet("/view/UserEditSvl")
public class UserEditSvl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	boolean isSameUserName 	= false;
	boolean isSameUserId   	= false;
	boolean isAllowLogin  	= false;
	boolean isAllowEdit   	= false;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserEditSvl() {
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
			/*
			 * String userPasswordForBaukUpを生成する理由
			 * 
			 * hash化された[password]
			 * ↓
			 * userPasswordForBaukUpに一時的に保管。
			 * ↓
			 * if(login->fail)
			 * ↓
			 * セッションuserinfoに[userPasswordForBaukUp]を再設定
			 * 
			 * ->セッション情報にパスワードのクリアテキストを記録させないため。
			 */
			String userPasswordForBaukUp = userInfo.getPassword_hash();
			userInfo.setPassword_hash(request.getParameter("oldpassword"));

			UserDto user = new UserDto();
			user.setId(userInfo.getId());
			user.setName(request.getParameter("name"));
			user.setPassword_hash(request.getParameter("newpassword"));


			/*		isAllowEditの条件
			 *
			 * [OK] Login<userInfo>-->success & (SameUserId,SameUserName)		-->true
			 *
			 * [OK] Login<userInfo>-->success & (DifferentUserName)				-->true
			 *
			 * [NG] Login<userInfo>-->success & (DifferentUserId,SameUserName)  -->false
			 *
			 * [NG] Login<userInfo>-->failed 									-->false
			 *
			 */

			UserDao userdao = new UserDao();

			/*
			 * 同ユーザーネームがいるか確認する
			 * いた場合->ユーザーIDを記録し、isSameUserIdの判定に使用する
			 */
			ArrayList<UserDto> userNameList = userdao.getList();
			int userIdForChk = 0;
			for (UserDto userNameChk : userNameList) {
				if (userNameChk.getName().equals(user.getName())) {
					isSameUserName = true;
					userIdForChk = userNameChk.getId();
				}
			}
			//同ネームのユーザーpassだけ変更しているか確認する
			isSameUserId = (user.getId() == userIdForChk);
			if(userdao.login(userInfo)!=null) {
				isAllowLogin = true;
			}

			//passwordのみ変更する場合[OK]
			if (isAllowLogin = true && isSameUserId == true && isSameUserName == true) {
				isAllowEdit=true;
			}else if (isAllowLogin = true && isSameUserName == false) {
			//name,passwordを変更する場合[OK]
				isAllowEdit=true;
			}else {
			//ログインができない->isAllowLogin=false
				isAllowEdit=false;
			}

			if(isAllowEdit==true) {
				session.setAttribute("userInfo", userdao.update(user));
				request.setAttribute("msg", "Your account information has been changed.");
				request.getRequestDispatcher("/yourAccount.jsp").forward(request, response);
			}else {
			//->記入されたパスワードをハッシュ化されたpasswordに変更
			user.setPassword_hash(userPasswordForBaukUp);
			session.setAttribute("userInfo", userInfo);
			request.setAttribute("error",
					"Same detailed account has been created or your password is wrong.Please retry it.");
			request.getRequestDispatcher("/editAccount.jsp").forward(request, response);
		}

		} catch (NotUserException e) {
			request.getRequestDispatcher("/500.jsp").forward(request,
					response);
		}
	}
}
