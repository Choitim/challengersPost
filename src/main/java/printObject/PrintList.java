package printObject;

import java.io.PrintWriter;

import constants.Constants;
import dataAccessObject.DAO;
import valueObject.ChallengerVO;
import valueObject.ParentVO;

public class PrintList {
	// constructor
	public PrintList(DAO dao, PrintWriter out) {print(dao, out);}
	// methods
	private void print(DAO dao, PrintWriter out) {
		out.print("<!DOCTYPE html>"
				+ "<html lang='en'>"
				+ "<head>"
				+ "  <meta charset='UTF-8'>"
				+ "  <meta http-equiv='X-UA-Compatible' content='IE=edge'>"
				+ "  <meta name='viewport' content='width=device-width, initial-scale=1.0'>"
				+ "  <title>챌린지 리스트</title>"
				+ "  <link rel='stylesheet' href='admin/css/list.css'>"
				+ "  <script src='https://kit.fontawesome.com/a4d2993e00.js' crossorigin='anonymous'>"
				+ "  </script>"
				+ "</head>"
				+ "<body>"
				+ "<h2>챌린지 리스트</h2>");
//		printTable(dao, out);
		out.print("<table>"
				+ "<thead></thead>"
				+ "<tbody>");
		for(ParentVO parentVO: dao.getList(ChallengerVO.class, Constants.Challenger_getList)) {
			out.print("<tr onclick=\"location.href=''\">");
			out.print("<td class='td1'>"+((ChallengerVO)parentVO).getName()+"</td>");
			out.print("<td class='td2'><i class='fas fa-arrow-right'></i></td>");
			out.print("</tr>");
		}
		out.print("</tbody></table>");
		out.print("</body>"
				+ "</html>");
		out.close();
	}
//	private void printTable(DAO dao, PrintWriter out) {
//		out.print("<table>"
//				+ "<thead></thead>"
//				+ "<tbody>");
//		for(ParentVO parentVO: dao.getList(ChallengerVO.class, Constants.Challenger_getList)) {
//			out.print("<tr onclick=\"location.href=''\">");
//			out.print("<td class='td1'>"+((ChallengerVO)parentVO).getName()+"</td>");
//			out.print("<td class='td2'><i class='fas fa-arrow-right'></i></td>");
//			out.print("</tr>");
//		}
//		out.print("</tbody></table>");
//	}
}
