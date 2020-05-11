package org.RequestDesk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.RequestDesk.beans.RequestType;
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
}
