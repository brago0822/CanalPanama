package com.udistrital.canalpanama.daos;

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
	
}
