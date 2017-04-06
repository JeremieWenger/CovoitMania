package com.cfranc.UserManager;

import java.io.IOException;
import java.util.HashMap;

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
 * Servlet implementation class DeleteUser
 */
@WebServlet("/DeleteUser")
public class DeleteUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteUser() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    private Utilisateur getUtilisateurFromContext(HttpServletRequest request){
    	String userId = request.getParameter("user");
		if(userId == null)
		{
			return null;
		}
		else
		{
			HttpSession session = request.getSession();
			ListeUtilisateur users = (ListeUtilisateur)session.getAttribute("users");	
			long id = Long.parseLong(userId);	
			Utilisateur user = users.get(id);
			return user;
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utilisateur user = getUtilisateurFromContext(request); 
		if(user == null)
		{
			getServletContext().setAttribute("error", "User doesn't exist");
			response.sendRedirect("AllUsers");
		}
		else
		{
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/UserDelete.jsp");
			dispatch.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Utilisateur user = getUtilisateurFromContext(request); 
		if(user == null)
		{
			getServletContext().setAttribute("error", "User doesn't exist");
			response.sendRedirect("AllUsers");
		}
		else
		{
			HttpSession session = request.getSession();
			ListeUtilisateur users = (ListeUtilisateur)session.getAttribute("users");	
				
			users.remove(user.getId());
			
			System.out.println("User " + user.getId() + " has been deleted");
			System.out.println(users.get(user.getId()));
			assert(users.get(user.getId()) == null);
			getServletContext().setAttribute("sucess", "The user has been deleted");
			response.sendRedirect("AllUsers");
		}
	}

}
