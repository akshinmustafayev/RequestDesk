package org.RequestDesk.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.RequestDesk.beans.Request;
import org.RequestDesk.beans.User;
import org.RequestDesk.conn.ConnectionUtils;

public class NewRequestDao 
{
	public Boolean CreateNewRequest(Request _request)
    {
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            pstmt = conn.prepareStatement("insert into requests (topic, description, createddate, author, status, priority, requesttype) values (?, ?, ?, ?, ?, ?, ?)"); 
            pstmt.setString(1, _request.GetTopic());
            pstmt.setString(2, _request.GetDescription());
            pstmt.setString(3, _request.GetCreatedDate());
            pstmt.setInt(4, _request.GetAuthor());
            pstmt.setInt(5, _request.GetStatus());
            pstmt.setInt(6, _request.GetPriority());
            pstmt.setInt(7, _request.GetRequestType());
        	pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            return true;
        }
	    catch(Exception e)
	    {
	        e.printStackTrace();
	    }
		
		return false;
    }
}
