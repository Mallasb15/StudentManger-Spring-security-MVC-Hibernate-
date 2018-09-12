<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE>

<html>
<head>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<title>Add New Student</title>
</head>

<body>
	<div>
		<blockquote class="blockquote text-center">
			<p class="mb-0">Add New Student</p>
		</blockquote>

		<div style="width: 50%; margin: 0 auto;">
			<form:form action="saveStudent" modelAttribute="student"
				method="POST">
				<form:hidden path="id" />
				<table class="table ">
					<thead class="thead-dark">
						<tr>
							<td><label>First Name</label></td>
							<td><form:input class="form-control" path="firstName" /></td>
						</tr>

						<tr>
							<td><label>Last Name</label></td>
							<td><form:input class="form-control" path="lastName" /></td>
						</tr>

						<tr>
							<td><label>Phone:</label></td>
							<td><form:input class="form-control" path="phone" /></td>
						</tr>
						<tr>
							<td><label></label></td>
							<td><button type="submit" class="btn btn-success">Save</button></td>
						</tr>
					</thead>

				</table>

			</form:form>
		</div>
	</div>

	<p>
		<a href="${pageContext.request.contextPath}/"
			class="btn btn-primary btn-lg active" role="button"
			aria-pressed="true">Back to List</a>
	</p>
</body>

</html>
