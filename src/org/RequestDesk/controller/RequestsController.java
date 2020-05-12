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

import org.RequestDesk.beans.Request;
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

        HttpSession session = request.getSession();

        if(request.getParameter("requestsgroup") != null &&
        		request.getParameter("requestsgroup") != "")
        {
        	session.removeAttribute("requestsgroup");
        	session.setAttribute("requestsgroup", request.getParameter("requestsgroup"));
        }
        Integer requestsgroup = -1;
        try
        {
        	requestsgroup = Integer.parseInt(session.getAttribute("requestsgroup").toString());
        }
        catch  (NumberFormatException e)
        {
        	requestsgroup = -1;
        	session.setAttribute("requestsgroup", -1);
        }
        
        User user = AuthorizeUtil.AuthorizeUser(request, response);
        ArrayList<UserGroup> usergroups = RequestsDao.GetUserGroups(user.GetId());
        ArrayList<Request> requests = RequestsDao.GetRequests(requestsgroup, user);
        RequestsDao.UpdateUserRequestsGroup(requestsgroup, user);
        request.setAttribute("userGroups", usergroups); 
        request.setAttribute("userRequests", requests);
        if(requestsgroup < 0)
        {
        	request.setAttribute("userCurrentGroup", requestsgroup.toString());
        }
        else
        {
        	request.setAttribute("userCurrentGroup", RequestsDao.GetUserCurrentRequestsGroup(requestsgroup));
        }
        
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
