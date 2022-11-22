/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dal.TakeInfoDAO;
import entity.Account;
import entity.OrderDetail;
import entity.Product;
import entity.Statistical;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author mylov
 */
public class SellDetails extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession sesstion = request.getSession();
        List<OrderDetail> list = new ArrayList<>();
        TakeInfoDAO tid = new TakeInfoDAO();
        Account a = (Account) sesstion.getAttribute("account");
        List<Statistical> listD = new ArrayList<>();
        for (Product ls : tid.getPIdByUId(a.getId())) {
            int pid1 = ls.getId();
            System.out.println(pid1);
            try {
                for (OrderDetail o : tid.getAllOrderInfoByPid(pid1)) {
                    int oid2 = o.getOid();
                    String name = tid.getCNamedByOId(o.getCusId());
                    String phone = tid.getCPhoneByOId(o.getCusId());
                    String address = tid.getCAddressByOId(o.getCusId());
                    System.out.println(o.getOid());
                    list.add(tid.getAllOrderInfoByOid(oid2, name, phone, address));

                }
            } catch (Exception e) {
            }

            Date date = null;

            for (OrderDetail od : list) {
                Date date1 = od.getDate();

                if (!date1.equals(date)) {
                    listD.add(tid.gePriceOrderInfoByDate(od.getDate()));
                    date = date1;
                }
            }
        }

        request.setAttribute("listD", listD);
        request.setAttribute("listP", list);
        request.getRequestDispatcher("SellDetail.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
