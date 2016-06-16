function [T] = array2textable(filename,A)

fid = fopen(filename,'w+');

T = cell(size(A));
[M,N] = size(A);

for i=1:M
    for j=1:N
        if j<N
            fprintf(fid,'%g &, ',A(i,j));
        else
            fprintf(fid,'%g \\\\ \n',A(i,j));
        end
    end
end