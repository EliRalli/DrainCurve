port='COM3';
a=open_scope(port);
dac0out_scope(a,5);
X=input('Enter a run number');
for i =1:20
    h = input('Enter a Height');
    if h ==50
        break;
    end
    he(i)=h;
    v(i)=adc_scope(a,2);
    disp(v(i));
end
save(sprintf("fill%d.mat",X),'he','v');
p = polyfit(v,he,1);
f = polyval(p,v);
plot(v,he)
hold on
xlabel('Volts')
ylabel('Height in cm')

plot(v,f)
hold off
clear(a),close(a);