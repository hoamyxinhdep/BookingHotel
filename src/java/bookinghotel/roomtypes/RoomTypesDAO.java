/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bookinghotel.roomtypes;

import bookinghotel.utils.DBHelper;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author Admin
 */
public class RoomTypesDAO {
     public boolean insertRoomType(RoomTypesDTO roomType) throws NamingException, SQLException {
        Connection con = null;
        PreparedStatement pst = null;
        try {
            con = DBHelper.makeConnect();

            if (con != null) {
                String sql = "insert into tblTypeRoom (typeName,[Description],MaxPeople,[Image],Utilities,Bed)\n"
                        + "  values (?,?,?,?,?,?)";
                pst = con.prepareStatement(sql);
                pst.setString(1, roomType.getTypeName());
                pst.setString(2, roomType.getDiscription());
                pst.setInt(3, roomType.getMaxPeople());
                pst.setString(4, roomType.getImage());
                pst.setString(5, roomType.getUtilities());
                pst.setString(6, roomType.getBed());
                if (pst.executeUpdate() > 0) {
                    return true;
                }
            }
        } finally {
            if (pst != null) {
                pst.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return false;
    }
 

    
}
