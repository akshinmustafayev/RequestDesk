package org.RequestDesk.misc;

import org.RequestDesk.beans.User;
import org.RequestDesk.conn.ConnectionUtils;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/** Represents Authorization functions
	@author Akshin A. Mustafayev
	@version 1.0
*/
public class AuthorizeUtil 
{
	/**
	Function for User authorization which gets all User information.
	@param	request	Default HttpServletRequest
	@param	response	Default HttpServletResponse
	@return Returns User bean class
	*/
	public static User AuthorizeUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
		User userBean = new User();
		HttpSession session = request.getSession();
		
		String sessionLogin = (String) session.getAttribute("login");
		String sessionSession = (String) session.getAttribute("session");
		
		try
        {
			Connection conn = ConnectionUtils.getConnection();
			PreparedStatement pstmt = null;
			
			pstmt = conn.prepareStatement("select * from users where login=? and session=?"); 
            pstmt.setString(1, sessionLogin);
            pstmt.setString(2, sessionSession);
            
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next())
            {
            	userBean.SetLogin((String)rs.getString("login"));
            	userBean.SetEmail((String)rs.getString("email"));
                userBean.SetFullName(rs.getString("fullname"));
                userBean.SetLastLoginDate(rs.getString("lastlogindate"));
                userBean.SetLanguage(rs.getString("language"));
                userBean.SetSession(rs.getString("session"));
                userBean.SetLanguage(rs.getString("language"));
                userBean.SetUserRole(rs.getInt("userrole"));
                return userBean;
            }
            
        }
		catch(Exception e)
        {
            e.printStackTrace();
            return null;
        }
		return null;
    }
	
	/**
	Function for checking if User is authorized and if not forward to /login page.
	This function should be used everywhere.
	@param	request	Default HttpServletRequest
	@param	response	Default HttpServletResponse
	*/
	public static void AuthorizedRedirect(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        String login = (String) session.getAttribute("login");
    	String sessionc = (String) session.getAttribute("session");
    	String fullname = (String) session.getAttribute("fullname");
        if (login == null || sessionc == null || fullname == null) 
        {
        	response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT);
			response.setHeader("Location", request.getContextPath() + "/login");
        }
    }
	
	/**
	Function for checking if User authorized but pointed to /login page, 
	and if yes, redirect user to /home page.
	@param	request	Default HttpServletRequest
	@param	response	Default HttpServletResponse
	*/
	public static void AuthorizedRedirectLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        HttpSession session = request.getSession();
        String login = (String) session.getAttribute("login");
    	String sessionc = (String) session.getAttribute("session");
    	String fullname = (String) session.getAttribute("fullname");
        if (login != null && sessionc != null & fullname != null) 
        {
        	response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT);
			response.setHeader("Location", request.getContextPath() + "/home");
        }
    }
	
	/**
	Function for checking if User pointed to .jsp page itself, 
	and if yes, redirect user to its alias page configured in web.xml.
	For example "Home.jsp" redirect to "/home".
	@param	request	Default HttpServletRequest
	@param	response	Default HttpServletResponse
	@param	pagename	Full .jsp page name
	@param	pagedestination	Destination to the alias of the given .jsp page 
	*/
	public static void UserLoadedJspRedirect(HttpServletRequest request, HttpServletResponse response, String pagename, String pagedestination) throws ServletException, IOException
    {
		String url = request.getRequestURL().toString();
		if(url.endsWith(pagename))
		{
			response.setStatus(HttpServletResponse.SC_TEMPORARY_REDIRECT);
			response.setHeader("Location", request.getContextPath() + pagedestination);
		}
    }
	
	/**
	Function for fixing UTF-8 for page. 
	Required to declare at he beginning of the doPost() and doGet() functions,
	of the Servlet. Without this pages do not show pages in other languages.
	@param	response	Default HttpServletResponse
	*/
	public static void FixUtf8(HttpServletResponse response) throws ServletException, IOException
    {
		response.setCharacterEncoding("UTF-8");
    }
}
