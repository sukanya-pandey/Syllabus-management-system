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
    <link rel="stylesheet" href="faculty_dash.css">
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
                    <span class="link-text">Notes</span>
                </a>
            </li>
            <li class="nav-item opt3">
                <a href="#" class="nav-link">
                    <span class="link-text">Mark Complete</span>
                </a>
            </li>

            <li class="nav-item opt4">
                <a href="#" class="nav-link">
                    <span class="link-text">Flags</span>
                </a>
            </li>
            <li class="nav-item opt5" id="themeButton">
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
						String sq="select * from users,faculty where users.User_id=faculty.user_id and faculty.User_id='"+userid+"'"; 
						String[] arr = {"user_name","Contact","t_address","email"}; 
						Sample s=new Sample(sq,arr,arr.length);
						String[] rq=s.Connection_Query();
						String[] field={"Name :","Contact No :","Address :","Email :"};
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
                <h1 id="title">Notes</h1>
                <div class="UDR-holder">
                    <div class="UDR">
                        <div class="button-holder">
                            <a id="upload">Upload</a>
                            <a id="download">Download</a>
                            <a id="request">Request</a>
                        </div>
                        <div class="UDR_body">
                            <!--Upload Download Request section-->
                            <div class="upload_body">
                                <!--Upload -->
                                <h3>Upload</h3>
                                <form action="UploadServlet" method="post" enctype="multipart/form-data">
                                    <input type="file" name="file" size="50" />
                                    <input type="text" name="subject" id="" placeholder="Subject/Tag"
                                        style="text-align: center;">
                                    <input type="text" name="subject" id="" placeholder="Sub-topic"
                                        style="text-align: center;">
                                    <input type="checkbox" name="" id="">Share with peers?<br>
                                    <input type="button" value="Upload File" />
                                </form>
                            </div>
                            <!--End of Upload-->
                            <div class="download_body">
                                <!--Download-->
                                <h3>Download</h3>
                                <form action="DownloadServlet" method="post" enctype="multipart/form-data">
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
                                    <input type="button" value="Show">
                                    <div class="dwn_notes">
                                        <div class="cards">
                                            <h5 id="sub_name">OS</h5>
                                            <h5 id="decription">Subtopic : <div>Lorem ipsum dolor sit amet consectetur
                                                </div>
                                            </h5>
                                            <input type="button" value="Download" />
                                        </div>
                                        <div class="cards">
                                            <h5 id="sub_name">OS</h5>
                                            <h5 id="decription">Subtopic : <div>Lorem ipsum dolor sit amet consectetur
                                                </div>
                                            </h5>
                                            <input type="button" value="Download" />
                                        </div>
                                        <div class="cards">
                                            <h5 id="sub_name">OS</h5>
                                            <h5 id="decription">Subtopic : <div>Lorem ipsum dolor sit amet consectetur
                                                </div>
                                            </h5>
                                            <input type="button" value="Download" />
                                        </div>
                                        <div class="cards">
                                            <h5 id="sub_name">OS</h5>
                                            <h5 id="decription">Subtopic : <div>Lorem ipsum dolor sit amet consectetur
                                                </div>
                                            </h5>
                                            <input type="button" value="Download" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <!--End of Download-->
                            <div class="request_body">
                                <!--Request-->
                                <h3>Request</h3>
                                <form action="RequestServlet" method="post" enctype="multipart/form-data">
                                    <input type="text" name="subject" id="" placeholder="Subject/Tag"
                                        style="text-align: center;">
                                    <input type="text" name="sub-topic" id="sub-topic" placeholder="Sub-topic">
                                    <input type="checkbox" name="all" id="all">All sub-topics?<br>
                                    <input type="button" value="Request" />
                                </form>
                            </div>
                            <!--End of Request-->
                            <div class="default">
                                <h1>Choose Upload/Download/Request for respective operations</h1>
                            </div>
                            <div class="status">
                                <!--stautus section-->
                                <div class="status_green">Successfull!</div>
                                <div class="status_red">fail!</div>
                            </div>
                        </div>
                        <!--End of Upload Download Request section-->
                    </div>
                </div>
            </div><!-- End of Notes section-->
        <div class="nav_opt div3">
                <h1 id="title">Mark Complete</h1>
                <div class="mark">
                    <div class="button_holder" style="margin: 2rem;">
                        <a id="mark">Mark</a>
                        <a id="unmark">Unmark</a>
                        <div class="mark_body_holder">
                            <div class="mark_body">
                                <form action="">
                                    <form name="subject" action="">
                                        <select name="" id="">
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                        </select>
                                    </form>
                                    <form name="topic" action="">
                                        <select name="" id="">
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                        </select>
                                    </form>
                                    <form name="sub-topic" action="">
                                        <select name="" id="">
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                        </select>
                                    </form>
                                    <input type="button" value="Mark">
                                </form>
                            </div>
                            <div class="unmark_body">
                                <form action="">
                                    <form name="subject" action="">
                                        <select name="" id="">
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                        </select>
                                    </form>
                                    <form name="topic" action="">
                                        <select name="" id="">
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                        </select>
                                    </form>
                                    <form name="sub-topic" action="">
                                        <select name="" id="">
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                            <option value=""></option>
                                        </select>
                                    </form>
                                    <input type="button" value="Unmark">
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="nav_opt div4">
                <h1 id="title">FLags</h1>
                <div class="flag_body">
                    <div class="flags">
                    <%
                    	String query_flag="Select * from flag_doubt";
	                    ResultS rs_flag=new ResultS(query_flag);
	                    ResultSet rt_flag=rs_flag.Connection_Result();
						while(rt_flag.next()){
						
                    %>
                        <section class="strips">
                            <span class="item1"><%=rt_flag.getString("sub_name") %></span>
                            <span class="item2"><%=rt_flag.getString("topic_name") %></span>
                            <span class="item3"><%=rt_flag.getString("sub_topic_name") %></span>
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
        $('#upload').click(function () {
            $('.upload_body').show().siblings().hide()
        })
        $('#download').click(function () {
            $('.download_body').show().siblings().hide()
        })
        $('#request').click(function () {
            $('.request_body').show().siblings().hide()
        })
        $(".mark_body").hide()
        $(".unmark_body").hide()
        $("#mark").click(function () {
            $(".mark_body").show().siblings().hide()
        })
        $("#unmark").click(function () {
            $(".unmark_body").show().siblings().hide()
        })
    })

</script>

</html>