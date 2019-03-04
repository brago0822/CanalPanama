package com.udistrital.canalpanama.controladores;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.udistrital.canalpanama.daos.ApartamentoDAO;
import com.udistrital.canalpanama.util.ODBManager;
import com.udistrital.canalpanama.modelo.Apartamento;


@RestController
public class ApartamentoController {
	
	@Autowired
	private ApartamentoDAO aptoDao;
	@Autowired
	private ODBManager odbManager;
	
	@RequestMapping(value="/apartamento",method=RequestMethod.GET)
	public List<Apartamento> listar(Model model) throws Exception {
		model.addAttribute("message", "Apartamento, agregado al modelo");
		List<Apartamento> res = new ArrayList<>();
		try {
			//odbManager.tomarConexion();
			res = aptoDao.listarApartamentos();
			/*Iterator<Apartamento> iter = res.iterator();
			while(iter.hasNext())
				System.out.println(iter.next());*/
			
			model.addAttribute("listadoApartamentos", res);
//			model.addAttribute("mensajeTitulo", "Contador de Registros = " + aptoDao.contarRegistros());
//			model.addAttribute("mensajeTitulo", "Conectado");
	    }catch(Exception e) {
	    	model.addAttribute("mensajeTitulo", e.getMessage());
	    	//return new ResponseEntity<>(e.getMessage(),HttpStatus.UNAUTHORIZED);
	    } 	finally {
	    	odbManager.liberarConexion();
	    }
	    	model.addAttribute("mensajeTitulo", "Apartamentoooooooos");
	    	//return new ResponseEntity<>("Se han listado los apartamentos",HttpStatus.OK);
//		model.addAttribute("listadoApartamentos", res);
	    	//model.addAttribute("mensajeTitulo", "Conectado");
		//return "apartamento";
	    	return res;
	}

}
