package org.RequestDesk.controller;

import org.RequestDesk.beans.Group;
import org.RequestDesk.dao.AdminGroupsDao;
import org.RequestDesk.misc.AuthorizeUtil;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminGroupsController extends HttpServlet 
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
    	System.out.println("Enter doGet for Admin Groups Controller");
    	AuthorizeUtil.AuthorizedRedirect(request, response);
    	
    	ArrayList<Group> groups = AdminGroupsDao.GetGroups();
    	request.setAttribute("groups", groups); 
    	
        RequestDispatcher rd = request.getRequestDispatcher("AdminGroups.jsp"); 
        rd.include(request, response);
    }
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
    	AuthorizeUtil.FixUtf8(response);
    	System.out.println("Enter doPost for Admin Groups Controller");
    }
}