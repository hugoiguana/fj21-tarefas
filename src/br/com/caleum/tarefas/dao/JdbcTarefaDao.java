package br.com.caleum.tarefas.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import br.com.caleum.tarefas.beans.Tarefa;
import br.com.caleum.tarefas.jdbc.ConectionFactory;

public class JdbcTarefaDao {

	private Connection con;

	public JdbcTarefaDao() {
		super();
		this.con = new ConectionFactory().getConection();
	}

	public JdbcTarefaDao(Connection con) {
		super();
		this.con = con;
	}

	public Tarefa getById(long id) {

		try {

			String sql = "SELECT * FROM tarefas WHERE id = ?";

			PreparedStatement stmt = this.con.prepareStatement(sql);

			stmt.setLong(1, id);

			ResultSet rs = stmt.executeQuery();

			rs.next();

			Tarefa tarefa = new Tarefa();
			tarefa.setId(rs.getLong("id"));
			tarefa.setDescricao(rs.getString("descricao"));
			tarefa.setFinalizado(rs.getBoolean("finalizado"));

			if (rs.getDate("dataFinalizacao") != null) {
				Calendar dataFinalizacao = Calendar.getInstance();
				dataFinalizacao.setTime(rs.getDate("dataFinalizacao"));
				tarefa.setDataFinalizacao(dataFinalizacao);
			}

			rs.close();
			stmt.close();

			return tarefa;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public List<Tarefa> getTarefas() {

		try {

			List<Tarefa> tarefas = new ArrayList<Tarefa>();

			String sql = "SELECT * FROM tarefas ORDER BY id";

			PreparedStatement stmt = this.con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {

				Tarefa tarefa = new Tarefa();
				tarefa.setId(rs.getLong("id"));
				tarefa.setDescricao(rs.getString("descricao"));
				tarefa.setFinalizado(rs.getBoolean("finalizado"));

				if (rs.getDate("dataFinalizacao") != null) {
					Calendar dataFinalizacao = Calendar.getInstance();
					dataFinalizacao.setTime(rs.getDate("dataFinalizacao"));
					tarefa.setDataFinalizacao(dataFinalizacao);
				}

				tarefas.add(tarefa);
			}

			rs.close();
			stmt.close();

			return tarefas;

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void adiciona(Tarefa tarefa) {

		try {

			StringBuilder sql = new StringBuilder();

			sql.append(" INSERT INTO tarefas");
			sql.append(" ( descricao, finalizado, \"dataFinalizacao\" )");
			sql.append(" VALUES (?, ?, ?)");

			PreparedStatement stmt = this.con.prepareStatement(sql.toString());

			stmt.setString(1, tarefa.getDescricao());
			stmt.setBoolean(2, tarefa.getFinalizado());

			if (tarefa.getDataFinalizacao() != null) {
				stmt.setDate(3, new Date(tarefa.getDataFinalizacao().getTimeInMillis()));
			} else {
				stmt.setDate(3, null);
			}

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void altera(Tarefa tarefa) {

		StringBuilder sql = new StringBuilder();

		sql.append(" UPDATE tarefas");
		sql.append(" SET descricao=?, finalizado=?, \"dataFinalizacao\"=?");
		sql.append(" WHERE id=?");

		try {

			PreparedStatement stmt = con.prepareStatement(sql.toString());

			stmt.setString(1, tarefa.getDescricao());
			stmt.setBoolean(2, tarefa.getFinalizado());

			if (tarefa.getDataFinalizacao() != null) {
				stmt.setDate(3, new Date(tarefa.getDataFinalizacao().getTimeInMillis()));
			} else {
				stmt.setDate(3, null);
			}

			stmt.setLong(4, tarefa.getId());

			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public void exclui(Long id) {

		try {

			PreparedStatement stmt = this.con.prepareStatement("DELETE FROM tarefas WHERE id = ?");

			stmt.setLong(1, id);
			stmt.execute();
			stmt.close();

		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
