function [varargout] = count_instance(file,varargin)

fid = fopen(file,'r');

for i=1:numel(varargin)
    varargout{i} = 0;
end

tline = 'test';
while ischar(tline)
    tline = fgetl(fid);
    for i=1:numel(varargin)
        tmp = strfind(tline,varargin{i});
        varargout{i} = varargout{i} + length(tmp);
    end
end
fclose(fid);