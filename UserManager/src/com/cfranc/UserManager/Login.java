package com.cfranc.UserManager;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cfranc.UserManger.model.ListeUtilisateur;
import com.cfranc.UserManger.model.Utilisateur;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/Login.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		ListeUtilisateur users = (ListeUtilisateur)session.getAttribute("users");
		String email = request.getParameter("email").trim();
		String password=request.getParameter("password").trim();
		for (Utilisateur user : users.values()){
			if (email.equals(user.getEmail())){
				if(user.getPassword().equals(password)){
					RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/Logged.jsp");
					dispatch.forward(request, response);
				}
				else 
					break;}	
			}
			getServletContext().setAttribute("error", "Mauvaise combinaison email, mot de passe. Veuillez reessayer");
			response.sendRedirect("Login");
		}
		
	}


