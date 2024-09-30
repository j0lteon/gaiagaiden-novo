package br.itb.projeto.gaiagarden.service;

import java.util.List;

import org.springframework.stereotype.Service;

import br.itb.projeto.gaiagarden.model.entity.Catalogo;
import br.itb.projeto.gaiagarden.model.repository.CatalogoRepository;
import jakarta.transaction.Transactional;


@Service
public class CatalogoService {

	private CatalogoRepository catalogoRepository;

	public CatalogoService(CatalogoRepository catalogoRepository) {
		super();
		this.catalogoRepository = catalogoRepository;
	}
	
	public List<Catalogo> findAll(){
		List<Catalogo> catalogos = catalogoRepository.findAll();
		return catalogos;
	}
	
	public Catalogo findById(long id) {
		Catalogo catalogo = catalogoRepository.findById(id).orElseThrow();
		return catalogo;
	}
	
	//jakarta.transaction.Transactional
	@Transactional
	public Catalogo create(Catalogo catalogo) {
		
		catalogo.setStatusProdCat("ATIVO");
		
		return catalogoRepository.save(catalogo);
	}
	
	@Transactional
	public Catalogo update(Catalogo catalogo) {
		return catalogoRepository.save(catalogo);
	}
}












