package cargo.JRDataSourceAdapter;

import java.util.ArrayList;
import java.util.List;

public class PersonFactory {
	public static List<Person> load(){
		 List<Person> l=new ArrayList<Person>();
		 l.add(new Person("josn","123123"));
		 l.add(new Person("josn","123123"));
		 l.add(new Person("josn","123123"));
		 l.add(new Person("josn","123123"));
		 l.add(new Person("josn","123123"));
		 l.add(new Person("josn","123123"));
		 
		 return l;
	}

}
