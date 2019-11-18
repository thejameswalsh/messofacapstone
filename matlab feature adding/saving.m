%%saving.m

%set init
Nt = 1000;
Clt = zeros(Nt,2);
% Solve for Cl residual.
for i = 1:Nt
    Clt(i,1) = i*i;
    Clt(i,2) = "two";
end



%%