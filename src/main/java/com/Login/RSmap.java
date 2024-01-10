package com.Login;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

class RSmap1 {

	public void GetResultMap() throws SQLException {
		String query="SELECT topic_name from topic,subject WHERE topic.sub_id=subject.sub_id  and sub_name=\"DSA\";";
		
		 ResultS ts=new ResultS(query);	
		 ResultSet rs=ts.Connection_Result();
		 ArrayList<String> topic = new ArrayList<String>();
		 while(rs.next()) {
			 topic.add(rs.getString("topic_name"));
		 }
		 Map<String, List<String>> topicMap = new HashMap<String, List<String>>();
//		System.out.print(topic);
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
		 System.out.print(topicMap);
	}
	
}

public class RSmap{
	public static void main(String[] args) throws SQLException {
		RSmap1 rs=new RSmap1();
		rs.GetResultMap();
	}
}