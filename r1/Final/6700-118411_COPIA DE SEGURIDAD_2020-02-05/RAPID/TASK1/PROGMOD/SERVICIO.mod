MODULE SERVICIO
!Variables
VAR shapedata shape1;
VAR pos pos1:=[0,0,0];
!
!SPOOTDATA    
PERS spotdata camb_cap:=[1,1,3,0];
!
!Posición comprobación CAPS
CONST robtarget check_cap_mov:=[[1231.32,1171.45,785.67],[0.970279,-0.0217659,0.156595,0.183204],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget check_cap_Fij:=[[1299.15,1196.61,955.90],[0.982699,0.010788,-0.0163106,0.184175],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget Ext_Cap:=[[210.95,1462.08,561.99],[0.000322762,-0.976239,-0.215357,-0.0240436],[1,1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget pfresado1:=[[1411.15,992.54,1023.66],[0.979762,0.00112925,-0.00331277,0.200134],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

PROC Marcas()
! Robot en marcas eje 5 a -90 grados
MoveAbsJ ceros\NoEOffs,v1000,fine,t_pinza;
!
ENDPROC

!

PROC t_mantenimiento()
!======================
! Maintenance position
!======================
!
!HOME
MoveAbsJ home_pos_rob,vmax,fine,t_Pinza;
!
MoveJ [[1009.31,993.86,1692.79],[0.999585,0.00950816,-0.00298638,-0.0270394],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z100,t_Pinza;
!
!Maintenance position
MoveJ p_mantenimiento,vmax,fine,t_Pinza;
!
Set do_Posicion_mant;
WHILE di_Mantenimiento=1 DO
	TPWrite "Espera FIN de Mantenimiento R2";
ENDWHILE
Reset do_Posicion_mant;
!
TPErase;
!
MoveJ [[1009.30,993.87,1692.79],[0.999585,0.00950883,-0.00298448,-0.0270381],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z100,t_Pinza;
!
!HOME
MoveAbsJ home_pos_rob,vmax,fine,t_Pinza;
!
!=============
!EXIT PROGRAM
!=============
ENDPROC

PROC CambCaps()
    !   
    b_CambCaps:=TRUE;    
    !
    !Comprueba almacen electrodos
    WHILE di_R1_Carg_Caps_Inf=0 DO
        TPWrite" Esperando Cargador de caps lleno";
    ENDWHILE
    TPErase;
    WHILE di_R1_Carg_Caps_Sup=0 DO
        TPWrite" Esperando Cargador de caps lleno";
    ENDWHILE
    TPErase;
    !
    !Robot 1 en Cambio de Caps
    Set do_En_Cambio;
    !
    !Corta agua y aspira
    Reset do_abrir_agua;
    Set do_EV_Aspiracion;
    WaitTime 5;
    Reset do_EV_Aspiracion;
    !
    WHILE di_flow1_ok=1 DO
        TPWrite" Esperando no tener caudal de agua";
    ENDWHILE
    TPErase;
    !
    !HOME
    home_robot;
    !
    !Abrimos pinza
    OpenHighLift GUN1;
    WHILE di_Pinza_Abierta=0 DO
        TPWrite" Esperando pinza abierta";
    ENDWHILE
    TPErase;
    ! 
    !Aplicamos programa de soldadura
    SetGO go_Progr_soldad, 1;
    ! 
    !Giro inverso
    !Cae electrodo
    Set do_Giro_fresa_2;
    WaitTime 2;
    Reset do_Giro_fresa_2;
    !
    MoveJ [[1051.05,997.42,972.98],[0.99396,0.000838937,0.013002,0.108968],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, t_pinza;
    !
    !Sacar electrodo inferior
    Repite_1:
    MoveL [[1280.31,1073.63,972.92],[0.982745,0.00512343,0.0132358,0.184418],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, t_pinza;
    MoveL [[1324.36,1140.76,993.62],[0.9827,0.0107793,-0.016304,0.184173],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, t_pinza;
    !
    !Posicion electrodo inferior
    MoveL [[1324.38,1140.79,1049.27],[0.982698,0.010804,-0.0163314,0.184176],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza;
    !
    !Marcha motor
    Set do_Giro_fresa;
    WaitTime 0.5;
    !
    !Sale
    MoveL [[1324.36,1140.77,993.67],[0.982699,0.0107916,-0.0163153,0.184176],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v50, fine, t_pinza;
    !
    !Reset motor pinza
    Reset do_Giro_fresa;
    !
    MoveL [[1245.64,1177.11,964.72],[0.982699,0.0107945,-0.0163173,0.184175],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, z100, t_pinza;
    !
    Set do_Giro_fresa_2;
    WaitTime 0.5;
    Reset do_Giro_fresa_2;
    !
    MoveL check_cap_Fij, v100, fine, t_pinza;
    WaitTime 1;
    !
    !Espera no electrodo
    IF di_presencia_cap = 1 GOTO Repite_1;
    !
    !Poner electrodo inferior
    Repite_2:
    MoveL [[1245.64,1177.11,964.70],[0.982699,0.0107921,-0.0163124,0.184176],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[1315.37,1261.88,1054.46],[0.982699,0.0107768,-0.0163,0.184174],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[1318.30,1263.37,1089.27],[0.982698,0.0107967,-0.0163227,0.184179],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, t_pinza;
    WaitTime 0.5;
    MoveL [[1283.08,1251.43,1085.96],[0.982698,0.0107977,-0.0163186,0.184177],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, t_pinza;
    !
    MoveL [[1245.64,1177.11,964.72],[0.982699,0.0107944,-0.0163173,0.184175],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza;
    MoveL check_cap_Fij, v100, fine, t_pinza;
    WaitTime 1;
    !
    !Espera  tener electrodo
    IF di_presencia_cap = 0 GOTO Repite_2;
    !
    MoveL [[1245.63,1177.10,964.70],[0.982699,0.0107923,-0.0163116,0.184173],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    MoveL [[1271.03,1386.37,884.67],[0.982699,0.0107788,-0.01631,0.184176],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[1271.03,1386.39,941.57],[0.982699,0.0107866,-0.016312,0.184174],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, fine, t_pinza;
    !
    CloseHighLift gun1;
    WaitTime 1;
    Set do_Cerrar_Pinza;
    WaitTime 2;
    Reset do_Cerrar_Pinza;
    OpenHighLift GUN1;
    WHILE di_Pinza_Abierta=0 DO
        TPWrite" Esperando pinza abierta";
    ENDWHILE
    TPErase;
    !
    MoveL [[1271.04,1386.39,884.70],[0.982699,0.0107872,-0.0163146,0.184175],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    MoveL [[1245.63,1177.09,964.68],[0.982699,0.0107867,-0.0163093,0.184174],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    !
    !Quitar electrodo superior
    Repite_3:
    MoveL [[1171.83,1161.50,964.65],[0.965539,-0.0268377,0.183567,0.182528],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    MoveL [[1276.23,1050.33,888.52],[0.968439,-0.0238259,0.167598,0.182947],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza;
    !
    !Posicion electrodo superior
    MoveL [[1276.27,1050.34,860.73],[0.968442,-0.0238205,0.167579,0.182946],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza;
    !
    !Marcha motor
    Set do_Giro_fresa;
    !
    WaitTime 0.5;
    !
    !Sale
    MoveL [[1276.27,1050.33,951.57],[0.968443,-0.0238225,0.167575,0.182944],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v50, fine, t_pinza;
    !
    !Reset motor
    Reset do_Giro_fresa;
    !
    MoveL [[1162.36,1173.24,918.95],[0.96554,-0.0268423,0.183565,0.182527],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, z100, t_pinza;
    MoveL [[1169.01,1151.65,774.18],[0.97028,-0.0217513,0.156592,0.183201],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, z100, t_pinza;
    !
    Set do_Giro_fresa_2;
    WaitTime 0.5;
    Reset do_Giro_fresa_2;
    !
    MoveL check_cap_mov, v100, fine, t_pinza;
    WaitTime 1;
    !
    !Espera no electrodo
    IF di_presencia_cap = 1 GOTO Repite_3;
    !
    !Poner electrodo superior
    Repite_4:
    MoveL [[1171.82,1161.55,964.71],[0.965541,-0.0268183,0.183555,0.182534],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[1241.69,1257.10,925.84],[0.969965,-0.0220814,0.158523,0.183169],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, t_pinza;
    MoveL [[1241.68,1257.08,910.43],[0.969963,-0.0220924,0.158538,0.183165],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, t_pinza;
    WaitTime 0.5;
    MoveL [[1216.68,1247.14,910.47],[0.969965,-0.0220866,0.158527,0.183167],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, t_pinza;
    !
    MoveL [[1169.01,1151.66,774.19],[0.965542,-0.0268445,0.183557,0.182525],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL check_cap_mov, v100, fine, t_pinza;
    !
    WaitTime 1;
    !Espera  tener electrodo
    IF di_presencia_cap = 0 GOTO Repite_4;
    !
    MoveL [[1169.00,1151.65,774.17],[0.965541,-0.0268478,0.183562,0.182523],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[1245.63,1177.10,964.70],[0.982699,0.0107923,-0.0163116,0.184173],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    MoveL [[1271.03,1386.37,884.67],[0.982699,0.0107788,-0.01631,0.184176],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[1271.03,1386.39,941.57],[0.982699,0.0107866,-0.016312,0.184174],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, fine, t_pinza;
    !
    CloseHighLift gun1;
    WaitTime 1;
    Set do_cerrar_pinza;
    WaitTime 2;
    Reset do_cerrar_pinza;
    OpenHighLift GUN1;
    WHILE di_Pinza_Abierta=0 DO
        TPWrite" Esperando pinza abierta";
    ENDWHILE
    TPErase;
    !
    MoveL [[1271.03,1386.37,884.67],[0.982699,0.0107807,-0.0163088,0.184174],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    MoveL [[1245.63,1177.10,964.70],[0.982699,0.0107921,-0.0163113,0.184172],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    MoveL [[1310.60,969.33,964.66],[0.982701,0.0107911,-0.0163024,0.184165],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, fine, t_pinza;
    !
    !
    !Abre agua
    Set do_abrir_agua;
    !
    !Resetea contador fresado
	N_ContF:=0;
	!    
	!Resetea contador fresado
	PulseDO\PLength:=1, do_Reset_contadores;
    !
	!Robot a fresar    
	FRESARDOBLE;
    !
    Reset do_En_Cambio;
    Reset do_EV_Aspiracion;
    !
	b_CambCaps:=FALSE;
	!    
ENDPROC  

PROC CambCapsManual()
    !
    b_CambCaps:=TRUE;
    !   
    !HOME
    home_robot;
    ! 
    !Abrir pinza
    OpenHighLift gun1; 
	!
	!
    !Posición cambio manual de caps
    MoveJ [[434.89,858.33,1471.25],[0.00909743,-0.776426,0.630128,-0.00434575],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z1, tool0;
    !
    !Aplicamos programa
    SetGO go_Progr_soldad, 1;
    !
    !Corta agua
    Reset do_abrir_agua;
    Set do_EV_Aspiracion;
    WaitTime 5;
    Reset do_EV_Aspiracion;
    !
    Set do_En_Cambio;
    WaitTime 1;
    WHILE di_Cambio_caps=1 DO
        TPWrite" Esperando no tener peticion cambio de caps";
    ENDWHILE
    TPErase;
    Reset do_En_Cambio;
    !
    !Abre agua
    Set do_abrir_agua;
    !
    !Resetea contador fresado
	N_ContF:=0;
	!    
	!Resetea contador fresado
	PulseDO\PLength:=1, do_Reset_contadores;
    !
	!Rutina de fresado    
	Fresardoble;
	!    
    !HOME
    home_Robot;
    !
    b_CambCaps:=FALSE;
    !
ENDPROC
  PROC fresado()
    ! Rutina fresado
    TPErase;
    TPWrite "----------------------------------------";
    TPWrite "   [  MB ABRERA ]  -  [Grupo GESTAMP]   ";
    TPWrite "----------------------------------------";
    TPWrite "              Robot en                  ";
    TPWrite "----------------------------------------";
    TPWrite "               Fresado                  ";
    TPWrite "----------------------------------------";
    TPWrite "                                        ";
    TPWrite "----------------------------------------";
    TPWrite "                                        ";
    TPWrite "----------------------------------------";
    WaitTime 0.5;
    ! 
    PulseDO\PLength:=1, do_Reset_Impulsos;
    OpenHighLift GUN1;
    !
    MoveJ [[1051.05,997.42,972.98],[0.994584,0.00336087,-0.00950809,0.103448],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, t_pinza;
    MoveL [[1412.01,994.80,976.82],[0.979762,0.00113008,-0.00332303,0.200133],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1500, fine, t_pinza;
    ! 
    PulseDO\PLength:=20,do_giro_fresa;
    WHILE di_Giro_fresa=1 DO
        TPWrite" Esperando giro motor fresa";
    ENDWHILE
    TPErase;
    WHILE di_Giro_fresa=0 DO
        TPWrite" Esperando giro motor fresa";
    ENDWHILE
    TPErase;
    ! 
    ! Punto fresado electrodos
    MoveL pfresado1,v200,fine,t_pinza;
    ! 
    CloseHighLift gun1;
    SetGO go_Progr_soldad, 63;
    WaitTime\InPos,0.5;
    Set do_Cerrar_Pinza;
    WaitTime\InPos,1;
    !Resetea contador vida electrodo
    Reset do_Cerrar_Pinza;
    SetGO go_Progr_soldad, 1;
    WaitTime 0.2;
    OpenHighLift GUN1;
    ! 
    MoveL [[1412.03,994.82,976.90],[0.979762,0.00114375,-0.00334238,0.200134],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v100,z10,t_pinza;
    MoveL [[1051.05,997.42,972.97],[0.994584,0.00335995,-0.00950576,0.103448],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1000,z30,t_pinza;
    Reset do_giro_fresa;
    !  
    home_Robot;
    N_ContF:=N_ContF+1;
    !  
    !Fin fresado
    Set do_Fin_Fresado;
    WaitTime 1;
    Reset do_Fin_Fresado;
    PulseDO\PLength:=1, do_Reset_fresado;
    ! 
  ENDPROC
  PROC FRESARDOBLE()
    ! Rutina fresado
    TPErase;
    TPWrite "----------------------------------------";
    TPWrite "   [  MB ABRERA ]  -  [Grupo GESTAMP]   ";
    TPWrite "----------------------------------------";
    TPWrite "              Robot en                  ";
    TPWrite "----------------------------------------";
    TPWrite "               Fresado                  ";
    TPWrite "----------------------------------------";
    TPWrite "                                        ";
    TPWrite "----------------------------------------";
    TPWrite "                                        ";
    TPWrite "----------------------------------------";
    PulseDO\PLength:=1, do_Reset_Impulsos;
    WaitTime 0.5;
    OpenHighLift GUN1;
    !
    MoveL [[1306.33,963.23,976.88],[0.979763,0.00114322,-0.00333844,0.20013],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1500,z50,t_pinza;
    PulseDO\PLength:=20,do_giro_fresa;
    WHILE di_Giro_fresa=1 DO
        TPWrite" Esperando giro motor fresa";
    ENDWHILE
    TPErase;
    WHILE di_Giro_fresa=0 DO
        TPWrite" Esperando giro motor fresa";
    ENDWHILE
    TPErase;
    MoveL [[1412.03,994.82,976.90],[0.979763,0.00114322,-0.00334292,0.200132],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1500, fine, t_pinza;
    ! 
    ! Punto fresado electrodos
    MoveL pfresado1,v200,fine,t_pinza;
    CloseHighLift gun1;
    SetGO go_Progr_soldad, 63;
    WaitTime\InPos,0.5;
    Set do_Cerrar_Pinza;
    WaitTime\InPos,1;
    TPErase;
    !Resetea contador vida electrodo
    Reset do_Cerrar_Pinza;
    OpenHighLift GUN1;
    ! 
    CloseHighLift gun1;
    WaitTime\InPos,0.4;
    Set do_Cerrar_Pinza;
    WaitTime\InPos,1;
    Reset do_Cerrar_Pinza;
    WaitTime\InPos,0.4;
    Set do_Cerrar_Pinza;
    WaitTime\InPos,1;
    Reset do_Cerrar_Pinza;
    SetGO go_Progr_soldad, 1;
    OpenHighLift GUN1;
    !  
    MoveL [[1412.03,994.82,976.90],[0.979762,0.00114444,-0.00334286,0.200133],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1500,z10,t_pinza;
    MoveL [[1310.61,969.36,964.70],[0.982699,0.0107912,-0.0163119,0.184174],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1000,z50,t_pinza;
    MoveL [[1051.05,997.42,972.98],[0.99396,0.000839333,0.0130013,0.108968],[0,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1000,z50,t_pinza;
    Reset do_giro_fresa;
    !  
    home_Robot;
    !
    !Fin fresado
    !Set do_Fresado;
    WaitTime 1;
    !Reset do_Fresado;
    ! 
  ENDPROC

    
  
	


ENDMODULE