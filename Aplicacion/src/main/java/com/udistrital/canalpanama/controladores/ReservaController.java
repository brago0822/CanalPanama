package com.udistrital.canalpanama.controladores;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.udistrital.canalpanama.daos.ReservaDAO;
import com.udistrital.canalpanama.util.ODBManager;
import com.udistrital.canalpanama.modelo.VReserva;

@Controller
@RequestMapping("/reserva")
public class ReservaController {
	
	@Autowired
	private ReservaDAO reservaDao;
	@Autowired
	private ODBManager odbManager;
	
	@GetMapping("/list")
	public String listar(Model model) throws Exception {
		List<VReserva> res = new ArrayList<>();
		try {
			res = reservaDao.listarReservas();
			model.addAttribute("listadoReservas", res);
	    }catch(Exception e) {
	    	model.addAttribute("mensajeTitulo", e.getMessage());
	    } 	finally {
	    	odbManager.liberarConexion();
	    }

		odbManager.liberarConexion();
    	return "reserva/ListadoReservas";
	}

}
