package mainServlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
/**
 *
 * @author Natalie
 */
@WebServlet(urlPatterns = {"/seshaServlet"})
public class seshaServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet seshaServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet seshaServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
           
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String id = request.getParameter("courseID");
            String disp = request.getParameter("displaySection");
            String action = request.getParameter("action");
            String categoryID = request.getParameter("categoryID");
            
            if(action==null)
            {
                action = "shop";
            }
            if(id==null){
                id = "1";
            }
            
            //connect to database to check ownership
            String driver = "org.mariadb.jdbc.Driver";
            try {
                Class.forName(driver);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(seshaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
    
            String dbURL = "jdbc:mariadb://localhost:3306/apollo8_sesha";
            String username = "apollo8";
            String password = "Ea8AHNGh";
            try {
                Connection conn = DriverManager.getConnection(dbURL, username, password);
                Statement stment = conn.createStatement();
                String sectionsQuery = "SELECT * FROM courseOwnership WHERE userID=1 and courseID = "+id;
                ResultSet rs = stment.executeQuery(sectionsQuery);
                
                //decides on going to course ownership or course landing page based on ownership
                
                String url="";
                
                if(action.equals("shop")){
                    url = "/index.jsp";
                   if(categoryID!=null){
                        url+="&categoryID="+categoryID;
                   }
                } else if(action.equals("viewPreview")){                     
                    url = "/content/previewCoursePage.jsp?courseID="+id;
                } else if(action.equals("viewCourse")){                  
                   url = "/content/fullCoursePage.jsp?courseID="+id;
                   if(disp!=null){
                        url+="&displaySection="+disp;
                   }
                } else if(action.equals("myCourses")){
                    url = "/content/myCoursesPage.jsp";
                }
                
                /*if(rs.next()){
                    
                   url = "/content/fullCoursePage.jsp?courseID="+id;
                   if(disp!=null){
                        url+="&displaySection="+disp;
                   }
                }
                else{
                    url = "/content/previewCoursePage.jsp?courseID="+id;
                }*/
                    
                stment.close();
                conn.close();
                
                RequestDispatcher dispatcher = request.getRequestDispatcher(url);
            
                dispatcher.forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(seshaServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
            


    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}