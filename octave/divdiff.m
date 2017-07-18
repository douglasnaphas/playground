% input: x, y   - the data to be interpolated, vectors
% output: a     - table (matrix) for Newton's divided differences
function a = divdiff(x, y)
	% make a a size(x) x size(x) table of 0s
	n=min([max(size(x)) max(size(y))]);
	a=zeros(n,n);
	if(n == 0)
		return;
	endif
	row=1;
	col=1;
	while(row <= n)
		col = 1;
		while(col <= row)
			if(col == 1)
				a(row,col) = y(row);
			else
				a(row,col) = ( a(row,col-1) - a(row-1,col-1) ) / ( x(row) - x(row+1-col) );
			endif
			col = col + 1; 
		end
		row = row + 1;
	end
end
