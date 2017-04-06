package com.cfranc.UserManager;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cfranc.UserManger.model.ListeUtilisateur;
import com.cfranc.UserManger.model.Utilisateur;


@WebServlet("/AllUsers")
public class AllUsers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllUsers() {
        super();
    }

	private ListeUtilisateur getStaticUsers() {
		ListeUtilisateur users = new ListeUtilisateur();
    	Utilisateur bobby = new Utilisateur();
    	bobby.setId(1);
    	bobby.setFirstname("Bobby");
    	bobby.setLastname("Johnson");
    	bobby.setAge(36);
    	bobby.setEmail("robert@johnson.name");
    	bobby.setPassword("mdp");
    	bobby.setAddress("5 rue des bouchers");
    	bobby.setCity("Strasbourg");
    	bobby.setCoord(ConvertAdressCoord.getCoordFromAdress(bobby.getAddress()+" "+bobby.getCity()));
    	users.put(bobby.getId(), bobby);
    	
    	Utilisateur johnny = new Utilisateur();
    	johnny.setId(2);
    	johnny.setFirstname("Johnny");
    	johnny.setLastname("Johnson");
    	johnny.setAge(42);
    	johnny.setEmail("johnny@johnson.name");
    	johnny.setPassword("mdp");
    	johnny.setAddress("5 rue des bouchers");
    	johnny.setCity("Strasbourg");
    	johnny.setCoord(ConvertAdressCoord.getCoordFromAdress(johnny.getAddress()+" "+johnny.getCity()));
    	
    	users.put(johnny.getId(), johnny);
    	
    	Utilisateur steve = new Utilisateur();
    	steve.setId(3);
    	steve.setFirstname("Steve");
    	steve.setLastname("Johnson");
    	steve.setAge(47);
    	steve.setEmail("steve@johnson.name");
    	steve.setPassword("mdp");
    	steve.setAddress("5 rue des bouchers");
    	steve.setCity("Strasbourg");
    	steve.setCoord(ConvertAdressCoord.getCoordFromAdress(steve.getAddress()+" "+steve.getCity()));
    	
    	users.put(steve.getId(), steve);
    	
    	Utilisateur bill = new Utilisateur();
    	bill.setId(4);
    	bill.setFirstname("Bill");
    	bill.setLastname("Johnson");
    	bill.setAge(59);
    	bill.setEmail("bill@johnson.name");
    	bill.setPassword("mdp");
    	bill.setAddress("5 rue des bouchers");
    	bill.setCity("Strasbourg");
    	bill.setCoord(ConvertAdressCoord.getCoordFromAdress(bill.getAddress()+" "+bill.getCity()));
    
    	users.put(bill.getId(), bill);
    	
    	System.out.print(users.nextId());
    	
		return users;
	}
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("users") == null){	
			ListeUtilisateur users = getStaticUsers();
			session.setAttribute("users", users);
			System.out.println("Session users created");
		}
		RequestDispatcher dispatch = request.getRequestDispatcher("WEB-INF/views/Users.jsp");
		dispatch.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
