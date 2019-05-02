clear

m1=4;
n1=2;
m2=4;
n2=2;
m3=4;
n3=2;

D1=deter(m1,n1);
D2=deter(m2,n2);
D3=deter(m3,n3);

d1=size(D1);
d2=size(D2);
d3=size(D3);

D=zeros(4*4*4,d1(1,2)*d2(1,2)*d3(1,2));

k=1;

for lambda1=1: d1(1,2)
    for lambda2=1: d2(1,2)
        for lambda3=1: d3(1,2)
            l=1;
            for x=1: 2
                for y=1: 2
                    for z=1: 2
                        for a=1: n1
                            for b=1: n2
                                for c=1: n3
                                    D(l,k)=D1((z-1)*n1+a+(x-1)*m1,lambda1)*D2((y-1)*n2+b+(x-1)*m2,lambda2)*D3((z-1)*n3+c+(y-1)*m3,lambda3);
                                    l=l+1;
                                end
                            end
                        end
                    end
                end
            end
            k=k+1;
        end
    end
end

disp(D1);
disp(D2);
disp(D3);

D=transpose(D);

dlmwrite('Deterministicos_circular.txt',D,'\t')