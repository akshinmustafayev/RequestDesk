package org.RequestDesk.controller;

import org.RequestDesk.beans.User;
import org.RequestDesk.dao.LoginDao;
import org.RequestDesk.misc.AuthorizeUtil;
import org.RequestDesk.misc.HashUtil;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginController extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	@Override
	public void init(ServletConfig config) throws ServletException 
	{
        super.init();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException 
    {
    	AuthorizeUtil.FixUtf8(response);
        System.out.println("Enter doGet for Login Controller");
        AuthorizeUtil.AuthorizedRedirectLogin(request, response);
        
        RequestDispatcher rd = request.getRequestDispatcher("Login.jsp"); 
        rd.include(request, response);
    }
	
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
    	AuthorizeUtil.FixUtf8(response);
    	
		if(request.getParameter("login_button") != null && 
				request.getParameter("login") != null && 
				request.getParameter("password") != null &&
				request.getParameter("login") != "" && 
				request.getParameter("password") != "")
		{
		    String login = request.getParameter("login");
		    String password = request.getParameter("password");
		    
		    User user = new User();
		    user.SetLogin(login);
		    user.SetPassword(password);
		    user.SetSession(HashUtil.GetSHA256());
		    
		    LoginDao loginDao = new LoginDao(); 
		    
		    Boolean authorize = loginDao.AuthorizeLogin(user); 
		    
		    if(authorize.equals(true))
		    {
		        HttpSession session = request.getSession();
		        session.setAttribute("login", user.GetLogin());
		        session.setAttribute("session", user.GetSession());
		        session.setAttribute("fullname", user.GetFullName());
		        session.setAttribute("lastlogindate", user.GetLastLoginDate());
		        session.setAttribute("language", user.GetLanguage());
		        session.setAttribute("requestsgroup", (Integer) user.GetRequestsGroup());
		        
		        AuthorizeUtil.SetUserCookie(response, "login", user.GetLogin(), 24 * 60 * 60);
		        AuthorizeUtil.SetUserCookie(response, "session", user.GetSession(), 24 * 60 * 60);
		        AuthorizeUtil.SetUserCookie(response, "fullname", user.GetFullName(), 24 * 60 * 60);
		        AuthorizeUtil.SetUserCookie(response, "language", user.GetLanguage(), 24 * 60 * 60);

		        response.sendRedirect(request.getContextPath() + "/home");
		    }
		    else
		    {
		        request.setAttribute("ErrorWrongLogin", true); 
		        RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp"); 
		        rd.include(request, response);
		    }
		}
    }
}
