package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logica.Controladora;
import logica.Empleado;
import logica.Usuario;

@WebServlet(name = "SvEliminarEmpleado", urlPatterns = {"/SvEliminarEmpleado"})
public class SvEliminarEmpleado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SvEliminarEmpleado</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SvEliminarEmpleado at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Controladora control = new Controladora();
        Empleado emple = control.buscarEmpleado(id);
        Usuario usu = emple.getUsu();
        usu.setHabilitado(false);
        emple.setHabilitado(false);
        control.modificarEmpleado(emple);
        control.modificarUsuario(usu);
        request.getSession().setAttribute("listaEmpleados", control.traerEmpleados());
        response.sendRedirect("listadoEmpleados.jsp");
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
