package Backend;



import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

public class ProbiereXml {
	
	
	static FileWriter fw = null;
	public static void main(String[] args) throws JAXBException, IOException {
		 
		 
//		SpielBean spiel= new SpielBean();
//		spiel.SpielerHinzufuegen("asf", "red", null);
//		spiel.SpielerHinzufuegen("asd", "blue", null);
//		
//		spiel.initSpiel();
//		
//		try{
//			JAXBContext context = JAXBContext.newInstance( SpielBean.class );
//			Marshaller m = context.createMarshaller();
//			m.setProperty( Marshaller.JAXB_FORMATTED_OUTPUT, true );
//			m.marshal( spiel, System.out );
//			fw=new FileWriter("Spielstand" + ".xml");
//			m.marshal(spiel, fw);
//		}
//		finally {
//			try{
//				fw.close();
//			}
//			catch(Exception e){
//				e.printStackTrace();
//			}
//		}

		SpielBean s = (SpielBean) laden();
		System.out.println(s);
		
	}
	
	public static Object laden() throws JAXBException, FileNotFoundException{
		JAXBContext context;
		context = JAXBContext.newInstance(SpielBean.class);
		Unmarshaller um = context.createUnmarshaller();
		
		 
		 SpielBean s = (SpielBean)um.unmarshal(new FileReader( "Spielstand.xml"));
		
	
		if(s!=null){
			System.out.println(s.getAmZug().getFarbe1());
			for (int i=0; i< s.getSpieler().size();i++){
				System.out.println(s.getSpieler().get(i));
				
			}
			
		}
		return s;
		
	}

}
