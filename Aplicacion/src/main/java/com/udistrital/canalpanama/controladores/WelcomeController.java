package com.udistrital.canalpanama.controladores;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.udistrital.canalpanama.util.ODBManager;

@Controller
public class WelcomeController {
	@Autowired
	private ODBManager odbManager;
	
	// inject via application.properties
	@Value("${welcome.message:test}")
	private String message = "";

	@RequestMapping("/")
	public String welcome(Model model) {
		try {
			odbManager.conectar();
	    }catch(Exception e) {
	    	//return new ResponseEntity<>(e.getMessage(),HttpStatus.UNAUTHORIZED);
	    	model.addAttribute("mensajeTitulo", "Error en conexion");
	    }
	    	model.addAttribute("mensajeTitulo", "Conectado");
	    	
		model.addAttribute("mensajeTitulo", this.message);
		return "welcome"; //Se retorna el nombre de la vista HTML
	}
	

}
