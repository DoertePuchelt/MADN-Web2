package Servlets;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBException;

import Backend.DatenzugriffSerialisiert;
import Backend.DatenzugriffXML;
import Backend.SpielBean;
import Interfaces.iDatenzugriff;

/**
 * Servlet implementation class LoadServlet
 */
@WebServlet("/LoadServlet")
public class LoadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpSession sess = request.getSession(true);
		ServletContext sc = request.getServletContext();
		
		String dateiname = request.getParameter("dateiname");
		
		if(dateiname.contains(".ser")){
			iDatenzugriff ser = new DatenzugriffSerialisiert();
			SpielBean spiel = null;
			try {
				spiel = (SpielBean) ser.laden(request.getServletContext().getRealPath("")+"/"+dateiname);
			} catch (Exception e) {
				out.print("Fehler beim laden der Datei!");
				out.print("<br><a href='login.jsp'>zurück</a>");
				return;
			}
			
			sc.setAttribute("spiel", spiel);
			sc.setAttribute("init", 1);
			response.sendRedirect("spiel.jsp");
		}else if(dateiname.contains(".xml")){
			iDatenzugriff xml = new DatenzugriffXML();
			SpielBean spiel = null;
			try {
				spiel = (SpielBean) xml.laden(request.getServletContext().getRealPath("")+"/"+dateiname);
			} catch (Exception e) {
				out.print("Fehler beim laden der Datei!");
				out.print("<br><a href='login.jsp'>zurück</a>");
				return;
			}
			sc.setAttribute("spiel", spiel);
			sc.setAttribute("init", 1);
//			System.out.println(sc.getAttribute("spiel"));
			response.sendRedirect("spiel.jsp");
			
		}else {
			out.print("Fehler beim laden der Datei!");
			out.print("<br><a href='login.jsp'>zurück</a>");
		}

		System.out.println(request.getServletContext().getRealPath(""));
	}

}
