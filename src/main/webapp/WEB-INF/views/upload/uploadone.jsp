<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>webuploader</title>
</head>
<body>
	<form action="${ctx }/upload/uploadOne" method="post" enctype="multipart/form-data">
		选择文件:<input type="file" name="fileName"/><br/>
		文件描述信息:<input type="text" name="describe"><br/> 
		<input type="submit" value="提交">
	</form>
</body>
</html>