package com.udistrital.canalpanama.controladores;


import java.sql.SQLException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RestController;


import com.udistrital.canalpanama.daos.UsuarioDAO;
import com.udistrital.canalpanama.modelo.Usuario;
import com.udistrital.canalpanama.util.ODBManager;

@RestController
public class LoginController {
	@Autowired
	private ODBManager odbManager;
	@Autowired
	private UsuarioDAO usuarioDAO;
 
    @RequestMapping(value="/login",method=RequestMethod.POST)
    public ResponseEntity<String> login(@RequestBody Usuario usuario, Model model) throws Exception {
    	try {
	    	odbManager.conectar(usuario);
	    	model.addAttribute("usuarioNombre", "Pepito"/*usuario.getUser()*/);
	//    	odbManager.liberarConexion();
    	}catch(Exception e) {
    		return new ResponseEntity<>(e.getMessage(),HttpStatus.UNAUTHORIZED);
    	}
    	model.addAttribute("mensajeTitulo", "Mensaje");
    	return new ResponseEntity<>("La sesión ha sido iniciada correctamente",HttpStatus.OK);
    }
    
    @RequestMapping(value="/loadUser",method=RequestMethod.POST)
    public ResponseEntity<String> loadUser() throws Exception {
    	String usuario = null;
		try {
			usuario = usuarioDAO.obtenerUsuario();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
    	return new ResponseEntity<>(usuario,HttpStatus.OK);
    }
    
    @RequestMapping(value="/logout",method=RequestMethod.GET)
    public ResponseEntity<String> logout() throws Exception {
    	try {
    	odbManager.cerrarConexion();
    	}catch(Exception e) {
    		return new ResponseEntity<>(e.getMessage(),HttpStatus.CONFLICT);
    	}
    	return new ResponseEntity<>("Conexion cerrada",HttpStatus.OK);
    }
}
