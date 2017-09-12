package br.com.caelum.tarefas.dao;

import java.util.List;

import br.com.caelum.tarefas.beans.Tarefa;

public interface ITarefaDao {

	Tarefa getById(Long id);

	List<Tarefa> lista();

	void adiciona(Tarefa t);

	void altera(Tarefa t);

	void remove(Tarefa t);

	void finaliza(Long id);

}
