package br.itb.projeto.gaiagarden.service;

import java.util.List;

import org.springframework.stereotype.Service;

import br.itb.projeto.gaiagarden.model.entity.Favorito;
import br.itb.projeto.gaiagarden.model.repository.FavoritoRepository;
import jakarta.transaction.Transactional;


@Service
public class FavoritoService {

	private FavoritoRepository favoritoRepository;

	public FavoritoService(FavoritoRepository favoritoRepository) {
		super();
		this.favoritoRepository = favoritoRepository;
	}
	
	public List<Favorito> findAll(){
		List<Favorito> favoritos = favoritoRepository.findAll();
		return favoritos;
	}
	
	public Favorito findById(long id) {
		Favorito favorito = favoritoRepository.findById(id).orElseThrow();
		return favorito;
	}
	
	//jakarta.transaction.Transactional
	@Transactional
	public Favorito create(Favorito favorito) {
		
		favorito.setStatusFavorito("ATIVO");
		
		return favoritoRepository.save(favorito);
	}
	
	@Transactional
	public Favorito update(Favorito favorito) {
		return favoritoRepository.save(favorito);
	}
	
}












