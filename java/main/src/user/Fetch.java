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
			PreparedStatement ps=con.prepareStatement("select * from item ");
			//ps.setInt(1,id);
			ResultSet rs=ps.executeQuery();
            while(rs.next()){
            	int itemId = rs.getInt(1);
            	FetchBean obj1 = new FetchBean();
            	obj1.setId(itemId);
            	items.add(obj1);
            }
            /*con.prepareStatement("select sentiment_score_info from item_similarity where item_id = ?) ");
			ps.setInt(1,id);
			rs=ps.executeQuery();
			while(rs.next()){
            	String arr1[] = rs.getString(1).split(",");
            }
			con.prepareStatement("select item_sentiment_id,item_sentiment_score from item_sentiment ");
			rs = ps.executeQuery();
            */
		}catch(Exception e){
			System.out.println(e);
		}
		return items;
	}
}

