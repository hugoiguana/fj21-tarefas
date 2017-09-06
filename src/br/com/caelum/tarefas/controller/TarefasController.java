package br.com.caelum.tarefas.controller;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.tarefas.beans.Tarefa;
import br.com.caelum.tarefas.dao.JdbcTarefaDao;

@Controller
public class TarefasController {

	JdbcTarefaDao tarefaDao;

	@Autowired
	public TarefasController(JdbcTarefaDao tarefaDao) {
		this.tarefaDao = tarefaDao;
	}

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

		tarefaDao.adiciona(tarefa);

		return "tarefa/adicionada";
	}

	@RequestMapping("listaTarefas")
	public String lista(Model model) {

		model.addAttribute("tarefas", tarefaDao.getTarefas());

		return "tarefa/lista";
	}

	@RequestMapping("removeTarefa")
	public String remove(Tarefa tarefa) {

		tarefaDao.exclui(tarefa.getId());

		return "redirect:listaTarefas";
	}

	@RequestMapping("mostraTarefa")
	public String mostra(Tarefa tarefa, Model model) {

		model.addAttribute("tarefa", tarefaDao.getById(tarefa.getId()));

		return "tarefa/mostra";
	}

	@RequestMapping("alteraTarefa")
	public String altera(Tarefa tarefa) {

		tarefaDao.altera(tarefa);

		return "redirect:listaTarefas";
	}

	@RequestMapping("finalizaTarefa")
	public String finaliza(Long id, Model model) {

		tarefaDao.finaliza(id);

		model.addAttribute("tarefa", tarefaDao.getById(id));

		return "tarefa/finalizada";
	}

	@RequestMapping("excluiTarefa")
	public void excluiTarefa(Long id, HttpServletResponse response) {
		tarefaDao.exclui(id);
		response.setStatus(200);
	}
}
