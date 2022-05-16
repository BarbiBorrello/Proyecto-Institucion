/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package institucionbarbi_CONTROLADOR;

import institucionMODELO.Alumno;
import institucionMODELO.Inscripcion;
import institucionMODELO.Materia;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JOptionPane;

/**
 *
 * @author Barbara
 */
public class InscripcionData {

    private Connection con = null;

    public InscripcionData(Conexion conexion) {
        try {
            con = conexion.getConexion();
        } catch (SQLException ex) {
            System.out.println("Error en la conexion");
        }
    }

    public void inscribir(Inscripcion insc) {
        String sql = "INSERT INTO inscripcion (idalumno, idmateria, nota) VALUES (?, ?, ?)";

        try {

            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            ps.setInt(1, insc.getAlumno().getIdAlumno());
            ps.setInt(2, insc.getMateria().getIdMateria());
            ps.setDouble(3, insc.getNota());

            ps.executeUpdate();

            ResultSet rs = ps.getGeneratedKeys();
            if (rs.next()) {
                insc.setIdInscripcion(rs.getInt(1));
                JOptionPane.showMessageDialog(null, "Inscripcion exitosa");

            } else {
                JOptionPane.showMessageDialog(null, "No se pudo ingresar la inscripción.");

            }
            ps.close();

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "error en la conexíon.");
        }

    }

    public Inscripcion buscarInscripcion(int idInscripcion) {
        Inscripcion inscripcion = null;

        String sql = "SELECT * FROM inscripcion WHERE idInscripcion =?;";

        try {
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, idInscripcion);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                inscripcion = new Inscripcion();

                inscripcion.setIdInscripcion(rs.getInt("idInscripcion"));
                inscripcion.getAlumno();
                inscripcion.getMateria();
                inscripcion.getNota();

            }
            JOptionPane.showMessageDialog(null, "Inscripcion encontrada");
            ps.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, " Inscripcion inexistente " + ex);

        }

        return inscripcion;

    }

    public void bajaInscripcion(int idInscripcion) {

        String sql = "UPDATE inscripcion SET activo =0 WHERE idInscripcion=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, idInscripcion);

            int rs = ps.executeUpdate();

            if (rs > 0) {
                JOptionPane.showMessageDialog(null, "Inscripcion dada de baja ");
            } else{
                JOptionPane.showMessageDialog(null, "Inscripcion inexistente ");
            }

            ps.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error de conexion en la inscripcion " + ex);

        }

    }
    
    
    
    public void altaInscripcion(int idInscripcion) {

        String sql = "UPDATE inscripcion SET activo =1 WHERE idInscripcion=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, idInscripcion);

            int rs = ps.executeUpdate();

            if (rs > 0) {
                JOptionPane.showMessageDialog(null, "Inscripcion dada de alta ");
            } else {
                JOptionPane.showMessageDialog(null, "Inscripcion inexistente");
            }

            ps.close();
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error de conexion en la inscripcion " + ex);

        }
    }

    
    public void modificarInscripcion(int idInscripcion, Alumno alumno, Materia materia) {


    }
    
//    public List<Inscripcion> obtenerInscripciones() {

//    }
}