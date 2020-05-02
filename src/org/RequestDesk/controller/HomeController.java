package org.RequestDesk.controller;

import org.RequestDesk.beans.RequestType;
import org.RequestDesk.dao.HomeDao;
import org.RequestDesk.misc.AuthorizeUtil;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class HomeController extends HttpServlet 
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
    	System.out.println("Enter doGet for Home Controller");
    	AuthorizeUtil.AuthorizedRedirect(request, response);
    	
    	HomeDao homeDao = new HomeDao();
    	
    	ArrayList requestTypes = homeDao.GetRequestTypes();
    	request.setAttribute("requestTypes", requestTypes); 
		
        RequestDispatcher rd = request.getRequestDispatcher("/Home.jsp"); 
        rd.include(request, response);
    }
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
    	AuthorizeUtil.FixUtf8(response);
    	System.out.println("Enter doPost for Home Controller");
    }
}
