package org.RequestDesk.dao;

import org.RequestDesk.beans.Group;
import org.RequestDesk.beans.Request;
import org.RequestDesk.beans.RequestStatus;
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
                request.SetSolution(rs.getString("solution"));
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
	
	public static RequestStatus GetRequestStatus(Integer requeststatus)
	{
		RequestStatus status = null;
		
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            pstmt = conn.prepareStatement("select * from requeststatuses where id=?"); 
            pstmt.setInt(1, requeststatus);
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next())
            {
            	status = new RequestStatus();
            	status.SetId(rs.getInt("id"));
            	status.SetName(rs.getString("name"));
            	status.SetColor(rs.getInt("color"));
            } 
           
            pstmt.close();
            conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
		
		return status;
	}
	
	public static Group GetRequestGroup(Integer requestgroup)
	{
		Group group = null;
		
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            pstmt = conn.prepareStatement("select * from groups where id=?"); 
            pstmt.setInt(1, requestgroup);
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next())
            {
            	group = new Group();
            	group.SetId(rs.getInt("id"));
            	group.SetName(rs.getString("name"));
            } 
           
            pstmt.close();
            conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
		
		return group;
	}
}
