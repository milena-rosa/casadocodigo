package br.com.casadocodigo.loja.models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class ListaPedidos implements Serializable {

	private static final long serialVersionUID = 1L;

	private List<Pedido> pedidos = new ArrayList<Pedido>();

	public void limpa() {
		this.pedidos.clear();
	}

	public List<Pedido> getPedidos() {
		return pedidos;
	}

	public void setPedidos(List<Pedido> pedidos) {
		this.pedidos = pedidos;
	}

}
