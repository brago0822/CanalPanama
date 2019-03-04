package com.udistrital.canalpanama.daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.udistrital.canalpanama.modelo.Apartamento;
import com.udistrital.canalpanama.util.ODBManager;

@Repository
public class ApartamentoDAO {
	@Autowired
	private ODBManager odbManager;
	
	public List<Apartamento> listarApartamentos() throws Exception {
		Connection conexion = odbManager.tomarConexion();
		List<Apartamento> listadoApartamentos = new ArrayList<>();
		if(conexion == null) {
			throw new SQLException("No loggeado");
		}
		else {
			Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("SELECT k_apartamento, v_area_m2, t_coeficiente, v_cuota_actual,k_identificacion, k_tipoid, k_bloque, k_conjunto FROM apartamento");// WHERE ID = '"+idSubasta+"'"); Se debería agregar un estado a la subasta ACTIVO=SI/NO
		     /*int i = rec.getRow() ;
		     if (i == 0) {
		    	 throw new SQLException("ResulSet Vacìo");
		     }*/
		     while (rec.next()) {
		    	  Apartamento apartamento = new Apartamento();
		    	  apartamento.setId(rec.getInt("K_APARTAMENTO"));
		    	  apartamento.setArea_m2(rec.getDouble("V_AREA_M2"));
		    	  apartamento.setCoeficiente(rec.getDouble("T_COEFICIENTE"));
		    	  apartamento.setValor_cuota(rec.getDouble("V_CUOTA_ACTUAL"));
		    	  apartamento.setTipo_id(rec.getString("K_TIPOID"));
		    	  apartamento.setIdentificacion(rec.getLong("K_IDENTIFICACION"));
		    	  apartamento.setBloque(rec.getInt("K_BLOQUE"));
		    	  apartamento.setConjunto(rec.getString("K_CONJUNTO"));
		    	  listadoApartamentos.add(apartamento);
		      }/*Apartamento apartamento = new Apartamento();
	    	  apartamento.setId(5);
	    	  apartamento.setArea_m2(45);
	    	  apartamento.setCoeficiente(0.7);
	    	  apartamento.setValor_cuota(450000);
	    	  apartamento.setTipo_id("CC");
	    	  apartamento.setIdentificacion(124515322);
	    	  apartamento.setBloque(2);
	    	  apartamento.setConjunto("VIPAZ");
	    	  listadoApartamentos.add(apartamento);*/
		      st.close();
		      odbManager.liberarConexion();
			 /**/
		      
		}
		return listadoApartamentos;
	}
	
	/*public int contarRegistros () throws SQLException {
		int contador = 0;
		Connection conexion = odbManager.tomarConexion();
		ArrayList<Apartamento> listadoApartamentos = new ArrayList<Apartamento>();
		if(conexion == null) {
			throw new SQLException("No loggeado");
		}
		else {
			Statement st = conexion.createStatement();
		     ResultSet rec = st.executeQuery("SELECT * FROM ADMHOR.APARTAMENTO");// WHERE ID = '"+idSubasta+"'"); Se debería agregar un estado a la subasta ACTIVO=SI/NO
		      while (rec.next()) {
		    	  contador++;
		    	  Apartamento apartamento = new Apartamento();
		    	  apartamento.setId(rec.getInt("K_APARTAMENTO"));
		    	  apartamento.setArea_m2(rec.getDouble("V_AREA_M2"));
		    	  apartamento.setCoeficiente(rec.getDouble("T_COEFICIENTE"));
		    	  apartamento.setValor_cuota(rec.getInt("V_CUOTA_ACTUAL"));
		    	  apartamento.setTipo_id(rec.getString("K_TIPOID"));
		    	  apartamento.setIdentificacion(rec.getInt("K_IDENTIFICACION"));
		    	  apartamento.setBloque(rec.getInt("K_BLOQUE"));
		    	  apartamento.setConjunto(rec.getString("K_CONJUNTO"));
		    	  listadoApartamentos.add(apartamento);
			
		      }
		      st.close();
			 /*Apartamento apartamento = new Apartamento();
	    	  apartamento.setId(5);
	    	  apartamento.setArea_m2(45);
	    	  apartamento.setCoeficiente(0.7);
	    	  apartamento.setValor_cuota(450000);
	    	  apartamento.setTipo_id("CC");
	    	  apartamento.setIdentificacion(124515322);
	    	  apartamento.setBloque(2);
	    	  apartamento.setConjunto("VIPAZ");
	    	  listadoApartamentos.add(apartamento);
		}

		return contador;
		
	}*/
}
