package br.itb.projeto.gaiagarden.service;

import java.util.List;

import org.springframework.stereotype.Service;

import br.itb.projeto.gaiagarden.model.entity.Mensagem;
import br.itb.projeto.gaiagarden.model.repository.MensagemRepository;
import jakarta.transaction.Transactional;


@Service
public class MensagemService {

	private MensagemRepository mensagemRepository;

	public MensagemService(MensagemRepository mensagemRepository) {
		super();
		this.mensagemRepository = mensagemRepository;
	}
	
	public List<Mensagem> findAll(){
		List<Mensagem> mensagems = mensagemRepository.findAll();
		return mensagems;
	}
	
	public Mensagem findById(long id) {
		Mensagem mensagem = mensagemRepository.findById(id).orElseThrow();
		return mensagem;
	}
	
	//jakarta.transaction.Transactional
	@Transactional
	public Mensagem create(Mensagem mensagem) {
		
		mensagem.setStatusMensagem("ATIVO");
		
		return mensagemRepository.save(mensagem);
	}
	
	@Transactional
	public Mensagem update(Mensagem mensagem) {
		return mensagemRepository.save(mensagem);
	}
	
}












