package com.sesoc.ictmd.Interface;

import com.sesoc.ictmd.vo.UserBase;
import com.sesoc.ictmd.vo.UserDetail;

public interface UserDAO {
	public int insertUserBase(UserBase ub);
	
	public int insertUserDetail(UserDetail ud);
	
	public UserBase checkUser(UserBase ub);
	
	public UserBase checkEmail(UserBase ub);
	
	public int secesionUser(UserBase ub);
	
	public int fixUserBase(UserBase ub);

	public int fixUserDetail(UserDetail ud);
}