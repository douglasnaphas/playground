grep -q "^\t\?require: {$" regex.txt
echo "exit status: $?"

lineNumber=$( awk '/^\s*require:\s*{\s*$/ {print FNR}' regex.txt ) 
echo "linenum: $lineNumber"