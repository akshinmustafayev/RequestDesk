package org.RequestDesk.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.RequestDesk.beans.RequestType;
import org.RequestDesk.beans.User;
import org.RequestDesk.beans.UserGroup;
import org.RequestDesk.dao.RequestsDao;
import org.RequestDesk.misc.AuthorizeUtil;

public class RequestsController extends HttpServlet  
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
        System.out.println("Enter doGet for Requests Controller");
        AuthorizeUtil.AuthorizedRedirect(request, response);
        
        // This piece is not working
        HttpSession session = request.getSession();
        Integer requestsgroup = 0;
        try
        {
        	requestsgroup = (Integer) session.getAttribute("requestsgroup");
        }
        catch  (NumberFormatException e)
        {
        	requestsgroup = 0;
        	session.setAttribute("requestsgroup", 0);
        }
        // up to this
        
        User user = AuthorizeUtil.AuthorizeUser(request, response);
        ArrayList<UserGroup> usergroups = RequestsDao.GetUserGroups(user.GetId());
        request.setAttribute("userGroups", usergroups); 
        
        RequestDispatcher rd = request.getRequestDispatcher("/Requests.jsp"); 
        rd.include(request, response);
    }
	
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
    	AuthorizeUtil.FixUtf8(response);
    	
    }
}
