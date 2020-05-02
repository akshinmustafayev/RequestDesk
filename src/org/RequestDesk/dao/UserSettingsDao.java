package org.RequestDesk.dao;

import org.RequestDesk.beans.User;
import org.RequestDesk.conn.ConnectionUtils;
import org.RequestDesk.misc.AuthorizeUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserSettingsDao 
{
	public Boolean UpdateLanguage(User userBean, String language)
    {
        String login = userBean.GetLogin();
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
