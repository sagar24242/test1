<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Testkiller</title>
<jsp:include page="AllCss2.jsp"></jsp:include>

</head>
<body themebg-pattern="theme1">
	<div id="pcoded" class="pcoded iscollapsed" nav-type="st2"
		theme-layout="vertical" vertical-placement="left"
		vertical-layout="wide" pcoded-device-type="desktop"
		vertical-nav-type="expanded" vertical-effect="shrink"
		vnavigation-view="view1" fream-type="theme1" layout-type="light">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">



			<jsp:include page="StudentHeader.jsp"></jsp:include>


			<div class="pcoded-main-container" style="margin-top: 70.3906px;">
				<div class="pcoded-wrapper">

					<jsp:include page="StudentSideBar.jsp"></jsp:include>
								<div class="pcoded-content">
				
<!-- Begin Page Content -->
                <div class="container-fluid">
                    
                    <!-- Page Heading -->
                    <h1 class="h3 mb-4 text-gray-800"></h1>

                    <!-- DataTales Example -->
                    
                    <form method="post" action="updateprofile">
                        <div class="row">
                        <div class="col-md-6">
                        <span id="message"></span>
                        <div class="card shadow mb-4">
                            <div class="card-header py-3">
                                <div class="row">
                                    <div class="col">
                                        <h6 class="m-0 font-weight-bold text-primary">Edit Profile</h6>
                                    </div>
                                    <div class="col" align="right">
                                        
                                        <button type="submit" name="edit_button" id="edit_button" class="btn btn-primary btn-sm"><i class="fas fa-edit"></i>Edit</button>
                                        &nbsp;&nbsp;
                                        
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                            <input type="hidden" name="studentId" value="${s.studentId }">
                                <!--<div class="row">
                                    <div class="col-md-6">!-->
                                        <div class="form-group">
                                            <label>Student Name</label>
                                            <input type="text" name="studentName" id="studentName" value="${s.studentName }"  class="form-control" required data-parsley-pattern="/^[a-zA-Z0-9 \s]+$/" data-parsley-maxlength="175" data-parsley-trigger="keyup" />
                                        </div>
                                       
                                        <div class="form-group">
                                            <label>Email Address</label>
                                            <input type="text" name="email" id="email" value="${s.email }"  class="form-control" required data-parsley-maxlength="175" data-parsley-type="email" data-parsley-trigger="keyup" />
                                        </div>
                                       <div class="form-group">
		          		<label>Gender</label>
		          		<select name="gender" id="gender" class="form-control" required>
		          		<option value="${s.gender }">${s.gender }</option>
                          <option value="">Select Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
		          	</div>
		          	<div class="form-group">
		          		<label>Date of Birth</label>
		         <input type="date" name="dateOfBirth" id="dateOfBirth" value="${s.dateOfBirth }" class="form-control datepicker"  required data-parsley-trigger="keyup" />
		          		
		          	</div>
		          	<div class="form-group">
                                            <label>Status</label>
                                            <input type="text" name="status" id="status" value="${s.status }" readonly class="form-control" required data-parsley-pattern="/^[a-zA-Z0-9 \s]+$/" data-parsley-maxlength="175" data-parsley-trigger="keyup" />
                                        </div>
                                    <!--</div>
                                </div>!-->
                            </div>
                        </div></div></div>
                    </form>
                    </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->
</div>
</div>
 <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="logoutstudent">Logout</a>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="AllJs2.jsp"></jsp:include>

</body>
</html>