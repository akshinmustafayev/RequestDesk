package org.RequestDesk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import org.RequestDesk.beans.User;
import org.RequestDesk.conn.ConnectionUtils;

public class AdminUsersDao 
{
	public static ArrayList GetUsers()
    {
		ArrayList<User> users = new ArrayList<User>();
		
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            pstmt = conn.prepareStatement("SELECT userroles.*, IFNULL(users.id, -1) as uid, users.email, users.lastlogindate, users.login, users.fullname FROM userroles left join users on userroles.userid = users.id WHERE userroles.userrole!=3 and userroles.userrole!=4");
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next())
            {
            	if(rs.getInt("uid") != -1)
            	{
	            	User user = new User();
	            	user.SetId(rs.getInt("uid"));
	            	user.SetFullName(rs.getString("fullname"));
	            	user.SetLogin(rs.getString("login"));
	            	user.SetEmail(rs.getString("email"));
	            	user.SetLastLoginDate(rs.getString("lastlogindate"));
	            	users.add(user);
            	}
            }
        }
		catch(Exception e)
        {
            e.printStackTrace();
        }
		
		return users;
    }
}
