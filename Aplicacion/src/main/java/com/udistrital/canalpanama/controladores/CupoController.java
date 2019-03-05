package com.udistrital.canalpanama.controladores;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.udistrital.canalpanama.daos.CupoDAO;
import com.udistrital.canalpanama.util.ODBManager;
import com.udistrital.canalpanama.modelo.Cupo;


@Controller
@RequestMapping("/cupos")
public class CupoController {
	
	@Autowired
	private CupoDAO cupoDao;
	@Autowired
	private ODBManager odbManager;
	
	@GetMapping("/list")
	public String listar(Model model) {
		model.addAttribute("message", "Cupo, agregado al modelo");
		List<Cupo> res = new ArrayList<>();
		try {
			//odbManager.tomarConexion();
			res = cupoDao.listarCupos();
			/*Iterator<Cupo> iter = res.iterator();
			while(iter.hasNext())
				System.out.println(iter.next());*/
			
			model.addAttribute("listadoCupos", res);
//			model.addAttribute("mensajeTitulo", "Contador de Registros = " + aptoDao.contarRegistros());
//			model.addAttribute("mensajeTitulo", "Conectado");
	    }catch(Exception e) {
	    	model.addAttribute("mensajeTitulo", e.getMessage());
	    	//return new ResponseEntity<>(e.getMessage(),HttpStatus.UNAUTHORIZED);
	    } 
	    model.addAttribute("mensajeTitulo", "Cupoooooooos");
	    	//return new ResponseEntity<>("Se han listado los Cupos",HttpStatus.OK);
//		model.addAttribute("listadoCupos", res);
	    	//model.addAttribute("mensajeTitulo", "Conectado");
		//return "Cupo";
    	odbManager.liberarConexion();
    	return "cupos/list-cupos";
	}

}
