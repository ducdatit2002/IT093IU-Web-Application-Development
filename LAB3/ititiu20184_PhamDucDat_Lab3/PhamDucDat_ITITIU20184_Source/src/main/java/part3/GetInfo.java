/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package part3;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asus
 */
@WebServlet("/GetInfo")
public class GetInfo extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet GetInfo</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GetInfo at " + request.getContextPath() + "</h1>");
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
        processRequest(request, response);
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
        PrintWriter out = response.getWriter();
        String docType
                = "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 "
                + "Transitional//EN\">\n";
        out.println(docType
                + "<HTML>\n"
                + "<HEAD><TITLE>Result Personal Info</TITLE></HEAD>\n"
                + "<STYLE>\n"
                + "* {"
                + "text-align: left"
                + "}\n"
                + "body {"
                + "background-color: #fcecab;\n"
                + "}\n"
                + "table {"
                + "border: 2px solid black;\n"
                + "margin-left: 570px;"
                + "}\n"
                + "tr, th, td {"
                + "border: 2px solid black"
                + "}\n"
                + "h1 {"
                + "text-align: center"
                + "}"
                + "</STYLE>\n"
                + "<BODY>\n"
                + "<H1>Reading Personal Information</H1>\n"
                + "<div class=container>"
                + "<table>\n"
                + " <tr>\n"
                + " <th>ID</th>\n"
                + " <td>"
                + request.getParameter("id")
                + " </td>\n"
                + " </tr>\n"
                + " <tr>\n"
                + " <th>Name</th>\n"
                + " <td>"
                + request.getParameter("fullname")
                + " </td>\n"
                + " </tr>\n"
                + " <tr>\n"
                + " <th>Email</th>\n"
                + " <td>"
                + request.getParameter("email")
                + " </td>\n"
                + " </tr>\n"
                + " <tr>\n"
                + " <th>Gender</th>\n"
                + " <td>"
                + request.getParameter("gender")
                + " </td>\n"
                + " </tr>\n"
                + " <tr>\n"
                + " <th>Major</th>\n"
                + " <td>"
                + request.getParameter("major")
                + " </td>\n"
                + " </tr>\n"
                + " <tr>\n"
                + " <th>Interesting Field</th>\n"
                + " <td>"
                + request.getParameter("comment")
                + " </td>\n"
                + " </tr>\n"
                + "</table>\n"
                + "</div>"
                + "</BODY></HTML>");
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
