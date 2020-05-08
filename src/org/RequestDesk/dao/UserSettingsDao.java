package org.RequestDesk.dao;

import org.RequestDesk.beans.User;
import org.RequestDesk.conn.ConnectionUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserSettingsDao 
{
	/**
	Function for User authorization which gets all User information.
	This function should be checked if Null result returned.
	@param	user	User bean class
	@param	language	Language which should be set
	@return Returns true if language changed, else it returns false
	*/
	public Boolean UpdateLanguage(User user, String language)
    {
        String login = user.GetLogin();
        try
        {
        	Connection conn = ConnectionUtils.getConnection();
        	PreparedStatement pstmt = null;
        	pstmt = conn.prepareStatement("UPDATE users SET language=? WHERE login=?"); 
        	pstmt.setString(1, language);
        	pstmt.setString(2, login);
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
