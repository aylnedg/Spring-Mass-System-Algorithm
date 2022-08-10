clear;
close all;

%%input matrices
n = input('Degree of freedom: ');

 mass=zeros(n,n);
 for i=1:n
     mass(i,i)= input(['Input mass of element ' num2str(i) ': ']);
 end

stiffness= zeros(n,n);
disp('0 = no connection');
for i=1:n
    stiffness(i,i)=input(['stiffness of connection to ground of element ' num2str(i) '; ']);
end

for i=1:n-1
    for j=i+1:n
        k=input(['stiffness of connection between elements ' num2str(i) ' & ' num2str(j) ': ']); 
    stiffness(i,i)=stiffness(i,i)+k;  %add the local matrix of stiffness to the global matrix
    stiffness(i,j)=stiffness(i,j)-k;
    stiffness(j,i)=stiffness(j,i)-k;
    stiffness(j,j)=stiffness(j,j)+k;
    end
end

%% calculate the natural frequency of vibration
[V,D,W]=eig(stiffness,mass);
w=diag(D).^0.5;    
K=V.'*stiffness*V;
M=V.'*mass*V;

%

