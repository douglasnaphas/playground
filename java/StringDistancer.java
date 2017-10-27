import java.util.Map;
import java.util.HashMap;

public class StringDistancer {
	public static int distance(String s, String t) {
		if(s == null && t == null) return 0;
		if(s == null) return t.length();
		if(t == null) return s.length();
		Map<Character, Integer> ms = new HashMap<Character, Integer>();
		Map<Character, Integer> mt = new HashMap<Character, Integer>();
		Character c;
		for(int i = 0; i < s.length(); i++) {
			c = new Character(s.charAt(i));
			ms.put(c, ms.getOrDefault(c, 0) + 1);
		}
		for(int i = 0; i < t.length(); i++) {
			c = new Character(t.charAt(i));
			mt.put(c, mt.getOrDefault(c, 0) + 1);
		}
		int snt = 0, tns = 0;
		for(Character ch : ms.keySet()) {
			snt += ms.get(ch) - mt.getOrDefault(ch, 0);
		}
		for(Character ch : mt.keySet()) {
			tns += mt.get(ch) - ms.getOrDefault(ch, 0);
		}
		return snt > tns ? snt : tns;
	}

	public static void distanceTest() throws Exception {
		Map<String[], Integer> td = new HashMap<String[], Integer>();
		td.put(new String[]{"a", ""}, 1);
		td.put(new String[]{"abc", "cab"}, 0);
		td.put(new String[]{"man", "woman"}, 2);
		td.put(new String[]{"woman", "man"}, 2);
		td.put(new String[]{"line", "lime"}, 1);
		td.put(new String[]{"lime", "mail"}, 1);
		td.put(new String[]{"mail", "lime"}, 1);
		Integer actual, expected;
		for(String[] s : td.keySet()) {
			expected = td.get(s);
			actual = distance(s[0], s[1]);
			if(! actual.equals(expected)) {
				throw new Exception("distance, expected " + expected + " from " +
					s[0] + ", " + s[1] + ", got " + actual);
			}
		}
	}

	public static void main(String[] args) {
		if(args.length != 2) {
			System.out.println("usage: java StringDistancer firstword secondword");
			System.exit(1);
		}
		try{
			distanceTest();
		} catch(Exception e) {
			System.out.println(e.getMessage());
			System.exit(1);
		}
		System.out.println(distance(args[0], args[1]));
	}
}
