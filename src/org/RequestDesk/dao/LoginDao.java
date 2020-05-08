package org.RequestDesk.dao;

import org.RequestDesk.beans.User;
import org.RequestDesk.conn.ConnectionUtils;
import org.RequestDesk.misc.TimeUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDao
{
	/**
	Function for User login.
	Updates session when login is successful.
	@param	user	User bean class
	@return Returns true if login process successful, else it returns false
	*/
	public Boolean AuthorizeLogin(User user)
    {
        String login = user.GetLogin();
        String password = user.GetPassword();
        String session = user.GetSession();
        String timenow = TimeUtil.GetTimeNow();
        
        try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            String dblogin = "";
            String dbpassword = "";
            
            pstmt = conn.prepareStatement("select * from users where login=? and password=?"); 
            pstmt.setString(1, login);
            pstmt.setString(2, password);
            
            ResultSet rs = pstmt.executeQuery();
            
            while(rs.next())
            {    
            	dblogin = rs.getString("login");   
                dbpassword = rs.getString("password");
                
                user.SetEmail(rs.getString("email"));
                user.SetFullName(rs.getString("fullname"));
                user.SetLastLoginDate(rs.getString("lastlogindate"));
                user.SetLanguage(rs.getString("language"));
                
                if(login.equals(dblogin) && password.equals(dbpassword))
                {
                	PreparedStatement pstmt2 = null;
                	pstmt2 = conn.prepareStatement("UPDATE users SET session=?, lastlogindate=? WHERE login=?"); 
                    pstmt2.setString(1, session);
                	pstmt2.setString(2, timenow);
                	pstmt2.setString(3, login);
                	pstmt2.executeUpdate();
                    pstmt2.close();
                    return true;
                }
                else
                	return false;
            } 
           
            pstmt.close();
            conn.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return false;
    }
}
