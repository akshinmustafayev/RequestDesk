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
import org.RequestDesk.dao.NewRequestDao;
import org.RequestDesk.misc.AuthorizeUtil;
import org.RequestDesk.misc.TimeUtil;

public class NewRequestController extends HttpServlet  
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
        System.out.println("Enter doGet for New Request Controller");
        AuthorizeUtil.AuthorizedRedirect(request, response);
        
        
        
        RequestDispatcher rd = request.getRequestDispatcher("/NewRequest.jsp"); 
        rd.include(request, response);
    }
	
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
    	AuthorizeUtil.FixUtf8(response);
    	
		if(request.getParameter("newrequest_button") != null && 
				request.getParameter("requestTopic") !=null && 
				request.getParameter("requestPriority") !=null && 
				request.getParameter("requestDescription") != null)
		{
			String requesttopic = request.getParameter("requestTopic");
			Integer requestpriority = Integer.parseInt(request.getParameter("requestPriority"));
			String requestdescription = request.getParameter("requestDescription");
			User userBean = AuthorizeUtil.AuthorizeUser(request, response);
			
			Request _request = new Request();
			_request.SetTopic(requesttopic);
			_request.SetDescription(requestdescription);
			_request.SetCreatedDate(TimeUtil.GetTimeNow());
			_request.SetAuthor(userBean.GetId());
			_request.SetStatus(0);
			_request.SetPriority(requestpriority);
			
			NewRequestDao newRequestDao = new NewRequestDao();
			Boolean requestCreated = newRequestDao.CreateNewRequest(_request); 
		    
		    if(requestCreated.equals(true))
		    {
		    	response.sendRedirect(request.getContextPath() + "/home");
		    }
		    else
		    {
		    	request.setAttribute("RequestCreationError", true); 
		        RequestDispatcher rd = request.getRequestDispatcher("/NewRequest.jsp"); 
		        rd.include(request, response);
		    }
		}
    }
}
