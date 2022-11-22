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

public class DeleteDAO extends DBContext{
    
    public void DeleteProdcut(String pid){
    String sql="delete from product where id = ?";
    try{
         PreparedStatement st = connection.prepareStatement(sql);//mo ket noi voi sql
         st.setString(1, pid);
            ResultSet rs = st.executeQuery();
    }catch(Exception e){
        System.out.println(e);}
            }
}

