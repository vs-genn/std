function ndl = solrad(phi) 
%% SOLAR RADIATION
% part of Vaganov-Shashkin Cambial Growth Model (VSCGM)
% calculate two insolation vectors, one for normal and one for leap year
% call the vectors as needed within the year loop depending on value of ydays
% preallocate for speed and use the original FORTRAN formuclation

% File History:
% 5/12/2018 Kevin Anchukaitis
% last modified 23/5/20 vs-genn

    latr = (pi/180) * phi;  % change to radians 
    [ndl,dtsi,hdl,y,sd] = deal(NaN(366,2));
    lt = deal(NaN(2,1));
    wcolumn = 0;
    for t=365:366
        wcolumn=wcolumn+1;
        lt(wcolumn)=length(1:t);
        sd(1:t,wcolumn) = asin(sin(pi*23.5/180) * sin(pi * (((1:t) - 80)/180)))';   % solar declination
        y(1:t,wcolumn)    = -tan(ones(t,1).* latr) .* tan(sd(1:t,wcolumn));
        y((y >= 1),wcolumn)  = 1;
        y((y <=- 1),wcolumn) = -1;
        hdl(1:t,wcolumn)  = acos(y(1:t,wcolumn));
        dtsi(1:t,wcolumn) = (hdl(1:t,wcolumn).* sin(ones(lt(wcolumn),1).*latr).*sin(sd(1:t,wcolumn))) + (cos(ones(lt(wcolumn),1).*latr).*cos(sd(1:t,wcolumn)).*sin(hdl(1:t,wcolumn)));
        ndl(1:t,wcolumn)=dtsi(1:t,wcolumn)./max(dtsi(1:t,wcolumn)); % normalized day length, a 366 x 2 matrix; first column is for normal years; second column is for leap years
    end
    
end 
