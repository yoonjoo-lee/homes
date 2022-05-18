package homes.dbconn;

import java.sql.Connection;
import java.sql.DriverManager;


public class Dbconn {
	String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String user="system";
	String password = "1234";
	
	public Connection getConnection() {
		Connection conn = null;
		try {
		//�ش���Ű���� �ִ� Ŭ������ �����´�
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//���������� Ȱ���ؼ� ���ᰴü�� �����
		conn = DriverManager.getConnection(url, user, password);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
