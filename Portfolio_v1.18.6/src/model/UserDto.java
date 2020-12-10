package model;

public class UserDto {

	private int id;
	private String name;
	private String salt;
	private String password_hash;

	public UserDto() {
		//初期化処理
		id = 0;
		name = null;
		salt = null;
		password_hash = null;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSalt() {
		return salt;
	}
	public String getPassword_hash() {
		return password_hash;
	}
	public void setSalt(String salt) {
		this.salt = salt;
	}
	public void setPassword_hash(String password_hash) {
		this.password_hash = password_hash;
	}
}
