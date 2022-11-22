/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

import java.util.Date;

public class OrderDetail {
        private int oid,pid,quantity;
        private String name, img;
        private Date date;
        private double price;
        private int cusId;
        private String cusName,phone,address;
    public OrderDetail() {
    }

    public OrderDetail(int oid, int pid, int quantity, String name, String img,Date date, double price) {
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.name = name;
        this.img = img;
        this.price = price;
        this.date = date;
    }
        public OrderDetail(int oid, int pid, int quantity, String name, String img,Date date, double price,String cusName,String phone, String address) {
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.name = name;
        this.img = img;
        this.price = price;
        this.date = date;
        this.cusName = cusName;
        this.phone = phone;
        this.address = address;
    }
        
        public OrderDetail(int oid, int pid, int quantity, String name, String img,Date date, double price,int cusId) {
        this.oid = oid;
        this.pid = pid;
        this.quantity = quantity;
        this.name = name;
        this.img = img;
        this.price = price;
        this.date = date;
        this.cusId = cusId;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCusName() {
        return cusName;
    }

    public void setCusName(String cusName) {
        this.cusName = cusName;
    }

    public int getCusId() {
        return cusId;
    }

    public void setCusId(int cusId) {
        this.cusId = cusId;
    }

    public int getOid() {
        return oid;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
        
}
