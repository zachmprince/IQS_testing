clear;

type = {'initial','adjoint','ndiff','iqs','iqspc'};

for ty=1:numel(type)

if strcmp(type{ty},'initial') || strcmp(type{ty},'adjoint')
    for_steady = true;
else
    for_steady = false;
end
xy_rf = 0; 
z_rf  = 2;

% Open file
fid = fopen('mesh.txt','w+');
% Intial stuff
fprintf(fid,'[Mesh]\n');
fprintf(fid,' type = GeneratedBIDMesh\n');
fprintf(fid,' dim = 3\n');
fprintf(fid,' xmin = 0\n');
fprintf(fid,' xmax = 110\n');
fprintf(fid,' ymin = 0\n');
fprintf(fid,' ymax = 110\n');
fprintf(fid,' zmin = 0\n');
fprintf(fid,' zmax = 200\n');
fprintf(fid,' elem_type = HEX8\n');
nxy = 2^xy_rf*11;
nz  = 2^z_rf *10;
fprintf(fid,' nx = %d\n',nxy);
fprintf(fid,' ny = %d\n',nxy);
fprintf(fid,' nz = %d\n',nz);

fprintf(fid,' subdomain=''\n\n');

% Bottom reflector
for k=1:2^z_rf
    for j=1:nxy
        fprintf(fid,'\t');
        for i=1:nxy
            fprintf(fid,'101 ');
        end
        fprintf(fid,'\n');
    end
    fprintf(fid,'\n');
end
fprintf(fid,'\t');

% Array for fprintf of middle part of core
string_array = cell(11,11);
string_array{1,1} = '%d ';
string_array{1,2} = '103 ';
string_array{1,3} = '103 ';
string_array{1,4} = '103 ';
string_array{1,5} = '103 ';
string_array{1,6} = '%d ';
string_array{1,7} = '%d ';
string_array{1,8} = '102 ';
string_array{1,9} = '102 ';
string_array{1,10} = '101 ';
string_array{1,11} = '101 ';
for i=1:2
    string_array{1+i,1} = '103 ';
    string_array{1+i,2} = '103 ';
    string_array{1+i,3} = '103 ';
    string_array{1+i,4} = '103 ';
    string_array{1+i,5} = '103 ';
    string_array{1+i,6} = '103 ';
    string_array{1+i,7} = '103 ';
    string_array{1+i,8} = '102 ';
    string_array{1+i,9} = '102 ';
    string_array{1+i,10} = '101 ';
    string_array{1+i,11} = '101 ';
    
    for j=1:11, string_array{3+i,j} = string_array{1+i,j}; end
    string_array{3+i,4} = '%d ';
    string_array{3+i,5} = '%d ';
    
    for j=1:11, string_array{5+i,j} = string_array{1+i,j}; end
    string_array{5+i,1} = '%d ';
    string_array{5+i,6} = '102 ';
    string_array{5+i,7} = '102 ';

    for j=1:7, string_array{7+i,j} = '102 '; end
    string_array{7+i,8} = '101 ';
    string_array{7+i,9} = '101 ';
    string_array{7+i,10} = '101 ';
    string_array{7+i,11} = '101 ';
    
    for j=1:9, string_array{9+i,j} = '101 '; end
    string_array{9+i,10} = '101 ';
    string_array{9+i,11} = '101 ';
end
string_array{11,11} = '101 ';

% Convert array to vector
string_vector = cell(1,121*4^xy_rf);
k=0;
for i=1:11
for ni=1:2^xy_rf
    for j=1:11
    for nj=1:2^xy_rf
        k=k+1;
        string_vector{k} = string_array{i,j};
    end
    end
    string_vector{k} = [string_vector{k} '\n\t'];
end
end
string_vector{k} = [string_vector{k} '\n\t'];

% Write as string for fprintf input
main_string = strjoin(string_vector,'');

% Array for positions for rods axially
rods_base = [0 0 0 0 0 0 0 0 0;
             0 0 0 0 0 0 0 0 0;
             3 0 0 3 3 3 3 0 0;
             3 0 0 3 3 3 3 0 0;
             3 2 2 3 3 3 3 2 2;
             3 2 2 3 3 3 3 2 2;
             3 2 2 3 3 3 3 2 2;
             3 2 2 3 3 3 3 2 2];
