package br.com.caleum.tarefas.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
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
	public String adiciona(@Valid Tarefa tarefa, BindingResult result){
	
		if(result.hasFieldErrors("descricao")){
			return "tarefa/formulario";
		}
		
//		if(result.hasErrors()){
//			return "tarefa/formulario";
//		}
		
		JdbcTarefaDao tarefaDao = new JdbcTarefaDao();
		tarefaDao.adiciona(tarefa);
		
		return "tarefa/adicionada";
	}
}
