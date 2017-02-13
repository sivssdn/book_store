package database;

import java.sql.*;
import java.util.Locale;
import java.util.ResourceBundle;

public class DatabaseManager {

    public Connection con;
    private ResultSet rs;
    public String success;


    public DatabaseManager() {


        con = null;
        rs = null;


        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {

            success = "failed";

        }
        try {
            //to get user name and password from .properties file

            Locale locale = new Locale("en", "US");
            //ResourceBundle bundle = ResourceBundle.getBundle("bundles" + File.separator + "credentials", locale);
            ResourceBundle bundle = ResourceBundle.getBundle("database.credentials", locale);

            con = DriverManager.getConnection(bundle.getString("db.url"), bundle.getString("db.username"), bundle.getString("db.password"));

            con.setAutoCommit(false); //to enable transactions
            success = "success";

        } catch (Exception e) {
            success = "failed";
            System.out.print(e.getMessage());
        }

    }


    /**
     * performs insert query on database specified by sqlStatement query
     * returns String "success" on completion without interruption and String "failed" in case of any Exception
     */
    public String insert(PreparedStatement insertStatement) {
        String success = "inserted";

        try {
            //preparing insert statement
            //st = con.prepareStatement(insertStatement);
            insertStatement.executeUpdate();

        } catch (Exception e) {
            //SQLException
            if (con != null) {
                try {
                    con.rollback();
                } catch (Exception e1) {
                    //cannot rollback
                    success = "failed";
                    return success;
                }
            }

            //System.out.println(e.getMessage());
            //success = "failed";
            success = e.getMessage();
            return success; //terminate the function
        }
        return success;
    }


    //for select statement on mysql db
    public ResultSet select(PreparedStatement selectStatement) {

        rs = null;
        try {

            rs = selectStatement.executeQuery();
        } catch (Exception e) {

            return rs; //return null if unable to perform select on the data
        }

        return rs;
    }

    /**
     * Used to perform update operation on database. Takes input update sql statement and return success in case of execution without interruption.
     */
    public String update(PreparedStatement updateStatement) {
        String success = "success";

        try {
            //st = con.prepareStatement(updateStatement);
            updateStatement.executeUpdate();
        } catch (Exception e) {
            //probably SQLException
            //success = "failed";
            success=e.getMessage();
            return success;
        }


        return success;
    }


    /**
     * close() required to commit all changes to database
     * closes all the open connection in the db
     */
    //to close db connections
    public String close() {

        //REQUIRED for committing to the database.(for query to complete.)
        try {
            con.commit();
        } catch (SQLException e) {
            return "failed";
        }


        if (con != null) {   //closing connection
            try {
                con.close();
            } catch (Exception e) {
                //Ignore
            }
        }
        if (rs != null) {
            try {
                rs.close();
            } catch (Exception e) {
                //Ignore
            }
        }
        return "success";
    }
}