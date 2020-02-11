MODULE SERVICIO
!Variables
VAR shapedata shape1;
VAR pos pos1:=[0,0,0];
!
!SPOOTDATA    
PERS spotdata camb_cap:=[1,1];
!
!Posición comprobación CAPS
CONST robtarget check_cap_mov:=[[719.95,251.36,526.23],[0.664522,-0.102406,0.114716,0.731275],[-1,-1,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget check_cap_Fij:=[[718.49,337.01,691.35],[0.663226,0.00610103,-0.00731855,0.748358],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget Ext_Cap:=[[210.95,1462.08,561.99],[0.000322762,-0.976239,-0.215357,-0.0240436],[1,1,0,1],[133.163,9E+09,9E+09,9E+09,9E+09,9E+09]];
CONST robtarget pfresado1:=[[943.81,381.41,758.90],[0.761013,0.0123749,-0.0219045,0.648249],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

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
MoveJ [[1114.61,32.86,1355.79],[0.987534,-0.00270492,0.0126912,0.15687],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z100,t_Pinza;
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
MoveJ [[1114.61,32.86,1355.79],[0.987534,-0.00270355,0.0126895,0.156873],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z100,t_Pinza;
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
    WHILE di_R2_Carg_Caps_Inf=0 DO
        TPWrite"Esperando recarga de caps en cargador";
    ENDWHILE
    TPErase;
    WHILE di_R2_Carg_Caps_Sup=0 DO
        TPWrite"Esperando recarga de caps en cargador";
    ENDWHILE
    TPErase;
    !
    !Robot 1 en Cambio de Caps
    Set do_En_Cambio;
    !
    !Corta agua y aspira
    Reset do_Abrir_Agua;
    Set do_EV_Aspiracion;
    WaitTime 5;
    Reset do_EV_Aspiracion;
    !
    WHILE di_flow1_ok=1 DO
        TPWrite"Esperando no tener caudal de agua";
    ENDWHILE
    TPErase;
    !
    !HOME
    home_robot;
    !
    !Abrimos pinza
    OpenHighLift gun1;
    WHILE di_Pinza_Abierta=0 DO
        TPWrite"Esperando Pinza Abierta";
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
    MoveL [[1312.35,175.66,1157.01],[0.958706,-0.0041099,0.000801974,0.284368],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z100, t_pinza;
    MoveL [[825.34,248.97,699.83],[0.704352,-0.00322401,0.00267774,0.709838],[-1,-1,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z1, t_pinza;
    !
    !Sacar electrodo inferior
    Repite_1:
    MoveL [[826.10,248.97,699.83],[0.704321,0.00649173,-0.00696161,0.709817],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, t_pinza;
    MoveL [[780.19,347.47,730.96],[0.704323,0.0064918,-0.00696343,0.709816],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, t_pinza;
    !
    !Posicion electrodo inferior
    MoveL [[778.66,346.28,773.60],[0.704322,0.00649367,-0.00696697,0.709816],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza;
    !
    !Marcha motor
    Set do_Giro_fresa;
    WaitTime 0.5;
    !
    !Sale
    MoveL [[780.19,347.47,730.96],[0.704322,0.00648958,-0.00696372,0.709817],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v50, fine, t_pinza;
    !
    !Reset motor pinza
    Reset do_Giro_fresa;
    !
    MoveL [[722.44,299.16,687.96],[0.663224,0.00608861,-0.00731853,0.74836],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, z100, t_pinza;
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
    MoveL [[688.62,291.37,694.15],[0.663225,0.00608774,-0.00731944,0.74836],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[659.42,353.28,714.42],[0.663226,0.00608399,-0.00731946,0.748359],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[663.00,377.10,773.92],[0.663225,0.00608762,-0.00731854,0.74836],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[663.41,379.50,807.27],[0.663225,0.00608358,-0.00731924,0.74836],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, t_pinza;
    WaitTime 0.5;
    MoveL [[663.42,347.13,808.25],[0.663224,0.00607961,-0.00731995,0.748361],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, t_pinza;
    !
    MoveL [[722.43,299.16,687.96],[0.663222,0.00608722,-0.00731549,0.748363],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza;
    MoveL check_cap_Fij, v100, fine, t_pinza;
    WaitTime 0.5;
    !
    !Espera  tener electrodo
    IF di_presencia_cap = 0 GOTO Repite_2;
    !
    MoveL [[637.27,279.98,629.94],[0.611309,0.0055859,-0.0077156,0.791334],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    MoveL [[531.53,375.27,621.73],[0.556395,0.00327494,-0.0083259,0.83087],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[532.35,375.59,664.15],[0.556391,0.00325948,-0.00832525,0.830872],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, fine, t_pinza;
    !
    CloseHighLift gun1;
    WaitTime 1;
    Set do_Cerrar_Pinza;
    WaitTime 2;
    Reset do_Cerrar_Pinza;
    OpenHighLift gun1;
    WHILE di_pinza_abierta=0 DO
        TPWrite"Esperando pinza abierta";
    ENDWHILE
    TPErase;
    !
    MoveL [[531.53,375.27,621.73],[0.556396,0.00327523,-0.0083275,0.830869],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    MoveL [[637.27,279.98,629.94],[0.611308,0.00558443,-0.00771433,0.791336],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    MoveL [[826.10,248.97,699.83],[0.704321,0.00649259,-0.00696129,0.709818],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    !
    !Quitar electrodo superior
    Repite_3:
    MoveL [[722.03,174.82,699.85],[0.690325,-0.14359,0.139987,0.695153],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    MoveL [[847.58,259.47,649.57],[0.695346,-0.115776,0.112411,0.700324],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza;
    !
    !Posicion electrodo superior
    MoveL [[849.36,259.47,591.71],[0.695346,-0.115773,0.112414,0.700324],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza;
    !
    !Marcha motor
    Set do_Giro_fresa;
    !
    WaitTime 0.5;
    !
    !Sale
    MoveL [[847.59,259.46,649.58],[0.695349,-0.11578,0.11241,0.70032],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v50, fine, t_pinza;
    !
    !Reset motor
    Reset do_Giro_fresa;
    !
    MoveL [[710.41,189.26,649.25],[0.663379,-0.13817,0.145351,0.72091],[-1,-1,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, z100, t_pinza;
    MoveL [[723.91,189.27,523.11],[0.66338,-0.138169,0.14535,0.720909],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, z100, t_pinza;
    !
    Set do_Giro_fresa_2;
    WaitTime 0.5;
    Reset do_Giro_fresa_2;
    !
    MoveL check_cap_mov, v50, fine, t_pinza;
    WaitTime 1;
    !
    !Espera no electrodo
    IF di_presencia_cap = 1 GOTO Repite_3;
    !
    !Joan
    !Poner electrodo superior
    Repite_4:
    MoveL [[722.03,174.82,699.85],[0.690325,-0.143588,0.139987,0.695153],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[644.47,285.88,693.81],[0.673342,-0.118934,0.125034,0.71891],[-1,-1,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, t_pinza;
    MoveL [[644.47,285.87,645.43],[0.673342,-0.118935,0.125041,0.718909],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, t_pinza;
    WaitTime 0.5;
    MoveL [[644.46,183.40,622.38],[0.678261,-0.112205,0.120047,0.716212],[-1,-1,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v600, fine, t_pinza;
    !
    MoveL [[723.91,189.28,523.11],[0.663381,-0.138167,0.145348,0.720909],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL check_cap_mov, v100, fine, t_pinza;
    !
    WaitTime 1;
    !Espera  tener electrodo
    IF di_presencia_cap = 0 GOTO Repite_4;
    WaitTime 1;
    !
    MoveL [[689.36,162.13,523.12],[0.663377,-0.138177,0.145351,0.72091],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[637.27,279.98,629.94],[0.611309,0.0055859,-0.0077156,0.791334],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    MoveL [[531.53,375.27,621.73],[0.556395,0.00327494,-0.0083259,0.83087],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z100, t_pinza;
    MoveL [[532.35,375.59,664.15],[0.556391,0.00325948,-0.00832525,0.830872],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, fine, t_pinza;
    !
    CloseHighLift gun1;
    WaitTime 1;
    Set do_cerrar_pinza;
    WaitTime 2;
    Reset do_cerrar_pinza;
    OpenHighLift gun1;
    WHILE di_Pinza_Abierta=0 DO
        TPWrite"Esperando Pinza Abierta";
    ENDWHILE
    TPErase;
    !
    MoveL [[531.53,375.27,621.73],[0.556395,0.00327682,-0.00832457,0.83087],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z100, t_pinza;
    MoveL [[637.27,279.98,629.94],[0.611307,0.00558392,-0.00771447,0.791336],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z20, t_pinza;
    MoveL [[826.10,248.97,699.83],[0.704322,0.00649198,-0.00696151,0.709817],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z20, t_pinza;
    !
    MoveJ [[928.05,271.06,1302.13],[0.762511,0.00705639,-0.0063847,0.646906],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z100, t_pinza;
    MoveAbsJ home_pos_rob, vmax, fine, tool0;
    !
    !Abre agua
    Set do_Abrir_Agua;
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
    MoveJ [[801.77,-158.34,1713.58],[0.0034656,0.878996,-0.476812,0.0023366],[-1,-1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z1, tool0;
    !
    !Aplicamos programa
    SetGO go_Progr_soldad, 1;
    !
    !Corta agua
    Reset do_abrir_Agua;
    Set do_EV_Aspiracion;
    WaitTime 5;
    Reset do_EV_Aspiracion;
    !
    Set do_En_Cambio;
    WaitTime 1;
    WHILE di_Cambio_caps=1 DO
        TPWrite"Esperando no tener peticion de cambio de caps";
    ENDWHILE
    TPErase;
    Reset do_En_Cambio;
    !
    !Abre agua
    Set do_abrir_Agua;
    !
    !Resetea contador fresado
	N_ContF:=0;
	!    
	!Resetea contador fresado
	PulseDO\PLength:=1, do_Reset_fresado;
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
    OpenHighLift gun1;
    MoveJ [[928.05,271.06,1302.13],[0.762511,0.00705639,-0.0063847,0.646906],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z100, t_pinza;
    MoveL [[948.26,271.06,694.80],[0.762511,0.00705811,-0.00637995,0.646905],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1500,z50,t_pinza;
    !
    PulseDO\PLength:=2, do_Reset_Impulsos;
    PulseDO\PLength:=20,do_giro_fresa;
    WHILE di_Giro_fresa=0 DO
        TPWrite"Esperando giro motor de fresa";
    ENDWHILE
    TPErase;
    WHILE di_Giro_fresa=1 DO
        TPWrite"Esperando giro motor de fresa";
    ENDWHILE
    TPErase;
    !
    MoveL [[943.12,379.40,752.04],[0.760466,0.0253203,-0.0345216,0.647965],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1500, fine, t_pinza;
    CloseHighLift gun1;
    ! 
    ! Punto fresado electrodos
    MoveL pfresado1,v200,fine,t_pinza;
    ! 
    !CloseHighLift gun1;
    SetGO go_Progr_soldad,63;
    WaitTime\InPos,0.5;
    Set do_Cerrar_Pinza;
    WHILE di_Pinza_Cerrada=0 DO
        TPWrite"Esperando pinza cerrada";
    ENDWHILE
    TPErase;
    WaitTime\InPos,1;
    !Resetea contador vida electrodo
    Reset do_Cerrar_Pinza;
    SetGO go_Progr_soldad,1;
    WaitTime 0.2;
    OpenHighLift gun1;
    ! 
    MoveL [[941.64,383.40,729.38],[0.760459,0.0252963,-0.0345244,0.647974],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v100,z10,t_pinza;
    MoveL [[875.06,265.31,699.82],[0.78934,0.0073293,-0.00607176,0.613882],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1000,z30,t_pinza;
    Reset do_giro_fresa;
    MoveL [[875.06,265.30,1248.02],[0.789339,0.00732602,-0.00606809,0.613884],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z100, t_pinza;
    !  
    home_Robot;
    !Resetea contador
    PulseDO\PLength:=5, do_Reset_fresado;
    !
    !Contador fresado
	N_ContF:=N_ContF+1;
	!
    !Fin fresado
    Set do_fin_Fresado;
    WaitTime 1;
    Reset do_fin_fresado;
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
    WaitTime 0.5;
    home_Robot;
    OpenHighLift gun1;
    MoveJ [[928.05,271.06,1302.13],[0.762511,0.00705639,-0.0063847,0.646906],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z100, t_pinza;
    MoveL [[948.26,271.06,694.80],[0.762511,0.00705811,-0.00637995,0.646905],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1500,z50,t_pinza;
    MoveL [[945.32,372.54,693.95],[0.762505,0.00704969,-0.00638474,0.646912],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1500,z50,t_pinza;
    ! 
    PulseDO\PLength:=20,do_giro_fresa;
    ! 
    WaitDI di_Giro_fresa,1;
    !
    MoveL [[946.93,380.74,717.90],[0.762508,0.00707112,-0.00637712,0.646909],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1500,z10,t_pinza;
    ! 
    ! Punto fresado electrodos
    MoveL pfresado1,v200,fine,t_pinza;
    CloseHighLift gun1;
    Reset do_Cerrar_Pinza;
    SetGO go_Progr_soldad,63;
    WaitTime\InPos,1;
    Set do_Cerrar_Pinza;
    WaitTime\InPos,1;
    !Resetea contador vida electrodo
    Reset do_Cerrar_Pinza;
    OpenHighLift gun1;
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
    SetGO go_Progr_soldad,1;
    OpenHighLift gun1;
    !  
    MoveL [[948.26,381.67,694.80],[0.76251,0.00705532,-0.00637895,0.646907],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1500,z10,t_pinza;
    MoveL [[948.25,271.06,694.80],[0.762513,0.00706178,-0.00637916,0.646903],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],v1000,z50,t_pinza;
    MoveL [[928.04,271.06,1302.12],[0.76251,0.00705951,-0.00637995,0.646906],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z100, t_pinza;
    !  
    home_Robot;
    !
    !Contador fresado
	N_ContF:=N_ContF+1;
	!
    Reset do_giro_fresa;
    !
    !Fin fresado
    Set do_fin_Fresado;
    WaitTime 1;
    Reset do_fin_Fresado;
    ! 
  ENDPROC

    
  
	


ENDMODULE