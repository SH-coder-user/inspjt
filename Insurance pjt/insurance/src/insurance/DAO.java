package insurance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	
	//로그인과정
	static int login(String a ,String b) {
		int rn = -1;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = "select * from staff_tbl where sno='"+a+"' and spass ='"+b+"'";
		
		try {
			con = dbcon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				rn= 1;
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbcon.close(con, ps, rs);
		}
		
		return rn;
		
	}

	public static List<DTO> viewlist() {
		List<DTO> list = new ArrayList<DTO>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select ino,iname,to_char(iamount,'999,999,999'),sname,to_char(idate,'yy/mm/dd') from staff_tbl natural join ins_tbl";
		try {
			con = dbcon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				DTO user = new DTO();
				user.setIno(rs.getString(1));
				user.setIname(rs.getString(2));
				user.setIamount(rs.getString(3));
				user.setSname(rs.getString(4));
				user.setIdate(rs.getString(5));
				list.add(user);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbcon.close(con, ps, rs);
		}
		
		return list;
	}

	public static List<DTO> viewone(String name) {		
		List<DTO> list = new ArrayList<DTO>();
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "select ino,iamount,sname,to_char(idate,'yy/mm/dd') from staff_tbl natural join ins_tbl where iname='"+name+"'";
		
		try {
			con = dbcon.getCon();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				DTO user =new DTO();
				user.setIno(rs.getString(1));
				user.setIamount(rs.getString(2));
				user.setSname(rs.getString(3));
				user.setIdate(rs.getString(4));
				list.add(user);				
				}
				if(list.size()<1) {
				list=null;
				}

		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbcon.close(con, ps, rs);
		}
		
		return list;
	}

	public static int insert(DTO u) {
		int rs = -1;
		Connection con = null;
		PreparedStatement ps = null;
		String sql = "insert into ins_tbl values(?,?,?,?,sysdate)";
		try {
			con = dbcon.getCon();
			ps = con.prepareStatement(sql);
			ps.setString(1, u.getIno());
			ps.setString(2, u.getIname());
			ps.setString(3, u.getIamount());
			ps.setString(4, u.getSno());
			ps.executeUpdate();
			rs=1;
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbcon.close(con, ps, null);
		}
		
		return rs;
	}

	public static DTO findking() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql= "select bname,srank,sname,sum(iamount)\r\n" + 
				"from staff_tbl natural join ins_tbl natural join bu_tbl\r\n" + 
				"group by sname,srank,bname\r\n" + 
				"having sum(iamount) = (select max(sum(iamount))\r\n" + 
				"                        from staff_tbl natural join ins_tbl natural join bu_tbl\r\n" + 
				"                        group by sname)";
		DTO u= new DTO();
		try {
			con = dbcon.getCon();
			ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				
				u.setBname(rs.getString(1));
				u.setSrank(rs.getString(2));
				u.setSname(rs.getString(3));
				u.setIamount(rs.getString(4));
				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbcon.close(con, ps, rs);
		}
		
		return u;
	}

	public static List<DTO> kinglist(String s) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<DTO> list = new ArrayList<DTO>();
		String sql= "select ino,iname,to_char(iamount,'999,999,999,999'),to_char(idate,'yy/mm/dd') from ins_tbl natural join staff_tbl where sname='"+s+"' order by idate asc";
		
		try {
			con = dbcon.getCon();
			ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				DTO u= new DTO();
				u.setIno(rs.getString(1));
				u.setIname(rs.getString(2));
				u.setIamount(rs.getString(3));
				u.setIdate(rs.getString(4));
				list.add(u);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			dbcon.close(con, ps, rs);
		}
		
		return list;
	}
	
}
