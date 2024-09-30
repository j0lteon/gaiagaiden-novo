package br.itb.projeto.gaiagarden.service;

import java.util.Base64;
import java.util.List;

import org.springframework.stereotype.Service;

import br.itb.projeto.gaiagarden.model.entity.Usuario;
import br.itb.projeto.gaiagarden.model.repository.UsuarioRepository;
import jakarta.transaction.Transactional;

@Service
public class UsuarioService {

	private UsuarioRepository usuarioRepository;

	public UsuarioService(UsuarioRepository usuarioRepository) {
		this.usuarioRepository = usuarioRepository;
	}
	// Source -> Generate Constructor using Fields...

	public List<Usuario> findAll() {
		List<Usuario> usuarios = usuarioRepository.findAll();
		return usuarios;
	}

	public Usuario findById(long id) {
		Usuario usuario = usuarioRepository.findById(id).orElseThrow();
		return usuario;
	}

	public Usuario findByEmail(String email) {
		Usuario usuario = usuarioRepository.findByEmail(email);
		return usuario;
	}

	@Transactional
	public Usuario create(Usuario usuario) {

		String senha = Base64.getEncoder().encodeToString(usuario.getSenha().getBytes());
		usuario.setSenha(senha);

		usuario.setStatusUsuario("ATIVO");

		return usuarioRepository.save(usuario);

	}
	
	@Transactional
	public Usuario update(Usuario usuario) {
		return usuarioRepository.save(usuario);
	}

	@Transactional
	public Usuario signin(String email, String senha) {
		Usuario usuario = usuarioRepository.findByEmail(email);
	    
		if (usuario.getStatusUsuario().equals("ATIVO")) {
			byte[] decodePass = Base64.getDecoder().decode(usuario.getSenha());
			if (new String(decodePass).equals(senha)) {
				return usuario;
			}
		}
		return null;
	}


	@Transactional
	public Usuario esqueciSenha( Usuario usuario) {
		Usuario _usuario = usuarioRepository.findByEmail(usuario.getEmail());

		if (_usuario != null) {
			String senha = Base64.getEncoder().encodeToString(usuario.getSenha().getBytes());

			usuario.setSenha(senha);

			return usuarioRepository.save(usuario);
		}
		return null;
	}
}










