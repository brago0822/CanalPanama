package com.udistrital.canalpanama.daos;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.udistrital.canalpanama.modelo.Cupo;
import com.udistrital.canalpanama.util.ODBManager;

@Repository
public class CupoDAO {
	@Autowired
	private ODBManager odbManager;
	
	public List<Cupo> listarCupos() throws Exception {
		Connection conexion = odbManager.tomarConexion();
		List<Cupo> listadoCupos = new ArrayList<>();
		if(conexion == null) {
			throw new SQLException("No loggeado");
		}
		else {
			Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("SELECT * FROM cupo order by k_cupo");
		     /*int i = rec.getRow() ;
		     if (i == 0) {
		    	 throw new SQLException("ResulSet Vacìo");
		     }*/
		     while (rec.next()) {
		    	  Cupo cupo = new Cupo();
		    	  cupo.setId(rec.getInt("K_CUPO"));
		    	  cupo.setTipo_esclusa(rec.getString("N_TIPO_ESCLUSA"));
		    	  cupo.setSentido(rec.getString("N_SENTIDO"));
		    	  cupo.setFecha(rec.getDate("F_CUPO"));
		    	  cupo.setTipo_cupo(rec.getString("N_TIPO_CUPO"));
		    	  listadoCupos.add(cupo);
		      }/*Cupo cupo = new Cupo();
		      cupo.setId(1);
	    	  cupo.setTipo_esclusa("NEO");
	    	  cupo.setSentido("ESTE");
	    	  cupo.setFecha(null);
	    	  cupo.setTipo_cupo("NORMA");
	    	  listadoCupos.add(cupo);*/
		      st.close();
		      odbManager.liberarConexion();
			 /**/
		      
		}
		return listadoCupos;
	}

}
