package com.udistrital.canalpanama.util;

import java.sql.Connection;
import java.sql.*;
import java.sql.SQLException;

import javax.annotation.PreDestroy;

import org.springframework.stereotype.Repository;

import com.udistrital.canalpanama.modelo.Usuario;


/**
 * Recursos Humanos
 * @author Alba Consuelo Nieto
 */
@Repository
public class ODBManager {

	/**
	 * Instancia del ServiceLocator
	 */
	//private static ODBManager instance = null;

	/**
	 * Conexion compartida a la Base de Datos
	 */
	private Connection conexion = null;

	/**
	 * Bandera que indica el estado de la conexion
	 */
	private boolean conexionLibre = true;

	/**
	 * @return instancia del ServiceLocator para el manejo de la conexion
	 */
	/*public static ODBManager getInstance() {
		if (instance == null) {
			try {
				instance = new ODBManager();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return instance;
	}*/

	/**
	 * @throws Exception
	 *             dice si no se pudo crear la conexion
	 */
	public void conectar() throws Exception {
			 /** TODO Establecer la conexion a la bd. usuario= hr, password= hr **/
                     Class.forName("oracle.jdbc.driver.OracleDriver");
                     conexion=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe"
                    		 ,"system"//usuario.getUser(),
                    		 ,"ORACLE2018");//usuario.getPassword());
                    		 
				     conexion.setAutoCommit(true);
	}

	public void conectar(Usuario usuario) throws Exception {
		 /** TODO Establecer la conexion a la bd. usuario= hr, password= hr **/
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conexion=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe"
               		 ,usuario.getUser()
               		 ,usuario.getPassword());
               		 
			     conexion.setAutoCommit(true);
}
	/**
	 * Toma la conexion para que ningun otro proceso la puedan utilizar
	 * @return da la conexion a la base de datos
	 */
	public synchronized Connection tomarConexion() {
		if(conexion != null) {
			/*while (!conexionLibre) {
				try {
				  wait();
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}*/
			conexionLibre = false;
			notify();
			return conexion;
		}
		return null;
	}

	/**
	 * Libera la conexion de la bases de datos para que ningun otro
	 * proceso la pueda utilizar
	 */
	public synchronized void liberarConexion() {
		/*while (conexionLibre) {
			try {
				wait();
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}*/

		conexionLibre = true;
		notify();
	}

	/**
	 * Cierra la conexion a la base de datos cuando se termina de
	 * ejecutar el programa
	 */
	public void close() {
		try {
			conexion.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Realiza los cambios en la base de datos. Con este metodo
	 * se asegura que no halla inconsitencias en el modelo relacional
	 * de la Base de datos.
	 * 
	 * Se utiliza cuando el procedimiento de insercion es terminado
	 * correctamente y se asegura que los datos en el modelo estan bien
	 * relacionados.
	 */
	public void commit() {
		try {
			conexion.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Deshace los cambios en la base de datos. Con este metodo
	 * se asegura que no halla inconsitencias en el modelo relacional
	 * de la Base de datos.
	 * 
	 * Se utiliza por lo general cuando se devuelve una Exepcion.
	 * Los procedimientos intermedios no deberia quedar almacenados en la
	 * base de datos. 
	 */

	public void rollback() {
		try {
			conexion.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void cerrarConexion() throws Exception{
		//cerrar la conexion con la base de datos
		System.out.println("cerrando conexion a BD");
		conexion.close();
	}
	
	@PreDestroy
	public void cleanUp() throws Exception {
		cerrarConexion();
	}

}
