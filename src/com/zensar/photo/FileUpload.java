package com.zensar.photo;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.zensar.util.db.ConnectionFactory;

public class FileUpload {

	public FileUpload(InputStream in, String userId) {

		try {
			Connection connection = ConnectionFactory.getConnection();
			PreparedStatement pst = connection
					.prepareStatement("UPDATE images SET photo=? WHERE userid=?");
			pst.setBlob(1, in);
			pst.setString(2, userId);
			pst.executeUpdate();
			
			pst.close();
			connection.close();
		} catch (SQLException e) {

			System.err.println(e.getMessage());
		}

	}

}
