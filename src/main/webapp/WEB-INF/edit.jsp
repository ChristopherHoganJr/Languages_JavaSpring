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
				<form action="/languages/${thisLanguage.id}" method="post">
					<input type="hidden" name="_method" value="delete"> <input
						type="submit" value="Delete">
				</form>
				<a href="/">Dashboard</a>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<form:form action="/languages/edit/${thisLanguage.id}" model="post"
					modelAttribute="thisLanguage">
					<div class="container">
						<form:errors style="color: red" path="*" />
					</div>
					<input type="hidden" name="_method" value="put">
					<p>
						<form:label path="language_name">language_name:</form:label>
						<form:input path="language_name" />
					</p>
					<p>
						<form:label path="language_creator">language_creator:</form:label>
						<form:input path="language_creator" />
					</p>
					<p>
						<form:label path="language_version">language_version:</form:label>
						<form:input path="language_version" />
					</p>
					<input type="submit" value="Submit" />
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>