package process;

import database.DatabaseManager;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Created by paras.
 */
public class BookStockManager extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        if (request.getServletPath().intern() == "/addNewBook") {
            if (request.getSession().getAttribute("department") != null) {
                DatabaseManager db = new DatabaseManager();
                if (db.success.intern() == "success") {
                    try {

                        String insertQuery = "INSERT INTO public.book_list( name, author, quantity, contribute_to,email) VALUES (?, ?, ?, ?, ?);";
                        PreparedStatement insertStatement = db.con.prepareStatement(insertQuery);

                        insertStatement.setString(1, request.getParameter("name"));
                        insertStatement.setString(2, request.getParameter("author"));
                        insertStatement.setString(3, request.getParameter("quantity"));
                        insertStatement.setString(5, (String) request.getSession().getAttribute("email"));

                        if (request.getSession().getAttribute("department").toString().intern() == "admin")
                            insertStatement.setString(4, "Book store");
                        else if(request.getSession().getAttribute("department").toString().intern() == "other")
                            insertStatement.setString(4, "people");

                        db.insert(insertStatement);
                    } catch (Exception e) {
                        e.printStackTrace();
                        out.print(e.getMessage());
                    }
                }
                db.close();
                out.print("success");
            }
        } else if (request.getServletPath().intern() == "/searchBooks") {
            String searchTerm = "%" + request.getParameter("search_term") + "%";
            int startRows = Integer.parseInt(request.getParameter("start_record"));

            DatabaseManager db = new DatabaseManager();
            if (db.success.intern() == "success") {
                try {

                    String searchQuery = "SELECT name,author, quantity, sno,contribute_to,email FROM public.book_list WHERE (name ILIKE ? OR author ILIKE ?);";
                    //paid, unpaid and total nt searchable
                    PreparedStatement selectStatement = db.con.prepareStatement(searchQuery);
                    selectStatement.setString(1, searchTerm);
                    selectStatement.setString(2, searchTerm);
/*

                    selectStatement.setInt(3, startRows);
                    startRows += 30; //setting limit to 30 rows
                    selectStatement.setInt(4, startRows);
*/

                    ResultSet rs = db.select(selectStatement);

                    JSONArray records = new JSONArray();
                    if (rs != null) {
                        while (rs.next()) {
                            JSONObject jsonRecord = new JSONObject();
                            jsonRecord.put("name", rs.getString("name"));
                            jsonRecord.put("author", rs.getString("author"));
                            jsonRecord.put("quantity", rs.getString("quantity"));
                            jsonRecord.put("sno", rs.getString("sno"));
                            jsonRecord.put("email", rs.getString("email"));

                            if (rs.getString("contribute_to").intern() == "people")
                                jsonRecord.put("color", "red-text");
                            else
                                jsonRecord.put("color", "green-text");

                            records.put(jsonRecord);
                        }
                    }
                    out.print(records);
                } catch (Exception e) {
                    e.printStackTrace();
                    out.print("error");
                }
            }
            db.close();
        }
    }

}
