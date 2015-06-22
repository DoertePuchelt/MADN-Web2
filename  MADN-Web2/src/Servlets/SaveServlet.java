package Servlets;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import com.itextpdf.text.DocumentException;

import Backend.DatenzugriffCSV;
import Backend.DatenzugriffPDF;
import Backend.DatenzugriffSerialisiert;
import Backend.SpielBean;
import Interfaces.iDatenzugriff;


@WebServlet("/SaveServlet")
public class SaveServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
       

    public SaveServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpSession sess = request.getSession(true);
		
//		SpielBean spiel= (SpielBean) sess.getAttribute("spiel");
		SpielBean spiel = (SpielBean) sess.getServletContext().getAttribute("spiel");
		if(spiel==null){
			this.getServletContext().setAttribute("spiel", new SpielBean());
			getServletContext().setAttribute("spiel", spiel);
		}
		

		String dateiname = request.getParameter("Dateiname");
		String dateiformat = request.getParameter("auswahl");
		
		if(dateiformat.equals("pdf")){
			iDatenzugriff pdf = new DatenzugriffPDF();
			try {
				pdf.spielfeld(spiel,dateiname,request.getServletContext().getRealPath("")+"/");
				out.print("<a href='"+dateiname+".pdf'>"+dateiname+".pdf</a>");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(dateiformat.equals("ser")){
			iDatenzugriff ser = new DatenzugriffSerialisiert();
			try {
				ser.speichern(request.getServletContext().getRealPath("")+"/"+dateiname, dateiformat, spiel);
			} catch (JAXBException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(dateiformat.equals("csv")){
			iDatenzugriff csv = new DatenzugriffCSV();
			try {
				csv.speichern(request.getServletContext().getRealPath("")+"/"+dateiname, dateiformat, spiel);
			} catch (JAXBException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(dateiformat.equals(".xml")){
			FileWriter fw = null;
			try{
				JAXBContext context = JAXBContext.newInstance( SpielBean.class );
				Marshaller m = context.createMarshaller();
				m.setProperty( Marshaller.JAXB_FORMATTED_OUTPUT, true );
				//m.marshal( spiel, System.out );
				
				fw=new FileWriter( request.getServletContext().getRealPath("")+"/"+dateiname+".xml");
				m.marshal(spiel, fw);
				response.sendRedirect("spielGespeichert.jsp");	
			} catch (JAXBException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally {
				try{
					fw.close();
				}
				catch(Exception e){
					e.printStackTrace();
				}
			}
		}


		
	}

}
