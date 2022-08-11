<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. -->
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) -->
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${thisLanguage.language_name}</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
	<div class="row">
			<div class="col d-flex justify-content-end">
				<a href="/">Dashboard</a>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<h2>
					<c:out value="${thisLanguage.language_name}" />
				</h2>
				<h3>
					<c:out value="${thisLanguage.language_creator}" />
				</h3>
				<h3>
					<c:out value="${thisLanguage.language_version}" />
				</h3>
				<a href="/languages/edit/${thisLanguage.id}">Edit</a>
				<form action="/languages/${thisLanguage.id}" method="post">
					<input type="hidden" name="_method" value="delete"> <input
						type="submit" value="Delete">
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>