function hello_w_tabs() {
	printf("hello\twith\ttabs from a \t\tfunction\n");
}

function hello_from_function() {
	print "hello from a function";
}

BEGIN {
	print "hello";
	printf("hello\t\twith tabs\n");
	hello_from_function();
	hello_w_tabs();	
}
