<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <script data-ad-client="ca-pub-4529508631166774" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Testkiller</title>

    <jsp:include page="AllCss.jsp"></jsp:include>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
<jsp:include page="AdminSideBar.jsp"></jsp:include>
               <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
<jsp:include page="AdminHeader.jsp"></jsp:include>
                <!-- Begin Page Content -->
                <div class="container-fluid">
                   
                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800">Assign Student Management</h1>

                    <!-- DataTales Example -->
                    <span id="message"></span>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                        	<div class="row">
                            	<div class="col">
                            		<h6 class="m-0 font-weight-bold text-primary">Student List with Class Name</h6>
                            	</div>
                            	<div class="col" align="right">
                            	<!-- Button trigger modal -->
                                  <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalLong">
                                 <i class="fas fa-plus"></i>
                                   </button>
                            		
                            	</div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="subjecttable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Roll No.</th>
                                            <th>Student Name</th>
                                            <th>Class Name</th>
                                            <th>Created On</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                         <c:forEach items="${ast }" var="ast">
                                         <tr>
                                         <td>${ast.rollNo }</td>
                                         <td>${ast.studentName }</td>
                                         <td>${ast.className }</td>
                                         <td>${dy }</td>
                                        <td>
                                        <a href="editassignstudent?assignStudentId=${ast.assignStudentId}" style="color:black;" data-toggle="modal">
		                                     <button type="button" name="edit" class="btn btn-warning btn-circle btn-sm edit_button" data-toggle="modal" data-target="#editAssign">
			                                 <i class="fas fa-edit"></i>
			                                 </button></a>
                                        <a  href="deleteassignstudent/${ast.assignStudentId}">
                                          <button type="button"  class="btn btn-danger btn-circle btn-sm delete_button" >
		                                      <i class="fas fa-times"></i>
		                                      </button></a>
                                      
		                                       </td>
		                                       </tr>
                                         </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Testkiller 2022</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">�</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="logout">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="AllJs.jsp"></jsp:include> <!-- Modal -->
<div class="modal fade" id="exampleModalLong" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
   <form method="post" id="assignstudent">
      		<div class="modal-content">
        		<div class="modal-header">
          			<h4 class="modal-title" id="modal_title">Assign Student to Class</h4>
          			<button type="button" class="close" data-dismiss="modal">&times;</button>
        		</div>
        		<div class="modal-body">
        			<span id="form_message"></span>
                    <div class="form-group">
                        <label>Class Name</label>
                        <select name="classId" id="classId" class="form-control" required>
                            <option value="">Select Class</option>
                              <c:forEach items="${classes }" var="c">
                                <option value="${c.classId }">${c.className }</option>
                            </c:forEach>
                            
                            </select>
                    </div>
		          	<div class="form-group">
		          		<label>Student Name</label>
		          		<select name="studentId" id="studentId" class="form-control" required>
                            <option value="">Select Student</option>
                            <c:forEach items="${student }" var="s">
                                <option value="${s.studentId }">${s.studentName }</option>
                            </c:forEach>
                            </select>
		          	</div>
                    <div class="form-group">
                        <label>Roll No.</label>
                        <input type="text" name="rollNo" id="rollNo" class="form-control" required />
                    </div>
        		</div>
        		<div class="modal-footer">
          			
          			<input type="submit" name="submit" id="submit_button" class="btn btn-success" value="Add" />
          			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        		</div>
      		</div>
    	</form>
  </div>
</div>


<div class="modal fade" id="editAssign" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
   <form method="post" id="assignstudent">
      		<div class="modal-content">
        		<div class="modal-header">
          			<h4 class="modal-title" id="modal_title">Edit Data</h4>
          			<button type="button" class="close" data-dismiss="modal">&times;</button>
        		</div>
        		<div class="modal-body">
        			<span id="form_message"></span>
                    <div class="form-group">
                        <label>Class Name</label>
                        <select name="classId" id="classId" class="form-control" required>
                            <option value="">Select Class</option>
                              <c:forEach items="${classes }" var="c">
                                <option value="${c.classId }">${c.className }</option>
                            </c:forEach>
                            
                            </select>
                    </div>
		          	<div class="form-group">
		          		<label>Student Name</label>
		          		<select name="studentId" id="studentId" class="form-control" required>
                            <option value="">Select Student</option>
                            <c:forEach items="${student }" var="s">
                                <option value="${s.studentId }">${s.studentName }</option>
                            </c:forEach>
                            </select>
		          	</div>
                    <div class="form-group">
                        <label>Roll No.</label>
                        <input type="text" name="rollNo" id="rollNo" class="form-control" required />
                    </div>
        		</div>
        		<div class="modal-footer">
          			
          			<input type="submit" name="submit" id="submit_button" class="btn btn-success" value="Edit" />
          			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        		</div>
      		</div>
    	</form>
  </div>
</div>
    <script type="text/javascript">
			$(document).ready(function() {
				$('#subjecttable').DataTable();
			});
		</script>
</body>

</html>