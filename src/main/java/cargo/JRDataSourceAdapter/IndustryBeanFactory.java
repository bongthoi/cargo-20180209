package cargo.JRDataSourceAdapter;

import java.util.Arrays;
import java.util.Collection;
import java.util.Date;

import cargo.domain.Industry;

public class IndustryBeanFactory {

	 private static Industry[] data =
		  {
		 	new Industry("iiiiiis", "name111", "des11",  new Date(), new Date(), "u2", "u1", 1),
			new Industry("iiiiiis", "name111", "des11",  new Date(), new Date(), "u2", "u1", 1),
			new Industry("iiiiiis", "name111", "des11",  new Date(), new Date(), "u2", "u1", 1),
			new Industry("iiiiiis", "name111", "des11",  new Date(), new Date(), "u2", "u1", 1),
			new Industry("iiiiiis", "name111", "des11",  new Date(), new Date(), "u2", "u1", 1),
			new Industry("iiiiiis", "name111", "des11",  new Date(), new Date(), "u2", "u1", 1),
			new Industry("iiiiiis", "name111", "des11",  new Date(), new Date(), "u2", "u1", 1)
		  };  
				
		

		 public static Collection<Industry> createBeanCollection()
		 {
			 return Arrays.asList(data);
		 }
		 public static void main(String agrs[]){
			 System.out.println(createBeanCollection().size());
		 }
}
