package br.itb.projeto.gaiagarden.rest.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import br.itb.projeto.gaiagarden.model.entity.Mensagem;
import br.itb.projeto.gaiagarden.service.MensagemService;

@RestController
@RequestMapping("/mensagem/")
public class MensagemController {

	private MensagemService mensagemService;

	public MensagemController(MensagemService mensagemService) {
		this.mensagemService = mensagemService;
	}

	@GetMapping("findAll")
	public ResponseEntity<List<Mensagem>> findAll() {
		List<Mensagem> mensagens = mensagemService.findAll();

		return new ResponseEntity<List<Mensagem>>(
								mensagens, HttpStatus.OK);
	}
	
	@GetMapping("findById/{id}")
	public ResponseEntity<Mensagem> findById(
			@PathVariable long id){
		
		Mensagem mensagem = 
				mensagemService.findById(id);
		
		return new ResponseEntity<Mensagem>
					(mensagem, HttpStatus.OK);
		
	}
	
	@PostMapping("create")
	public ResponseEntity<Mensagem> create (
			@RequestBody Mensagem mensagem){
		
		Mensagem _mensagem = 
				mensagemService.create(mensagem);
		
		return new ResponseEntity<Mensagem>
				      (_mensagem, HttpStatus.OK);	
	}
	
	@PostMapping("update")
	public ResponseEntity<Mensagem> update(
			@RequestBody Mensagem mensagem){
				
		Mensagem _mensagem = 
				mensagemService.update(mensagem);
		
		System.out.println(_mensagem.getId());
		
		return new ResponseEntity<Mensagem>
	      						(_mensagem, HttpStatus.OK);
	}
	
	
}






