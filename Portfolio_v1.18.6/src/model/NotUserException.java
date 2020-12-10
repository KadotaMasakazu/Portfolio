package model;

public class NotUserException extends Exception {
	private int errorCode;
	private static String[] ERROR_MSG = new String[] { "System failure", "System failure by database" };
	public static int ERROR_NO_EXCEPTION = 0;
	public static int ERROR_NO_DB_EXCEPTION = 1;

	public NotUserException(int errCd) {
		this.errorCode = errCd;
	}

	public String getMsg() {
		String errorMsg = ERROR_MSG[this.errorCode];
		return errorMsg;
	}
}