rods{1} = rods_base(:,1:3);
rods{2} = rods_base(:,4:5);
rods{3} = rods_base(:,6:7);
rods{4} = rods_base(:,8);
rods{5} = rods_base(:,9);

% Write rod movements
k2=1;addk2=false;
k3=1;addk3=false;
for i=1:8
for ni=1:2^z_rf
    layer = zeros(1,9*4^xy_rf);
    rr=0;
    for r=1:5
    for nr=1:2^xy_rf
        jj=0;
        for j=1:length(rods{r}(i,:))
        for nj=1:2^xy_rf
            jj=jj+1;
            if rods{r}(i,j)==0
                layer(rr+jj) = 103;
            elseif rods{r}(i,j)==2
                addk2 = true;
                layer(rr+jj) = rods{r}(i,j)*100+k2;
            elseif rods{r}(i,j)==3
                addk3 = true;
                layer(rr+jj) = rods{r}(i,j)*100+k3;
            end
        end
        end
        rr = rr+jj;
    end
    end
    fprintf(fid,main_string,layer);
    
    if addk2, k2=k2+1; addk2=false; end
    if addk3, k3=k3+1; addk3=false; end
end
end
K = [k2-1 k3-1];
    
% Top reflector
for k=1:2^z_rf
    for j=1:nxy
        for i=1:nxy
            fprintf(fid,'101 ');
        end
        fprintf(fid,'\n\t');
    end
    fprintf(fid,'\n\t');
