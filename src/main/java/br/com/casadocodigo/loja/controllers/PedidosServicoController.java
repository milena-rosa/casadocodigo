package br.com.casadocodigo.loja.controllers;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import br.com.casadocodigo.loja.models.ListaPedidos;
import br.com.casadocodigo.loja.models.Pedido;

@Controller
@RequestMapping("/pedidos")
@Scope(value=WebApplicationContext.SCOPE_REQUEST)
public class PedidosServicoController {

	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private ListaPedidos listaPedidos;
	
	private ObjectMapper mapper = new ObjectMapper();

	@RequestMapping(method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView pedidos(RedirectAttributes redirectAttributes)
			throws JsonParseException, JsonMappingException, IOException {
		String uri = "https://book-payment.herokuapp.com/orders";

		String response = restTemplate.getForObject(uri, String.class);
		listaPedidos.setPedidos(mapper.readValue(response, 
		        mapper.getTypeFactory().constructCollectionType(List.class, Pedido.class)));
		
		redirectAttributes.addFlashAttribute("listaPedidos", listaPedidos);
		
//		return listaPedidos.getPedidos();
		return new ModelAndView("carrinho/pedidos");
	}
}
