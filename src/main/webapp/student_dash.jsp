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
    <link href="https://fonts.googleapis.com/css2?family=Quintessential&display=swap" rel="stylesheet">
    <link rel="stylesheet" type="text/css"  href="dash.css">
    <link rel="stylesheet" type="text/css" href="Resume.css">
    <link rel="stylesheet" type="text/css" href="accordion.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
                    <span class="link-text">Syllabus view</span>
                </a>
            </li>

            <li class="nav-item opt4">
                <a href="#" class="nav-link">
                    <span class="link-text">Flag Doubts</span>
                </a>
            </li>
            <li class="nav-item Resume-form opt6" id="themeButton">
                <a href="#" class="nav-link">
                    <span class="link-text ">Resume Builder</span>
                </a>
            </li>
            <li class="nav-item opt7" id="themeButton">
            	
                <a href="logout.jsp" class="nav-link">
                    <span class="link-text">Logout</span>
                </a>
            </li>
        </ul>
    </nav>
    <!-- Main section -->
    <main>
        <div class="body_dos">
        	<!-- Dashboard complete-->
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
                    	session.setAttribute("user",userid);
						String sq="select * from users,student where users.User_id=student.user_id and student.User_id='"+userid+"'"; 
						String[] arr = {"user_name","Roll_no","course","prn","contact","dept","curr_seat","dob","s_address"}; 
						Sample s=new Sample(sq,arr,arr.length);
						String[] rq=s.Connection_Query();
						String[] field={"Name :","Roll no :","Course :","Permanent no :","Contact No :","Department :","Current seat no :","Address :","DOB :"};
						for(int i=0;i<rq.length;i++) {
						%>
                        <p><%= field[i]%><%= rq[i] %></p>
                    	<%
						}
						%>
						 </div>
                    <div class="subjects">
                        <table class="table" cellspacing="10">
                        <%
                        ResultSet rs=null;
                        ResultS s1=new ResultS("SELECT sub_name,t_name,faculty.email,faculty.contact FROM subject,faculty,stu_teacher WHERE faculty.t_id=subject.t_id and stu_teacher.t_id=faculty.t_id and stu_teacher.s_id = (select s_id from student where user_id='"+userid+"')");   
                        rs=s1.Connection_Result();
						%>
                            <thead>
                                <tr>
                                    <th scope="col">Subject</th>
                                    <th scope="col">Faculty name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Contact</th>
                                </tr>
                            </thead>
                            <tbody>
                            <%
							while (rs.next()) {
							%>
                            <tr>
                            	<td><%=rs.getString("sub_name") %></td>
	                            <td><%=rs.getString("t_name") %></td>
	                            <td><%=rs.getString("email") %></td>
	                            <td><%=rs.getString("contact") %></td>
                            </tr>
							<%
							}
							%>	

                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="notifications">
                    <h3>Notifications</h3>
                    <div class="messages">
	                <%
	                String query_flag="Select * from Request";
	                ResultS rs_flag=new ResultS(query_flag);
	                ResultSet rt2_req=rs_flag.Connection_Result();
	                while(rt2_req.next()){
	                
	            	%>
                        <div class="notif">
                            <section class="strips_req">
                                <span class="item1"><%=rt2_req.getString("Tag") %></span>
			                    <span class="item2"><%=rt2_req.getString("topic") %></span>
			                    <span class="item3"><%=rt2_req.getString("All_subt")%></span>
			                 </section> 
			          <%
			          } 
			          %>
                        </div>
                    </div>
                </div>
            </div>
	            <!--End Dashboard section-->
	            <!-- Notes -->
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
                                    <input type="submit" value="Upload File" />
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
                                            <p id="decription">Subtopic : 
                                            <div>Lorem ipsum dolor sit amet consectetur</div>
                                            </p>
                                            <input type="button" value="Download" />
                                        </div>
                                        <div class="cards">
                                            <h5 id="sub_name">OS</h5>
                                            <p id="decription">Subtopic : <div>Lorem ipsum dolor sit amet consectetur
                                                </div>
                                            </p>
                                            <input type="button" value="Download" />
                                        </div>
                                        <div class="cards">
                                            <h5 id="sub_name">OS</h5>
                                            <p id="decription">Subtopic : <div>Lorem ipsum dolor sit amet consectetur
                                                </div>
                                            </p>
                                            <input type="button" value="Download" />
                                        </div>
                                        <div class="cards">
                                            <h5 id="sub_name">OS</h5>
                                            <p id="decription">Subtopic : <div>Lorem ipsum dolor sit amet consectetur
                                                </div>
                                            </p>
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
                                    <input type="submit" value="Request" />
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
            </div>
            	<!-- End of Notes section-->
            	
            	<!-- Syllabus section  complete-->
            <div class="nav_opt div3">
                <h1 id="title">Syllabus</h1>
                <div class="subject-dropdown ">
                    <form action="Value" method="get" name="formSyllabus" id="formSyllabus">
                        <select class="sel" name="sel">
                        	<option value=" ">-----</option>
                            <option value="DSA">DSA</option>
                            <option value="NT">NT</option>
                            <option value="OS">OS</option>
                            <option value="OOSE">OOSE</option>
                            <option value="RM">RM</option>
                            <option value="DM">DM</option>
                        </select>
                        <input id="FetchSyllabus" type="button" name="fetch" value="submit" onclick="javascript:document.formSyllabus.submit();">
                    </form>
                    
                </div>
             <div class="accordion">
	                <%String subject = (String)request.getAttribute("subject");
	                String query="SELECT topic_name from topic,subject WHERE topic.sub_id=subject.sub_id  and sub_name='"+subject+"'";
	        		
		       		 ResultS ts=new ResultS(query);	
		       		 ResultSet rs_st=ts.Connection_Result();
		       		 ArrayList<String> topic = new ArrayList<String>();
		       		 while(rs_st.next()) {
		       			 topic.add(rs_st.getString("topic_name"));
		       		 }
		       		 Map<String, List<String>> topicMap = new HashMap<String, List<String>>();
		       		 String topic_name=null;
		       		 for(int i=0;i<topic.size();i++) {
		       			 topic_name=topic.get(i);
		       			 String sub_query="SELECT sub_topic_name from sub_topic,topic WHERE topic.topic_id=sub_topic.topic_id  and topic_name='"+topic_name+"'";
		       			 ResultS ts1=new ResultS(sub_query);	
		       			 ResultSet rs_sub=ts1.Connection_Result();
		       			 ArrayList<String> subtopic = new ArrayList<String>();
		       			 while(rs_sub.next()) {
		       				 subtopic.add(rs_sub.getString("sub_topic_name"));
		       			 }
		           		  topicMap.put(topic.get(i) , subtopic);
		       		 }
		       		
		       		 
		       		 Set<String> setOfKeySet = topicMap.keySet();
		       		for(String key : setOfKeySet) {   
					  %>
					  <h1 id="accordionhead_1"><%=key %></h1>
					   <div id="accordioncontent_1" class="accordion-content">       
		               <%
		               for(String sub_topic : topicMap.get(key)) {
							  %>
							  <section class="strips">
							  		<span class="item1"><%=sub_topic %></span>
							  		<%
							  		String q2="SELECT covered_flag FROM topic,sub_topic,subject WHERE topic.topic_id=sub_topic.topic_id and topic.sub_id=subject.sub_id and topic_name='"+key+"' and sub_topic_name='"+sub_topic+"';";
							  		ResultS ts2=new ResultS(q2);	
						       		 ResultSet rs3=ts2.Connection_Result();
						       		String flag=null;
						       		 while(rs3.next()){
						       			flag=(rs3.getInt("covered_flag"))== 0 ? "Pending" : "Complete" ;
						       		 }
							  		%>
							  		
		                            <span class="item3"><%=flag%></span>
		                        </section> 
		                       <%
						  }
		               %>
		             	</div>
						<%
					  }
					  %>                     
	              </div>
               </div>
               <!-- End of Syllabus section -->
               
               <!-- Flag Doubts complete -->
            <div class="nav_opt div4">
                <h1 id="title">Flag Doubts</h1>
                 <div class="flag_body">
                    <div class="flag">
                        <form action="FlagServlet" method="get" name="Flag">
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
                            <input type="text" name="topic" placeholder="Topic Name">
                            <input type="text" name="subtopic" placeholder="Sub-topic Name">
                            <input type="button" value="Flag" onclick="javascript:document.Flag.submit();">  
                        </form>
                    </div>
                    <div class="flag_msg">
                    <%String message = (String)request.getAttribute("msg"); 
                    out.print(message);
                    %>
                    </div>
                    <div class="flags">
                    <%
                    	String query_flag1="Select * from flag_doubt";
	                    ResultS rs_req=new ResultS(query_flag1);
	                    ResultSet rt1_req=rs_req.Connection_Result();
						while(rt1_req.next()){
						
                    %>
                        <section class="strips">
                            <span class="item1"><%=rt1_req.getString("sub_name") %></span>
                            <span class="item2"><%=rt1_req.getString("topic_name") %></span>
                            <span class="item3"><%=rt1_req.getString("sub_topic_name") %></span>
                        </section> 
                        <%
						}
                        %> 
                    </div>

                </div> 
            </div>
            <!-- End of flag doubts -->
            
            <div class="nav_opt div6">
                <h1 id="title">Resume</h1>
                <div class="resume_holder">
                    <!--Block for Personal list  -->
                    <form action="ResumeServlet">
                        <p class="title">Personal Details</p>
                        <div class="Personal">
                            <div class="personal_small">
                                <input type="text" name="name" placeholder="FullName">
                                <input type="email" name="email" placeholder="Email">
                                <input type="date" name="DOB">
                                <input type="number" name="age" id="" min="18" max="60" placeholder="Age">
                                <input type="text" name="phone" id="" placeholder="Phone Number">
                                <input type="text" name="LinkedIn" id="" placeholder="LinkedIn">
                            </div>
                            <div class="personal_large">
                                <textarea name="Address" id="" cols="30" rows="5" placeholder="Address"></textarea>
                                <textarea name="About" id="" cols="30" rows="5" placeholder="About"></textarea>
                            </div>
                        </div> <!-- End of personal list -->
                        <!-- Block of Educational list -->
                        <p class="title">Educational Details</p>
                        <div class=" Educational">
                            <input name="Education_no"  type="number" min="0" max="60" placeholder="Qualifications" id="Educational_rows">
                            <input type="button" id="Submit1" value="Submit">
                            <br>
                            <div class="row education">
                                <!--Block for appending details-->
                            </div>
                            <input type="number" min="0" max="60" placeholder="Projects" id="project_rows" name="project_no">
                            <input type="button" id="projects" value="Submit">
                            <div class="projects">
                                <!--Block for appending details-->
                            </div>
                            <input type="number" min="0" max="60" placeholder="Languages & Technologies" id="tech_rows" name="techologies_no">
                            <input type="button" id="tech" value="Submit">
                            <div class="techs">
                                <!--Block for appending details-->
                            </div>
                        </div><!-- End of Block of Educational list -->
                        <!-- Block of Professional Details -->
                        <p class="title">Professional Details</p>
                        <div class="row Experience">
                            <input type="text" placeholder="Current Designation">
                            <input type="number" min="0" max="60" placeholder="Experience" id="Experience">

                            <input type="button" id="Submit2" value="Submit">
                            <div class="row experience-list">
                                <!--Block for appending details-->

                            </div><br>
                            <input type="number" min="0" max="60" placeholder="Certifications" id="certif">

                            <input type="button" id="cert" value="Submit">
                            <div class="certification-list">
                                <!--Block for appending details-->

                            </div><br>
                            <!-- End of Professional Details -->
                            <div class="btns">
                                <input type="submit" id="Submit3" value="Submit">
                                <input type="reset" id="reset" value="Reset">
                            </div>
                        </div>

                    </form>
                </div>
            </div>

        </div>
    </main>
