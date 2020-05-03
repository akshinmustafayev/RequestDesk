package org.RequestDesk.dao;

import org.RequestDesk.beans.Request;
import org.RequestDesk.beans.User;
import org.RequestDesk.conn.ConnectionUtils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RequestDao 
{
	public static Request GetRequest(Integer requestid)
	{
		Request request = null;
		
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            pstmt = conn.prepareStatement("select * from requests where id=?"); 
            pstmt.setInt(1, requestid);
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next())
            {
            	request = new Request();
                request.SetId(rs.getInt("id"));
                request.SetTopic(rs.getString("topic"));
                request.SetDescription(rs.getString("description"));
                request.SetCreatedDate(rs.getString("createddate"));
                request.SetAuthor(rs.getInt("author"));
                request.SetStatus(rs.getInt("status"));
                request.SetPriority(rs.getInt("priority"));
                request.SetRequestGroup(rs.getInt("requestgroup"));
                request.SetRequestType(rs.getInt("requesttype"));
                request.SetAssigned(rs.getInt("assigned"));
            } 
           
            pstmt.close();
            conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
		
		return request;
	}
}
