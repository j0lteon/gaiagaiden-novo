package br.itb.projeto.gaiagarden.model.entity;

import java.time.LocalDateTime;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Favorito")
public class Favorito {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	private LocalDateTime dataCadastro;
	@ManyToOne
	@JoinColumn(name = "usuario_id")
	private Usuario Usuario;
	@ManyToOne
	@JoinColumn(name = "produto_id")
	private Produto Produto;
	private String statusFavorito;
	
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public LocalDateTime getDataCadastro() {
		return dataCadastro;
	}
	public void setDataCadastro(LocalDateTime dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	public Usuario getUsuario() {
		return Usuario;
	}
	public void setUsuario(Usuario usuario) {
		Usuario = usuario;
	}
	public Produto getProduto() {
		return Produto;
	}
	public void setProduto(Produto produto) {
		Produto = produto;
	}
	public String getStatusFavorito() {
		return statusFavorito;
	}
	public void setStatusFavorito(String statusFavorito) {
		this.statusFavorito = statusFavorito;
	}
}