</body>

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
        $('.navbar-nav .opt6').click(function () {
            $('.div6').show().siblings().hide()
        })
        $('.navbar-nav .opt7').click(function () {
            $('.div7').show().siblings().hide()
        })
        $('#Submit1').click(function () {
            var num1 = $('#Educational_rows').val()
            for (let i = 1; i <= num1; i++) {
                $('.education').append('<input type="text" placeholder="Course" name="course"' + i + '><input type="text" placeholder="Percentage" name="percentage"' + i + '><input type="text" placeholder="Board" name="board"' + i + '><input type="year" id="" name="year"' + i + '>')
            }
        })
        $('#Submit2').click(function () {
            var num = $('#Experience').val()
            for (let i = 1; i <= num; i++) {
                $('.experience-list').append('<input type="text" placeholder="Company Name" name="company"' + i + '><input type="text" placeholder="Designation" name="designation"' + i + '><input type="number" name="tenure" id="" min="0" max="70" placeholder="Tenure" name="tenure"' + i + '><br>')
            }
        })
        $('#projects').click(function () {
            var num = $('#project_rows').val()
            for (let i = 1; i <= num; i++) {
                $('.projects').append('<input type="text" placeholder="Project Name" name="project' + i + '"><input type="text" placeholder="Language used" name="language' + i + '"><br>')
            }
        })
        $('#tech').click(function () {
            var num = $('#tech_rows').val()
            for (let i = 1; i <= num; i++) {
                $('.techs').append('<input type="text" placeholder="Language/Technology" name="tech' + i + '"><br>')
            }
        })
        $('#cert').click(function () {
            var num = $('#certif').val()
            for (let i = 1; i <= num; i++) {
                $('.certification-list').append('<input type="text" placeholder="Certification" style="width:25rem;" name="cert' + i + '"><br>')
            }
        })
       
        $(".accordion h1").click(function () {
            var id = this.id;   /* getting heading id */

            /* looping through all elements which have class .accordion-content */
            $(".accordion-content").each(function () {

                if ($("#" + id).next()[0].id != this.id) {
                    $(this).slideUp(2000);
                }
            });

            $(this).next().toggle(1000);  /* Selecting div after h1 */
        });
        //$("#formSyllabus").on("submit",function(){
        	//$(window).on("load", function(){
        //	$(".div3").show().siblings().hide()
        	//})
        //})
        //$(window).on("load", function(){
        //	$(".div3").show().siblings().hide()
        //})
})

</script>

</html>
