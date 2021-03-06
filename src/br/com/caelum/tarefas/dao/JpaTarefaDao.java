package br.com.caelum.tarefas.dao;

import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.caelum.tarefas.beans.Tarefa;

@Repository
public class JpaTarefaDao implements ITarefaDao {

	@PersistenceContext
	EntityManager manager;
	
	
	@Override
	public Tarefa getById(Long id) {
		
		return manager.find(Tarefa.class, id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Tarefa> lista() {
		return manager.createQuery("select t from Tarefa t").getResultList();
	}

	@Override
	public void adiciona(Tarefa tarefa) {
//		manager.getTransaction().begin();
		manager.persist(tarefa);
//		manager.getTransaction().commit();
//		manager.close();
	}

	@Override
	public void altera(Tarefa tarefa) {
		manager.merge(tarefa);
	}

	@Override
	public void remove(Tarefa tarefa) {
		Tarefa tarefaARemover = getById(tarefa.getId());
		manager.remove(tarefaARemover);

	}

	@Override
	public void finaliza(Long id) {
	    Tarefa tarefa = getById(id);
        tarefa.setFinalizado(true);
        tarefa.setDataFinalizacao(Calendar.getInstance());
	}

}
