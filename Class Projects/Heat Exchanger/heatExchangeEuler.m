

%% set parameters
length=1.25; % meters
dz=.01; % delta z, meters
Nz=round(length/dz); % number of delta z's, or number of small pipes
NT=Nz+1; % number of temperatures, starting with 1 going in an Nz+1
% coming out. Converts number of small pipes to an integer
smallPipeInnerRadius=.00555625; % m, for 7/16inch diameter
smallPipeOuterRadius=.00635; % m, for 1/2inch diameter
avgSmallPipeRadius=.005953125; % m
bigPipeInnerRadius=.01905; % m

t=30; % seconds, time of operation
dt=.1; % delta t, seconds
Nt=round(t/dt); % number of small time periods
t(1)=0; % initialize time vector


Qs=(2300/60)/(100^3); % m^3/second, for 2300ml/minute. Shell volumetric flow rate
Qt=(460/60)/(100^3); % m^3/second, for 460ml/minute. Tube volumetric flow rate
Abetween = (bigPipeInnerRadius-smallPipeOuterRadius)^2*pi; % m^2
Asa=2*pi*avgSmallPipeRadius*dz; % m^2, Area of heat transfer
Ai=smallPipeInnerRadius^2*pi; % m^2, Area of inner pipe
rhoI=999970; % fluid density of water, gram/m^3
rhoO=999970;
CpI=4.184; % specific heat of water, J/gC
CpO=4.184;
k=358; % W/(m^2K), overall heat transfer coefficient

counter=NT; % used for getting last for second terms of equation
it=2; % initialize time counting vector

%% initialize matrices

Ts(1,1:NT)=0; % shell starts at 0C everywhere
Tt(1,1:NT)=20; % tube starts at 20C everywhere

%% Ts and Tt equations

for jt=1:Nt
    t(jt+1)=t(jt)+dt;
    for iT=2:NT
        Tt(it,1)=20; % constant feed stream
        Ts(it,1)=0; % constant feed stream
        firstTermTs=(Qs*(Ts(it-1,iT-1)-Ts(it-1,iT)))/(Abetween*dz);
        secondTermTs=(k*Asa*(Tt(it-1,counter)-Ts(it-1,iT)))/(Abetween*rhoO*CpO*dz);
        Ts(it,iT)=Ts(it-1,iT)+dt*(firstTermTs+secondTermTs);
        % Tt
        firstTermTt=(Qt*(Tt(it-1,iT-1)-Tt(it-1,iT)))/(dz*Ai);
        secondTermTt=(k*Asa*(Tt(it-1,iT)-Ts(it-1,counter)))/(Ai*rhoI*CpI*dz);
        Tt(it,iT)=Tt(it-1,iT)+dt*(firstTermTt-secondTermTt);
        counter=counter-1;
    end
        counter=NT; % reset counter
        it=it+1; % increment time marching counter
end

%% plot final temperatures over time

plot(t,Ts(:,NT),'r-',...
    t,Tt(:,NT),'b-')
axis([0 inf 0 inf]);
xlabel('Time (sec)')
ylabel('Temperature (Degrees Celcius)')