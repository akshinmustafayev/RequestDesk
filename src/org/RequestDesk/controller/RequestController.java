package org.RequestDesk.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.RequestDesk.beans.Group;
import org.RequestDesk.beans.Request;
import org.RequestDesk.beans.RequestStatus;
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
        
        if(request.getParameter("requestid") != null &&
        		request.getParameter("requestid") != "")
        {
        	Integer requestID = 0;
        	try
        	{
        		requestID = Integer.parseInt(request.getParameter("requestid"));
        	}
        	catch (NumberFormatException e) 
        	{
        		request.setAttribute("ErrorRequestNotNumber", true); 
            	request.getRequestDispatcher("/requests").forward(request, response);
        	}
        	
        	Request _request = RequestDao.GetRequest(requestID);
        	if(_request != null)
        	{
            	User user = AuthorizeUtil.GetUserById(_request.GetAuthor());
            	User assigned = AuthorizeUtil.GetUserById(_request.GetAssigned());
            	RequestStatus status = RequestDao.GetRequestStatus(_request.GetStatus());
            	Group group = RequestDao.GetRequestGroup(_request.GetUserGroup());
            	
        		request.setAttribute("request", _request);
        		if (user == null)
        		{
        			user = new User();
                	user.SetLogin("User Not Found");
                	user.SetEmail("User Not Found");
                	user.SetFullName("User Not Found");
                	user.SetLastLoginDate("User Not Found");
        		}
        		if (assigned == null)
        		{
        			assigned = new User();
        			assigned.SetLogin("Not assigned");
        			assigned.SetEmail("Not assigned");
        			assigned.SetFullName("Not assigned");
        			assigned.SetLastLoginDate("Not assigned");
        		}
        		if (status == null)
        		{
        			status = new RequestStatus();
        			status.SetId(1);
                	status.SetName("None");
                	status.SetColor(0);
        		}
        		if (group == null)
        		{
        			group = new Group();
        			group.SetId(1);
        			group.SetName("None");
        		}
        		request.setAttribute("user", user);
        		request.setAttribute("assigned", assigned);
        		request.setAttribute("status", status);
        		request.setAttribute("group", group);
        	}
        	else
        	{
        		request.setAttribute("ErrorRequestNotFound", true); 
            	request.getRequestDispatcher("/requests").forward(request, response);
        	}
        }
        else
        {
        	request.setAttribute("ErrorEmptyRequestID", true); 
        	request.getRequestDispatcher("/requests").forward(request, response);
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
