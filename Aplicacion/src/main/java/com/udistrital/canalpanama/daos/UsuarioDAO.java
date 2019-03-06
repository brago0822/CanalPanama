package com.udistrital.canalpanama.daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.udistrital.canalpanama.util.ODBManager;

@Repository
public class UsuarioDAO {
	@Autowired
	private ODBManager odbManager;
	
	public String obtenerUsuario() throws SQLException{		 
		 Connection conexion = odbManager.tomarConexion();		 
		 if(conexion != null) {
			 Statement st = conexion.createStatement();
			 ResultSet rec = st.executeQuery("SELECT user FROM DUAL");
			 String user =  ""+rec.next();//rec.getString(1);
			 st.close();
		     odbManager.liberarConexion();
		     return user;
	      }
		 else {
			 return null;
		 }
		
	}
	
}
