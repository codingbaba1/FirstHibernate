<%@page import="java.lang.reflect.Modifier"%>
<%@page import="java.lang.reflect.Field"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.cebs.hibernate.util.HibernateUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	if(request.getMethod().equalsIgnoreCase("post"))
	{
		%>		
			<jsp:useBean id="student" class="com.cebs.beans.Student"></jsp:useBean>
			<jsp:setProperty property="*" name="student"/>	
		
		<%
		Session hibernateSession= HibernateUtility.getSession();
		Transaction tran= hibernateSession.beginTransaction();		
		hibernateSession.save(student);		
		tran.commit();
		hibernateSession.close();
		
		
	}


%>

<h2>Student Information Form</h2>
<form action="" method="post">
	<p><input type="text" name="name" placeholder="Name" required/></p>
	<p><input type="text" name="email" placeholder="Email" required/></p>
	<p><input type="submit" name="submit" value="Insert"/></p>
</form>
<%
	try
	{
		Class c= Class.forName("com.cebs.beans.Student");
		Field []fields= c.getDeclaredFields();
		for(Field f:fields)
		{
			
			%>
				<h1><%=f.getModifiers() %> <%=f.getType() %> <%=f.getName() %></h1>
			<%
		}
		
	}
	catch(Exception ex)
	{
		
	}


%>




</body>
</html>































