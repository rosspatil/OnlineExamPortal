package com.zensar.exam;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.zensar.DAO.QuestionDAO;
import com.zensar.DAO.UserDAO;
import com.zensar.bean.User;
import com.zensar.photo.FileUpload;

/**
 * Servlet implementation class Controller
 */
@MultipartConfig
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Controller() {

	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		ServletContext context = config.getServletContext();
		PropertyConfigurator.configure(context
				.getRealPath("/WEB-INF/log4j.properties"));
		Logger logger = Logger.getLogger(Controller.class);
		context.setAttribute("UserId", "" + new UserDAO().getCount());
		context.setAttribute("Logger", logger);
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Logger logger = (Logger) request.getServletContext().getAttribute(
				"Logger");
		String url = "Default.jsp";
		String action = request.getParameter("action");
		String userName = null;
		String password = null;
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("userName")) {
					userName = cookie.getValue();
				}
				if (cookie.getName().equals("password")) {
					password = cookie.getValue();
				}
			}
			if (new UserDAO().checkLogin(userName, password)) {
				logger.info("Logged in using Cookies");
				setCookie(userName, password, response);
				HttpSession session = request.getSession(true);
				session.setAttribute("email", userName.trim());
				session.setAttribute("User", new UserDAO().getUser(userName));
				url = "Welcome.jsp";
			}
		}

		if (action != null) {

			if (action.equals("login")) {
				userName = request.getParameter("userName");
				password = request.getParameter("password");
				if (new UserDAO().checkLogin(userName, password)) {
					logger.info("Logged in user " + userName);
					setCookie(userName, password, response);
					HttpSession session = request.getSession(true);
					session.setAttribute("User",
							new UserDAO().getUser(userName));
					session.setAttribute("email", userName.trim());
					url = "Welcome.jsp";
				} else {
					logger.fatal("Login fail for " + userName);
					response.setHeader("refresh", "2;URL= Default.js");


				}
			} else if (action.equals("signup")) {
				String userId = request.getServletContext()
						.getAttribute("UserId").toString();
				int UserId = Integer.parseInt(userId);
				HttpSession session = request.getSession(true);
				userName = request.getParameter("email").trim();
				password = request.getParameter("password");
				new UserDAO().register(new User((UserId + 1), request
						.getParameter("firstname"), request
						.getParameter("lastname"), request
						.getParameter("mobile"), password, userName),new FileInputStream(request.getServletContext().getRealPath("/images/Guest.JPG")));
				setCookie(userName, password, response);
				logger.info("User Registered with email: " + userName);
				session.setAttribute("User", new UserDAO().getUser(userName));
				session.setAttribute("email", userName.trim());
				url = "Welcome.jsp";
			} else if (action.equals("start")) {
				HttpSession session = request.getSession();
				QuestionDAO questionDAO = new QuestionDAO();
				questionDAO.setQuestions();
				session.setAttribute("ScoreMap", questionDAO.initHashMap());
				session.setAttribute("Questions", questionDAO);
				logger.info("Test started for user: "
						+ session.getAttribute("userName"));
				url = "Question.jsp";
			} else if (action.equals("finish")) {
				HttpSession session = request.getSession();
				QuestionDAO questionDAO = (QuestionDAO) session
						.getAttribute("Questions");
				User user=(User)session.getAttribute("User");
				int score = questionDAO
						.calculateResult((ArrayList<String>) session
								.getAttribute("ScoreMap"),user);
				new  QuestionDAO().sendEmail(user, score,session.getAttribute("email").toString());
				url = "ScoreDisplay.jsp?score=" + score;
				logger.info("Test Successfully finished by user: "
						+ session.getAttribute("userName"));
				logger.info("Test score for user: "
						+ session.getAttribute("userName"));
			} else if (action.equals("logout")) {
				HttpSession session = request.getSession();
				logger.info("User logged out successfully with email: "
						+ session.getAttribute("userName"));
				session.invalidate();
				deleCookie(response);
				url = "Default.jsp";
			}
		}

		RequestDispatcher requestDispatcher = request.getRequestDispatcher(url);
		requestDispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)){
			Part filepart=request.getPart("profile");
			System.out.println("Successfuly upload....");
			InputStream fin=filepart.getInputStream();
			HttpSession session=request.getSession(false);
			User user=(User)session.getAttribute("User");
			new FileUpload(fin,String.valueOf(user.getUserId()));
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("profileCard.jsp");
			requestDispatcher.forward(request, response);
		}
		else{
			doGet(request, response);
		}
	}

	private void setCookie(String userName, String password,
			HttpServletResponse response) {
		Cookie cookie1 = new Cookie("userName", userName);
		cookie1.setMaxAge(150);
		Cookie cookie2 = new Cookie("password", password);
		cookie2.setMaxAge(150);
		response.addCookie(cookie1);
		response.addCookie(cookie2);
	}

	private void deleCookie(HttpServletResponse response) {
		Cookie cookie1 = new Cookie("userName", "default");
		cookie1.setMaxAge(0);
		Cookie cookie2 = new Cookie("password", "default");
		cookie2.setMaxAge(0);
		response.addCookie(cookie1);
		response.addCookie(cookie2);
	}



}
