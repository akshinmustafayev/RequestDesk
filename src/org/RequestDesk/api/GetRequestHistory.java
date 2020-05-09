package org.RequestDesk.api;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.RequestDesk.beans.Request;
import org.RequestDesk.beans.RequestHistory;
import org.RequestDesk.beans.RequestType;
import org.RequestDesk.conn.ConnectionUtils;
import org.RequestDesk.misc.AuthorizeUtil;

public class GetRequestHistory extends HttpServlet 
{
	private static final long serialVersionUID = 1L;
	
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException 
    {
		AuthorizeUtil.FixUtf8(response);
        Boolean authroized = AuthorizeUtil.AuthorizedForAPI(request, response);
        if(authroized == false)
        {
        	String result = "{ \"history\": [ { \"historyid\" : -1 , \"requestid\" : -1 , \"historyaction\" : \"Not Authorized\" , \"historydate\" : \"Not Authorized\" } ] }";
	        PrintWriter out = response.getWriter();
	        out.println(result);
        }

        if(request.getParameter("requestid") != null && request.getParameter("requestid") != "")
		{
        	if(authroized == true)
        	{
        		String history = "{ \"history\": [ ";
	        	Integer requestID = Integer.parseInt(request.getParameter("requestid"));
	        	
	        	ArrayList<RequestHistory> requestHistories = new ArrayList<RequestHistory>();
	        	
	        	try
	        	{
	            	Connection conn = ConnectionUtils.getConnection();
	                PreparedStatement pstmt = null;
	                
	                pstmt = conn.prepareStatement("select * from requestshistory where requestid=?"); 
	                pstmt.setInt(1, requestID);
	                ResultSet rs = pstmt.executeQuery();
	                
	                if (rs.next() == false)
	                {
	                	history = "{ \"history\": [ { \"historyid\" : -2 , \"requestid\" : -2 , \"historyaction\" : \"Request is empty\" , \"historydate\" : \"Request is empty\" }";
	                }
	                
	                while(rs.next())
	                {
	                	RequestHistory requestHistory = new RequestHistory();
	                	requestHistory.SetId(rs.getInt("id"));
	                	requestHistory.SetRequestId(rs.getInt("requestid"));
	                	requestHistory.SetAction(rs.getString("action"));
	                	requestHistory.SetDate(rs.getString("date"));
	                	requestHistories.add(requestHistory);
	                }
	               
	                pstmt.close();
	                conn.close();
	            }
	            catch(Exception e)
	            {
	            	RequestHistory requestHistory = new RequestHistory();
                	requestHistory.SetId(-1);
                	requestHistory.SetRequestId(-1);
                	requestHistory.SetAction("Error occured!");
                	requestHistory.SetDate("Error occured!");
                	requestHistories.add(requestHistory);
	                e.printStackTrace();
	            }
	        	
	        	for (int i = 0; i < requestHistories.size(); i++) 
	        	{
	        		if(i == requestHistories.size() - 1)
	        		{
	        			history = history + "{ \"historyid\" : " + requestHistories.get(i).GetId() + " , \"requestid\" : " + requestHistories.get(i).GetRequestId() + " , \"historyaction\" : \"" + requestHistories.get(i).GetAction() + "\", \"historydate\" : \"" + requestHistories.get(i).GetDate() + "\" }";
	        			
	        		}
	        		else
	        		{
	        			history = history + "{ \"historyid\" : " + requestHistories.get(i).GetId() + " , \"requestid\" : " + requestHistories.get(i).GetRequestId() + " , \"historyaction\" : \"" + requestHistories.get(i).GetAction() + "\", \"historydate\" : \"" + requestHistories.get(i).GetDate() +  "\" }, ";
	        		}
	        	}
	        	
	        	history = history + " ] }";
	        	
		        PrintWriter out = response.getWriter();
		        out.println(history);
        	}
            else
            {
            	String result = "{ \"history\": [ { \"historyid\" : -1 , \"requestid\" : -1 , \"historyaction\" : \"Request ID Required\" , \"historydate\" : \"Request ID Required\" } ] }";
    	        PrintWriter out = response.getWriter();
    	        out.println(result);
            }
		}
    }
}

