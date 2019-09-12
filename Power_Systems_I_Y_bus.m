% Evangelos Stamos
% estamos@e-ce.uth.gr
%
% CE351 Power Systems I | UTH
%
% Ybus Kron Reduction Method
% 
% _________________________________________________________________________
% Alpha : 12/09/19
% Beta : 
% Stable : 
% _________________________________________________________________________


Y_bus=[-5.5i 0 2i 0 2.5i
    0 -7.8i 0 2i 5i
    2i 2.5i -14i 8i 4i
    0 2i 8i 10i 0
    2.5i 5i 4i 0i -11.5i];

disp('Ybus')
Y_bus
p = input('Input the bus you want to eliminate: ')


[row,col]=size(Y_bus);   
Y_bus_new=zeros(row,col);


for k=1 :row
    for l=1 : col
        if k==p || l==p
            Y_bus_new(k,l)=0;
        else 
           Y_bus_new(k,l)=Y_bus(k,l)-((Y_bus(k,p)*Y_bus(p,l))/(Y_bus(p,p)));
           
        end
    end
end

Y_bus_new(:, p) = [];
Y_bus_new(p, :) = [];
Y_bus_new