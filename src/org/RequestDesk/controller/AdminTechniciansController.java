package org.RequestDesk.controller;

import org.RequestDesk.beans.User;
import org.RequestDesk.beans.UserGroup;
import org.RequestDesk.dao.AdminTechniciansDao;
import org.RequestDesk.dao.RequestsDao;
import org.RequestDesk.misc.AuthorizeUtil;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminTechniciansController extends HttpServlet 
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
    	System.out.println("Enter doGet for Admin Technicians Controller");
    	AuthorizeUtil.AuthorizedRedirect(request, response);
    	
    	ArrayList<User> technicians = AdminTechniciansDao.GetTechnicians();
    	request.setAttribute("technicians", technicians); 
    	
        RequestDispatcher rd = request.getRequestDispatcher("AdminTechnicians.jsp"); 
        rd.include(request, response);
    }
	
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
    	AuthorizeUtil.FixUtf8(response);
    	System.out.println("Enter doPost for Admin Technicians Controller");
    }
}