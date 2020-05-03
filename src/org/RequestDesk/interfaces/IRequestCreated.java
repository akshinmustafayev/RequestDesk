package org.RequestDesk.interfaces;

import org.RequestDesk.beans.Request;

public interface IRequestCreated 
{
    public Boolean CreateNewRequest(Request _request);
    public Integer GetCreatedRequestID();
}
