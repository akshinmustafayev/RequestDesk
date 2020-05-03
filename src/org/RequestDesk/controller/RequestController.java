package org.RequestDesk.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.RequestDesk.beans.Request;
import org.RequestDesk.beans.User;
import org.RequestDesk.dao.RequestDao;
import org.RequestDesk.misc.AuthorizeUtil;

public class RequestController extends HttpServlet  
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
        System.out.println("Enter doGet for Request Controller");
        AuthorizeUtil.AuthorizedRedirect(request, response);
        
        if(request.getParameter("requestid") != null)
        {
        	Integer requestID = Integer.parseInt(request.getParameter("requestid"));
        	Request _request = RequestDao.GetRequest(requestID);
        	User user = AuthorizeUtil.GetUserById(_request.GetAuthor());
        	if(_request != null)
        	{
        		request.setAttribute("request", _request);
        		if (user == null)
        		{
        			user = new User();
                	user.SetLogin("User Not Found");
                	user.SetEmail("User Not Found");
                	user.SetFullName("User Not Found");
                	user.SetLastLoginDate("User Not Found");
        		}
        		request.setAttribute("user", user);
        	}
        	else
        	{
        		response.sendRedirect(request.getContextPath() + "/home");
        	}
        }
        
        
        RequestDispatcher rd = request.getRequestDispatcher("/Request.jsp"); 
        rd.include(request, response);
    }
	
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
    	AuthorizeUtil.FixUtf8(response);
    	
    }
}
