package model;

import java.nio.charset.StandardCharsets;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


/*
 *UserDto型を返すメソッド
 *[OK]return User->処理に成功
 *[NG]return null->処理に失敗
 *の構成になっています。
 *
 *パスワードの暗号化について
 *public UserDto insert(UserDto user) メソッドにて
 *詳細な説明があります。
 */

public class UserDao {

	private String sql = "";
	private String tableName = "user";
	private String column_id = "id";
	private String column_name = "name";
	private String column_salt = "salt";
	private String column_password_hash = "password_hash";

	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;


	private static Connection getConnection() throws NotUserException {

		String dbName = System.getProperty("RDS_DB_NAME");
		String userName = System.getProperty("RDS_USERNAME");
		String password = System.getProperty("RDS_PASSWORD");
		String hostname = System.getProperty("RDS_HOSTNAME");
		String port = System.getProperty("RDS_PORT");
		String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName
				+ "?user=" + userName + "&password=" + password;

		// Load the JDBC driver
		try {
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(jdbcUrl);
		} catch (Exception e) {
			throw new NotUserException(0);
		}

	}

	private static void allClose(PreparedStatement pst, Connection con,
			ResultSet rs) throws NotUserException {
		try {
			if (rs != null)
				rs.close();
			if (pst != null)
				pst.close();
			if (con != null)
				con.close();
		} catch (SQLException e) {
			throw new NotUserException(1);
		}
	}

	public UserDto login(UserDto user) throws NotUserException {

		try {
			con = getConnection();

			//userSaltを取得する
			sql = ("SELECT salt FROM " + tableName + " WHERE " + column_name
					+ "=? ");
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getName());
			rs = pst.executeQuery();
			if (rs.next()) {
				user.setSalt(rs.getString(column_salt));
			} else {
				return null;
			}

			//passwordのハッシュ化
			GenerateUserPassword doCheckUserPassword = new GenerateUserPassword();
			//受け取ったuser情報にsaltとpassword_hashを追加
			byte[] salt = user.getSalt().getBytes(StandardCharsets.UTF_8);
			String storedPassword = doCheckUserPassword.GenerateSecurePassword(user.getPassword_hash(), salt);
			user.setPassword_hash(storedPassword);

			sql = ("SELECT * FROM " + tableName + " WHERE " + column_name
					+ "=? AND " + column_password_hash + "=?");
			pst = con.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setString(2, user.getPassword_hash());
			rs = pst.executeQuery();

			if (rs.next()) {
				user.setId(rs.getInt(column_id));
				user.setName(rs.getString(column_name));
				user.setSalt(rs.getString(column_salt));
				user.setPassword_hash(rs.getString(column_password_hash));

				return user;
			} else {

				return null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			allClose(pst, con, rs);
		}
		return null;
	}

	public ArrayList<UserDto> getList() throws NotUserException {
		ArrayList<UserDto> userList = new ArrayList<UserDto>();

		try {
			con = getConnection();

			sql = ("SELECT * FROM " + tableName);
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				UserDto ud = new UserDto();
				ud.setId(rs.getInt(1));
				ud.setName(rs.getString(2));
				userList.add(ud);
			}

			return userList;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			allClose(pst, con, rs);

		}
		return null;
	}

	public UserDto insert(UserDto user) throws NotUserException {

		try {
			con = getConnection();

			//passwordのハッシュ化
			GenerateUserPassword doHashPassword = new GenerateUserPassword();
			try {
				/*
				 * ランダムなByte[salt]を生成
				 * ↓
				 * [salt]をString[salt.toString]に変換する
				 * ↓
				 * パスワードをハッシュ化するメソッド、GenerateSecurePassword[ユーザーが入力した値,salt]
				 * ↓
				 * ハッシュ化されたパスワード[storedPassword]を生成
				 * ↓
				 * Object[User]に[storedPassword]を保管。
				 *
				 */
				byte[] salt = doHashPassword.getSalt();

				user.setSalt((salt).toString());
				salt = user.getSalt().getBytes(StandardCharsets.UTF_8);
				String storedPassword = doHashPassword.GenerateSecurePassword(user.getPassword_hash(), salt);

				user.setPassword_hash(storedPassword);

			} catch (NoSuchAlgorithmException | NoSuchProviderException e) {
				e.printStackTrace();
			}

			sql = ("INSERT INTO " + tableName + " (" + column_name + ","
					+ column_salt + "," + column_password_hash + ") VALUES (?,?,?)");
			pst = con.prepareStatement(sql);

			pst.setString(1, user.getName());
			pst.setString(2, user.getSalt());
			pst.setString(3, user.getPassword_hash());
			pst.executeUpdate();

			pst.close();

			sql = "SELECT LAST_INSERT_ID()";

			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();
			while (rs.next()) {
				user.setId(rs.getInt(1));
			}


			return user;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			allClose(pst, con, rs);
		}
		return null;
	}

	public UserDto update(UserDto user) throws NotUserException {

		try {
			con = getConnection();
			//passwordのハッシュ化
			GenerateUserPassword doHashPassword = new GenerateUserPassword();
			try {
				byte[] salt = doHashPassword.getSalt();

				user.setSalt((salt).toString());
				salt = user.getSalt().getBytes(StandardCharsets.UTF_8);
				String storedPassword = doHashPassword.GenerateSecurePassword(user.getPassword_hash(), salt);

				user.setPassword_hash(storedPassword);

			} catch (NoSuchAlgorithmException | NoSuchProviderException e) {
				e.printStackTrace();
			}


			sql = (" UPDATE " + tableName + " SET " + column_name + "=?, "
					+ column_salt + "=?, "+ column_password_hash + "=? "
					+ " WHERE " + column_id
					+ " =?");


			pst = con.prepareStatement(sql);
			pst.setString(1, user.getName());
			pst.setString(2, user.getSalt());
			pst.setString(3, user.getPassword_hash());
			pst.setInt(4, user.getId());
			pst.executeUpdate();

			return user;

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			allClose(pst, con, rs);
		}
		return null;
	}

	public void delete(UserDto user) throws NotUserException {

		try {
			con = getConnection();

			sql = "DELETE FROM " + tableName + " WHERE " + column_id
					+ " =? AND " + column_name + "=? AND " + column_password_hash
					+ " =?";
			pst = con.prepareStatement(sql);
			pst.setInt(1, user.getId());
			pst.setString(2, user.getName());
			pst.setString(3, user.getPassword_hash());

			pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			allClose(pst, con, rs);
		}

	}

}
