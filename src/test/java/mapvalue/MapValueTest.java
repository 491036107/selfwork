package mapvalue;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MapValueTest {

	public MapValueTest() {
		// TODO Auto-generated constructor stub
	}
	public static void main(String[] args) {
		Map<String, String> map=new HashMap<String, String>();
		map.put("1", "java");
		map.put("2", "c++");
		map.put("3", "c#");
		map.put("4", "php");
		List<Map<String,String>> list = new ArrayList<Map<String,String>>();
		list.add(map);
		map.put("4", "修改");
		System.out.println(list.get(0));
	}

}
