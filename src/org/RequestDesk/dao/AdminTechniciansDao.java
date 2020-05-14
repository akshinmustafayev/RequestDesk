package org.RequestDesk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.RequestDesk.beans.User;
import org.RequestDesk.beans.UserRole;
import org.RequestDesk.conn.ConnectionUtils;

public class AdminTechniciansDao 
{
	public static ArrayList GetTechnicians()
    {
		ArrayList<User> technicians = new ArrayList<User>();
		
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            pstmt = conn.prepareStatement("SELECT userroles.*, IFNULL(users.id, -1) as uid, users.email, users.fullname FROM userroles left join users on userroles.userid = users.id WHERE userroles.userrole!=1");
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next())
            {
            	if(rs.getInt("id") != -1)
            	{
            		UserRole userRole = new UserRole();
            		userRole.SetId(rs.getInt("id"));
            		userRole.SetUserId(rs.getInt("userid"));
            		userRole.SetUserRole(rs.getInt("userrole"));
            		
	            	User technician = new User();
	            	technician.SetId(rs.getInt("uid"));
	            	technician.SetFullName(rs.getString("fullname"));
	            	technician.SetEmail(rs.getString("email"));
	            	technician.SetUserRole(userRole.GetUserRole());
	            	technician.SetUserRoleName(userRole.GetUserRoleName(userRole.GetUserRole()));
	            	technicians.add(technician);
            	}
            }
        }
		catch(Exception e)
        {
            e.printStackTrace();
        }
		
		return technicians;
    }
}
