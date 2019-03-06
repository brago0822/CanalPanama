package com.udistrital.canalpanama.controladores;

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
		
		if (odbManager.tomarConexion() == null) {
			return "login";
		}
		
		return "index";
	    	
	}
	

}
