public class MyList {
	public Node first;

	public void add(int data) {
		Node o = new Node(data);
		if(this.first == null) {
			this.first = o;
			return;
		}
		Node n = this.first;
		while(n.next != null) {
			n = n.next;
		}
		// n is the last node
		n.next = o;
	}

	public boolean contains(int data) {
		Node n = this.first;
		while(n != null){
			if(n.data == data) return true;
			n = n.next;
		}
		return false;
	}
}
