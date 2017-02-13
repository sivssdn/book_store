package process;

import database.DatabaseManager;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by admin on 13-02-2017.
 */
public class LoginManager {
    public String getUserDepartment(String email) {
        //String department = "other";
        String department = "others";
        DatabaseManager db = new DatabaseManager();
        if (db.success.intern() == "success") {

            try {
                String selectQuery = "SELECT email FROM public.admin_users WHERE email ILIKE ?;";
                PreparedStatement selectStatement = db.con.prepareStatement(selectQuery);
                selectStatement.setString(1, email);
                ResultSet rs = db.select(selectStatement);

                if(rs.next()){
                    department = "admin";
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        db.close();
        return department;
    }
}
