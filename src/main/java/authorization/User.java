package authorization;

import Database.DatabaseConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    public static boolean isAuthorized(String user, String passwd) {
        String sql = "SELECT username, passwd FROM users";
        try {
            Connection connection = DatabaseConnection.getConnection();
            ResultSet resultSet = DatabaseConnection.getData(sql);
            while (resultSet.next()) {
                if (resultSet.getString("username").equals(user) && resultSet.getString("passwd").equals(passwd)) {
                    return true;
                }
            }
            return false;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return true;
    }
}
