package br.com.casadocodigo.loja.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.casadocodigo.loja.dao.ProdutoDAO;
import br.com.casadocodigo.loja.models.RelatorioProdutos;

@Controller
@RequestMapping("/relatorio-produtos")
public class RelatorioProdutosController {

	@Autowired
	private ProdutoDAO produtoDao;

	@RequestMapping(method=RequestMethod.GET)
	@ResponseBody
	public RelatorioProdutos relatorioProdutosJson() {
		return produtoDao.gerarRelatorio();
	}
	
	@RequestMapping(params = "data", method=RequestMethod.GET)
	@ResponseBody
	public RelatorioProdutos relatorioProdutosJson(@RequestParam("data") String data) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(sdf.parse(data));
		return produtoDao.gerarRelatorio(calendar);
	}
}
