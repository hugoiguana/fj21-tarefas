package br.com.caleum.tarefas.beans;

import java.util.Calendar;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Tarefa {

	private Long id;

//	@Size(min=5, message="A descrição deve ter pelo menos 5 caracteres.")
//	@NotNull(message="O campo descrição não pode ser nulo")
	@Size(min=5, message="{tarefa.descricao.pequena}")
	@NotNull(message="{tarefa.descricao.vazia}")
	private String descricao;
	
	private boolean finalizado;
	
	private Calendar dataFinalizacao;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	public boolean getFinalizado() {
		return finalizado;
	}

	public void setFinalizado(boolean finalizado) {
		this.finalizado = finalizado;
	}

	public Calendar getDataFinalizacao() {
		return dataFinalizacao;
	}

	public void setDataFinalizacao(Calendar dataFinalizacao) {
		this.dataFinalizacao = dataFinalizacao;
	}

}