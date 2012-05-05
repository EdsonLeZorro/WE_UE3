package webapp.servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import webapp.model.Bean;

public class Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    public Servlet() {
        super();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }

    /*
     * Processes GET requests, i.e., initial request
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(true);

        if (session.getAttribute("gameBean") == null) {
            Bean gb = new Bean();
            session.setAttribute("gameBean", gb);
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Game.jsp");
        dispatcher.forward(request, response);
    }

    /*
     * Processes POST requests, i.e., restart game requests and dice requests
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession(true);
        Bean gb = null;
        
        if (request.getParameter("action").equals("restart")) {
            gb = new Bean();
        }
        else if (request.getParameter("action").equals("act")) {
            gb = (Bean) session.getAttribute("gameBean");
            if (gb != null) {
                gb.rollDice();   
            }
        }

        session.setAttribute("gameBean", gb);
        
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Game.jsp");
        dispatcher.forward(request, response);
    }
}