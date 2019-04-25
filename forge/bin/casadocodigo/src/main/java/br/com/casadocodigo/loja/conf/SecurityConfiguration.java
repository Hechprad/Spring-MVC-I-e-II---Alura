package br.com.casadocodigo.loja.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import br.com.casadocodigo.loja.daos.UsuarioDAO;

@EnableWebMvcSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{

	@Autowired
	private UsuarioDAO usuarioDAO;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/resources/**").permitAll()
			.antMatchers("/produtos/form").hasRole("ADMIN")
		    .antMatchers("/carrinho/**").permitAll()
		    .antMatchers("/pagamento/**").permitAll()
		    .antMatchers(HttpMethod.POST, "/produtos").hasRole("ADMIN")
		    .antMatchers(HttpMethod.GET, "/produtos").hasRole("ADMIN")
		    .antMatchers("/produtos/**").permitAll()
		    .antMatchers("/").permitAll()

		   //.antMatchers("/url-magica-maluca-asbdjabsdjhsajeruwygeiu232ewmn").permitAll() // apenas para liberar uma chava adm automática no banco do heroku
		    
		    .anyRequest().authenticated()
		    .and().formLogin().loginPage("/login").permitAll()
			.and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/");
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(usuarioDAO)
		.passwordEncoder(new BCryptPasswordEncoder());	//Forma de encodificador de senha do Spring
	}
}
