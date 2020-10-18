package com.waffle.reporsitory;

import org.springframework.stereotype.Repository;

@Repository
public interface MainDAO 
{
	String select() throws Exception;
}
