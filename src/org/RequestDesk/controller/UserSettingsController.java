package org.RequestDesk.controller;

import org.RequestDesk.beans.User;
import org.RequestDesk.dao.UserSettingsDao;
import org.RequestDesk.misc.AuthorizeUtil;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserSettingsController extends HttpServlet 
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
    	System.out.println("Enter doGet for UserSettings Controller");
    	AuthorizeUtil.AuthorizedRedirect(request, response);
    	
    	
        RequestDispatcher rd = request.getRequestDispatcher("/UserSettings.jsp"); 
        rd.include(request, response);
        //request.getRequestDispatcher("/Login.jsp").forward(request, response);
    }
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException 
    {
    	AuthorizeUtil.FixUtf8(response);
		if(request.getParameter("language_set_button") != null && 
				request.getParameter("language") != null &&
				request.getParameter("language") != "")
		{
			String language = request.getParameter("language");
			System.out.println(language);
			
			User userBean = AuthorizeUtil.AuthorizeUser(request, response);

			if (userBean != null)
			{
				UserSettingsDao userSettingsDao = new UserSettingsDao(); 
				Boolean changeLang = userSettingsDao.UpdateLanguage(userBean, language); 

			    if(changeLang.equals(false))
			    {
			    	request.setAttribute("LangErrorHappened", true); 
			    	request.setAttribute("language", language); 
			        RequestDispatcher rd = request.getRequestDispatcher("UserSettings.jsp"); 
			        rd.include(request, response);
			    }
			    else
			    {
			    	request.setAttribute("LangChangeSuccess", true);  
			    	request.setAttribute("language", language); 
			    	System.out.println(language);
			        RequestDispatcher rd = request.getRequestDispatcher("UserSettings.jsp"); 
			        rd.include(request, response);
			    }
			}
		}
    }
}
