MODULE DATA
    !
    !ROBOT 3
    !
    ! Módulo con datos comunes para todas las rutinas
    !
    ! Variable de posición:
    CONST jointtarget home_pos_rob:=[[125.815,-38.3673,-4.56141,86.5967,-81.8986,-42.7585],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget jposActual_rob1:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget delta_pos:=[[0.1,0.1,0.1,0.1,0.1,0.1],[0.1,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jpos_Home_old1:=[[125.815,-38.3673,-4.56141,86.5967,-81.8986,-42.7585],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget ceros:=[[0,0,0,0,0,0],[0,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !
    ! Posiciones especiales:
    CONST robtarget p_mantenimiento:=[[-680.1,-1166.51,768.59],[0.38102,-0.602947,0.381316,0.588112],[-2,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_comp_pernos1:=[[2023.85,-1098.59,1691.40],[0.945047,-0.00402276,0.000332541,-0.326911],[-1,-4,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_comp_pernos2:=[[2017.14,-1087.20,1765.61],[0.945404,-0.00159653,0.039383,-0.323509],[-1,-3,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !
    ! Datos numéricos:
    VAR num nteclas:=0;
    VAR num nDif_pos:=0;
    VAR num nDif_pos1:=0;
    VAR num nDif_pos2:=0;
    VAR num nDif_pos3:=0;
    VAR num n_Tiempo_ciclo:=0;
    VAR num N_Intentos:=0;
    VAR num nDefecto_Pernos_Fase1:=0;
    VAR num nDefecto_Pernos_Fase2:=0;
    VAR num nContador_Piezas_NOK:=0;
    !
    CONST buttondata btnSiNo:=4;
    !
    ! Datos fuerza:
    PERS forcedata cap_nuevo:=[1200,2];
    PERS forcedata coger_cap:=[1700,2.5];
    PERS forcedata fresado:=[1000,3];
    PERS forcedata fresado_new:=[1000,4];
    !
    ! Variables booleanas:
    PERS bool b_robot3_home:=TRUE;
    PERS bool b_ver_t_ciclo:=TRUE;
    PERS bool b_cycle_start:=FALSE;
    PERS bool cnt_clean:=TRUE;
    PERS bool b_presencia_cap1:=TRUE;
    PERS bool b_presencia_cap2:=TRUE;
    PERS bool b_Soldadura_Activada:=TRUE;
    PERS bool B_Sin_Detectores:=FALSE;
    VAR bool operacion_nok:=TRUE;
    VAR bool cambio_manual:=FALSE;
    VAR bool b_fallo_sold:=FALSE;
    VAR bool b_fallo_sold_perno:=FALSE;
    VAR bool b_Dummie:=FALSE;
    !
    ! Para activar fresado
    PERS bool b_cambio_elec1:=FALSE;
    PERS bool b_libera_fresa := TRUE;
    PERS bool b_libera_robot := TRUE;
    !
    !Memorias de programa
    PERS bool b_M1_Coger:=FALSE;
    PERS bool b_M2_Coger:=FALSE;
    PERS bool b_Vaciado_linea:=FALSE;
    PERS bool b_Dejar_cinta:=FALSE;
    !
    ! Para activar fresado
    PERS bool b_cambio_prensa:=FALSE;
    ! Variables de pantalla:
    VAR errnum err_var_s5;
    VAR errnum errno2;
    !	
    ! Variables :
    VAR clock ck_Tiempo_ciclo;
    VAR btnres nteclas_s5;
    VAR string estado_s5;
    VAR string tiempo_ciclo_s5;
    VAR shapedata joint_space;
    VAR wztemporary wzhome1:=[0];
    VAR wzstationary wz_home:=[0];
    !
    ! TOOLDATA
    !Intercambiador
    !TCP Garra PAL
    PERS tooldata t_pinza:=[FALSE,[[-581.94,-1757.66,1328.51],[0.766044,0,0,-0.642788]],[66.8,[129.9,-6,232.6],[1,0,0,0],7.805,6.998,6.25]];
    PERS tooldata t_tucker_Rosca:=[FALSE,[[266.38,-1379.66,1121.14],[0.382683,0,0,-0.92388]],[66.8,[129.9,-6,232.6],[1,0,0,0],7.805,6.998,6.25]];
    PERS tooldata t_tucker_Setas:=[FALSE,[[1395.28,-374.26,1137.15],[0.92388,0,0,-0.382683]],[66.8,[129.9,-6,232.6],[1,0,0,0],7.805,6.998,6.25]];
    PERS tooldata tCargaCaps:=[FALSE,[[-384.13,-1949.74,832],[0.92388,0,0,-0.382683]],[66.8,[129.9,-6,232.6],[1,0,0,0],7.805,6.998,6.25]];
    PERS tooldata Tcp_Garra:=[TRUE,[[89.4577,-523.22,573.552],[0.683013,-0.183013,-0.683013,-0.183013]],[113.8,[36,-14.8,178.1],[1,0,0,0],23.989,11.751,20.489]];
    PERS tooldata tCambio_Electrodos:=[TRUE,[[-411.633,-26.7925,658.38],[1,0,0,0]],[66.8,[129.9,-6,232.6],[1,0,0,0],7.805,6.998,6.25]];
    PERS tooldata Tcp_Coche:=[TRUE,[[89.4577,-523.22,573.552],[0,0.258819,0.965926,0]],[113.8,[36,-14.8,178.1],[1,0,0,0],23.989,11.751,20.489]];
    PERS tooldata t_tucker_Setas_370:=[TRUE,[[90.4577,-523.22,572.552],[0.683013,-0.183013,-0.683013,-0.183013]],[113.8,[36,-14.8,178.1],[1,0,0,0],23.989,11.751,20.489]];
    !
    !OBJETOS DE TRABAJO
    PERS wobjdata wobj_Garra_R3:=[TRUE,TRUE,"",[[262.527,456.177,480.005],[0.709118,-0.0404631,0.702784,0.0401017]],[[0,0,0],[1,0,0,0]]];
    PERS wobjdata wobj_tpinza:=[FALSE,TRUE,"",[[225.1,1636.4,1480.3],[0.1146,-0.81593,0.27728,0.49421]],[[-83.6,272.3,328.4],[1,0,0,0]]];
    PERS wobjdata wobj_manipulador1:=[TRUE,TRUE,"",[[-266.02,-733.299,998.82],[0.89248,-0.140048,0.423611,0.066473]],[[56,-62.5,799.3],[1,0,0,0]]];
    !
    !Payloads piezas
    PERS loaddata load_GARRA_R3:=[14.2,[-119.9,-414.2,130.7],[1,0,0,0],6.3,3.2,3.3];
    !
    !
    !  Espesores (mm) Esfuerzo (N) Programas Poténcia (KvA) Tiempo (ms) Serratron R3
    ! Espesor 2.7 mm prog. 01	Tip_Force 2500	8.50  - 9.50  kvA  370 ms
    ! Espesor 3.2 mm prog. 02	Tip_Force 3100	8.50  - 9.50  kvA  380 ms
    ! Espesor 3.3 mm prog. 03	Tip_Force 3200	8.50  - 9.50  kvA  460 ms
    ! Espesor 3.5 mm prog. 04	Tip_Force 3300	8.50  - 9.50  kvA  480 ms
    ! Espesor 3.7 mm prog. 05	Tip_Force 3400	8.50  - 9.50  kvA  540 ms
    ! Espesor 4.0 mm prog. 06	Tip_Force 3500	8.50  - 9.50  kvA  550 ms
    ! Espesor 4.2 mm prog. 07	Tip_Force 3600	8.50  - 9.50  kvA  580 ms
    ! Espesor 4.3 mm prog. 08	Tip_Force 3600	8.50  - 9.50  kvA  590 ms
    ! Espesor 4.7 mm prog. 09	Tip_Force 3600	8.50  - 9.50  kvA  400 ms
    ! Espesor 4.8 mm prog. 10	Tip_Force 3600	8.50  - 9.50  kvA  660 ms
    ! Espesor 5.5 mm prog. 11   Tip_Force 3600	8.50  - 9.50  kvA  760 ms

    !SPOT DATA PIEZA FASE-1
    PERS spotdata RA696SOLD011:=[1,1];
    PERS spotdata RA696SOLD019:=[1,1];
    PERS spotdata RA696SOLD044:=[1,1];
    PERS spotdata RA696SOLD045:=[1,1];
    
    CONST errnum errno1:=0;
     ! Tuerca (M-8) Programa Presión (EV) Tiempo (ms) Poténcia (KvA) Estática 1
    ! Tuerca M-8 nº1   prog.01 Serratron  3.2 EV  220 ms  10.0 KvA   
    ! Tuerca M-8 nº2   prog.02 Serratron  3.2 EV  220 ms  10.0 KvA
    ! Tuerca M-8 nº3   prog.03 Serratron  3.2 EV  220 ms  10.0 KvA
    ! Tuerca M-8 nº4   prog.04 Serratron  3.2 EV  220 ms  10.0 KvA

ENDMODULE
