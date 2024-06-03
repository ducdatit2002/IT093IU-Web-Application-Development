import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class EmailServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
        // Get parameters from request
        String email = request.getParameter("email");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        
        // Validate parameters (basic example)
        if(email == null || !email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            // Invalid email
            out.println("<p>Invalid email format. Please go back and try again.</p>");
        } else if(firstName == null || firstName.trim().isEmpty()) {
            // Invalid first name
            out.println("<p>First name is required. Please go back and try again.</p>");
        } else if(lastName == null || lastName.trim().isEmpty()) {
            // Invalid last name
            out.println("<p>Last name is required. Please go back and try again.</p>");
        } else {
            // Everything is valid, forward to thank you page
            request.setAttribute("email", email);
            request.setAttribute("firstName", firstName);
            request.setAttribute("lastName", lastName);
            RequestDispatcher dispatcher = request.getRequestDispatcher("thankYou.jsp");
            dispatcher.forward(request, response);
        }
    }
}

