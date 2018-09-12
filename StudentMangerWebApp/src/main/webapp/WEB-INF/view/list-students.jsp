<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>

<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

<title>Student Manager Web App</title>
</head>

<body>

	<blockquote class="blockquote text-center">
		<p class="mb-0">Welcome to Simple Student Manager Web APP</p>
	</blockquote>
	<hr>
	
	<div>
			User:
			<security:authentication property="principal.username" />
			, <br> Role(s):
			<security:authentication property="principal.authorities" />
		
	</div>
	<br>
	<div>
		<security:authorize access="hasAnyRole('ADMIN','INSTRUCTOR')">
			<input type="button" value="Add New Student"
				onClick="window.location.href='showFormForAdd'; return fasle"
				class="btn btn-primary" />
		</security:authorize>
	</div>

	<br>

	<div id="container">
		<div id="content">

			<table class="table">
				<thead class="thead-dark">
					<tr>
						<th scope="col">First Name</th>
						<th scope="col">Last Name</th>
						<th scope="col">Phone</th>

						<security:authorize access="hasAnyRole('ADMIN','INSTRUCTOR')">
							<th scope="col">Action</th>
						</security:authorize>
					</tr>
				</thead>

				<c:forEach var="tempStudent" items="${students}">

					<c:url var="updateLink" value="/showFormForUpdate">
						<c:param name="studentId" value="${tempStudent.id}" />
					</c:url>

					<c:url var="deleteLink" value="/delete">
						<c:param name="studentId" value="${tempStudent.id }" />
					</c:url>

					<tbody>
						<tr>
							<td>${tempStudent.firstName}</td>
							<td>${tempStudent.lastName}</td>
							<td>${tempStudent.phone}</td>

							<security:authorize access="hasAnyRole('ADMIN','INSTRUCTOR')">
								<td><security:authorize
										access="hasAnyRole('ADMIN','INSTRUCTOR')">

										<a href="${updateLink}">Update</a>

									</security:authorize> <security:authorize access="hasAnyRole('ADMIN')">
										<a href="${deleteLink}"
											onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
									</security:authorize></td>

							</security:authorize>
						</tr>
					</tbody>

				</c:forEach>

			</table>
		</div>
		<!-- Add a logout button-->

		<form:form action="${pageContext.request.contextPath}/logout"
			method="POST">
			<button type="submit" class="btn btn-danger">Logout</button>
		</form:form>
	</div>

</body>

</html>