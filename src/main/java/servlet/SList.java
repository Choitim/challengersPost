package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dataAccessObject.DAO;
import printObject.PrintList;

@WebServlet("/list")
public class SList extends HttpServlet {
	// attribute
	private static final long serialVersionUID = 1L;
	private DAO dao=new DAO();
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); response.setContentType("text/html; charset=utf-8");
		new PrintList(dao, response.getWriter());
	}
}
