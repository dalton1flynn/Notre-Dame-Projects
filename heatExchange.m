function L=heatExchange(U)

r= .005953125; % m, this is avg heat transfer surface radius: 
% inner diameter is 7/16inch and outer is 1/2inch
mdotH=((500/60)/(100^3))*1000*999.97; % g/sec. This is mass flow rate of hotter fluid
mdotC=((2800/60)/(100^3))*1000*999.97; % g/sec. Mass flow rate of colder fluid
CpH=4.184; % J/gC, specific heat of fluid in inner pipe
CpC=4.184; % J/gC, specific heat of fluid in outer pipe
Thinit=30; % degrees celcius, this is 68 F or room temp
Thfin=23; % degrees celcius
Tcinit=.5; % degrees celcius
Tcfin=Tcinit+(CpH*mdotH*abs(Thinit-Thfin))/(CpC*mdotC); % degrees celcius, about 50 F, when flow rate outside is 5 times
% inside
qdot=mdotH*CpH*(Thinit-Thfin); % J/s, heat transfer rate

deltaT1=abs(Thinit-Tcfin); % degrees C, see equations for Tlm
deltaT2=abs(Thfin-Tcinit); % degrees C
Tlm=(deltaT1-deltaT2)/log(deltaT1/deltaT2);

L=qdot/(U*2*pi*r*Tlm);
