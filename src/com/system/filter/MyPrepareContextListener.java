package com.system.filter;

import java.io.IOException;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.http.HttpServlet;

import com.system.util.ConstantUtil;

/**
 * 系统启动时初始化系统部分参数的监听器
 * 
 * @author yangtao
 *
 */
public class MyPrepareContextListener extends HttpServlet implements ServletContextListener {

	/**
	 * 版本
	 */
	private static final long serialVersionUID = 4909079258221611478L;

	@Override
	public void contextInitialized(ServletContextEvent event) {
		ServletContext context = event.getServletContext();
		Properties properties = new Properties();
		try {
			properties.load(context.getResourceAsStream("/WEB-INF/classes/jdbc.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}

		// final String driver = properties.getProperty("driverClass");
		// final String url = properties.getProperty("jdbcUrl");
		// final String username = properties.getProperty("user");
		// final String password = properties.getProperty("password");

		ConstantUtil.XMPATH = context.getRealPath("/");
		ConstantUtil.DOMAIN = properties.getProperty("DOMAIN");
		ConstantUtil.IMGDOMAIN = properties.getProperty("IMGDOMAIN");
		ConstantUtil.FILEUPLOADSAVEPATH = properties.getProperty("fileUploadSavePath");

		// conn = jdbc.getConnection(driver, url, username, password);
		// jdbc.Close();// 关闭数据库链接
	}

	@Override
	public void contextDestroyed(ServletContextEvent event) {}
	
}
