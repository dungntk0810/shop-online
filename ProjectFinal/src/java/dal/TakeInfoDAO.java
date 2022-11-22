/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Comment;
import entity.OrderDetail;
import entity.Product;
import entity.Sellingproducts;
import entity.Statistical;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author mylov
 */
public class TakeInfoDAO extends DBContext {

    public List<OrderDetail> getAllOrderInfoByUid(int uid) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select * from OrdersDetail where uid =? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate("date"),
                        rs.getDouble(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Statistical gePriceOrderInfoByDate(Date date) {

        String sql = " SELECT SUM(price*quantity) FROM [OrdersDetail] where date like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setDate(1, (java.sql.Date) date);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Statistical s = new Statistical(date,
                        rs.getInt(1));
                return s;
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<OrderDetail> getAllOrderInfoByPid(int pid) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select * from [Wish].[dbo].[OrdersDetail] where pid =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setInt(1, pid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate("date"),
                        rs.getDouble(7),
                        rs.getInt(2)));

            }
        } catch (Exception e) {
        }
        return list;
    }

    public OrderDetail getAllOrderInfoByOid(int oid, String name, String phone, String address) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "select * from [Wish].[dbo].[OrdersDetail] where oid =? ";
        OrderDetail o = new OrderDetail();
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setInt(1, oid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {

                o = new OrderDetail(rs.getInt(1),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getDate("date"),
                        rs.getDouble(7),
                        name, phone, address);

            }
        } catch (Exception e) {
        }
        return o;
    }

    public List<Product> getPIdByUId(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT id  FROM [Wish].[dbo].[product] WHERE uid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt("id")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public String getCNamedByOId(int oid) {
        String sql1 = "SELECT       [Customer_name]  FROM [Wish].[dbo].[Customers] where uid =  ?";

        try {
            PreparedStatement st2 = connection.prepareStatement(sql1);
            st2.setInt(1, oid);
            ResultSet rs2 = st2.executeQuery();
            while (rs2.next()) {
                return rs2.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public String getCPhoneByOId(int oid) {
        String sql = "SELECT       [phone_number]  FROM [Wish].[dbo].[Customers] where uid =  ?";

        try {
            PreparedStatement st2 = connection.prepareStatement(sql);
            st2.setInt(1, oid);
            ResultSet rs = st2.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public String getCAddressByOId(int oid) {
        String sql = "SELECT       [address]  FROM [Wish].[dbo].[Customers] where uid =  ?";

        try {
            PreparedStatement st2 = connection.prepareStatement(sql);
            st2.setInt(1, oid);
            ResultSet rs = st2.executeQuery();
            while (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Comment> getComment(String pid) {
        List<Comment> list = new ArrayList<>();
        String sql = "SELECT [pid]\n"
                + "      ,[uid]\n"
                + "      ,[comment]\n"
                + "  FROM [Wish].[dbo].[Productreviews] where pid = ?";

        try {
            PreparedStatement st2 = connection.prepareStatement(sql);
            st2.setString(1, pid);
            ResultSet rs = st2.executeQuery();
            while (rs.next()) {
                list.add(new Comment(pid, rs.getString(2), rs.getString(3)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void main(String[] args) {
        TakeInfoDAO tdao = new TakeInfoDAO();
        DAO d = new DAO();
        DAO dao = new DAO();
        List<Product> list = dao.getAllProduct();

        System.out.println(list.get(0).getName());

    }

    public List<Sellingproducts> getSeller() {
        List<Sellingproducts> list = new ArrayList<>();
        String sql = "SELECT top 3 sum(quantity), pid from [OrdersDetail] group by pid";
        try {
            PreparedStatement st2 = connection.prepareStatement(sql);
            ResultSet rs = st2.executeQuery();
            while (rs.next()) {
                list.add(new Sellingproducts(rs.getInt(1), rs.getInt(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

}
