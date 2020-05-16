package org.RequestDesk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.RequestDesk.beans.Group;
import org.RequestDesk.conn.ConnectionUtils;

public class AdminGroupsDao 
{
	public static ArrayList GetGroups()
    {
		ArrayList<Group> groups = new ArrayList<Group>();
		
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            pstmt = conn.prepareStatement("SELECT * from groups");
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next())
            {
            	if(rs.getInt("id") == 1) continue;
	            Group group = new Group();
	            group.SetId(rs.getInt("id"));
	            group.SetName(rs.getString("name"));
	            group.SetCreatedDate(rs.getString("createddate"));
	            groups.add(group);
            }
        }
		catch(Exception e)
        {
            e.printStackTrace();
        }
		
		return groups;
    }
}
