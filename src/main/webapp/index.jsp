<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Task Management</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- DataTables CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css">
<!-- jQuery, Popper.js, Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<!-- DataTables JS -->
<script
	src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script
	src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>

<style>
.task-form {
	border: 1px solid #ddd;
	padding: 20px;
	margin-bottom: 20px;
}

.task-heading {
	background-color: #f8f9fa;
	padding: 10px;
	margin-bottom: 10px;
	overflow: hidden;
}

.inner-form {
	border: 1px solid #000;
	padding: 10px;
	margin-bottom: 10px;
}

.add-task-button {
	background: none;
	border: none;
	color: #007bff;
	cursor: pointer;
	text-decoration: underline;
	float: right;
	margin-top: -3px;
}

.modal-body {
	background-color: #f8f9fa;
	text-align: left;
}

.delete-button {
	background-color: #6c757d; /* Grey color */
	color: #fff;
}

.delete-confirmation-button {
	background-color: #007bff; /* Blue color */
	color: #fff;
}
<
link
 
href
="
https
:
//
unpkg
.com
/
bootstrap-table
@
1
.22
.1
/
dist
/
bootstrap-table
.min
.css
"
 
rel
="
stylesheet
"
>
<
script
 
src
="
https
:
//
unpkg
.com
/
bootstrap-table
@
1
.22
.1
/
dist
/
bootstrap-table
.min
.js
"
>
</
script
>
<
script
 
src
="
https
:
//
unpkg
.com
/
bootstrap-table
@
1
.22
.1
/
dist
/
extensions
/
filter-control
/
bootstrap-table-filter-control
.min
.js
"
>
</
script
>
</style>
</head>

<body>

	<div class="container mt-5">
		<!-- Tab navigation -->
		<ul class="nav nav-tabs" id="tasksTab" role="tablist">
			<li class="nav-item"><a class="nav-link active" id="allTasksTab"
				data-toggle="tab" href="#allTasks" role="tab">All Tasks</a></li>
			<li class="nav-item"><a class="nav-link" id="completedTasksTab"
				data-toggle="tab" href="#completedTasks" role="tab">Completed
					Tasks</a></li>
		</ul>
		<!-- Tab content -->
		<div class="tab-content">
			<!-- All Tasks Tab -->
			<div class="tab-pane fade show active" id="allTasks" role="tabpanel">
				<!-- Task Management Form -->
				<div class="task-form">
					<div class="task-heading">
						<h3 style="display: inline;">Task Management</h3>
						<!-- Add New Task Button -->
						<button class="btn add-task-button" data-toggle="modal"
							data-target="#newTaskModal" id="addNewTaskBtn">Add New
							Task</button>
					</div>
					<div class="inner-form">
						<!-- Additional form content can be added here -->
						<table class="table table-bordered table-striped"
							data-filter-control="true">
							<thead>
							<tr>
								<th>Show <select
									class="form-control form-control-sm d-inline"
									style="width: auto; margin-left: 5px;">
										<option value="10">10</option>
										<option value="25">25</option>
										<option value="50">50</option>
										<option value="100">100</option>
								</select> Entries
								</th>
								<th>Status: <select
									class="form-control form-control-sm d-inline"
									style="width: auto; margin-left: 5px;">
										<option value="all">All</option>
										<option selected value="pending">Pending</option>
										<option value="completed">Completed</option>
										<option value="wip">WIP</option>
										<option value="parked">Parked</option>
								</select>
								</th>
								<th>Search: <input type="text" id="searchInput"
									class="searchbox">
								</th>
							</tr>
