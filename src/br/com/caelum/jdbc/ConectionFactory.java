package br.com.caelum.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectionFactory {

	public Connection getConection() {

		try {
			Class.forName("org.postgresql.Driver");	
			return DriverManager.getConnection("jdbc:postgresql://localhost/fj21", "postgres", "admin");
		} catch (SQLException e) {
			throw new RuntimeException(e);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		}
	}
}
