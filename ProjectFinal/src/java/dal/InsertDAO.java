/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import entity.Account;
import entity.Category;
import entity.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class InsertDAO extends DBContext {

    public void insertProduct(String name, String img, String price, String title, String description, String category, int uid) {
        String sql = "INSERT [Wish].[dbo].[product]\n"
                + "([name]\n"
                + "      ,[image]\n"
                + "      ,[price]\n"
                + "      ,[title]\n"
                + "      ,[description]\n"
                + "      ,[cateID]\n"
                + "      ,[uID])\n"
                + "	  VALUES(?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setString(1, name);
            st.setString(2, img);
            st.setString(3, price);
            st.setString(4, title);
            st.setString(5, description);
            st.setString(6, category);
            st.setInt(7, uid);
            ResultSet rs = st.executeQuery();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void editProduct(String name, String img, String price, String title, String description,
            String category, String pid) {
        String sql = "update product set [name] = ? ,\n"
                + "				[image] = ?, price = ?,  title = ?, [description] = ?, cateID = ?\n"
                + "				where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setString(1, name);
            st.setString(2, img);
            st.setString(3, price);
            st.setString(4, title);
            st.setString(5, description);
            st.setString(6, category);
            st.setString(7, pid);
            ResultSet rs = st.executeQuery();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
       public void editUser(String id, String name, String phone, String address, String country) {
        String sql = "update Customers set [Customer_name] = ?,\n" +
"             			[phone_number] = ?, \n" +
"						[address] = ?, \n" +
"						[Country] = ?\n" +
"             		where [uID] =?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setString(1, name);
            st.setString(2, phone);
            st.setString(3, address);
            st.setString(4, country);
            st.setString(5, id);

            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
       public void AddComment(String uid, int pid,String comment){
           String sql ="Insert into Productreviews values (?,?,?)";
           try {
            PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
            st.setString(1, uid);
            st.setInt(2, pid);
            st.setString(3, comment);

            st.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
       }
       public static void main(String[] args) {
        InsertDAO id = new InsertDAO();
        id.AddComment("1", 1, "dungntk");
        
        
    }
}