end
fprintf(fid,'''\n\n');
    
% Rest of mesh stuff
fprintf(fid,' uniform_refine = 0\n second_order = false \n[]');

fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Materials %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Open file
fid = fopen('material.txt','w+');

% Material Properties
nu = 2.5;
chi = [1 0];
beta = [0.0002470 0.0013845 0.0012220 0.0026455 0.0008320 0.0001690];
lambda = [0.0127 0.0317 0.1150 0.3110 1.4000 3.8700];
vel = [1.25e7 2.50e5];
D = [1.423913 0.356306; 1.423913 0.356306; 1.425611 0.350574; 1.634227 0.264002];
Sa = [0.01040206 0.08766217; 0.01095206 0.09146217; 0.01099263 0.09925634; 0.002660573 0.04936351];
nSf = [0.006477691 0.112732800; 0.006477691 0.112732800; 0.007503284 0.137800400];
Ss12 = [0.01755550; 0.01755550; 0.01717768; 0.02759693];
St = 1./(3*D);
Sr = [Sa(:,1)+Ss12 Sa(:,2)];
Ss11 = St(:,1) - Sr(:,1);
Ss22 = St(:,2) - Sr(:,2);
Ss21 = zeros(4,1);
Ss = [Ss11 Ss21 Ss12 Ss22];

fprintf(fid,'[GlobalParams]\n');
fprintf(fid,'  neutron_speed = ''%.16g %.16g''\n',vel);
fprintf(fid,'[]\n\n');

fprintf(fid,'[Materials]\n');

% Constant Materials
const_mat_string = {'reflector', 'fuel2', 'fuel1'};
const_mat_blocks = [101 102 103];
mat = [4 3 1];
for i=1:3
    fprintf(fid,' [./%s]\n',const_mat_string{i});
    fprintf(fid,'  type = ConstantNeutronicsMaterial\n');
    fprintf(fid,'  block = %d\n',const_mat_blocks(i));
    fprintf(fid,'  diffusion_coef = ''%.16g %.16g''\n',D(mat(i),:));
    fprintf(fid,'  sigma_r = ''%.16g %.16g''\n',Sr(mat(i),:));
    fprintf(fid,'  sigma_t = ''%.16g %.16g''\n',St(mat(i),:));
    fprintf(fid,'  sigma_s = ''%.16g %.16g\n             %.16g %.16g''\n',Ss(mat(i),:));
    if i>1
        fprintf(fid,'  fissile = true\n');
        fprintf(fid,'  nu_sigma_f = ''%.16g %.16g''\n',nSf(mat(i),:));
        fprintf(fid,'  chi = ''%.16g %.16g''\n',chi);
        fprintf(fid,'  delay_fraction = ''%.16g %.16g %.16g %.16g %.16g %.16g''\n',beta);
        fprintf(fid,'  decay_constant = ''%.16g %.16g %.16g %.16g %.16g %.16g''\n',lambda);
        fprintf(fid,'  delay_spectrum = ''%.16g %.16g\n',chi);
        for j=2:length(beta)
            fprintf(fid,'                     %.16g %.16g',chi);
            if j==length(beta), fprintf(fid,''''); end
            fprintf(fid,'\n');
        end
    else
        fprintf(fid,'  fissile = false\n');
    end
    fprintf(fid,' [../]\n');
end

% Rod materials
if for_steady
    
for i=1:2
    fprintf(fid,' [./rod_%d]\n',(i==1)+1);
    fprintf(fid,'  type = ConstantNeutronicsMaterial\n');
    fprintf(fid,'  block = ''');
    for j=1:K(i)
        fprintf(fid,'%d ',(i+1)*100+j);
    end
    fprintf(fid,'''\n');
    fprintf(fid,'  diffusion_coef = ''%.16g %.16g''\n',D(2,:));
    fprintf(fid,'  sigma_r = ''%.16g %.16g''\n',Sr((i==1)+1,:));
    fprintf(fid,'  sigma_t = ''%.16g %.16g''\n',St(2,:));
    fprintf(fid,'  sigma_s = ''%.16g %.16g\n             %.16g %.16g''\n',Ss((i==1)+1,:));
    fprintf(fid,'  fissile = true\n');
    fprintf(fid,'  nu_sigma_f = ''%.16g %.16g''\n',nSf(2,:));
    fprintf(fid,'  chi = ''%.16g %.16g''\n',chi);
    fprintf(fid,'  delay_fraction = ''%.16g %.16g %.16g %.16g %.16g %.16g''\n',beta);
    fprintf(fid,'  decay_constant = ''%.16g %.16g %.16g %.16g %.16g %.16g''\n',lambda);
    fprintf(fid,'  delay_spectrum = ''%.16g %.16g\n',chi);
    for k=2:length(beta)
        fprintf(fid,'                     %.16g %.16g',chi);
        if k==length(beta), fprintf(fid,''''); end
        fprintf(fid,'\n');
    end
    fprintf(fid,' [../]\n');
end
fprintf(fid,'[]\n');

else
    
for i=1:2
for j=1:K(i)
    fprintf(fid,' [./fuel_%d]\n',(i+1)*100+j);
    fprintf(fid,'  type = FunctionNeutronicsMaterial\n');
    fprintf(fid,'  block = %d\n',(i+1)*100+j);
    fprintf(fid,'  diffusion_coef = ''%.16g %.16g''\n',D(2,:));
    fprintf(fid,'  sigma_r = ''removal1_%d removal2_%d''\n',(i+1)*100+j,(i+1)*100+j);
    fprintf(fid,'  sigma_t = ''%.16g %.16g''\n',St(2,:));
    fprintf(fid,'  sigma_s = ''scat1_%d %.16g\n            %.16g scat2_%d''\n',(i+1)*100+j,Ss(2,2),Ss(2,3),(i+1)*100+j);
    fprintf(fid,'  fissile = true\n');
    fprintf(fid,'  nu_sigma_f = ''%.16g %.16g''\n',nSf(2,:));
    fprintf(fid,'  chi = ''%.16g %.16g''\n',chi);
    fprintf(fid,'  delay_fraction = ''%.16g %.16g %.16g %.16g %.16g %.16g''\n',beta);
    fprintf(fid,'  decay_constant = ''%.16g %.16g %.16g %.16g %.16g %.16g''\n',lambda);
    fprintf(fid,'  delay_spectrum = ''%.16g %.16g\n',chi);
    for k=2:length(beta)
        fprintf(fid,'                     %.16g %.16g',chi);
        if k==length(beta), fprintf(fid,''''); end
        fprintf(fid,'\n');
    end
    fprintf(fid,' [../]\n');
end
end
fprintf(fid,'[]\n');
end

fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Open file
fid = fopen('functions.txt','w+');
fprintf(fid,'[Functions]\n');

speed = 3.0;
time_beg = [0.0 7.5];
time_end = [26.666 47.5];
dt = (time_end-time_beg)./K;

time = time_beg(1);
for j=1:K(1)
for i=1:2
    fprintf(fid,' [./removal%d_%d]\n',i,200+j);
    fprintf(fid,'  type = SlopeFunction\n');
    fprintf(fid,'  timep = ''%.16g %.16g %.16g %.16g''\n',-0.1,time,time+dt(1),60.0);
    fprintf(fid,'  value = ''%.16g %.16g %.16g %.16g''\n',Sr(2,i),Sr(2,i),Sr(1,i),Sr(1,i));
    fprintf(fid,' [../]\n');

    fprintf(fid,' [./scat%d_%d]\n',i,200+j);
    fprintf(fid,'  type = SlopeFunction\n');
    fprintf(fid,'  timep = ''%.16g %.16g %.16g %.16g''\n',-0.1,time,time+dt(1),60.0);
    fprintf(fid,'  value = ''%.16g %.16g %.16g %.16g''\n',Ss(2,1+(i-1)*3),Ss(2,1+(i-1)*3),Ss(1,1+(i-1)*3),Ss(1,1+(i-1)*3));
    fprintf(fid,' [../]\n');
    
end
time = time+dt(1);
end

time = time_beg(2);
for j=K(2):-1:1
for i=1:2
    fprintf(fid,' [./removal%d_%d]\n',i,300+j);
    fprintf(fid,'  type = SlopeFunction\n');
    fprintf(fid,'  timep = ''%.16g %.16g %.16g %.16g''\n',-0.1,time,time+dt(2),60.0);
    fprintf(fid,'  value = ''%.16g %.16g %.16g %.16g''\n',Sr(1,i),Sr(1,i),Sr(2,i),Sr(2,i));
    fprintf(fid,' [../]\n');

    fprintf(fid,' [./scat%d_%d]\n',i,300+j);
    fprintf(fid,'  type = SlopeFunction\n');
    fprintf(fid,'  timep = ''%.16g %.16g %.16g %.16g''\n',-0.1,time,time+dt(2),60.0);
    fprintf(fid,'  value = ''%.16g %.16g %.16g %.16g''\n',Ss(1,1+(i-1)*3),Ss(1,1+(i-1)*3),Ss(2,1+(i-1)*3),Ss(2,1+(i-1)*3));
    fprintf(fid,' [../]\n');
    
end
time = time+dt(2);
end
fprintf(fid,'[]\n');

fclose(fid);

switch type{ty}
    case 'initial'
        fout = fopen('LMW_initial.i','w+');
    case 'adjoint'
        fout = fopen('LMW_adjoint.i','w+');
    case 'ndiff'
        fout = fopen('ndiff_LMW.i','w+');
    case 'iqs'
        fout = fopen('iqs_LMW.i','w+');
    case 'iqspc'
        fout = fopen('iqspc_LMW.i','w+');
end

fin = fopen('mesh.txt');
while ~feof(fin)
    fprintf(fout,'%s\n',fgetl(fin));
end
fclose(fin);

if strcmp(type{ty},'initial')
    fin = fopen('TransportSystems_initial.txt');
elseif strcmp(type{ty},'adjoint')
    fin = fopen('TransportSystems_adjoint.txt');
else
    fin = fopen('TransportSystems_ndiff.txt');
end
while ~feof(fin)
    fprintf(fout,'%s\n',fgetl(fin));
end
fclose(fin);

fin = fopen('material.txt');
while ~feof(fin)
    fprintf(fout,'%s\n',fgetl(fin));
end
fclose(fin);

if ~for_steady
    fin = fopen('functions.txt');
    while ~feof(fin)
        fprintf(fout,'%s\n',fgetl(fin));
    end
    fclose(fin);
end

if for_steady
    fin = fopen('executioner_initial.txt');
elseif strcmp(type{ty},'ndiff')
    fin = fopen('executioner_ndiff.txt');
elseif strcmp(type{ty},'iqs')
    fin = fopen('executioner_iqs.txt');
elseif strcmp(type{ty},'iqspc')
    fin = fopen('executioner_iqspc.txt');
end
while ~feof(fin)
    fprintf(fout,'%s\n',fgetl(fin));
end
fclose(fin);

fclose(fout);
clear fout fin
        
end




