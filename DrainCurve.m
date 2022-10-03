port='COM3';
a=open_scope(port);
dac0out_scope(a,5);
X=input('Enter a run number');
for i =1:20
    h = input('Enter a Height');
    if h ==-1
        break;
    end
    he(i)=h;
    v(i)=adc_scope(a,2);
    disp(v(i));
end
p = polyfit(v,he,1);
f = polyval(p,v);
save(sprintf("drain%d.mat",X),'he','v','p');
plot(v,he)
hold on
xlabel('Volts')
ylabel('Height in cm')

plot(v,f)
hold off
clear(a),close(a);

