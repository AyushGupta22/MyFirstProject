package user;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Fetch {

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

