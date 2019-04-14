package br.com.casadocodigo.loja.conf;

import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.servlet.configuration.EnableWebMvcSecurity;

@EnableWebMvcSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter{

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
			.antMatchers("/resources/**").permitAll()
		    .antMatchers("/carrinho/**").permitAll()
		    .antMatchers("/pagamento/**").permitAll()
		    .antMatchers("/produtos/form").hasRole("ADMIN")
		    .antMatchers(HttpMethod.POST, "/produtos").hasRole("ADMIN")
		    .antMatchers(HttpMethod.GET, "/produtos").hasRole("ADMIN")
		    .antMatchers("/produtos/**").permitAll()
		    .antMatchers("/").permitAll()
		    .anyRequest().authenticated()
		    .and().formLogin();
	}
	
}
