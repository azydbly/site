package com.system.filter;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class LoginFilter implements Filter{

	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
/*		Employee employee = (Employee) session.getAttribute("employee");
		String uri = req.getRequestURI();
		if (uri.contains("login") || uri.contains("css") || uri.contains("img") || uri.contains("code")) {
			chain.doFilter(req, resp);
			return;
		}else if (employee == null){
			if(req.getRequestURL().equals("http://localhost:8080/hr") || req.getRequestURL().equals("http://localhost:8080/hr/") || req.getRequestURL().equals("http://localhost:8080/hr/login.jsp")){
				System.out.println("----" + req.getRequestURL());
				chain.doFilter(req, resp);
			}else{
				System.out.println(req.getRequestURL());
				System.out.println("================登录过期");
				resp.sendRedirect("http://localhost:8080/hr");
			}
			//req.getRequestDispatcher("http://127.0.0.1:8080/hr/login.jsp").forward(req, resp);
		} else {
			chain.doFilter(request, response);
		}
		
		
		*/
		
		if ((!req.getRequestURI().equals("/hr/login.jsp"))) {  
            System.out.println(req.getRequestURI());  
            if (session.getAttribute("employee") == null) {  
                session.invalidate();  
                response.setContentType("text/html;charset=utf8");  
                PrintWriter out = response.getWriter();  
                out.println("alert('由于你长时间没有操作,导致Session失效!请你重新登录!');window.location.href='" +req.getRequestURI() + "/login.jsp'");  
            } else {  
                chain.doFilter(request, response);  
            }  
        } else {  
            chain.doFilter(request, response);  
        }  
		
		
		
		
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		
	}

}
