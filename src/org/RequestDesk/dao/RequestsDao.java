package org.RequestDesk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.RequestDesk.beans.Request;
import org.RequestDesk.beans.RequestType;
import org.RequestDesk.beans.User;
import org.RequestDesk.beans.UserGroup;
import org.RequestDesk.conn.ConnectionUtils;

public class RequestsDao 
{
	public static ArrayList GetUserGroups(Integer userid)
    {
		ArrayList<UserGroup> userGroups = new ArrayList<UserGroup>();
		
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            pstmt = conn.prepareStatement("SELECT usergroups.id, usergroups.userid, \r\n" + 
            		"CASE\r\n" + 
            		"	WHEN groups.name IS NULL THEN -1\r\n" + 
            		"	ELSE usergroups.groupid\r\n" + 
            		"	END AS groupid,\r\n" + 
            		"IFNULL(groups.name, \"Group not found\") as groupname\r\n" + 
            		"FROM usergroups\r\n" + 
            		"LEFT JOIN groups\r\n" + 
            		"ON usergroups.groupid = groups.id where userid=?");
            pstmt.setInt(1, userid);
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next())
            {
            	if(rs.getInt("groupid") != -1)
            	{
	            	UserGroup userGroup = new UserGroup();
	            	userGroup.SetId(rs.getInt("id"));
	            	userGroup.SetGroupId(rs.getInt("groupid"));
	            	userGroup.SetUserId(rs.getInt("userid"));
	            	userGroup.SetGroupName(rs.getString("groupname"));
	            	userGroups.add(userGroup);
            	}
            }
        }
		catch(Exception e)
        {
            e.printStackTrace();
        }
		
		return userGroups;
    }
	
	public static ArrayList GetRequests(Integer requestsgroup, User user)
    {
		ArrayList<Request> requests = new ArrayList<Request>();
		
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            if(requestsgroup == -1) 
            {
            	pstmt = conn.prepareStatement("select requests.*, IFNULL(users.fullname, \"User not found\") as authorname, IFNULL(u.fullname, \"None\") as assignedname from requests left join users on requests.author = users.id left join users u on requests.assigned = u.id where requests.author=?");
            	pstmt.setInt(1, user.GetId());
            }
            else if(requestsgroup == -2) 
            {
            	pstmt = conn.prepareStatement("select requests.*, IFNULL(users.fullname, \"User not found\") as authorname, IFNULL(u.fullname, \"None\") as assignedname from requests left join users on requests.author = users.id left join users u on requests.assigned = u.id where requests.author=? and requests.status!=3 and requests.status!=6");
            	pstmt.setInt(1, user.GetId());
            }
            else if(requestsgroup == -3) 
            {
            	pstmt = conn.prepareStatement("select requests.*, IFNULL(users.fullname, \"User not found\") as authorname, IFNULL(u.fullname, \"None\") as assignedname from requests left join users on requests.author = users.id left join users u on requests.assigned = u.id where requests.author=? and (requests.status=3 or requests.status=6)");
            	pstmt.setInt(1, user.GetId());
            }
            else if(requestsgroup == -4) 
            {
            	pstmt = conn.prepareStatement("select requests.*, IFNULL(users.fullname, \"User not found\") as authorname, IFNULL(u.fullname, \"None\") as assignedname from requests left join users on requests.author = users.id left join users u on requests.assigned = u.id where requests.author=? and requests.assigned=0");
            	pstmt.setInt(1, user.GetId());
            }
            else if(requestsgroup == -5) 
            {
            	pstmt = conn.prepareStatement("select requests.*, IFNULL(users.fullname, \"User not found\") as authorname, IFNULL(u.fullname, \"None\") as assignedname from requests left join users on requests.author = users.id left join users u on requests.assigned = u.id");
            }
            else
            {
            	pstmt = conn.prepareStatement("select requests.*, IFNULL(users.fullname, \"User not found\") as authorname, IFNULL(u.fullname, \"None\") as assignedname from requests left join users on requests.author = users.id left join users u on requests.assigned = u.id where requests.author=? and requests.usergroup=?");
            	pstmt.setInt(1, user.GetId());
            	pstmt.setInt(2, requestsgroup);
            }
            
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next())
            {
	            Request request = new Request();
	            request.SetId(rs.getInt("id"));
	            request.SetTopic(rs.getString("topic"));
	            request.SetDescription(rs.getString("description"));
	            request.SetCreatedDate(rs.getString("createddate"));
	            request.SetSolution(rs.getString("solution"));
	            request.SetAuthor(rs.getInt("author"));
	            request.SetStatus(rs.getInt("status"));
	            request.SetPriority(rs.getInt("priority"));
	            request.SetUserGroup(rs.getInt("usergroup"));
	            request.SetRequestType(rs.getInt("requesttype"));
	            request.SetAssigned(rs.getInt("assigned"));
	            request.SetAuthorName(rs.getString("authorname"));
	            request.SetAssignedName(rs.getString("assignedname"));
	            requests.add(request);
            }
            pstmt.close();
            conn.close();
        }
		catch(Exception e)
        {
            e.printStackTrace();
        }
		
		return requests;
    }
	
	public static void UpdateUserRequestsGroup(Integer requestsgroup, User user)
    {
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            pstmt = conn.prepareStatement("UPDATE users SET requestsgroup=? WHERE id=?"); 
            pstmt.setInt(1, requestsgroup);
            pstmt.setInt(2, user.GetId());
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
        }
		catch(Exception e)
        {
            e.printStackTrace();
        }
    }
	
	public static String GetUserCurrentRequestsGroup(Integer requestsgroup)
    {
		String currentgroupname = "";
		
		try
        {
            Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
                
            pstmt = conn.prepareStatement("select IFNULL(groups.name, \"User not found\") as name from groups where id=?");
            pstmt.setInt(1, requestsgroup);
                
            ResultSet rs = pstmt.executeQuery();
                
            while(rs.next())
            { 
            	currentgroupname = rs.getString("name");
            }
            
            pstmt.close();
            conn.close();
        }
    	catch(Exception e)
        {
            e.printStackTrace();
        }
		
		return currentgroupname;
    }
}
