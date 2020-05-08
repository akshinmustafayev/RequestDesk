package org.RequestDesk.dao;

import org.RequestDesk.beans.RequestType;
import org.RequestDesk.beans.User;
import org.RequestDesk.conn.ConnectionUtils;
import org.RequestDesk.misc.HashUtil;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class HomeDao {
	public ArrayList GetRequestTypes()
    {
		ArrayList<RequestType> requestTypes = new ArrayList<RequestType>();
		
		try
        {
        	Connection conn = ConnectionUtils.getConnection();
            PreparedStatement pstmt = null;
            
            pstmt = conn.prepareStatement("select * from requeststypes");
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next())
            {
            	RequestType reqquestType = new RequestType();
            	reqquestType.SetId(rs.getInt("id"));
            	reqquestType.SetName(rs.getString("name"));
            	reqquestType.SetDescription(rs.getString("description"));
            	reqquestType.SetCreatedDate(rs.getString("createddate"));
            	reqquestType.SetNeedApproval(rs.getBoolean("needapproval"));
            	requestTypes.add(reqquestType);
            }
        }
		catch(Exception e)
        {
            e.printStackTrace();
        }
		
		return requestTypes;
    }
}
