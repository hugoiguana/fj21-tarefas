package br.com.caleum.tarefas.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caleum.tarefas.beans.Tarefa;
import br.com.caleum.tarefas.dao.JdbcTarefaDao;

@Controller
public class TarefasController {

	@RequestMapping("novaTarefa")
	public String form() {
		return "tarefa/formulario";
	}

	@RequestMapping("adicionaTarefa")
	public String adiciona(@Valid Tarefa tarefa, BindingResult result) {

		if (result.hasFieldErrors("descricao")) {
			return "tarefa/formulario";
		}

		// if(result.hasErrors()){
		// return "tarefa/formulario";
		// }

		JdbcTarefaDao tarefaDao = new JdbcTarefaDao();
		tarefaDao.adiciona(tarefa);

		return "tarefa/adicionada";
	}

	@RequestMapping("listaTarefas")
	public String lista(Model model) {

		JdbcTarefaDao tarefaDao = new JdbcTarefaDao();

		model.addAttribute("tarefas", tarefaDao.getTarefas());

		return "tarefa/lista";
	}

	@RequestMapping("removeTarefa")
	public String remove(Tarefa tarefa) {

		JdbcTarefaDao tarefaDao = new JdbcTarefaDao();

		tarefaDao.exclui(tarefa.getId());

		return "redirect:listaTarefas";
	}

	@RequestMapping("mostraTarefa")
	public String mostra(Tarefa tarefa, Model model) {

		JdbcTarefaDao tarefaDao = new JdbcTarefaDao();

		model.addAttribute("tarefa", tarefaDao.getById(tarefa.getId()));

		return "tarefa/mostra";
	}

	@RequestMapping("alteraTarefa")
	public String altera(Tarefa tarefa) {

		JdbcTarefaDao tarefaDao = new JdbcTarefaDao();

		tarefaDao.altera(tarefa);

		return "redirect:listaTarefas";
	}

	@RequestMapping("finalizaTarefa")
	public void finaliza(Long id, HttpServletResponse response) {

		JdbcTarefaDao dao = new JdbcTarefaDao();
		dao.finaliza(id);
		response.setStatus(200);
	}

	@RequestMapping("excluiTarefa")
	public void excluiTarefa(Long id, HttpServletResponse response) {

		JdbcTarefaDao dao = new JdbcTarefaDao();
		dao.exclui(id);
		response.setStatus(200);
	}
}
