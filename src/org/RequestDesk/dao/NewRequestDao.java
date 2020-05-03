package org.RequestDesk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.RequestDesk.beans.Request;
import org.RequestDesk.conn.ConnectionUtils;
import org.RequestDesk.interfaces.IRequestCreated;

import com.mysql.jdbc.Statement;

public class NewRequestDao implements IRequestCreated
{
	private Integer RequestID = 0;
	
	@Override
	public Boolean CreateNewRequest(Request _request)
    {
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            pstmt = conn.prepareStatement("insert into requests (topic, description, createddate, author, status, priority, requesttype) values (?, ?, ?, ?, ?, ?, ?)", Statement.RETURN_GENERATED_KEYS); 
            pstmt.setString(1, _request.GetTopic());
            pstmt.setString(2, _request.GetDescription());
            pstmt.setString(3, _request.GetCreatedDate());
            pstmt.setInt(4, _request.GetAuthor());
            pstmt.setInt(5, _request.GetStatus());
            pstmt.setInt(6, _request.GetPriority());
            pstmt.setInt(7, _request.GetRequestType());
        	pstmt.executeUpdate();
        	ResultSet rs = pstmt.getGeneratedKeys();
            if(rs.next())
            {
                //int last_inserted_id = rs.getInt(1);
                //int requestid = (int) rs.getLong(1);
                RequestID = (int) rs.getLong(1);
            }
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
	
	@Override
	public Integer GetCreatedRequestID()
    {
		return RequestID;
    }
}
