/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author mylov
 */
public class Sellingproducts {
    private int quantity;
    private int pid;

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public Sellingproducts() {
    }

    public Sellingproducts(int quantity, int pid) {
        this.quantity = quantity;
        this.pid = pid;
    }
    
}
