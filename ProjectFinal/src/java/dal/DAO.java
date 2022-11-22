/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import entity.Account;
import entity.Cart;
import entity.Category;
import entity.Item;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author trinh
 */
public class DAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt("quantity")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getProductByCID(String cid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product where cateid = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setString(1, cid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt("quantity")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(String id) {

        String sql = "select * from product where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return (new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt("quantity")));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt("cid"),
                        rs.getString("cname")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product"
                + " where name like ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setString(1, "%" + txtSearch + "%");
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt("quantity")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getLast() {
        String sql = "select top 1 * from product\n"
                + "order by id desc";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt("quantity"));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account check(String user, String pass) {
        String sql = "SELECT *\n"
                + "  FROM [Wish].[dbo].[Customers] where [user] = ? AND pass= ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8)
                );
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Account Update(String id) {
        String sql = "UPDATE [dbo].[Customers]\n"
                + "   SET [user] = ?\n"
                + "      ,[pass] = ?\n"
                + "      ,[Customer_name] = ?\n"
                + "      ,[phone_number] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[Country] = ?\n"
                + " WHERE uID = ?";

        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getString(7),
                        rs.getString(8)
                );
            }

        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public boolean existed(String username) {
        String sql = "select * from Customers where [user] = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return false;
    }

    public void insert(String acc, String pass) {
        String sql = "insert into Customers values(?,?,0,0,0,0,0)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, acc);
            st.setString(2, pass);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Product> getSellProductByUID(int uid) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product "
                + "where uID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setInt(1, uid);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt("quantity")));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void change(String newpassword, String user) {
        String sql = "update Customers set pass=? where [user] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newpassword);
            st.setString(2, user);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }

    }

    public void addOrder(Account c, Cart cart) {
        LocalDate curDate = LocalDate.now();
        String date = curDate.toString();
        try {
            //add order
            for (Item i : cart.getItems()) {
                String sql = "insert into [Orders] values(?,?,?)";
                PreparedStatement st = connection.prepareStatement(sql);
                st.setString(1, date);
                st.setInt(2, i.getQuantity());
                st.setInt(3, i.getProduct().getId());
                st.executeUpdate();

                //lay id cua order vua add
                String sql1 = "select top 1 [Oid] from [Orders] order by [Oid] desc";
                PreparedStatement st1 = connection.prepareStatement(sql1);
                ResultSet rs = st1.executeQuery();
                //add bang OrderDetail
                if (rs.next()) {
                    int oid = rs.getInt("oid");
                    String sql2 = "insert into [OrdersDetail] values(?,?,?,?,?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, c.getId());
                    st2.setInt(3, i.getProduct().getId());
                    st2.setInt(4, i.getQuantity());
                    st2.setString(5, i.getProduct().getName());
                    st2.setString(6, i.getProduct().getImage());
                    st2.setDouble(7, i.getProduct().getPrice());
                    st2.setString(8, date);
                    st2.executeUpdate();
                }
            }

            //cap nhat lai so luong san pham
            String sql3 = "update product set quantity=quantity-? where id=?";
            PreparedStatement st3 = connection.prepareStatement(sql3);
            for (Item i : cart.getItems()) {
                st3.setInt(1, i.getQuantity());
                st3.setInt(2, i.getProduct().getId());
                st3.executeUpdate();
            }
        } catch (SQLException e) {

        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();

    }

}
