package org.RequestDesk.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.RequestDesk.beans.Request;
import org.RequestDesk.conn.ConnectionUtils;
import org.RequestDesk.misc.AuthorizeUtil;

public class GetRequestSolution extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException 
    {
		AuthorizeUtil.FixUtf8(response);
        AuthorizeUtil.AuthorizedRedirect(request, response);

        if(request.getParameter("requestid") != null)
		{
        	Integer requestID = Integer.parseInt(request.getParameter("requestid"));
        	
        	Request _request = new Request();
        	try
        	{
            	Connection conn = ConnectionUtils.getConnection();
                PreparedStatement pstmt = null;
                
                pstmt = conn.prepareStatement("select solution from requests where id=?"); 
                pstmt.setInt(1, requestID);
                ResultSet rs = pstmt.executeQuery();
                
                while(rs.next())
                {
                    _request.SetSolution(rs.getString("solution"));
                } 
               
                pstmt.close();
                conn.close();
            }
            catch(Exception e)
            {
            	_request.SetSolution("Error occured!");
                e.printStackTrace();
            }
        	
        	String result = "{ \"requestid\":" + requestID + ", \"requestsolution\":\"" + _request.GetSolution() + "\" }";
	        PrintWriter out = response.getWriter();
	        out.println(result);
	        
		}
    }
}
