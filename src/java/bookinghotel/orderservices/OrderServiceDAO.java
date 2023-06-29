/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookinghotel.orderservices;

import bookinghotel.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author DW
 */
public class OrderServiceDAO {

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<ServiceDTO> getListServiceByOrder(String orderId) throws SQLException {
        List<ServiceDTO> serviceDTOs = new ArrayList<>();
        try {
            String sql = "select s.id, s.name, s.price from tblOrderService os left join tblService s on os.serviceId = s.id\n"
                    + "where os.orderId = ?";
            con = DBHelper.makeConnect();
            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, orderId);
                rs = ps.executeQuery();
                while (rs.next()) {

                    ServiceDTO serviceDTO = new ServiceDTO(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getDouble("price"));
                    serviceDTOs.add(serviceDTO);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return serviceDTOs;
    }

    public List<ServiceDTO> getListServices() throws SQLException {
        List<ServiceDTO> serviceDTOs = new ArrayList<>();
        try {
            String sql = "select * from tblService";
            con = DBHelper.makeConnect();
            if (con != null) {
                ps = con.prepareStatement(sql);
                rs = ps.executeQuery();
                while (rs.next()) {
                    ServiceDTO serviceDTO = new ServiceDTO(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getDouble("price"));
                    serviceDTOs.add(serviceDTO);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return serviceDTOs;
    }

    public ServiceDTO getServiceById(int id) throws SQLException {
        try {
            String sql = "select * from tblService where id = ?";
            con = DBHelper.makeConnect();
            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setInt(1, id);
                rs = ps.executeQuery();
                if (rs.next()) {
                    ServiceDTO serviceDTO = new ServiceDTO(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getDouble("price"));
                    return serviceDTO;
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return null;
    }

    public void saveOrderService(OrderServiceDTO orderServiceDTO) throws SQLException {
        try {
            String sql = "INSERT INTO [dbo].[tblOrderService]([orderId],[serviceId])\n"
                    + "     VALUES (?,?);";
            con = DBHelper.makeConnect();
            if (con != null) {
                ps = con.prepareStatement(sql);
                ps.setString(1, orderServiceDTO.getOrderId());
                ps.setInt(2, orderServiceDTO.getServiceId());
                ps.executeUpdate();
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
