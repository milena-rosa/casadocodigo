package br.com.casadocodigo.loja.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.casadocodigo.loja.models.Usuario;

public class UsuarioValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return Usuario.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		Usuario usuario = (Usuario) target;
		
		ValidationUtils.rejectIfEmpty(errors, "nome", "field.required");
		ValidationUtils.rejectIfEmpty(errors, "email", "field.required");

		if (usuario.getSenha().isEmpty() || usuario.getSenha().length() < 5) {
			errors.rejectValue("senha", "invalid.password");
		}
		
		if (usuario.getSenhaRepetida().isEmpty()) {
			errors.rejectValue("senhaRepetida", "field.required");
		} else if (!usuario.getSenha().equals(usuario.getSenhaRepetida())) {
			errors.rejectValue("senhaRepetida", "invalid.password");
		}
	}

}
