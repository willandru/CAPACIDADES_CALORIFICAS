clc; clear;


m_agua_i= 352.5/1000; % [kg] --> 200 mL H2O
Tf_agua=87 ;% °C
m_calorimetro= 560.5/1000; % kg
Ti_calorimetro= 22; % °C
Tf_calorimetro= 68; %°C
m_vidrio= 171.3/1000; %kg
c_vidrio= 837 ;% J/(kg*°C)
c_agua= 4186 ;% J/(kg*°C)
m_agua_f=323.5/1000;% kg
Ti_agua=20; %°C;

%% ¿Qué cantidad de calor Q se requiere para elevar la masa a 87°C?
m= (m_agua_i+m_vidrio)/1000 ;%Kg
Q_87= m_agua_i*c_agua*(Tf_agua - Ti_agua) + m_vidrio*c_vidrio*(Tf_agua - Ti_agua)

%% ¿ "c" calorimetro?
syms c_calorimetro
Q_agua= m_agua_f*c_agua*(Tf_calorimetro-Tf_agua)
Q_vidrio= m_vidrio*c_vidrio*(Tf_calorimetro-Tf_agua)
Q_calorimetro= m_calorimetro*c_calorimetro*(Tf_calorimetro- Ti_calorimetro)
eq1= Q_agua + Q_vidrio == -Q_calorimetro;
c_calorimetro= solve(eq1, c_calorimetro)

%% Temperatura vs TIempo

TT= [0 87; 10 84; 30 76; 40 72; 50 70; 70 69; 80 68; 100 68; 120 68; 140 66 ;160 65; 200 63 ];
plot(TT(:,1), TT(:,2), 'k-*')
title("Temperatura de equiibrio Agua-Calorimetro")
xlabel("Tiempo (s)")
ylabel("Temperatura °C")