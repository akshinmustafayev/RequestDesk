package org.RequestDesk.controller;

import org.RequestDesk.beans.User;
import org.RequestDesk.dao.LoginDao;
import org.RequestDesk.misc.AuthorizeUtil;
import org.RequestDesk.misc.HashUtil;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
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
		    
		    User userBean = new User();
		    userBean.SetLogin(login);
		    userBean.SetPassword(password);
		    userBean.SetSession(HashUtil.GetSHA256());
		    
		    LoginDao loginDao = new LoginDao(); 
		    
		    Boolean authorize = loginDao.AuthorizeLogin(userBean); 
		    
		    if(authorize.equals(true))
		    {
		        HttpSession session = request.getSession();
		        session.setAttribute("login", userBean.GetLogin());
		        session.setAttribute("session", userBean.GetSession());
		        session.setAttribute("fullname", userBean.GetFullName());
		        session.setAttribute("lastlogindate", userBean.GetLastLoginDate());
		        session.setAttribute("language", userBean.GetLanguage());
		        
		        Cookie cookieLogin = new Cookie("login", userBean.GetLogin());
		        Cookie cookieSession = new Cookie("session", userBean.GetSession());
		        Cookie cookieFullName = new Cookie("fullname", userBean.GetFullName());
		        Cookie cookieLanguage = new Cookie("language", userBean.GetLanguage());
		        cookieLogin.setMaxAge(24 * 60 * 60);
		        response.addCookie(cookieLogin);
		        cookieSession.setMaxAge(24 * 60 * 60);
		        response.addCookie(cookieSession);
		        cookieFullName.setMaxAge(24 * 60 * 60);
		        response.addCookie(cookieFullName);
		        cookieLanguage.setMaxAge(24 * 60 * 60);
		        response.addCookie(cookieLanguage);
		        
		        response.sendRedirect(request.getContextPath() + "/home");
		    }
		    else
		    {
		        request.setAttribute("WrongLoginMsg", true); 
		        RequestDispatcher rd = request.getRequestDispatcher("/Login.jsp"); 
		        rd.include(request, response);
		    }
		}
    }
}
