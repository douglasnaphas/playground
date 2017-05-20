public class TenThousand {
	public static void main(String[] args) {
		MyList list = new MyList();
		for(int i = 0; i < 100000; i++) {
			list.add(i);
		}
		for(int i = 0; i < 100000; i++) {
			list.contains(99999);
			if(i == 99999 && list.contains(99999)) {
				System.out.println("9999 is here");
			}
		}
	}
}
