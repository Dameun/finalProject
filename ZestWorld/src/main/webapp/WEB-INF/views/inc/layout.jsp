<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Index</title>
	<link href="index.css" type="text/css" rel="stylesheet">
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" style="width:100%;">
        <tr>          

            <td height="30" colspan="2">

            	<tiles:insertAttribute name="header" />

            </td>

        </tr>

        <tr>

            <td height="300" style="width:10%;">

            	<tiles:insertAttribute name="aside" />

            </td>

            <td width="90%">

            	<tiles:insertAttribute name="content" />

            </td>

        </tr>

    </table>

	
</body>
</html>