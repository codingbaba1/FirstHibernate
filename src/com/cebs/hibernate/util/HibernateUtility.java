package com.cebs.hibernate.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtility
{
	private static Configuration config;
	private static SessionFactory factory;
	
	static
	{
		try
		{
			config=new Configuration().configure();
			factory=config.buildSessionFactory();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
	public static Session getSession()
	{
		return factory.openSession();
	}
	
}
