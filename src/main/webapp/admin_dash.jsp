<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.Login.Sample"%>
<%@page import="com.Login.ResultS"%>
<%@page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Domain of syllabus</title>
    <!-- <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->
    <link href="https://fonts.googleapis.com/css2?family=Quintessential&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="dash.css">
    <link rel="stylesheet" href="admin_dash.css">
</head>

<body>
    <nav class="navbar">
        <ul class="navbar-nav">
            <li class="logo-min">
                <span class="logo-text-min">DOS<br></span>
            </li>
            <li class="logo">
                <span class="link-text logo-text-max"
                    style="padding-bottom:1rem;margin-top: 1.3rem;font-weight: 800">Domain<br><span
                        style="font-size: 0.6rem;">of syllabus</span></span>
            </li>
            <li class="nav-item opt1">
                <a href="#" class="nav-link">
                    <span class="link-text">Dashboard</span>
                </a>
            </li>

            <li class="nav-item opt2">
                <a href="#" class="nav-link">
                    <span class="link-text">User CRUD</span>
                </a>
            </li>
            <li class="nav-item opt3">
                <a href="#" class="nav-link">
                    <span class="link-text">Subject CRUD</span>
                </a>
            </li>
            <li class="nav-item opt5" id="themeButton">
                <a href="#" class="nav-link">
                    <span class="link-text">Queries</span>
                </a>
            </li>
            <li class="nav-item opt6" id="themeButton">
                <a href="logout.jsp" class="nav-link">
                    <span class="link-text">Logout</span>
                </a>
            </li>
        </ul>
    </nav>
    <!-- Main section -->
    <main>
        <div class="body_dos">
            <div class="nav_opt div1">
                <!--Dashboard section-->
                <h1 id="title">DashBoard</h1>
                <div class="container">
                    <div class="photo" style="border: 3px solid red;">
                        <img src="placeholder.png" alt="">

                    </div>
                    <div class="profile">
                    <%
						String userid = (String)request.getAttribute("id");
						String sq="select users.User_id,A_name,A_address,contact,email,dept,dob from users,admin where users.User_id=admin.user_id and admin.User_id='"+userid+"'"; 
						String[] arr = {"user_id","A_name","A_address","contact","email","dept","dob"}; 
						Sample s=new Sample(sq,arr,arr.length);
						String[] rq=s.Connection_Query();
						String[] field={"User ID:","Name :","Address :","Contact :","Email :","Department :","DOB :"};
						for(int i=0;i<rq.length;i++) {
						%>
                        <p><%= field[i]%><%= rq[i] %></p>
                    	<%
						}
						%>
					</div>

                </div>
                <div class="notifications">
                    <h3>Notifications</h3>
                    <div class="messages">
                        <div class="notif">

                        </div>
                    </div>
                </div>
			</div>
            <!--End Dashboard section-->
            <div class="nav_opt div2">
                <!--Notes section-->
                <h1 id="title">User CRUD</h1>
                <div class="UDR-holder">
                    <div class="UDR">
                        <div class="button-holder">
                            <a id="create">Create</a>
                            <a id="update">Update</a>
                            <a id="delete">Delete</a>
                        </div>
                        <div class="UDR_body">
                            <!--Upload Download Request section-->
                            <div class="create_body">
                                <!--Upload -->
                                <h3>Create user</h3>
                                <form action="CreateServlet" method="post">
                                    <select name="Subject" id="dropdown">
                                        <option value="none">----</option>
                                        <option value="Admin">Admin</option>
                                        <option value="Faculty">Faculty</option>
                                        <option value="Student">Student</option>
                                    </select>
                                    <input type="text" name="user_name" id="username" placeholder="User full name">
                                    <input type="text" name="Course" id="course" placeholder="Course">
                                    <input type="text" name="contact" id="contact" placeholder="Contact number">
                                    <input type="text" name="dept" id="dept" placeholder="Department">
                                    <input type="email" name="email" id="email" placeholder="Email"><br>

                                    <input type="button" value="Create">  
                                </form>
                            </div>
                            <!--End of Upload-->
                            <div class="update_body">
                                <!--Download-->
                                <h3>Update user </h3>
                                <form action="UpdateServlet" method="post" >
                                    <select name="Subject" id="dropdown">
                                        <option value="none">----</option>
                                        <option value="Admin">Admin</option>
                                        <option value="Faculty">Faculty</option>
                                        <option value="Student">Student</option>
                                    </select>
                                    <input type="text" name="userID" id="userid" placeholder="UserID"><br>
                                    <input type="text" name="field" id="" placeholder="Field ">
                                    <input type="text" name="value" id="" placeholder="value"><br>
                                    <input type="button" value="Update">
                                </form>
                            </div>
                            <!--End of Download-->
                            <div class="delete_body">
                                <!--Request-->
                                <h3>Delete</h3>
                                <form action="DeleteServlet" method="post" enctype="multipart/form-data">
                                    <select name="Subject" id="dropdown">
                                        <option value="none">----</option>
                                        <option value="Admin">Admin</option>
                                        <option value="Faculty">Faculty</option>
                                        <option value="Student">Student</option>
                                    </select>
                                    <input type="text" name="username" id="username" placeholder="Username">
                                    <input type="text" name="userid" id="userid" placeholder="UserID"><br>
                                    <input type="button" value="Delete"> 
                                </form>
                            </div>
                            <!--End of Request-->
                            <div class="status">
                                <!--stautus section-->
                                <div class="status_green">Successfull!</div>
                                <div class="status_red">fail!</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Notes section-->
            <div class="nav_opt div3">
                <h1 id="title">Subject CRUD</h1>
                <div class="UDR-holder">
                    <div class="UDR">
                        <div class="button-holder">
                            <a id="create_subject">Create</a>
                            <a id="update_subject">Update</a>
                            <a id="delete_subject">Delete</a>
                        </div>
                        <div class="UDR_body">
                            <!--Upload Download Request section-->
                            <div class="create_subject_body">
                                <!--Upload -->
                                <h3>Create Subject</h3>
                                <form action="CreateSubjectServlet" method="post" enctype="multipart/form-data">
                                    <select name="Subject" id="dropdown">
                                        <option value="none">----</option>
                                        <option value="DSA">DSA</option>
                                        <option value="OS">OS</option>
                                        <option value="NT">NT</option>
                                        <option value="JAVA">JAVA</option>
                                        <option value="Javascript">Javascript</option>
                                        <option value="OOSE">OOSE</option>
                                        <option value="RM">RM</option>
                                        <option value="DM">DM</option>
                                    </select>
                                    <input type="text" name="topic_name" id="topicname" placeholder="Topic name">
                                    <input type="number" name="Subtopic" id="Subtopic" placeholder="Sub-topic number">
                                    <input type="button" id="subtopics" value="Go">
                                    <div class="subtopics">
                                        <!--Block for appending details-->
                                    </div>
                                    <input type="button" value="create">  
                                </form>
                            </div>
                            <!--End of Upload-->
                            <div class="update_subject_body">
                                <!--Download-->
                                <h3>Update Subject</h3>
                                <form action="CreateSubjectServlet" method="post" enctype="multipart/form-data">
                                    <select name="Subject" id="dropdown">
                                        <option value="none">----</option>
                                        <option value="DSA">DSA</option>
                                        <option value="OS">OS</option>
                                        <option value="NT">NT</option>
                                        <option value="JAVA">JAVA</option>
                                        <option value="Javascript">Javascript</option>
                                        <option value="OOSE">OOSE</option>
                                        <option value="RM">RM</option>
                                        <option value="DM">DM</option>
                                    </select>
                                    <input type="text" name="upd_field" id="topicname" placeholder="Update-Field">
                                    <input type="number" name="Value" id="Subtopic" placeholder="Value">
                                    <input type="button" value="Update">  
                                </form>
                            </div>
                            <!--End of Download-->
                            <div class="delete_subject_body">
                                <!--Request-->
                                <h3>Delete Subject</h3>
                                <form action="DeleteServlet" method="post" enctype="multipart/form-data">
                                    <select name="Subject" id="dropdown">
                                        <option value="none">----</option>
                                        <option value="DSA">DSA</option>
                                        <option value="OS">OS</option>
                                        <option value="NT">NT</option>
                                        <option value="JAVA">JAVA</option>
                                        <option value="Javascript">Javascript</option>
                                        <option value="OOSE">OOSE</option>
                                        <option value="RM">RM</option>
                                        <option value="DM">DM</option>
                                    </select>
                                    <input type="button" value="Delete"> 
                                </form>
                            </div>
                            <!--End of Request-->
                            <div class="status">
                                <!--stautus section-->
                                <div class="status_green">Successfull!</div>
                                <div class="status_red">fail!</div>
                            </div>
                        </div>
                    </div>
            	</div>
            </div>
            <!-- End of create user -->
	        <div class="nav_opt div5">
	            <h1 id="title">Queries</h1>
	            <div class="queries">
                    <div class="flag_body">
                
                        <div class="flags">
                    <%
                    	String query_flag="Select * from Queries";
	                    ResultS rs_flag=new ResultS(query_flag);
	                    ResultSet rt_flag=rs_flag.Connection_Result();
						while(rt_flag.next()){
						
                    %>
                        <section class="strips">
                            <span class="item1"><%=rt_flag.getString("quer_id") %></span>
                            <span class="item2"><%=rt_flag.getString("Name") %></span>
                            <span class="item3"><%=rt_flag.getString("Subject") %></span>
                        </section> 
                        <%
						}
                        %> 
                    </div>
                    </div> 
                </div>
	        </div>
     	</div>
    </main>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $(function () {
        $('#upload').click(function () {
            $('.upload_body').show().siblings().hide()
        })
        $('#download').click(function () {
            $('.download_body').show().siblings().hide()
        })
        $('#request').click(function () {
            $('.request_body').show().siblings().hide()
        })
        $('.navbar-nav .opt1').click(function () {
            $('.div1').show().siblings().hide()
        })
        $('.navbar-nav .opt2').click(function () {
            $('.div2').show().siblings().hide()
        })
        $('.navbar-nav .opt3').click(function () {
            $('.div3').show().siblings().hide()
        })
        $('.navbar-nav .opt4').click(function () {
            $('.div4').show().siblings().hide()
        })
        $('.navbar-nav .opt5').click(function () {
            $('.div5').show().siblings().hide()
        })
        $("#create").click(function(){
            $(".create_body").show().siblings().hide()
        })
        $("#update").click(function(){
            $(".update_body").show().siblings().hide()
        })
        $("#delete").click(function(){
            $(".delete_body").show().siblings().hide()
        })
        $("#create_subject").click(function(){
            $(".create_subject_body").show().siblings().hide()
        })
        $("#update_subject").click(function(){
            $(".update_subject_body").show().siblings().hide()
        })
        $("#delete_subject").click(function(){
            $(".delete_subject_body").show().siblings().hide()
        })
        $('#subtopics').click(function () {
            var num = $('#Subtopic').val()
            for (let i = 1; i <= num; i++) {
                $('.subtopics').append('<input type="text" placeholder="Subtopic Name" name="Subtopic' + i + '">')
            }
        })
    })

</script>

</html>