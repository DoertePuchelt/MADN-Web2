package Servlets;

import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import Backend.SpielBean;
import Interfaces.iBediener;

/**
 * Servlet implementation class XMLServlet
 */
@WebServlet("/XMLServlet")
public class XMLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	String xml;
	String csv;
	String ser;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XMLServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpSession sess = request.getSession(true);
		
		
		SpielBean spiel =  (SpielBean) request.getServletContext().getAttribute("spiel");
		//SpielBean spiel = (SpielBean) sess.getServletContext().getAttribute("spiel");
		if(spiel==null){
			this.getServletContext().setAttribute("spiel", new SpielBean());
			getServletContext().setAttribute("spiel", spiel);
		}

		xml= (request.getParameter("auswahl"));
		String dateiname= request.getParameter("dateiname");
		
		
		request.getSession(true).setAttribute("auswahl", xml);
		request.getSession(true).setAttribute("dateiname", xml);
		
		
		if(spiel!=null){
			
			if(xml.equals(".xml")){
				FileWriter fw = null;
				try{
					JAXBContext context = JAXBContext.newInstance( SpielBean.class );
					Marshaller m = context.createMarshaller();
					m.setProperty( Marshaller.JAXB_FORMATTED_OUTPUT, true );
					//m.marshal( spiel, System.out );
					
					fw=new FileWriter( dateiname+".xml");
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


}