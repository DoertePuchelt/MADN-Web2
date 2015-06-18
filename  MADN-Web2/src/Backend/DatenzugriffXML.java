package Backend;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import com.itextpdf.text.DocumentException;

import sun.awt.FwDispatcher;
import Fehler_Exceptions.SpielerFarbeVorhandenException;
import Fehler_Exceptions.SpielerNichtGefundenException;
import Interfaces.iDatenzugriff;
import Spiel.SpielBean;

public class DatenzugriffXML implements iDatenzugriff {

	@Override
	public void speichern(String dateiname, String dateiende, Object o) throws IOException {
		
		
		FileWriter fw = null;
		
		if (o instanceof SpielBean) {
			SpielBean s = (SpielBean)o;
		
			try{
				JAXBContext context = JAXBContext.newInstance( SpielBean.class );
				Marshaller m = context.createMarshaller();
				m.setProperty( Marshaller.JAXB_FORMATTED_OUTPUT, true );
				//m.marshal( s, System.out );
				fw=new FileWriter(dateiname + ".xml");
				m.marshal(s, fw);
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

	@Override
	public Object laden(String dateipfad) {

		JAXBContext context=JAXBContext.newInstance(SpielBean.class);
		Unmarshaller um = context.createUnmarshaller();
		SpielBean s = (SpielBean)um.unmarshal(new FileReader(dateipfad));
		
		
		
		return s;
	}

	@Override
	public void spielfeld(Backend.SpielBean spiel)
			throws FileNotFoundException, DocumentException {
		// TODO Auto-generated method stub
		
	}


}