</thead>
						</table>
						<table id="allTasksTable"
							class="table table-bordered table-striped"
							data-filter-control="true" data-show-search-clear-button="true">
							<thead>
								<tr>
									<th>Task Name</th>
									<th>Sim link</th>
									<th data-filter-control="select">Status</th>
									<th>Start Date</th>
									<th>End Date</th>
									<th>Delete</th>
								</tr>
								<%@include file="data.jsp"%>
							</thead>
							<tbody id="">
								<!-- Add your data rows here
                                <tr>
                                    <td><a href="#" class="task-link" data-toggle="modal" data-target="updateTaskModal">Task 1</a></td>
                                    <td>Pending</td>
                                    <td>2023-04-13</td>
                                    <td>2023-04-23</td>
                                    <td><button class="btn btn-danger delete-button" data-toggle="modal" data-target="#deleteConfirmationModal">Delete</button></td>
                                </tr>
                                <tr>
                                    <td><a href="#" class="task-link" data-toggle="modal" data-target="updateTaskModal">Task 2</a></td>                                  
                                     <td>Pending</td>
                                    <td>2023-04-13</td>
                                    <td>2023-04-23</td>
                                    <td><button class="btn btn-danger delete-button" data-toggle="modal" data-target="#deleteConfirmationModal">Delete</button></td>
                                </tr>
                                <tr>
                                     <td><a href="#" class="task-link" data-toggle="modal" data-target="updateTaskModal">Task 3</a></td>
                                    <td>Pending</td>
                                    <td>2023-04-13</td>
                                    <td>2023-04-23</td>
                                    <td><button class="btn btn-danger delete-button" data-toggle="modal" data-target="#deleteConfirmationModal">Delete</button></td>
                                </tr>-->
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<!-- Completed Tasks Tab -->
			<div class="tab-pane fade" id="completedTasks" role="tabpanel">
				<table id="completedTasksTable"
					class="table table-bordered table-striped">
					<thead>
						<tr>
							<th>Task Name</th>
							<th>Status</th>
							<th>Start Date</th>
							<th>End Date</th>
						</tr>
					</thead>
					<tbody id="completedTasksTable">
						<!-- Add your data rows here -->
						<%@include file="completedata.jsp"%>
					</tbody>
				</table>
			</div>
		</div>
	</div>

	<!-- New Task Modal -->
	<form action="insertdata.jsp">
		<div class="modal fade" id="newTaskModal" tabindex="-1" role="dialog"
			aria-labelledby="newTaskModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="newTaskModalLabel">New Task</h5>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<!-- New task body -->
						<div class="row p-3 g-3">
							<label for="taskName" class="form-label">Task Name</label> <input
								type="text" class="form-control" id="taskName" name="taskname"
								required>
							<div id="taskNameError" class="error-message"></div>
							<div class="row p-3 g-3">
								<label for="simLink" class="simLink">Sim Link</label> <input
									type="text" class="form-control" id="simLink" name="simlink">
								<div id="simLinkError" class="error-message"></div>
								<div class="row p-3 g-3">
									<div class="col-md-6">
										<label for="startDate" class="form-label">Start Date</label> <input
											type="date" class="form-control" id="startDate"
											name="startdate" placeholder="yyyy-mm-dd" required>
									</div>
									<div class="col-md-6">
										<label for="endDate" class="form-label">End Date</label> <input
											type="date" class="form-control" id="endDate" name="enddate"
											placeholder="yyyy-mm-dd">
									</div>
									<div class="row p-3 g-3">
										<button type="submit" id="saveTask" class="btn btn-primary">Save
											Task</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- Update Task Modal -->

	<!-- Delete Confirmation Modal -->
	<div class="modal fade" id="deleteConfirmationModal" tabindex="-1"
		role="dialog" aria-labelledby="deleteConfirmationModalLabel"
		aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="deleteConfirmationModalLabel">Delete
						Confirmation</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- Delete confirmation body -->
					<h5>Justification:</h5>
					<div class="row p-3 g-3">
						<input type="text" class="modal-body" id="modal-body" required>
					</div>
					<button type="button" class="btn delete-confirmation-button">Delete</button>
				</div>
			</div>
		</div>
	</div>


	<script>
		$(document)
				.ready(
						function() {
							$("#searchInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#allTasksTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>
	<script>
		$(function() {
			$('#table').bootstrapTable()
		})
	</script>

</body>
</html>