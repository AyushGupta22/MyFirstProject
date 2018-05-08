package user;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;

public class Fetch extends HttpServlet {

	public static boolean validate(LoginBean bean){
		boolean status=false;
               
		
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con= DriverManager.getConnection("jdbc:mysql:///recommend","root","");
			Statement stmt=con.createStatement();
			PreparedStatement ps=con.prepareStatement("select * from user where user_name=? and password=?");
			ps.setString(1,bean.getUser());
			ps.setString(2, bean.getPass());
			
			ResultSet rs=ps.executeQuery();
                        status=rs.next();
                       // HttpSession session = request.getSession();
                       if(status)
                            bean.setId(rs.getInt(1));
                       
       // session.setAttribute("MyAttribute", "test value");
			
			System.out.println(status);
		}catch(Exception e){}
		return status;
	}
	public static boolean orderInsert(OrderBean obj){
		boolean status = false;;
		Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con= DriverManager.getConnection("jdbc:mysql:///recommend","root","");
			Statement stmt=con.createStatement();
			PreparedStatement ps=con.prepareStatement("Insert into order_info(user_id,item_id,order_time) values(?,?,?)");
			ps.setInt(1,obj.getOrderId());
			ps.setInt(2, obj.getItemId());
			ps.setString(3, "2018-06-07");
			
			ps.execute();
            status = true;           // HttpSession session = request.getSession();
           
                       
       // session.setAttribute("MyAttribute", "test value");
			
			System.out.println(status);
			System.out.println(obj.getOrderId());
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}
	public static boolean reviewInsert(ReviewBean obj){
		boolean status = false;;
		Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con= DriverManager.getConnection("jdbc:mysql:///recommend","root","");
			Statement stmt=con.createStatement();
			PreparedStatement ps=con.prepareStatement("Insert into user_item_review_rating(user_id,item_id,review) values(?,?,?)");
			ps.setInt(1,obj.getUserId());
			ps.setInt(2, obj.getId());
			ps.setString(3, obj.getReview());
			
			ps.execute();
            status = true;           // HttpSession session = request.getSession();
           
                       
       // session.setAttribute("MyAttribute", "test value");
			
			System.out.println(status);
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}

	public static List<FetchBean> itemFetch(FetchBean obj){
		List<FetchBean> items = new ArrayList<FetchBean>();
               
		
        Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con= DriverManager.getConnection("jdbc:mysql:///recommend","root","");
            int id = obj.getId();
			PreparedStatement ps=con.prepareStatement("select * from item where item_id = ?");
			ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	int itemId = rs.getInt(1);
            	String itemName = rs.getString(2);
            	FetchBean obj1 = new FetchBean();
            	obj1.setId(itemId);
            	obj1.setName(itemName);
            	items.add(obj1);
            }
            int n=0;
            ps=con.prepareStatement("select count(*) from item");
			rs=ps.executeQuery();
            while(rs.next()){
            	int countItem = rs.getInt(1);
            	n = countItem;
            }
            String arr[] = new String[n];
            ps = con.prepareStatement("select item_similarity_score_info from item_similarity where item_id = ? ");
			ps.setInt(1,id);
			rs=ps.executeQuery();
			while(rs.next()){
            	arr = rs.getString(1).split(",");
            }
			ArrayList<Float> arr1 = new ArrayList<Float>();
			for(int i = 0;i<n;i++){
				arr1.add(Float.parseFloat(arr[i]));
			}
			ArrayList<Float> arr2 = new ArrayList<Float>();
			ps = con.prepareStatement("select item_sentiment_score from item_sentiment ");
			rs = ps.executeQuery();
			while(rs.next()){
            	float a = rs.getFloat(1);
            	arr2.add(a);
            }
			
			for(int i = 0;i < n;i++){
				if(id != (i+1)){
					if(i < arr2.size()){
						if(arr1.get(i) >= 0.5 && arr2.get(i) >= 0.4){
							FetchBean obj1 = new FetchBean();
			            	obj1.setId(i+1);
			            	items.add(obj1);
						}
					}
					else{
						if(arr1.get(i) >= 0.5){
							FetchBean obj1 = new FetchBean();
			            	obj1.setId(i+1);
			            	items.add(obj1);
						}
					}
				}
			}
            
		}catch(Exception e){
			System.out.println(e);
		}
		return items;
	}
}

