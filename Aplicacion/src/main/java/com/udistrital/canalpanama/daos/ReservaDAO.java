package com.udistrital.canalpanama.daos;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.udistrital.canalpanama.modelo.VReserva;
import com.udistrital.canalpanama.util.ODBManager;
import oracle.jdbc.OracleTypes;


@Repository
public class ReservaDAO {
	@Autowired
	private ODBManager odbManager;
	
	public List<VReserva> listarReservas() throws Exception {
		Connection conexion = odbManager.tomarConexion();
		List<VReserva> listadoReservas = new ArrayList<>();
		if(conexion == null) {
			throw new SQLException("No loggeado");
		}
		else {
			Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("SELECT * FROM V_LISTADO_RESERVAS");// WHERE ID = '"+idSubasta+"'"); Se debería agregar un estado a la subasta ACTIVO=SI/NO
		     /*int i = rec.getRow() ;
		     if (i == 0) {
		    	 throw new SQLException("ResulSet Vacìo");
		     }*/
		     while (rec.next()) {
		    	  VReserva vReserva = new VReserva();
		    	  vReserva.setIdReserva(rec.getInt(1));
		    	  vReserva.setIdAgente(rec.getInt(2));
		    	  vReserva.setCodigoCliente(rec.getString(3));
		    	  vReserva.setFechaReservaRealizada(rec.getString(4));
		    	  vReserva.setFechaFuturoPaso(rec.getString(5));
		    	  vReserva.setTipoBuque(rec.getString(6)); 
		    	  vReserva.setSentido(rec.getString(7));
		    	  vReserva.setPeriodo(rec.getString(8));
		    	  vReserva.setEstado(rec.getString(9));
		    	  
		    	  listadoReservas.add(vReserva);
		      }
		      st.close();
		      odbManager.liberarConexion();
			 /**/
		      
		}
		return listadoReservas;
	}
	
	public String registrarReservas(int idCupo, int idAgente, int idBuque) throws Exception {
		Connection conexion = odbManager.tomarConexion();
		Statement st = null;
		String mensaje  = "";
        int codError 	 = 0;
        String msjError = "";
        
		try {

			if(conexion == null) {
				throw new SQLException("No loggeado");
			}
			else {
				 st = conexion.createStatement();
			     //ResultSet rec = st.executeQuery("SELECT * FROM V_LISTADO_RESERVAS");// WHERE ID = '"+idSubasta+"'"); Se debería agregar un estado a la subasta ACTIVO=SI/NO
				 CallableStatement cst = conexion.prepareCall("{call PK_RESERVA.PR_REGISTRAR_RESERVA(?,?,?,?,?,?)}");
			     cst.setInt(1, idCupo);
			     cst.setInt(2, idAgente);
	             cst.setInt(3, idBuque);
	             // Definimos los tipos de los parametros de salida del procedimiento almacenado
	             cst.registerOutParameter(4, java.sql.Types.VARCHAR);
	             cst.registerOutParameter(5, java.sql.Types.INTEGER);
	             cst.registerOutParameter(6, java.sql.Types.VARCHAR);
				 
				 cst.execute();
				 
				 mensaje  = cst.getString(5);
	             codError 	 = cst.getInt(5);
	             msjError = cst.getString(6);
			      
			}
		} catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	    	st.close();
		      odbManager.liberarConexion();
    	}
    	
		/*if (msjError != null || msjError != ""){
			return "ERROR: Código Error: "+ codError + "; MensajeError: "+ msjError;
			
		}*/
		return "Mensaje:" + mensaje;		
	}
	
	
}
