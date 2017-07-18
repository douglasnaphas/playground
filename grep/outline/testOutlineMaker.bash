#!/bin/bash
# USER GUIDE - 
#	(1) MUST HAVE CYGWIN
#	(2) run command sed -i 's/\r$//' testOutlineMaker.bash

COMPO=textfield

function user_instructions() {
	printf "To use this script you will need to :
	(1) \'cd\' into your bolt project \n 
	(2) run this script via the command \' bash testOutlineMaker.bash' \n"
	#option for just one or create for all
}


function get_compo_name() {
	read -p "Enter the name of the component you wish to unit test: " COMPO
}


function find_and_copy_compo_module() {
	cp src/components/"$COMPO"/"$COMPO".module.js  test/components/temp."$COMPO".module.js

	# print at the top of temp file what it is and what to do if it still hangs around
}


function make_mocha_file() {
	touch test/components/"$COMPO".mocha.js
}


function outer_describe() {
	printf "'use strict'; 
	describe('$COMPO', function() {
	// Load Module & Templates
    	beforeEach(module('blt_$COMPO'));
    	beforeEach(module('templates'));

    	var element;
    	var outerScope;
    	var innerScope;" > test/components/"$COMPO".mocha.js

    first_before_each	

    printf " \n }" > test/components/"$COMPO".mocha.js
}


function first_before_each() {
	printf "\n \n 	// Do This Before Each Test
    	beforeEach(inject(function(\$rootScope, \$compile) {
        element = angular.element('" >> test/components/"$COMPO".mocha.js	

    form_tags	  	

    printf    "\n
    	outerScope = \$rootScope;
        \$compile(element)(outerScope);

        innerScope = element.isolateScope();

        outerScope.\$digest();
    }));" >> test/components/"$COMPO".mocha.js	

    cat test/components/"$COMPO".mocha.js 	
}


function form_tags(){
	printf "<form><blt-$COMPO ' + \n" >> test/components/"$COMPO".mocha.js	

	get_attributes
		
	printf "></blt-$COMPO></form>" >> test/components/"$COMPO".mocha.js
}


#NOT DONE
function get_attributes() {
	declare -a text_binding_arr			#@
	declare -a one_way_binding_arr		#<
	declare -a method_binding_arr		#&
	declare -a two_way_binding_arr		#=

	grep -q "^\t?require:" test/components/temp."$COMPO".module.js
	if [ $? -eq 0 ]; then
		lineNumber=$( awk '/^\s*binding:\s*{\s*$/ {print FNR}' test/components/temp."$COMPO".module.js )

		while read lineNumber
		do
			echo "made it to while"
			#if [[ $0 == "{" ]]; then

			#fi	
		done < test/components/temp."$COMPO".module.js
		#start at lineNUmber
		#read through lines until reach }


	else
		echo "$COMPO has no attributes to test. Congrats! You don't have to write any unit tests."
		rm test/components/temp."$COMPO".mocha.js
		remove_temp_file
		quit
	fi 
	return 
}


function remove_temp_file() {
	rm test/components/temp."$COMPO".module.js
}

function quit() {
	exit
}


#user_instructions
#get_compo_name
find_and_copy_compo_module
make_mocha_file
outer_describe
#testing