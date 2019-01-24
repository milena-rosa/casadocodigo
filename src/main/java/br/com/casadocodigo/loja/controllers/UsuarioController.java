package br.com.casadocodigo.loja.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.dao.RoleDAO;
import br.com.casadocodigo.loja.dao.UsuarioDAO;
import br.com.casadocodigo.loja.models.Role;
import br.com.casadocodigo.loja.models.Usuario;
import br.com.casadocodigo.loja.validators.UsuarioValidator;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {

	@Autowired
	private UsuarioDAO usuarioDao;

	@Autowired
	private RoleDAO roleDao;

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.addValidators(new UsuarioValidator());
	}

	@RequestMapping("/form")
	public ModelAndView form(Usuario usuario) {
		return new ModelAndView("/usuarios/form");
	}

	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView gravar(@Valid Usuario usuario, BindingResult result, RedirectAttributes redirectAttributes) {
		
		if (result.hasErrors()) {
			// verifica se o usuário existe
			if (!usuarioDao.find(usuario.getEmail()).equals(null)) {
				result.rejectValue("email", "invalid.user");
			}
			return form(usuario);
		}
		
		String senha = new BCryptPasswordEncoder().encode(usuario.getSenha());
		usuario.setSenha(senha);
		usuario.setSenhaRepetida(senha);
				
		usuarioDao.gravar(usuario);

		redirectAttributes.addFlashAttribute("message", "Usuário cadastrado com sucesso");
		return new ModelAndView("redirect:/usuarios");
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView listar() {
		List<Usuario> usuarios = usuarioDao.listar();
		ModelAndView modelAndView = new ModelAndView("usuarios/lista");
		modelAndView.addObject("usuarios", usuarios);
		return modelAndView;
	}

	@RequestMapping(value = "/formAlterarRoles")
	public ModelAndView formAlterarRoles(@RequestParam String email) {
		Usuario usuario = usuarioDao.find(email);

		ModelAndView modelAndView = new ModelAndView("usuarios/formAlterarRoles");
		modelAndView.addObject("roles", getRoles());
		modelAndView.addObject("usuario", usuario);

		return modelAndView;
	}

	@RequestMapping("atualizarRoles")
	public ModelAndView atualizarRoles(@RequestParam String email, @ModelAttribute Usuario usuario, RedirectAttributes redirectAttributes) {
		Usuario u = usuarioDao.find(email);
		u.setRoles(usuario.getRoles());
		usuarioDao.atualizarRoles(usuario);
		redirectAttributes.addFlashAttribute("message", "Usuário atualizado com sucesso");

		return new ModelAndView("redirect:/usuarios");
	}

	@ModelAttribute
	public List<Role> getRoles() {
		return roleDao.listar();
	}
}
