<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.db.TaskDb,com.db.Task,java.util.*"%>

	<%
	List<Task> list = TaskDb.getAllRecordsP();
	request.setAttribute("list", list);
	%>

	
	<%  for(Task task: list){  %>
		<tr>
			<td><a href="# class="task-link"
				data-toggle="modal" data-target="#updateTaskModal<%=task.getId()%>"><%=task.getTaskname()%></a>
				<div class="modal fade" id="updateTaskModal<%=task.getId()%>" tabindex="-1"
					role="dialog" aria-labelledby="updateTaskModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="updateTaskModalLabel">Update
									Task</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<!-- Update task body -->
								<form action="updatedata.jsp" id="updateTaskForm">
									<input type="hidden" name="id" value="<%=task.getId()%>"/>
									<div class="row p-3 g-3">
										<label for="updateStatus" class="form-label">Status</label> <select
											class="form-control" id="updateStatus" name="status">
											<option value="parked" <%= (task.getStatus().equalsIgnoreCase("Parked")?"selected":"") %> >Parked</option>
											<option value="pending" <%= (task.getStatus().equalsIgnoreCase("pending")?"selected":"") %>>Pending</option>
											<option value="wip" <%= (task.getStatus().equalsIgnoreCase("WIP")?"selected":"") %>>WIP</option>
											<option value="completed" <%= (task.getStatus().equalsIgnoreCase("completed")?"selected":"") %>>Completed</option>
										</select>
									</div>
									<div class="row p-3 g-3">
										<label for="updateSimLink" class="form-label">Sim Link</label>
										<input type="text" class="form-control" id="updateSimLink"
											value="<%=task.getSimlink()%>" name="simlink" required>
									</div>
									<div class="row p-3 g-3">
										<div class="col-md-6">
											<label for="updateStartDate" class="form-label">Start
												Date</label> <input type="date" class="form-control"
												id="updateStartDate" name="startdate"
												value="<%=task.getStartdate()%>">
										</div>
										<div class="col-md-6">
											<label for="updateEndDate" class="form-label">End
												Date</label> <input type="date" class="form-control"
												id="updateEndDate" name="enddate"
												value="<%=task.getEnddate()%>">
										</div>
									</div>
									<div class="row p-3 g-3">
										<button type="submit" id="updateTaskBtn"
											class="btn btn-primary">Update Task</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div></td>
			<td><%=task.getSimlink()%></td>
			<td><%=task.getStatus()%></td>
			<td><%=task.getStartdate()%></td>
			<td><%=task.getEnddate()%></td>
			<td><a
				class="btn btn-danger delete-button" data-toggle="modal"
				data-target="#deleteConfirmationModal<%=task.getId()%>">Delete</a>
					<div class="modal fade" id="deleteConfirmationModal<%=task.getId()%>" tabindex="-1"
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
					<form action="deletedata.jsp" id="updateTaskForm">
									<input type="hidden" name="id" value="<%=task.getId()%>" />
					<h5>Justification:</h5>
					<div class="row p-3 g-3">
						<input type="text" class="modal-body" name="deletemessage" id="modal-body" required>
					</div>
					<button type="submit" class="btn delete-confirmation-button">Delete</button>
					</form>
				</div>
			</div>
		</div>
	</div>
				
				
				</td>
		</tr>
		<% }%>