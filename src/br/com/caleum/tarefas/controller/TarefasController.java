package br.com.caleum.tarefas.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caleum.tarefas.beans.Tarefa;
import br.com.caleum.tarefas.dao.JdbcTarefaDao;

@Controller
public class TarefasController {

	@RequestMapping("novaTarefa")
	public String form(){
		
		return "tarefa/formulario";
	}
	
	
	@RequestMapping("adicionaTarefa")
	public String adiciona(Tarefa tarefa){
	
		JdbcTarefaDao tarefaDao = new JdbcTarefaDao();
		tarefaDao.adiciona(tarefa);
		
		return "tarefa/adicionada";
	}
}
