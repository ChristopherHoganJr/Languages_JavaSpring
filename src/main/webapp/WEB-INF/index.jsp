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
<title>Languages</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/main.css">
<!-- change to match your file/naming structure -->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Creator</th>
							<th scope="col">Version</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="language" items="${allLanguages}">
							<tr>
								<td><a href="/languages/${language.id}"> <c:out
											value="${language.language_name}" />
								</a></td>
								<td><c:out value="${language.language_creator}" /></td>
								<td><c:out value="${language.language_version}" /></td>
								<td>
									<form action="/languages/${language.id}" method="post">
										<input type="hidden" name="_method" value="delete"> <input
											type="submit" value="Delete">
									</form> 
									<a href="/languages/edit/${language.id}">Edit</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col">
				<form:form action="/languages" method="post"
					modelAttribute="language">
					<div class="container">
						<form:errors style="color: red" path="*" />
					</div>
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