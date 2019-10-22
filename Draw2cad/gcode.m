f=fopen('gcode.stl','w');
fprintf(f,'G17 G21 G90 G54\n');
fprintf(f,'G00 X0 Y0\n');
x=[1     2     3     4     5     6     7     8     9    10    11    12    13    14    15 30    31    32    33    34    35    36    37    38];
y=1:24;
for i=2:length(x)
    fprintf(f,'G01 ');
    fprintf(f,'X%d Y%d ',x(i),y(i));
    
    if(abs(x(i)-x(i-1))<6)
    fprintf(f,'Z0\n');
    else
        fprintf(f,'Z1\n');
    end
end
fprintf(f,'G01 ');
fprintf(f,'X%d Y%d ',x(i),y(i));
fprintf(f,'Z1 \nX0 Y0 \nM2');
fclose(f);
