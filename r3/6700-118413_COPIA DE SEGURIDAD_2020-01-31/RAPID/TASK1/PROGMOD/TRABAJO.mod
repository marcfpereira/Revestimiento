%%%
  VERSION:1
  LANGUAGE:ENGLISH
%%%

MODULE TRABAJO
  VAR num reg6tuerca:=0;
  VAR num FINAL:=0;
  CONST robtarget ptuerca:=[[1249.42,48.71,-1388.86],[0.596781,0.68052,-0.304471,0.296722],[-1,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget pCogida_M1:=[[-537.36,2192.35,1024.75],[0.925948,0.0032282,-0.00696363,0.377572],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget pCogida_M3:=[[-536.02,2187.19,1029.18],[0.925373,0.000925067,-0.0103583,0.378916],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget pDejada_Cinta:=[[2771.54,953.08,924.77],[0.923943,-0.0314454,0.0814092,0.372442],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget p_marcadora:=[[2871.40,956.62,1201.76],[0.928848,-0.00132288,0.0145741,0.370172],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget Enlace_Soldar_Descarga:=[[2176.66,293.36,1739.37],[0.928851,-0.00130889,0.0145672,0.370164],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  ! DATOS SOLDADURA TUERCAS
  ! DATOS SOLDADURA M1 Y M2 PIEZA IZQUIERDA
  PERS spotdata S_A01_0002:=[1,1];
  PERS spotdata S_A02_0002:=[1,1];
  PERS spotdata S_A02_0004:=[1,1];
  PERS spotdata S_A03_0002:=[1,1];
  PERS spotdata S_A04_0001:=[1,1];
  PERS spotdata S_A06_0001:=[1,1];
  ! POSICION PUNTOS SOLDADURA PIEZA DERECHA
  CONST robtarget A01_0003_D:=[[950.77,286.26,439.52],[0.436642,0.460978,0.585734,-0.503745],[0,-1,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget A02_0002_D:=[[469.07,103.22,423.85],[0.028714,0.699748,0.713268,-0.027881],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget A02_0004_D:=[[-2145.209029858,-2700.583295642,66.007911795],[0.200690654,-0.138578048,0.96962113,0.018821524],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget A03_0002_D:=[[755.26,59.19,436.87],[0.029856,0.733792,0.678214,-0.026158],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget A04_0001_D:=[[906.48,381.87,427.93],[0.014355,0.536428,0.843822,0.001824],[0,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  ! POSICION PUNTOS SOLDADURA PIEZA IZQUIERDA
  CONST robtarget A02_0004_I:=[[-325.93,276.38,384.29],[0.486148,0.497071,0.541711,-0.472367],[-1,1,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget A06_0001_I:=[[1985.38,-368,972.28],[0.098715,-0.994636,0.01677,0.025944],[-1,0,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget pCogida_M4:=[[-575.64,2152.52,960.88],[0.926628,0.00288482,-0.0178473,0.375545],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget Enlace_Pinza_Pernos:=[[-856.98,-663.56,2603.67],[0.0461744,-0.053885,-0.497102,-0.864785],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget Dejada_Cinta_370:=[[2765.34,944.62,988.86],[0.923941,-0.0314477,0.0814329,0.372441],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget Dejada_Pocayoke:=[[2816.24,973.78,1394.10],[0.923125,0.00569149,-0.016762,0.384092],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget Dejada_Pocayoke10:=[[2827.20,983.42,1324.39],[0.922139,-0.00138068,-0.00255896,0.386849],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget Enlace_Soldar_Descarga10:=[[1372.39,256.00,3560.88],[0.852769,-0.135458,-0.37515,0.337192],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  CONST robtarget Dejada_Pocayoke370:=[[2815.91,973.81,1395.99],[0.922947,0.00732428,-0.0217323,0.384243],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
  
  
  PROC COGER_M1()
    !
    ! Posisción reposo 
    MoveAbsJ home_pos_rob,vmax,z10,Tcp_Garra;
    !
    rAnticol acA4_R1, aaActivate;
    rAnticol acA4_R2, aaActivate;
    ! Abre garra y saca centrador Izq.
    if di_presencia_1=1 OR di_presencia_2=1 THEN 
        TPWrite"Esperando Robot sin pieza";
        WaitTime 0.2;
    ENDIF
    TPErase;
    !
    ! Abre garra y retrocede centradores
    ABRIR_GARRA_COMPLETA;
    !
    ! Espera permiso mesa
    WHILE di_Util1_OK=0 DO
        TPWrite"   Esperando Util 1 OK   ";
    ENDWHILE
    TPErase;
    Reset do_Mesa_Free;
    !
    MoveJ [[-597.16,2096.35,1735.71],[0.917113,0.134015,0.0246041,0.374618],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    !
    ! Punto aproximacion 
    MoveL Offs(pCogida_M1,0,0,200),vmax,z10,Tcp_Garra;
    !
    ! En posición mesa 1-2
    MoveL pCogida_M1, vmax, fine, Tcp_Garra;
    !
    !Bajar Centradores
    Set do_Move_Fix1;
    WHILE di_FixMoved1=0 DO
        TPWrite"   Esperando Centradores de Útil Retrocedidos  ";
    ENDWHILE
    TPErase;
    Reset do_Move_Fix1;
    !
    ! Cierra garra 
    CERRAR_GARRA_COMPLETA;
    !
    MoveL Reltool(pCogida_M1,14,0,20),vmax,z20,Tcp_Garra;
    !
    IF B_Sin_Detectores=FALSE THEN
    ! Mira presencia pieza
    WHILE di_presencia_1=0 DO
        TPWrite"   Esperando Presencia pieza detector 1 ";
    ENDWHILE
    TPErase;
    WHILE di_presencia_2=0 DO
        TPWrite"   Esperando Presencia pieza detector 2 ";
    ENDWHILE
    TPErase;
    ENDIF
    !
    ! Punto aproximacion 
    MoveL Reltool(pCogida_M1,25,0,150),vmax,z20,Tcp_Garra;
    MoveL Reltool(pCogida_M1,-15,0,350),vmax,z20,Tcp_Garra;
    MoveJ [[-597.16,2096.35,1735.71],[0.917113,0.134015,0.0246041,0.374618],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    MoveJ [[267.70,1050.27,2603.67],[0.802781,0.487611,0.110678,0.324852],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    ! Libera mesa
    Set do_Mesa_Free;
    End_of_cycle;
    rAnticol acA4_R1, aaDeactivate;
    rAnticol acA4_R2, aaDeactivate;
    !
  ENDPROC
  PROC COGER_M4()
    !
    ! Posisción reposo 
    MoveAbsJ home_pos_rob,v3000,z10,Tcp_Garra;
    !
    rAnticol acA4_R1, aaActivate;
    rAnticol acA4_R2, aaActivate;
    ! Abre garra y saca centrador Izq.
    if di_presencia_1=1 OR di_presencia_2=1 THEN 
        TPWrite"Esperando Robot sin pieza";
    ENDIF
    TPErase;
    ! Abre garra y retrocede centradores
    ABRIR_GARRA_COMPLETA;
    !
    ! Espera permiso mesa
    WHILE di_Util4_OK=0 DO
        TPWrite"   Esperando Util 4 OK   ";
    ENDWHILE
    TPErase;
    Reset do_Mesa_Free;
    !
    MoveJ [[-480.12,2055.15,1709.58],[0.918245,0.125325,0.0219366,0.375019],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    MoveL Offs(pCogida_M4,0,0,400),v3000,z10,Tcp_Garra;
    !
    ! Punto aproximacion 
    MoveL Offs(pCogida_M4,0,0,200),v3000,z10,Tcp_Garra;
    !
    ! En posición mesa 1-2
    MoveL pCogida_M4, v1000, fine, Tcp_Garra;
    !
    !Bajar Centradores
    Set do_Move_Fix1;
    WHILE di_FixMoved1=0 DO
        TPWrite"   Esperando Centradores de Útil Retrocedidos  ";
    ENDWHILE
    TPErase;
    Reset do_Move_Fix1;
    !
    ! Cierra garra 
    AVANZAR_CENTRADORES_GARRA;
    CERRAR_BRIDAS_GARRA_C;
    !
    MoveL RelTool(pCogida_M4,12,0,20), v2000, z1, Tcp_Garra;
    !
    IF B_Sin_Detectores=FALSE THEN
    ! Mira presencia pieza
    WHILE di_presencia_1=0 DO
        TPWrite"   Esperando Presencia pieza detector 1 ";
    ENDWHILE
    TPErase;
    WHILE di_presencia_2=0 DO
        TPWrite"   Esperando Presencia pieza detector 2 ";
    ENDWHILE
    TPErase;
    ENDIF
    !
    ! Punto aproximacion 
    MoveL Reltool(pCogida_M4,17,0,150),v2000,z1,Tcp_Garra;
    MoveL Reltool(pCogida_M4,17,0,350),v2000,z20,Tcp_Garra;
    !
    MoveJ [[267.70,1050.27,2603.67],[0.802781,0.487611,0.110678,0.324852],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    ! Libera mesa
    Set do_Mesa_Free;
    End_of_cycle;
    rAnticol acA4_R1, aaDeactivate;
    rAnticol acA4_R2, aaDeactivate;
    !
  ENDPROC
  
  PROC COGER_M3()
    !
    ! Posisción reposo 
    MoveAbsJ home_pos_rob,vmax,z10,Tcp_Garra;
    !
    rAnticol acA4_R1, aaActivate;
    rAnticol acA4_R2, aaActivate;
    ! Abre garra y saca centrador Izq.
    if di_presencia_1=1 OR di_presencia_2=1 THEN 
        TPWrite"Esperando Robot sin pieza";
        WaitTime 0.2;
    ENDIF
    TPErase;
    ! Abre garra y saca centrador Izq.
    ABRIR_GARRA_COMPLETA;
    !
    ! Va a mesa coge talonera der.
    !
    ! Espera permiso mesa
    WHILE di_Util3_OK=0 DO
        TPWrite"   Esperando Util 3 OK ";
    ENDWHILE
    TPErase;
    Reset do_Mesa_Free;
    !
    MoveJ [[-597.16,2096.35,1735.71],[0.917113,0.134015,0.0246041,0.374618],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, Tcp_Garra;
    !
    ! Punto aproximacion 
    MoveL Offs(pCogida_M3,0,0,200),vmax,z10,Tcp_Garra;
    !
    ! En posición mesa 1-2
    MoveL pCogida_M3, vmax, fine, Tcp_Garra;
    !
    !Bajar Centradores
    Set do_Move_Fix1;
    WHILE di_FixMoved1=0 DO
        TPWrite"   Esperando Centradores de Útil Retrocedidos ";
    ENDWHILE
    TPErase;
    Reset do_Move_Fix1;
    !
    ! Cierra garra 
    CERRAR_GARRA_COMPLETA;
    !
    MoveL RelTool(pCogida_M3,16,0,20),vmax,z20,Tcp_Garra;
    !
    IF B_Sin_Detectores=FALSE THEN
    ! Mira presencia pieza
    WHILE di_presencia_1=0 DO
        TPWrite"   Esperando Presencia pieza detector 1 ";
    ENDWHILE
    TPErase;
    WHILE di_presencia_2=0 DO
        TPWrite"   Esperando Presencia pieza detector 2 ";
    ENDWHILE
    TPErase;
    ENDIF
    !
    ! Punto aproximacion 
    MoveL Reltool(pCogida_M3,15,0,70),vmax,z20,Tcp_Garra;
    MoveL Reltool(pCogida_M3,14,0,150),vmax,z20,Tcp_Garra;
    MoveL Reltool(pCogida_M3,-15,0,350),vmax,z20,Tcp_Garra;
    MoveJ [[-597.16,2096.35,1735.71],[0.917113,0.134015,0.0246041,0.374618],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    MoveJ [[267.70,1050.27,2603.67],[0.802781,0.487611,0.110678,0.324852],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    ! Libera mesa
    Set do_Mesa_Free;
    End_of_cycle;
    rAnticol acA4_R1, aaDeactivate;
    rAnticol acA4_R2, aaDeactivate;
    !
  ENDPROC

  
  
  
  PROC SOLDAR_REV_M4()
    ! Posisción reposo 
    MoveJ [[267.70,1050.27,2603.67],[0.802781,0.487611,0.110678,0.324852],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    !
    Seg_Fresado;
    !
    ! Control avatible atras
    WHILE di_Abat_Retrocedido=0 DO
        TPWrite"   Esperando abatible fresadora retrocedido ";
    ENDWHILE
    TPErase;
    !
    ! Comunica a PLC zona trabajo
    Seg_Fresado;
    !
    !
    OpenHighLift gun1;
    MoveJ [[1404.29,-559.81,3718.69],[0.858718,-0.127689,-0.488428,-0.0879582],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    MoveJ [[-341.75,-1150.15,3923.79],[0.584619,-0.431145,-0.31879,-0.608857],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    MoveJ [[-1273.09,-1451.15,2287.91],[0.125248,-0.0683115,-0.927804,-0.344712],[-2,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    MoveL [[-1041.27,-1520.27,1363.66],[0.0064679,-0.0848252,0.993325,0.0779001],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-869.04,-1624.95,1363.94],[0.0018949,-0.139064,0.987184,0.0782601],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-850.38,-1689.88,1353.41],[0.00189436,-0.139065,0.987184,0.078261],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-822.66,-1777.72,1336.24],[0.00392655,0.139016,-0.983037,-0.119568],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    SetGO go_Progr_soldad, 1;
    !Punto 1
    MoveL [[-825.76,-1753.60,1328.92],[0.00393362,0.139019,-0.983039,-0.11955],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    Soldar\AbrirTotal;
    !OpenHighLift gun1;
    !
    MoveL [[-850.38,-1689.88,1353.41],[0.00189436,-0.139065,0.987184,0.078261],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-1041.27,-1520.27,1363.66],[0.0064679,-0.0848252,0.993325,0.0779001],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveJ [[-1189.30,-1394.60,1366.82],[0.010129,-0.0379554,0.996217,0.0775078],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveJ [[-1106.71,-466.23,1351.56],[0.0369892,0.0132334,-0.00511414,-0.999215],[-2,1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-907.71,-806.70,1393.60],[0.0369849,0.0132392,-0.00510985,-0.999215],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-889.27,-917.82,1223.93],[0.0398632,0.0130643,-0.0732745,-0.996429],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    SetGO go_Progr_soldad, 1;
    !Punto 2
    MoveL [[-881.53,-904.61,1215.73],[0.0398612,0.0130644,-0.073274,-0.996429],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar\AbrirTotal;
    !OpenHighLift gun1;
    !
    MoveL [[-907.71,-806.70,1393.60],[0.0369849,0.0132392,-0.00510985,-0.999215],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-1106.71,-466.23,1351.56],[0.0369892,0.0132334,-0.00511414,-0.999215],[-2,1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    MoveJ Enlace_Pinza_Pernos, vmax, fine, Tcp_Garra;
    !
  ENDPROC
  
  PROC SOLDAR_REV_M1()
    ! Posisción reposo 
    MoveJ [[267.70,1050.27,2603.67],[0.802781,0.487611,0.110678,0.324852],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    !
    Seg_Fresado;
    !
    ! Control avatible atras
    WHILE di_Abat_Retrocedido=0 DO
        TPWrite"   Esperando abatible fresadora retrocedido ";
    ENDWHILE
    TPErase;
    !
    ! Comunica a PLC zona trabajo
    Seg_Fresado;
    !
    OpenHighLift gun1;
    MoveJ [[1404.29,-559.81,3718.69],[0.858718,-0.127689,-0.488428,-0.0879582],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    MoveJ [[-341.75,-1150.15,3923.79],[0.584619,-0.431145,-0.31879,-0.608857],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    !
    !GOTO Salto_Mesa1_Soldadura;
    !
    MoveJ [[-1273.09,-1451.15,2287.91],[0.125248,-0.0683115,-0.927804,-0.344712],[-2,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    MoveL [[-1041.27,-1520.27,1363.66],[0.0064679,-0.0848252,0.993325,0.0779001],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
    MoveL [[-899.49,-1687.02,1363.75],[0.00196831,-0.138222,0.987303,0.0782474],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    !Puntos Cuernos 
    !MoveL [[-851.77,-1640.20,1317.56],[0.0106163,0.139908,-0.989359,-0.038491],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    !SetGO go_Progr_soldad, 1;
    !Punto 1
    !MoveL [[-848.59,-1654.74,1315.29],[0.010617,0.139906,-0.989359,-0.0384906],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !Soldar;
    !
    !SetGO go_Progr_soldad, 1;
    !Punto 2
    !MoveL [[-842.45,-1665.54,1314.45],[0.0106136,0.139903,-0.98936,-0.0384853],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !Soldar;
    !OpenHighLift gun1;
    !
    !MoveL [[-856.60,-1668.60,1322.18],[0.0106156,0.139909,-0.989359,-0.0384928],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
    !MoveL [[-872.16,-1687.10,1314.02],[0.0106155,0.139906,-0.989359,-0.0384883],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    !SetGO go_Progr_soldad, 1;
    !Punto 3
    !MoveL [[-861.15,-1691.66,1313.53],[0.0106128,0.139903,-0.98936,-0.0384846],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !Soldar;
    !
    !SetGO go_Progr_soldad, 1;
    !Punto 4
    !MoveL [[-857.83,-1704.18,1314.37],[0.010612,0.139899,-0.989361,-0.0384819],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !Soldar;
    !OpenHighLift gun1;
    !
    !MoveL [[-856.60,-1668.60,1322.18],[0.0106167,0.13991,-0.989359,-0.038495],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    MoveL [[-847.61,-1804.57,1316.91],[0.00197018,-0.138221,0.987304,0.0782444],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    SetGO go_Progr_soldad, 1;
    !Punto 
    MoveL [[-843.08,-1810.81,1315.44],[0.00728158,0.138864,-0.984326,-0.108472],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    Soldar;
    !
    SetGO go_Progr_soldad, 1;
    !Punto 
    MoveL [[-819.11,-1776.75,1314.01],[0.00727876,0.138864,-0.984325,-0.108483],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    Soldar\AbrirTotal;
    !OpenHighLift gun1;
    !
    MoveL [[-883.60,-1704.74,1338.50],[0.0072792,0.138863,-0.984326,-0.108477],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-1041.27,-1520.27,1363.66],[0.0064679,-0.0848252,0.993325,0.0779001],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveJ [[-1247.61,-1395.72,1290.86],[0.00742906,-0.0114849,0.976578,0.214731],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveJ [[-1118.56,-437.03,1351.56],[0.023877,0.0131635,-0.00528775,-0.999614],[-2,1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-951.17,-805.10,1413.65],[0.0369869,0.0132368,-0.00510881,-0.999215],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    !Puntos Cuernos
    !MoveL [[-871.15,-756.77,1277.09],[0.0341197,0.00961054,-0.041765,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    !SetGO go_Progr_soldad, 1;
    !Punto 5
    !MoveL [[-870.44,-779.80,1275.09],[0.0341226,0.00961105,-0.0417523,-0.998499],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    !Soldar;
    !
    !MoveL [[-867.67,-801.55,1287.04],[0.0341216,0.00961279,-0.0417781,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
    !
    !SetGO go_Progr_soldad, 1;
    !Punto 6
    !MoveL [[-866.46,-813.69,1276.13],[0.0341191,0.00961468,-0.0417513,-0.998499],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    !Soldar;
    !OpenHighLift gun1;
    !
    !MoveL [[-868.46,-798.59,1322.69],[0.0341212,0.00961305,-0.0417764,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
    !MoveL [[-897.70,-807.22,1315.11],[0.0341213,0.00961239,-0.0417809,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
    !MoveL [[-898.04,-795.92,1287.97],[0.034119,0.00961067,-0.0417862,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    !SetGO go_Progr_soldad, 1;
    !Punto 7
    !MoveL [[-893.86,-796.80,1276.58],[0.034119,0.00961395,-0.0417675,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    !Soldar;
    !
    !MoveL [[-897.98,-814.10,1292.57],[0.0341179,0.00962026,-0.0417753,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
    !
    !SetGO go_Progr_soldad, 1;
    !Punto 8
    !MoveL [[-889.63,-825.79,1277.07],[0.0341179,0.0096316,-0.0417632,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    !Soldar;
    !OpenHighLift gun1;
    !
    !MoveL [[-913.07,-824.95,1321.04],[0.0341159,0.00962511,-0.0417775,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    MoveL [[-896.41,-945.15,1160.28],[0.0353169,0.00989658,-0.108502,-0.993419],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    SetGO go_Progr_soldad, 1;
    !Punto 
    MoveL [[-898.37,-954.36,1155.83],[0.0353162,0.00990084,-0.108494,-0.99342],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar;
    !
    SetGO go_Progr_soldad, 1;
    !Punto 
    MoveL [[-871.48,-925.86,1156.65],[0.0353161,0.00990249,-0.108494,-0.99342],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar\AbrirTotal;
    !OpenHighLift gun1;
    !
    MoveL [[-951.17,-805.10,1413.66],[0.0369871,0.0132354,-0.00511121,-0.999215],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    MoveL [[-1127.22,-542.06,1470.29],[0.0424967,0.0183048,0.00681274,-0.998906],[-2,1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveJ [[-1219.57,-815.88,1776.21],[0.222157,-0.029866,-0.057158,-0.972876],[-2,1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    !Salto_Mesa1_Soldadura:
    !
    MoveJ [[-984.84,-1498.78,1838.30],[0.591658,-0.0640156,-0.0374685,-0.80277],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-947.83,-1409.52,1322.96],[0.593341,0.00531506,0.00433532,-0.804922],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-1061.27,-1829.30,1350.35],[0.680915,0.00577579,0.00370966,-0.73233],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-1052.09,-2007.77,1296.51],[0.726221,0.00599993,0.00333287,-0.687428],[-2,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    CloseHighLift gun1;
    SetGO go_Progr_soldad, 1;
    !Punto ??
    MoveL [[-1067.38,-2026.82,1288.44],[0.726219,0.00599982,0.0033328,-0.687429],[-2,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar;
    !
    SetGO go_Progr_soldad, 1;
    !Punto ??
    MoveL [[-1007.88,-2044.39,1286.66],[0.739907,0.00607071,0.00321005,-0.672674],[-2,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar;
    !
    SetGO go_Progr_soldad, 1;
    !Punto ??
    MoveL [[-899.87,-2076.89,1286.56],[0.776953,0.00625198,0.00285853,-0.629522],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar;
    !
    SetGO go_Progr_soldad, 1;
    !Punto ??
    MoveL [[-834.63,-2079.07,1286.57],[0.792832,0.00632241,0.00269502,-0.609401],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar;
    OpenHighLift gun1;
    !
    MoveL [[-1052.09,-2007.77,1317.23],[0.72622,0.0060009,0.00333326,-0.687428],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-1061.27,-1829.30,1350.35],[0.680915,0.00577579,0.00370966,-0.73233],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-961.90,-1515.00,1367.34],[0.593306,0.0107408,0.0078868,-0.804867],[-2,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveJ [[-1000.33,-1536.15,1899.86],[0.591498,-0.0669837,-0.0392577,-0.802559],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    MoveJ Enlace_Pinza_Pernos, vmax, fine, Tcp_Garra;
    !
    RETURN;
  ENDPROC
  PROC SOLDAR_REV_M3()
    ! Posisción reposo 
    MoveJ [[267.70,1050.27,2603.67],[0.802781,0.487611,0.110678,0.324852],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    !
    Seg_Fresado;
    !
    ! Control avatible atras
    WHILE di_Abat_Retrocedido=0 DO
        TPWrite"   Esperando abatible fresadora retrocedido ";
    ENDWHILE
    TPErase;
    !
    ! Comunica a PLC zona trabajo
    Seg_Fresado;
    !
    OpenHighLift gun1;
    MoveJ [[1404.29,-559.81,3718.69],[0.858718,-0.127689,-0.488428,-0.0879582],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    MoveJ [[-341.75,-1150.15,3923.79],[0.584619,-0.431145,-0.31879,-0.608857],[-1,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    !
    !GOTO Salto_Mesa1_Soldadura;
    !
    MoveJ [[-1273.09,-1451.15,2287.91],[0.125248,-0.0683115,-0.927804,-0.344712],[-2,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,z200,Tcp_Garra;
    MoveL [[-1041.27,-1520.27,1363.66],[0.0064679,-0.0848252,0.993325,0.0779001],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
    MoveL [[-899.49,-1687.02,1363.75],[0.00196831,-0.138222,0.987303,0.0782474],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    !Puntos Cuernos 
    !MoveL [[-851.77,-1640.20,1317.56],[0.0106163,0.139908,-0.989359,-0.038491],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    !SetGO go_Progr_soldad, 1;
    !Punto 1
    !MoveL [[-848.59,-1654.74,1315.29],[0.010617,0.139906,-0.989359,-0.0384906],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !Soldar;
    !
    !SetGO go_Progr_soldad, 1;
    !Punto 2
    !MoveL [[-842.45,-1665.54,1314.45],[0.0106136,0.139903,-0.98936,-0.0384853],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !Soldar;
    !OpenHighLift gun1;
    !
    !MoveL [[-856.60,-1668.60,1322.18],[0.0106156,0.139909,-0.989359,-0.0384928],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
    !MoveL [[-872.16,-1687.10,1314.02],[0.0106155,0.139906,-0.989359,-0.0384883],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    !SetGO go_Progr_soldad, 1;
    !Punto 3
    !MoveL [[-861.15,-1691.66,1313.53],[0.0106128,0.139903,-0.98936,-0.0384846],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !Soldar;
    !
    !SetGO go_Progr_soldad, 1;
    !Punto 4
    !MoveL [[-857.83,-1704.18,1314.37],[0.010612,0.139899,-0.989361,-0.0384819],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !Soldar;
    !OpenHighLift gun1;
    !
    !MoveL [[-856.60,-1668.60,1322.18],[0.0106167,0.13991,-0.989359,-0.038495],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    MoveL [[-847.61,-1804.57,1316.91],[0.00197018,-0.138221,0.987304,0.0782444],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    SetGO go_Progr_soldad, 1;
    !Punto 
    MoveL [[-843.08,-1810.81,1315.44],[0.00728158,0.138864,-0.984326,-0.108472],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    Soldar;
    !
    SetGO go_Progr_soldad, 1;
    !Punto 
    MoveL [[-819.11,-1776.75,1314.01],[0.00727876,0.138864,-0.984325,-0.108483],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    Soldar\AbrirTotal;
    !OpenHighLift gun1;
    !
    MoveL [[-883.60,-1704.74,1338.50],[0.0072792,0.138863,-0.984326,-0.108477],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-1041.27,-1520.27,1363.66],[0.0064679,-0.0848252,0.993325,0.0779001],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveJ [[-1247.61,-1395.72,1290.86],[0.00742906,-0.0114849,0.976578,0.214731],[-2,0,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveJ [[-1118.56,-437.03,1351.56],[0.023877,0.0131635,-0.00528775,-0.999614],[-2,1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-951.17,-805.10,1413.65],[0.0369869,0.0132368,-0.00510881,-0.999215],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    !Puntos Cuernos
    !MoveL [[-871.15,-756.77,1277.09],[0.0341197,0.00961054,-0.041765,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    !SetGO go_Progr_soldad, 1;
    !Punto 5
    !MoveL [[-870.44,-779.80,1275.09],[0.0341226,0.00961105,-0.0417523,-0.998499],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    !Soldar;
    !
    !MoveL [[-867.67,-801.55,1287.04],[0.0341216,0.00961279,-0.0417781,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
    !
    !SetGO go_Progr_soldad, 1;
    !Punto 6
    !MoveL [[-866.46,-813.69,1276.13],[0.0341191,0.00961468,-0.0417513,-0.998499],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    !Soldar;
    !OpenHighLift gun1;
    !
    !MoveL [[-868.46,-798.59,1322.69],[0.0341212,0.00961305,-0.0417764,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
    !MoveL [[-897.70,-807.22,1315.11],[0.0341213,0.00961239,-0.0417809,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
    !MoveL [[-898.04,-795.92,1287.97],[0.034119,0.00961067,-0.0417862,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    !SetGO go_Progr_soldad, 1;
    !Punto 7
    !MoveL [[-893.86,-796.80,1276.58],[0.034119,0.00961395,-0.0417675,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    !Soldar;
    !
    !MoveL [[-897.98,-814.10,1292.57],[0.0341179,0.00962026,-0.0417753,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
    !
    !SetGO go_Progr_soldad, 1;
    !Punto 8
    !MoveL [[-889.63,-825.79,1277.07],[0.0341179,0.0096316,-0.0417632,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    !Soldar;
    !OpenHighLift gun1;
    !
    !MoveL [[-913.07,-824.95,1321.04],[0.0341159,0.00962511,-0.0417775,-0.998498],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    MoveL [[-896.41,-945.15,1160.28],[0.0353169,0.00989658,-0.108502,-0.993419],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    SetGO go_Progr_soldad, 1;
    !Punto 
    MoveL [[-898.37,-954.36,1155.83],[0.0353162,0.00990084,-0.108494,-0.99342],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar;
    !
    SetGO go_Progr_soldad, 1;
    !Punto 
    MoveL [[-871.48,-925.86,1156.65],[0.0353161,0.00990249,-0.108494,-0.99342],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar\AbrirTotal;
    !OpenHighLift gun1;
    !
    MoveL [[-951.17,-805.10,1413.66],[0.0369871,0.0132354,-0.00511121,-0.999215],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    MoveL [[-1127.22,-542.06,1470.29],[0.0424967,0.0183048,0.00681274,-0.998906],[-2,1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveJ [[-1219.57,-815.88,1776.21],[0.222157,-0.029866,-0.057158,-0.972876],[-2,1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    !Salto_Mesa1_Soldadura:
    !
    MoveJ [[-984.84,-1498.78,1838.30],[0.591658,-0.0640156,-0.0374685,-0.80277],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-947.83,-1409.52,1322.96],[0.593341,0.00531506,0.00433532,-0.804922],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-1061.27,-1829.30,1350.35],[0.680915,0.00577579,0.00370966,-0.73233],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-1052.09,-2007.77,1296.51],[0.726221,0.00599993,0.00333287,-0.687428],[-2,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
    !
    !CloseHighLift gun1;
    SetGO go_Progr_soldad, 1;
    !Punto ??
    MoveL [[-1067.38,-2026.82,1288.44],[0.726219,0.00599982,0.0033328,-0.687429],[-2,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar;
    !
    SetGO go_Progr_soldad, 1;
    !Punto ??
    MoveL [[-1007.88,-2044.39,1286.66],[0.739907,0.00607071,0.00321005,-0.672674],[-2,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar;
    !
    SetGO go_Progr_soldad, 1;
    !Punto ??
    MoveL [[-899.87,-2076.89,1286.56],[0.776953,0.00625198,0.00285853,-0.629522],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar;
    !
    SetGO go_Progr_soldad, 1;
    !Punto ??
    MoveL [[-834.63,-2079.07,1286.57],[0.792832,0.00632241,0.00269502,-0.609401],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,fine,Tcp_Garra;
    Soldar\AbrirTotal;
    !OpenHighLift gun1;
    !
    MoveL [[-1052.09,-2007.77,1317.23],[0.72622,0.0060009,0.00333326,-0.687428],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-1061.27,-1829.30,1350.35],[0.680915,0.00577579,0.00370966,-0.73233],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveL [[-961.90,-1515.00,1367.34],[0.593306,0.0107408,0.0078868,-0.804867],[-2,1,-2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    MoveJ [[-1000.33,-1536.15,1899.86],[0.591498,-0.0669837,-0.0392577,-0.802559],[-2,1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
    !
    MoveJ Enlace_Pinza_Pernos, vmax, fine, Tcp_Garra;
    !
    RETURN;
  ENDPROC
  
  
  
	
	PROC PERNOS_ROSCA()
		!
        Seg_Fresado;
        !
		WaitDI di_Cabezal_Atras_1, 1;
		Reset do_def_perno;
		!
        MoveJ [[603.20,-1624.84,1848.22],[0.59806,-0.461075,0.625578,0.195923],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
        MoveJ [[564.76,-689.28,1456.36],[0.304411,0.68446,0.0756709,-0.65812],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[169.06,-1295.32,1363.21],[0.287738,0.654766,0.285686,-0.637865],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[169.34,-1290.83,1214.62],[0.287722,0.654777,0.285705,-0.637852],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 1
		SetGO Go_prog_Pernos, 1;
		MoveL RelTool([[188.9535,-1272.222,1212.491],[0.405440181493759,0.0119414702057838,-0.00149482768028975,-0.914042353630066],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],3,-1.1,1), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[174.86,-1286.97,1214.71],[0.287727,0.654775,0.285723,-0.637844],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[117.21,-1244.89,1190.47],[0.287731,0.654774,0.2857,-0.637854],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[-27.39,-1087.72,1104.81],[0.287741,0.654771,0.28569,-0.637857],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 2
		SetGO Go_prog_Pernos, 2;
		MoveL RelTool([[606.4202,577.7348,-484.9338],[0.389494061470032,0.274516701698303,0.846500515937805,0.237427443265915],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],2.5,0,31), vmax, fine, t_tucker_Rosca\WObj:=wobj_manipulador1;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[-27.39,-1087.70,1104.77],[0.287728,0.65478,0.285698,-0.63785],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[-202.94,-950.30,1191.65],[0.287743,0.654769,0.285687,-0.63786],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[-243.47,-906.25,1208.41],[0.287745,0.654768,0.285678,-0.637864],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 3
		SetGO Go_prog_Pernos, 3;
		MoveL RelTool([[-212.6775,-876.6003,1211.014],[0.389685094356537,0.0122691383585334,-0.00130572402849793,-0.920865535736084],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],5,-1.2,-3.2), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[-225.47,-887.22,1209.92],[0.276469,0.659829,0.274627,-0.642473],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[-243.74,-905.03,1288.95],[0.287735,0.654772,0.285688,-0.63786],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[89.79,-783.90,1339.00],[0.168588,0.681061,0.0519737,-0.710656],[-2,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[617.82,-1661.28,1794.20],[0.601631,-0.449152,0.626237,0.210073],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[472.60,-1689.98,1281.15],[0.652168,-0.28181,0.650368,0.268854],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[469.80,-1698.16,1074.09],[0.652166,-0.281809,0.650369,0.268854],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[470.22,-1700.28,975.42],[0.652167,-0.281807,0.650368,0.268855],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 4
		SetGO Go_prog_Pernos, 4;
		MoveL RelTool([[477.4239,-1695.369,975.2551],[0.92103123664856,-0.00913159549236298,-0.00128119951114058,0.389379590749741],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,-0.1,0.1), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[416.50,-1642.19,974.24],[0.650483,-0.285478,0.648853,0.272699],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 5
		SetGO Go_prog_Pernos, 5;
		MoveL RelTool([[423.7353,-1635.692,973.1382],[0.918765008449554,-0.00902924500405788,-0.00115138315595686,0.39469987154007],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,2,0.6), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[418.73,-1639.83,974.25],[0.650483,-0.28548,0.648854,0.272693],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[345.67,-1518.45,968.48],[0.635618,-0.325126,0.62401,0.317638],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 6
		SetGO Go_prog_Pernos, 6;
		MoveL RelTool([[352.2307,-1515.633,970.2027],[0.890684127807617,-0.00528494408354163,-0.00820931419730186,0.454517811536789],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0.4,0.9), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[346.53,-1522.64,967.28],[0.635617,-0.325126,0.624007,0.317647],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[350.78,-1515.60,1284.37],[0.634836,-0.327564,0.622027,0.320574],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[1289.87,-1194.54,1412.19],[0.50255,-0.509087,0.500122,0.488009],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1536.67,-877.00,1396.62],[0.266442,-0.668654,0.280687,0.634921],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1735.17,-67.59,1476.12],[0.283865,-0.65471,0.27788,0.643084],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Reset Do_Start_salida_1;
		Reset do_def_perno;
		!
		b_libera_fresa:=TRUE;
		!
	ENDPROC
	PROC PERNOS_ROSCA_M1()
		!
        Seg_Fresado;
        !
		WaitDI di_Cabezal_Atras_1, 1;
		Reset do_def_perno;
		!
        MoveJ [[564.76,-689.28,1456.36],[0.304411,0.68446,0.0756709,-0.65812],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z80, Tcp_Garra;
		MoveJ [[169.06,-1295.32,1363.21],[0.287738,0.654766,0.285686,-0.637865],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z80, Tcp_Garra;
		MoveL [[169.34,-1303.40,1214.63],[0.287724,0.654776,0.285703,-0.637853],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		!MoveL [[169.34,-1290.83,1214.62],[0.287722,0.654777,0.285705,-0.637852],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 1
		SetGO Go_prog_Pernos, 1;
		MoveL RelTool([[171.8896,-1291.194,1218.776],[0.405448585748672,0.0119471326470375,-0.00147339550312608,-0.914038598537445],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		!MoveL [[174.86,-1286.97,1214.71],[0.287727,0.654775,0.285723,-0.637844],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[175.12,-1296.76,1215.94],[0.287723,0.654775,0.285727,-0.637845],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[112.24,-1242.56,1177.42],[0.287717,0.654778,0.285711,-0.637851],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveL [[-23.42,-1090.91,1088.36],[0.28769,0.65479,0.28571,-0.637852],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		!
		!Pos. perno peq 2
		SetGO Go_prog_Pernos, 2;
		MoveL RelTool([[625.2822,579.8434,-499.5084],[0.389501184225082,0.274526000022888,0.846500873565674,0.237403839826584],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, t_tucker_Rosca\WObj:=wobj_manipulador1;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[-23.42,-1090.91,1088.36],[0.28769,0.65479,0.28571,-0.637852],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[-202.94,-950.30,1191.65],[0.287743,0.654769,0.285687,-0.63786],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveL [[-244.82,-913.07,1208.42],[0.287749,0.654766,0.285679,-0.637863],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		!
		!Pos. perno peq 3
		SetGO Go_prog_Pernos, 3;
		MoveL RelTool([[-217.0257,-881.8192,1216.152],[0.389673918485641,0.0122811747714877,-0.00128265144303441,-0.920870125293732],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[-230.37,-893.77,1209.95],[0.276474,0.659824,0.274624,-0.642476],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[-252.53,-908.62,1288.96],[0.287735,0.65477,0.285683,-0.637863],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveJ [[89.79,-783.90,1339.00],[0.168588,0.681061,0.0519737,-0.710656],[-2,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveJ [[617.82,-1661.28,1794.20],[0.601631,-0.449152,0.626237,0.210073],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveL [[470.66,-1679.04,1281.14],[0.652166,-0.281809,0.650369,0.268855],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveL [[477.30,-1684.48,1074.10],[0.652167,-0.281809,0.650371,0.268847],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[462.59,-1705.75,975.43],[0.652169,-0.281807,0.650369,0.268852],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		!
		!Pos. perno peq 4
		SetGO Go_prog_Pernos, 4;
		MoveL RelTool([[476.0457,-1693.666,982.7706],[0.921030402183533,-0.00911400374025106,-0.00128338928334415,0.389382004737854],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
        MoveL [[473.28,-1699.01,975.25],[0.652174,-0.281789,0.650361,0.268877],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[416.50,-1642.19,974.24],[0.650483,-0.285478,0.648853,0.272699],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		!
		!Pos. perno peq 5
		SetGO Go_prog_Pernos, 5;
		MoveL RelTool([[424.7246,-1633.042,981.6294],[0.918756783008575,-0.00901340041309595,-0.00115571019705385,0.394719392061234],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[418.73,-1639.83,974.25],[0.650483,-0.28548,0.648854,0.272693],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[345.67,-1518.45,968.48],[0.635618,-0.325126,0.62401,0.317638],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		!
		!Pos. perno peq 6
		SetGO Go_prog_Pernos, 6;
		MoveL RelTool([[351.0705,-1514.083,976.4147],[0.890686869621277,-0.00528165465220809,-0.00821681134402752,0.454512357711792],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[352.42,-1522.65,967.31],[0.635615,-0.32513,0.624009,0.317643],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[372.88,-1517.43,1161.83],[0.635046,-0.32693,0.622535,0.31982],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[350.78,-1515.60,1284.37],[0.634836,-0.327564,0.622027,0.320574],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveJ [[1289.87,-1194.54,1412.19],[0.50255,-0.509087,0.500122,0.488009],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveL [[1536.67,-877.00,1396.62],[0.266442,-0.668654,0.280687,0.634921],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveL [[1735.17,-67.59,1476.12],[0.283865,-0.65471,0.27788,0.643084],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		!
		!Reset Do_Start_salida_1;
		Reset do_def_perno;
		!
		b_libera_fresa:=TRUE;
		!
	ENDPROC
	PROC PERNOS_ROSCA_M3()
		!
        Seg_Fresado;
        !
		WaitDI di_Cabezal_Atras_1, 1;
		Reset do_def_perno;
		!
        MoveJ [[564.76,-689.28,1456.36],[0.304411,0.68446,0.0756709,-0.65812],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[169.06,-1295.32,1363.21],[0.287738,0.654766,0.285686,-0.637865],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[160.91,-1301.41,1250.46],[0.287731,0.654771,0.285696,-0.637859],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[165.89,-1293.49,1214.62],[0.287724,0.654777,0.285704,-0.637852],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		!
		!Pos. perno peq 1
		SetGO Go_prog_Pernos, 1;
		MoveL RelTool([[179.9975,-1282.949,1218.031],[0.405433416366577,0.0119514102116227,-0.00142236158717424,-0.914045333862305],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[162.46,-1297.41,1212.90],[0.28773,0.654773,0.285721,-0.637846],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[107.66,-1244.88,1190.46],[0.287726,0.654774,0.285706,-0.637854],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[-26.22,-1091.28,1086.46],[0.287689,0.654789,0.28571,-0.637852],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 2
		SetGO Go_prog_Pernos, 2;
		MoveL RelTool([[623.741,581.7996,-500.7409],[0.389514893293381,0.274570882320404,0.846488654613495,0.23737296462059],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, t_tucker_Rosca\WObj:=wobj_manipulador1;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[-26.22,-1091.28,1086.46],[0.287689,0.654789,0.285711,-0.637852],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[-202.94,-950.30,1191.65],[0.287743,0.654769,0.285687,-0.63786],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[-248.18,-912.28,1208.42],[0.287745,0.654768,0.285672,-0.637866],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 3
		SetGO Go_prog_Pernos, 3;
		MoveL RelTool([[-216.8069,-881.8998,1215.984],[0.389678925275803,0.012287950143218,-0.00127474090550095,-0.920867919921875],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[-229.56,-892.99,1209.94],[0.276472,0.659825,0.274623,-0.642477],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[-249.00,-919.59,1288.95],[0.287734,0.654772,0.285687,-0.63786],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveJ [[89.79,-783.90,1339.00],[0.168588,0.681061,0.0519737,-0.710656],[-2,-1,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveJ [[617.82,-1661.28,1794.20],[0.601631,-0.449152,0.626237,0.210073],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[473.22,-1686.50,1281.17],[0.652164,-0.281819,0.650368,0.268852],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[485.05,-1687.60,1074.06],[0.652166,-0.281804,0.650371,0.268856],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[483.00,-1707.90,1033.29],[0.652166,-0.281803,0.650371,0.268857],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[460.59,-1700.21,975.42],[0.652169,-0.281807,0.650367,0.268854],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 4
		SetGO Go_prog_Pernos, 4;
		MoveL RelTool([[476.4772,-1697.283,982.9344],[0.92103111743927,-0.00911673810333014,-0.00129008723888546,0.389380156993866],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
        MoveL [[463.12,-1690.24,975.07],[0.651916,-0.282359,0.650129,0.269465],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[416.50,-1642.19,974.24],[0.650483,-0.285478,0.648853,0.272699],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 5
		SetGO Go_prog_Pernos, 5;
		MoveL RelTool([[423.3795,-1636.036,981.3914],[0.918766915798187,-0.00900011789053679,-0.0011699857423082,0.394696027040482],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[418.73,-1639.83,974.25],[0.650483,-0.28548,0.648854,0.272693],[-1,0,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[345.67,-1518.45,968.48],[0.635618,-0.325126,0.62401,0.317638],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 6
		SetGO Go_prog_Pernos, 6;
		MoveL RelTool([[350.7679,-1515.707,976.9504],[0.89068192243576,-0.00522020598873496,-0.0082294624298811,0.454522490501404],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[346.53,-1522.64,967.28],[0.635617,-0.325126,0.624007,0.317647],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[362.75,-1512.06,1135.56],[0.635204,-0.326422,0.622957,0.319201],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[353.06,-1513.65,1284.37],[0.634836,-0.327565,0.622026,0.320574],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveJ [[1289.87,-1194.54,1412.19],[0.50255,-0.509087,0.500122,0.488009],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1536.67,-877.00,1396.62],[0.266442,-0.668654,0.280687,0.634921],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1735.17,-67.59,1476.12],[0.283865,-0.65471,0.27788,0.643084],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Reset Do_Start_salida_1;
		Reset do_def_perno;
		!
		b_libera_fresa:=TRUE;
		!
	ENDPROC
    
	PROC PERNOS_ROSCA_370()
		!
        Seg_Fresado;
        !
		WaitDI di_Cabezal_Atras_1, 1;
		Reset do_def_perno;
		!
		MoveJ Enlace_Pinza_Pernos, vmax, fine, Tcp_Garra;
		!
        MoveJ [[524.04,-587.79,1529.28],[0.354258,0.679592,0.020067,-0.64207],[-1,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[152.76,-1310.22,1363.23],[0.287743,0.654764,0.28568,-0.637868],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[160.82,-1295.12,1213.65],[0.287701,0.654783,0.285725,-0.637847],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[172.81,-1289.58,1218.76],[0.287702,0.654781,0.285742,-0.637841],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 1
		SetGO Go_prog_Pernos, 1;
		MoveL RelTool([[172.7046,-1289.895,1220.281],[0.405106872320175,0.0291661061346531,0.00497390935197473,-0.913790464401245],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[168.99,-1294.76,1211.21],[0.287719,0.65478,0.285701,-0.637852],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[111.79,-1237.90,1194.29],[0.287726,0.654776,0.285705,-0.637852],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[-6.71,-1070.39,1120.33],[0.269705,0.662404,0.268141,-0.645431],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 2
		SetGO Go_prog_Pernos, 2;
		MoveL RelTool([[-3.238709,-1070.302,1123.678],[0.38265585899353,0.0120148649439216,-0.00109398784115911,-0.923812210559845],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[-6.73,-1073.32,1119.50],[0.269711,0.662402,0.268127,-0.645436],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[-202.94,-950.30,1191.65],[0.287743,0.654769,0.285687,-0.63786],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[-198.86,-868.70,1211.92],[0.255275,0.667265,0.256261,-0.651093],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno peq 3
		SetGO Go_prog_Pernos, 3;
		MoveL RelTool([[-181.4935,-851.4297,1219.388],[0.361668735742569,0.011506836861372,0.000856856291648,-0.932235240936279],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche;
		SOLDADURA_TUCKERS_M1;
        !
		MoveL [[-192.80,-863.98,1216.42],[0.255274,0.667266,0.256266,-0.651091],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[-251.13,-913.10,1288.98],[0.287745,0.654767,0.285682,-0.637863],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[725.31,-1258.14,1643.07],[0.24016,-0.685185,0.425647,0.540064],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		Reset do_def_perno;
		!
		b_libera_fresa:=TRUE;
		!
	ENDPROC
  
    PROC PERNOS_SETAS()
		!
		Reset do_def_perno;
		WaitDI di_Cabezal_Atras_2, 1;
		!
        MoveJ [[1735.17,-67.60,1476.15],[0.283865,-0.654716,0.277882,0.643078],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1870.32,378.46,1293.84],[0.173635,-0.700024,0.18303,0.66807],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1873.67,378.84,1106.73],[0.17186,-0.700608,0.181495,0.668335],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1904.35,303.14,1108.03],[0.194634,-0.694811,0.203707,0.661709],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[2036.69,86.21,1049.64],[0.294829,-0.658621,0.299255,0.624292],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[2092.67,-12.46,1017.22],[0.346025,-0.633216,0.347919,0.598546],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno grande 1
		SetGO Go_prog_Pernos, 20;
		MoveL RelTool([[2092.875,-2.309774,1021.844],[0.49069145321846,-0.0245276596397161,0.00133170722983778,0.870987117290497],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,-0.2,-4.5), vmax, fine, Tcp_Coche\WObj:=wobj0;
		SOLDADURA_TUCKERS_M2;
        !
		MoveL [[2095.55,-17.18,1017.49],[0.346034,-0.633215,0.347918,0.598542],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1921.53,289.78,1103.62],[0.206214,-0.691593,0.214679,0.658095],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1864.89,382.29,1125.16],[0.168152,-0.701816,0.178284,0.668875],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1856.56,387.42,1326.10],[0.168157,-0.701823,0.178274,0.668869],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1864.88,21.05,1308.50],[0.260865,-0.673168,0.267076,0.63833],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1724.71,-123.21,1077.22],[0.254919,-0.673427,0.268553,0.639838],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno grande 2
		SetGO Go_prog_Pernos, 21;
		MoveL RelTool([[1720.318,-120.9785,1076.675],[0.370150089263916,-0.0237506441771984,0.00964116957038641,0.928618252277374],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,-0.1,-1.3), vmax, fine, Tcp_Coche\WObj:=wobj0;
		SOLDADURA_TUCKERS_M2;
        !
		MoveL [[1724.74,-123.23,1077.27],[0.254924,-0.673433,0.268554,0.639829],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1602.32,-267.99,1079.95],[0.268503,-0.671238,0.276541,0.633144],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1534.97,-313.89,1043.12],[0.224531,-0.686453,0.236557,0.64993],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1453.05,-374.27,996.33],[0.163925,-0.698372,0.176798,0.673905],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno grande 3
		SetGO Go_prog_Pernos, 22;
		MoveL RelTool([[595.1597,338.4201,-815.1718],[0.207926869392395,-0.859488606452942,0.223254635930061,-0.41012579202652],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0.8,-0.8), vmax, fine, t_tucker_Setas\WObj:=wobj_manipulador1;
		SOLDADURA_TUCKERS_M2;
        !
		MoveL [[1454.07,-383.57,997.57],[0.204844,-0.68622,0.219164,0.662652],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1528.68,-314.83,1040.59],[0.220212,-0.685921,0.230542,0.654117],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1602.32,-267.99,1079.95],[0.268503,-0.671238,0.276541,0.633144],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1589.56,-258.29,1300.50],[0.268507,-0.671242,0.276543,0.633137],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[1617.27,-51.33,1537.14],[0.273281,-0.708029,0.270804,0.59218],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[2176.66,293.36,1739.37],[0.928851,-0.00130899,0.0145678,0.370165],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		Reset do_def_perno;
		!
		b_libera_fresa := TRUE;
		  
	ENDPROC
	PROC PERNOS_SETAS_M3()
		!
		Reset do_def_perno;
		WaitDI di_Cabezal_Atras_2, 1;
		!
        MoveJ [[1735.17,-67.60,1476.15],[0.283865,-0.654716,0.277882,0.643078],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveL [[1953.31,318.70,1299.74],[0.214576,-0.689311,0.219276,0.656297],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveL [[1879.61,380.84,1108.39],[0.180506,-0.697119,0.178285,0.670565],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1904.35,303.14,1108.03],[0.194634,-0.694811,0.203707,0.661709],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[2036.69,86.21,1049.64],[0.294829,-0.658621,0.299255,0.624292],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[2092.67,-12.46,1017.22],[0.346025,-0.633216,0.347919,0.598546],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno grande 1
		SetGO Go_prog_Pernos, 20;
		MoveL RelTool([[2096.432,-19.88448,1032.073],[0.494315415620804,-0.043987050652504,0.00825603771954775,0.868129730224609],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche\WObj:=wobj0;
		SOLDADURA_TUCKERS_M2;
        !
		MoveL [[2095.55,-17.18,1017.49],[0.346034,-0.633215,0.347918,0.598542],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1921.53,289.78,1103.62],[0.206214,-0.691593,0.214679,0.658095],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1869.23,386.63,1127.24],[0.168158,-0.701819,0.178283,0.668871],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1856.56,387.42,1326.10],[0.168157,-0.701823,0.178274,0.668869],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1864.88,21.05,1308.50],[0.260865,-0.673168,0.267076,0.63833],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		!MoveL [[1722.64,-122.48,1077.21],[0.25492,-0.673426,0.268554,0.639837],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v600, z1, Tcp_Garra;
		!
		!Pos. perno grande 2
		!SetGO Go_prog_Pernos, 21;
		!MoveL RelTool([[1719.277,-123.4575,1074.289],[0.370150297880173,-0.0237258039414883,0.00964375585317612,0.928618788719177],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,-2,1.3), v600, fine, Tcp_Coche\WObj:=wobj0;
		!SOLDADURA_TUCKERS_M2;
        !
		!MoveL [[1724.74,-123.23,1077.27],[0.254924,-0.673433,0.268554,0.639829],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v600, z10, Tcp_Garra;
		MoveL [[1602.32,-267.99,1079.95],[0.268503,-0.671238,0.276541,0.633144],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1529.69,-309.22,1042.99],[0.224526,-0.686458,0.236555,0.649927],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1453.05,-374.27,996.33],[0.163925,-0.698372,0.176798,0.673905],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno grande 3
		SetGO Go_prog_Pernos, 22;
		MoveL RelTool([[597.1202,323.4434,-807.8406],[0.207953482866287,-0.8595010638237,0.223255455493927,-0.410085737705231],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, t_tucker_Setas\WObj:=wobj_manipulador1;
		SOLDADURA_TUCKERS_M2;
        !
		MoveL [[1454.07,-383.57,997.57],[0.204844,-0.68622,0.219164,0.662652],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1523.99,-309.95,1040.43],[0.220211,-0.685923,0.230545,0.654114],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1602.32,-267.99,1079.95],[0.268503,-0.671238,0.276541,0.633144],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1588.34,-253.10,1203.00],[0.268504,-0.67124,0.276541,0.633141],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1589.56,-258.29,1300.50],[0.268507,-0.671242,0.276543,0.633137],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[1617.27,-51.33,1537.14],[0.273281,-0.708029,0.270804,0.59218],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[2176.66,293.36,1739.37],[0.928851,-0.00130899,0.0145678,0.370165],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		Reset do_def_perno;
		!
		b_libera_fresa := TRUE;
	ENDPROC
	PROC PERNOS_SETAS_M1()
		!
		Reset do_def_perno;
		WaitDI di_Cabezal_Atras_2, 1;
		!
        MoveJ [[1735.17,-67.60,1476.15],[0.283865,-0.654716,0.277882,0.643078],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveL [[1870.32,378.46,1293.84],[0.173635,-0.700024,0.18303,0.66807],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveL [[1873.14,381.17,1166.13],[0.172415,-0.700428,0.181975,0.66825],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1872.03,382.86,1106.73],[0.171853,-0.70061,0.181492,0.668336],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1904.35,303.14,1108.03],[0.194634,-0.694811,0.203707,0.661709],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[2036.69,86.21,1049.64],[0.294829,-0.658621,0.299255,0.624292],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[2092.67,-12.46,1017.22],[0.346025,-0.633216,0.347919,0.598546],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno grande 1
		SetGO Go_prog_Pernos, 20;
		MoveL RelTool([[2088.409,-11.5139,1024.592],[0.490694522857666,-0.024512255564332,0.00133824441581964,0.870985805988312],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, Tcp_Coche\WObj:=wobj0;
		SOLDADURA_TUCKERS_M2;
        !
		MoveL [[2095.55,-17.18,1017.49],[0.346034,-0.633215,0.347918,0.598542],[0,-1,3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1921.53,289.78,1103.62],[0.206214,-0.691593,0.214679,0.658095],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1866.10,383.37,1125.53],[0.168154,-0.701817,0.178286,0.668873],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1856.56,387.42,1326.10],[0.168157,-0.701823,0.178274,0.668869],[0,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1864.88,21.05,1308.50],[0.260865,-0.673168,0.267076,0.63833],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!MoveL [[1724.71,-123.21,1077.22],[0.254919,-0.673427,0.268553,0.639838],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno grande 2
		!SetGO Go_prog_Pernos, 21;
		!MoveL RelTool([[1720.318,-120.9785,1076.675],[0.370150089263916,-0.0237506441771984,0.00964116957038641,0.928618252277374],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0.7,-1.8), vmax, fine, Tcp_Coche\WObj:=wobj0;
		!SOLDADURA_TUCKERS_M2;
        !
		!MoveL [[1724.74,-123.23,1077.27],[0.254924,-0.673433,0.268554,0.639829],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1591.10,-262.14,1079.89],[0.268497,-0.671232,0.276545,0.633151],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1529.05,-306.63,1043.00],[0.224531,-0.686439,0.236555,0.649945],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1453.05,-374.27,996.33],[0.163925,-0.698372,0.176798,0.673905],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno grande 3
		SetGO Go_prog_Pernos, 22;
		MoveL RelTool([[593.3856,326.1837,-812.0073],[0.207957297563553,-0.859510898590088,0.223219767212868,-0.41008248925209],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],3,0,0), vmax, fine, t_tucker_Setas\WObj:=wobj_manipulador1;
		SOLDADURA_TUCKERS_M2;
        !
		MoveL [[1454.07,-383.57,997.57],[0.204844,-0.68622,0.219164,0.662652],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1528.68,-306.62,1040.56],[0.220211,-0.685916,0.23054,0.654123],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1602.29,-254.26,1079.92],[0.2685,-0.671237,0.276541,0.633146],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveL [[1589.54,-250.30,1300.51],[0.268506,-0.671247,0.276543,0.633131],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z20, Tcp_Garra;
		MoveJ [[1617.27,-51.33,1537.14],[0.273281,-0.708029,0.270804,0.59218],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		MoveJ [[2176.66,293.36,1739.37],[0.928851,-0.00130899,0.0145678,0.370165],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z50, Tcp_Garra;
		!
		Reset do_def_perno;
		!
		b_libera_fresa := TRUE;
	ENDPROC
  
    PROC PERNOS_SETAS_370()
		!
		WaitDI di_Cabezal_Atras, 1;
		!
		MoveJ [[725.31,-1258.14,1643.07],[0.24016,-0.685185,0.425648,0.540063],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[1833.50,77.23,1521.51],[0.198161,-0.713854,0.196452,0.642301],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[2507.45,39.68,1485.91],[0.28721,-0.663229,0.272127,0.635284],[0,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno grande 1
		SetDO do_Prog0_Pernos, 1;
		SetDO do_Prog1_Pernos, 0;
		!MoveL [[2530.97,-0.55,1483.95],[0.2872,-0.663183,0.272094,0.63535],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, t_tucker_Setas_370;
		MoveL RelTool([[2574.196,-53.95472,1480.817],[0.316813975572586,-0.63384610414505,0.293202936649323,0.641794383525848],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, t_tucker_Setas_370\WObj:=wobj0;
		Soldadura_Tucker370;
        !
		MoveL [[2510.94,31.68,1486.04],[0.287218,-0.663246,0.272117,0.635266],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[2339.84,-26.67,1511.39],[0.279755,-0.659128,0.258236,0.648538],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[2172.77,-175.30,1525.51],[0.223001,-0.690244,0.21189,0.654932],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno grande 2
		SetDO do_Prog0_Pernos, 0;
		SetDO do_Prog1_Pernos, 1;
		!MoveL [[2216.02,-208.72,1547.74],[0.222997,-0.690175,0.211876,0.655011],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, t_tucker_Setas_370;
		MoveL RelTool([[2213.3,-208.356,1609.398],[0.269646406173706,-0.703696727752686,0.161557167768478,0.637182116508484],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, t_tucker_Setas_370\WObj:=wobj0;
		Soldadura_Tucker370;
        !
		MoveL [[2176.78,-178.97,1546.40],[0.223001,-0.690245,0.21189,0.654932],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[2010.88,-311.93,1454.91],[0.222819,-0.677637,0.19926,0.671904],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveL [[1921.09,-458.70,1451.81],[0.135817,-0.697443,0.118049,0.69368],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		!Pos. perno grande 3
		SetDO do_Prog0_Pernos, 1;
		SetDO do_Prog1_Pernos, 1;
		!MoveL [[1973.48,-488.36,1456.05],[0.135876,-0.697345,0.118024,0.693771],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, t_tucker_Setas_370;
		MoveL RelTool([[1971.59,-492.3406,1458.067],[0.135882720351219,-0.69734513759613,0.118019424378872,0.693770170211792],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],0,0,0), vmax, fine, t_tucker_Setas_370\WObj:=wobj0;
		Soldadura_Tucker370;
        !
		MoveL [[1921.09,-458.72,1451.81],[0.135819,-0.697442,0.118051,0.69368],[-1,0,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[1730.16,104.53,1521.50],[0.198162,-0.713852,0.196454,0.642303],[-1,-1,2,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		MoveJ [[1554.30,-512.18,1902.59],[0.937536,-0.046074,-0.0252665,-0.343898],[0,-4,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z10, Tcp_Garra;
		!
		b_libera_fresa := TRUE;
		!
	ENDPROC
	
	PROC Comprobacion_Pernos()
        VAR num reg1;
        !
		MoveJ [[1554.31,-512.18,1902.56],[0.937536,-0.0460763,-0.0252571,-0.343896],[0,-4,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, Tcp_Garra;
		MoveL [[1868.89,-1012.62,1744.41],[0.922385,0.00574495,0.0175047,-0.385833],[-1,-4,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
		!
        ReintentoComprobación1:
        MoveL [[2024.01,-1103.12,1696.47],[0.94414,0.00206806,0.0188925,-0.328995],[-1,-4,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, fine, Tcp_Garra;
		!
		!Posicion comprobacion Inferior
		MoveL p_comp_pernos1, v150, fine, Tcp_Garra;
		WaitTime 3;
        !
        IF di_Comprobacion2_OK = 1 AND b_Dummie = FALSE THEN
            !
            TPErase;
            TPWrite" Presencia Pernos Inferior OK  ";
            WaitTime 1;
            !
        ELSEIF (di_Pieza_Dummie=0 AND b_Dummie = TRUE) OR (di_Comprobacion2_OK = 1 AND b_Dummie = TRUE) THEN
            !
            !Fallo pieza Dummie detectando
            WHILE di_Pieza_Dummie=0 DO
                !
                TPErase;
                TpWrite "Seleccionada pieza Dummie y hay algun detector activo";
                Waittime 1;
                !
                nDefecto_Pernos_Fase1:=1;
                !
            ENDWHILE
            !
        ELSEIF di_Comprobacion2_OK = 0 AND b_Dummie=FALSE THEN
            !
            TPErase;
            TPWrite" Espera Presencia Pernos Inferior OK  ";
            TPWrite"                                      ";
            WaitTime 1;
            !
            reg1:=0;
            TPReadFK reg1, "Reintentar o Continuar ?", stEmpty, stEmpty, stEmpty, "Reintentar", "Continuar";
            !
            TEST reg1
            CASE 4:
            !
            !Reeintentar Comprobación
            GOTO ReintentoComprobación1;
            !
            CASE 5:
            !
            TPErase;
            TPWrite" Pieza NO OK ";
            WaitTime 1;
            nDefecto_Pernos_Fase1:=1;
            !
            DEFAULT:
            stop;
            stop;
            stop;           
            ENDTEST
            !
        ENDIF
        !
        ReintentoComprobación2:
		MoveL [[2022.33,-1096.95,1696.57],[0.94414,0.00206584,0.0189064,-0.328995],[-1,-4,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z10, Tcp_Garra;
		!
		!Posicion comprobacion arriba
		MoveL p_comp_pernos2, v150, fine, Tcp_Garra;
		WaitTime 3;
		!
        IF di_Comprobacion1_OK = 1 AND b_Dummie = FALSE THEN
            !
            TPErase;
            TPWrite" Presencia Pernos Superior OK  ";
            WaitTime 1;
            !
        ELSEIF (di_Pieza_Dummie=0 AND b_Dummie = TRUE) OR (di_Comprobacion1_OK = 1 AND b_Dummie = TRUE) THEN
            !
            !Fallo pieza Dummie detectando
            WHILE di_Pieza_Dummie=0 DO
                !
                TPErase;
                TpWrite "Seleccionada pieza Dummie y hay algun detector activo";
                Waittime 1;
                !
                nDefecto_Pernos_Fase2:=1;
                !
            ENDWHILE
            !
        
        ELSEIF di_Comprobacion1_OK = 0 AND b_Dummie=FALSE THEN
            !
            TPErase;
            TPWrite" Espera Presencia Pernos Superior OK  ";
            TPWrite"                                      ";
            WaitTime 1;
            !
            reg1:=0;
            TPReadFK reg1, "Reintentar o Continuar ?", stEmpty, stEmpty, stEmpty, "Reintentar", "Continuar";
            !
            TEST reg1
            CASE 4:
            !
            !Reeintentar Comprobación
            GOTO ReintentoComprobación2;
            !
            CASE 5:
            !
            TPErase;
            TPWrite" Pieza NO OK ";
            WaitTime 1;
            nDefecto_Pernos_Fase2:=1;
            !
            DEFAULT:
            stop;
            stop;
            stop;           
            ENDTEST
            !
        ENDIF
		!
		MoveL [[2022.36,-1096.94,1721.22],[0.944143,0.00207062,0.0188886,-0.328989],[-1,-4,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z50, Tcp_Garra;
		MoveL [[1868.89,-1012.62,1744.41],[0.922385,0.00574495,0.0175047,-0.385833],[-1,-4,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
		MoveL [[1554.31,-512.18,1902.56],[0.937536,-0.0460763,-0.0252571,-0.343896],[0,-4,3,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, Tcp_Garra;
		!
		MoveJ Enlace_Soldar_Descarga,vmax,fine,Tcp_Garra;
		!
	ENDPROC
	PROC Descarte_pieza()
        !
        TPErase;
        TPWrite "Descartando Pieza";
        !
        WHILE nContador_Piezas_NOK >=3 DO
            TPErase;
            TPWrite "El contenedor de piezas NOK está lleno";
            WaitTime 1;
        ENDWHILE
        !
        Seg_Fresado;
        WHILE di_Abat_Retrocedido=0 DO
            TPErase;
            TPWrite"   Esperando abatible fresadora retrocedido ";
            WaitTime 1;
        ENDWHILE
        !
        !		
        MoveJ [[2176.66,293.36,1739.37],[0.928851,-0.00130899,0.0145678,0.370165],[0,-2,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z10, Tcp_Garra;
        MoveJ [[905.21,-1598.25,2891.26],[0.706137,-0.240981,-0.593916,-0.300935],[-1,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
        MoveJ [[-1194.35,-1783.60,2040.10],[0.285467,-0.0352779,-0.123043,-0.949802],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
        MoveJ [[-1543.23,-861.43,1966.28],[0.0822752,-0.0218633,0.0128589,0.996287],[-2,1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
        MoveL [[-1414.27,-790.57,495.53],[0.192293,-0.023151,0.0103558,0.98101],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, fine, Tcp_Garra;
        !
        ABRIR_GARRA_COMPLETA;
        !
        WHILE di_presencia_1=1 OR di_presencia_2=1 DO
            TPErase;
            TPWrite "Pieza en Garra";
            WaitTime 1;
        ENDWHILE
        !
        Incr nContador_Piezas_NOK;
        !
        MoveL [[-1543.23,-861.43,1966.28],[0.0822762,-0.0218627,0.0128623,0.996287],[-2,1,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, Tcp_Garra;
        MoveJ [[-1066.91,-1163.96,2909.80],[0.272915,-0.159973,-0.355188,-0.87964],[-2,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
        !
        b_libera_fresa := FALSE;
        !
        ! Movimientos a Home
        MoveJ [[1473.98,-864.86,2830.50],[0.85957,0.155646,-0.320589,-0.366247],[-1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
        !
        ! Posisción reposo 
        MoveAbsJ home_pos_rob,v3000,z10,Tcp_Garra;
        !
        
	ENDPROC
	PROC DEJAR_POCAYOKE()
		!
		!Enlace rutinas
		MoveJ Enlace_Soldar_Descarga,vmax,fine,Tcp_Garra;
		!
		!Esperamos permiso Pocayoke
		WaitDI di_Permiso_Pocayoke, 1;
		!
		!Ocupamos Pocayoke
		SetDO do_Pocayoke_Free, 0;
		!
		!Movimientos a Pocayoke
		MoveL [[2601.50,735.16,1291.97],[0.922138,-0.00138257,-0.00255723,0.38685],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
		MoveL [[2744.80,901.30,1291.98],[0.922138,-0.00138226,-0.00255974,0.386849],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z20, Tcp_Garra;
		MoveL [[2804.33,966.09,1291.97],[0.92214,-0.00137904,-0.00255792,0.386846],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z20, Tcp_Garra;
		MoveL [[2804.34,966.09,1332.88],[0.92214,-0.00137765,-0.00256693,0.386845],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z5, Tcp_Garra;
		!
		!Posicion Pocayoke
		MoveL Dejada_Pocayoke, v200, fine, Tcp_Garra;
		!
		!Cerrar Pocayoke
		Set do_Cerrar_Pocayoke;
		WaitDI di_Pocayoke_Cerrado, 1;
		Reset do_Cerrar_Pocayoke;
		!
		IF di_PiezaOK_Pocayoke = 1 THEN
			!
			!Abrir Garra
			ABRIR_GARRA_COMPLETA;
			!
			!Movimientos de salida de Pocayoke
			MoveL [[2819.94,977.86,1402.14],[0.923274,0.000487973,-0.00358405,0.384126],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z20, Tcp_Garra;
			!
			WaitDI di_presencia_1, 0;
			WaitDI di_presencia_2, 0;
			!
			MoveL [[2819.94,977.87,1501.84],[0.923274,0.000487939,-0.00358642,0.384126],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z20, Tcp_Garra;
			MoveL [[2675.63,866.46,1593.00],[0.923274,0.00048699,-0.00358798,0.384126],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z20, Tcp_Garra;
			MoveL [[2478.76,680.45,1593.00],[0.923273,0.00048509,-0.00358855,0.384127],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
			MoveJ Enlace_Soldar_Descarga,vmax,fine,Tcp_Garra;
			!
			!Liberamos Pocayoke
			SetDO do_Pocayoke_Free, 1;
			!
			MoveJ [[1383.33,-172.88,3555.18],[0.858229,0.194006,-0.46037,0.117744],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
			!
		ELSEIF di_PiezaNOK_Pocayoke = 1 THEN
			!
			!Esperamos Pocayoke abierto
			WaitDI di_Pocayoke_Cerrado, 1;
			!
			!Movimientos de salida de Pocayoke
			MoveL [[2804.34,966.09,1332.88],[0.92214,-0.00137765,-0.00256693,0.386845],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z20, Tcp_Garra;
			MoveL [[2804.33,966.09,1291.97],[0.92214,-0.00137904,-0.00255792,0.386846],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z20, Tcp_Garra;
			MoveL [[2744.80,901.30,1291.98],[0.922138,-0.00138226,-0.00255974,0.386849],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z20, Tcp_Garra;
			MoveL [[2601.50,735.16,1291.97],[0.922138,-0.00138257,-0.00255723,0.38685],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
			MoveL Enlace_Soldar_Descarga,vmax,fine,Tcp_Garra;
			!
			!Liberamos Pocayoke
			SetDO do_Pocayoke_Free, 1;
			!
			!Pieza a Rechazo
			Descarte_pieza;
			!
		ENDIF
		!
		! Posisción reposo 
		MoveAbsJ home_pos_rob,v3000,z10,Tcp_Garra;
		!
	ENDPROC
    
    PROC DEJAR_DUMMIE380()
		!
        !DEJADA DE PIEZA DUMMIE EN POKAYOKE 380
        !
		!Enlace rutinas
		MoveJ Enlace_Soldar_Descarga,vmax,fine,Tcp_Garra;
		!
		!Esperamos permiso Pocayoke
		WaitDI di_Permiso_Pocayoke, 1;
		!
		!Ocupamos Pocayoke
		SetDO do_Pocayoke_Free, 0;
		!
		!Movimientos a Pocayoke
		MoveL [[2601.50,735.16,1291.97],[0.922138,-0.00138257,-0.00255723,0.38685],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
		MoveL [[2744.80,901.30,1291.98],[0.922138,-0.00138226,-0.00255974,0.386849],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z20, Tcp_Garra;
		MoveL [[2804.33,966.09,1291.97],[0.92214,-0.00137904,-0.00255792,0.386846],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z20, Tcp_Garra;
		MoveL [[2804.34,966.09,1332.88],[0.92214,-0.00137765,-0.00256693,0.386845],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z5, Tcp_Garra;
		!
		!Posicion Pocayoke
		MoveL Dejada_Pocayoke, v200, fine, Tcp_Garra;
		!
		!Cerrar Pocayoke
		Set do_Cerrar_Pocayoke;
		WaitDI di_Pocayoke_Cerrado, 1;
		Reset do_Cerrar_Pocayoke;
        !
        !Esperamos Pieza Dummie
        WaitDI di_Pieza_Dummie, 1;
        !
		!Esperamos Pocayoke abierto
		WaitDI di_Pocayoke_Cerrado, 1;
		!
		!Movimientos de salida de Pocayoke
		MoveL [[2804.34,966.09,1332.88],[0.92214,-0.00137765,-0.00256693,0.386845],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z5, Tcp_Garra;
		MoveL [[2804.33,966.09,1291.97],[0.92214,-0.00137904,-0.00255792,0.386846],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z10, Tcp_Garra;
		MoveL [[2744.80,901.30,1291.98],[0.922138,-0.00138226,-0.00255974,0.386849],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z20, Tcp_Garra;
		MoveL [[2601.50,735.16,1291.97],[0.922138,-0.00138257,-0.00255723,0.38685],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
		MoveL Enlace_Soldar_Descarga,vmax,fine,Tcp_Garra;
		!
		!Liberamos Pocayoke
		SetDO do_Pocayoke_Free, 1;
		!
		!Pieza a Rechazo
		Descarte_pieza;
		!		
		! Posisción reposo 
		MoveAbsJ home_pos_rob,v3000,z10,Tcp_Garra;
		!
	ENDPROC
    
	PROC DEJAR_POCAYOKE_370()
		!
		!Enlace rutinas
		MoveJ Enlace_Soldar_Descarga,vmax,fine,Tcp_Garra;
		!
		IF nDefecto_Pernos_Fase1 = 1 OR nDefecto_Pernos_Fase2 = 1 THEN
			!Pieza a Rechazo
			Descarte_pieza;
			!
		ELSE
		!
		!Esperamos permiso Pocayoke
		WaitDI di_Permiso_Pocayoke, 1;
		!
		!Ocupamos Pocayoke
		SetDO do_Pocayoke_Free, 0;
		!
		!Movimientos a Pocayoke
		MoveL [[2601.50,735.16,1291.97],[0.922138,-0.00138257,-0.00255723,0.38685],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
		MoveL [[2744.80,901.30,1291.98],[0.922138,-0.00138226,-0.00255974,0.386849],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z20, Tcp_Garra;
		MoveL [[2804.33,966.09,1291.97],[0.92214,-0.00137904,-0.00255792,0.386846],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z20, Tcp_Garra;
		MoveL [[2804.34,966.09,1332.88],[0.92214,-0.00137765,-0.00256693,0.386845],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z5, Tcp_Garra;
		!
		!Posicion Pocayoke
		MoveL Dejada_Pocayoke370, v200, fine, Tcp_Garra;
		!
		!Cerrar Pocayoke
		Set do_Cerrar_Pocayoke;
		WaitDI di_Pocayoke_Cerrado, 1;
		Reset do_Cerrar_Pocayoke;
		!
			!Abrir Garra
			RETROCEDER_CENTRADORES_GARRA;
			ABRIR_BRIDAS_GARRA_B;
			ABRIR_BRIDAS_GARRA_C;
			!
			!Movimientos de salida de Pocayoke
			MoveL [[2819.94,977.86,1402.14],[0.923274,0.000487973,-0.00358405,0.384126],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z20, Tcp_Garra;
			!
			WaitDI di_presencia_1, 0;
			WaitDI di_presencia_2, 0;
			!
			MoveL [[2819.94,977.87,1501.84],[0.923274,0.000487939,-0.00358642,0.384126],[0,-1,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z20, Tcp_Garra;
			MoveL [[2675.63,866.46,1593.00],[0.923274,0.00048699,-0.00358798,0.384126],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z20, Tcp_Garra;
			MoveL [[2478.76,680.45,1593.00],[0.923273,0.00048509,-0.00358855,0.384127],[0,-1,1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z50, Tcp_Garra;
			MoveJ Enlace_Soldar_Descarga,vmax,fine,Tcp_Garra;
			!
			!Liberamos Pocayoke
			SetDO do_Pocayoke_Free, 1;
			!
			MoveJ [[1383.33,-172.88,3555.18],[0.858229,0.194006,-0.46037,0.117744],[0,0,0,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra;
		ENDIF
		!
		nDefecto_Pernos_Fase1 := 0;
		nDefecto_Pernos_Fase2 := 0;
		!
		! Posisción reposo 
		MoveAbsJ home_pos_rob,v3000,z10,Tcp_Garra;
		!
	ENDPROC
  
    PROC ABRIR_GARRA_COMPLETA()
    !
    !Retrocede centradores
    Reset do_Avanzar_Centradores;
    Set do_Retroceder_Centradores;
    !
    !Abrir todas las bridas B
    Reset do_Cerrar_Brida_B;
    Set do_Abrir_brida_B;
    !
    !Abrir todas las bridas C
    Reset do_Cerrar_Brida_C;
    Set do_Abrir_brida_C;
    !
    !Esperando todos los centradores retrocedidos
    WaitDI di_Centrador_1_Retrocedido,1\MaxTime:=2\timeflag:=b_fallo_centrador1;
    WaitDI di_Centrador_2_Retrocedido,1\MaxTime:=2\timeflag:=b_fallo_centrador2;
    !
    !Esperando todas las bridas C abiertas
    WaitDI di_Brida_C1_Abierta,1\MaxTime:=2\timeflag:=b_fallo_Brida_C1;
    WaitDI di_Brida_C2_Abierta,1\MaxTime:=2\timeflag:=b_fallo_Brida_C2;
    WaitDI di_Brida_C3_Abierta,1\MaxTime:=2\timeflag:=b_fallo_Brida_C3;
    WaitDI di_Brida_C4_Abierta,1\MaxTime:=2\timeflag:=b_fallo_Brida_C4;
    !
    !Esperando todas las bridas B abiertas
    WaitDI di_Brida_B1_Abierta, 1\MaxTime:=2\TimeFlag:=b_fallo_Brida_B1;
    WaitDI di_Brida_B2_Abierta, 1\MaxTime:=2\TimeFlag:=b_fallo_Brida_B2;
    !
    !Fallo centradores
    WHILE b_fallo_centrador1=TRUE DO
        TPWrite"      Esperando centrador 1 Retrocedido      ";
        WaitUntil di_Centrador_1_Avanzado=0 AND di_Centrador_1_Retrocedido=1;
        b_fallo_centrador1:=FALSE;
    ENDWHILE
    TPErase;    
     WHILE b_fallo_centrador2=TRUE DO
        TPWrite"      Esperando centrador 2 Retrocedido      ";
        WaitUntil di_Centrador_2_Avanzado=0 AND di_Centrador_2_Retrocedido=1;
        b_fallo_centrador2:=FALSE;
    ENDWHILE
    TPErase;    
    !
    !Fallo Bridas B
    WHILE b_fallo_Brida_B1=TRUE DO
        TPWrite"      Esperando brida B1 Abierta     ";
        WaitUntil di_Brida_B1_Abierta=1 AND di_Brida_B1_Cerrada=0;
        b_fallo_Brida_B1:=FALSE;
    ENDWHILE
    TPErase;
    WHILE b_fallo_Brida_B2=TRUE DO
        TPWrite"      Esperando brida B2 Abierta     ";
        WaitUntil di_Brida_B2_Abierta = 1 AND di_Brida_B2_Cerrada = 0;
        b_fallo_Brida_B2:=FALSE;
    ENDWHILE    
    TPErase;   
    !
    !Fallo Bridas C    
    WHILE b_fallo_Brida_C1=TRUE DO
        TPWrite"      Esperando brida C1 Abierta     ";
        WaitUntil di_Brida_C1_Abierta=1 AND di_Brida_C1_Cerrada=0;
        b_fallo_Brida_C1:=FALSE;
    ENDWHILE
    TPErase;    
    WHILE b_fallo_Brida_C2=TRUE DO
        TPWrite"      Esperando brida C2 Abierta     ";
        WaitUntil di_Brida_C2_Abierta=1 AND di_Brida_C2_Cerrada=0;
        b_fallo_Brida_C2:=FALSE;
    ENDWHILE
    TPErase;    
    WHILE b_fallo_Brida_C3=TRUE DO
        TPWrite"      Esperando brida C3 Abierta     ";
        WaitUntil di_Brida_C3_Abierta=1 AND di_Brida_C3_Cerrada=0;
        b_fallo_Brida_C3:=FALSE;
    ENDWHILE
    TPErase;    
    WHILE b_fallo_Brida_C4=TRUE DO
        TPWrite"      Esperando brida C4 Abierta     ";
        WaitUntil di_Brida_C4_Abierta=1 AND di_Brida_C4_Cerrada=0;
        b_fallo_Brida_C4:=FALSE;
    ENDWHILE
    TPErase;    
    !
ENDPROC

PROC CERRAR_GARRA_COMPLETA ()
    !
    !Avanzar Centradores
    Reset do_Retroceder_Centradores;
    Set do_Avanzar_Centradores;
    !
    !Cerrar todas las bridas B
    Reset do_Abrir_brida_B;
    Set do_Cerrar_Brida_B;
    !
    !Cerrar todas las bridas C
    Reset do_Abrir_brida_C;
    Set do_Cerrar_Brida_C;
    !
    !Esperando todos los centradores avanzados
    WaitDI di_Centrador_1_Avanzado,1\MaxTime:=2\timeflag:=b_fallo_centrador1;
    WaitDI di_Centrador_2_Avanzado,1\MaxTime:=2\timeflag:=b_fallo_centrador2;
    !
    !Esperando todas las bridas B cerradas
    WaitDI di_Brida_B1_Cerrada, 1\MaxTime:=2\TimeFlag:=b_fallo_Brida_B1;
    WaitDI di_Brida_B2_Cerrada, 1\MaxTime:=2\TimeFlag:=b_fallo_Brida_B2;
    !
    !Esperando todas las bridas C cerrades
    WaitDI di_Brida_C1_Cerrada, 1\MaxTime:=2\timeflag:=b_fallo_Brida_C1;
    WaitDI di_Brida_C2_Cerrada, 1\MaxTime:=2\timeflag:=b_fallo_Brida_C2;
    WaitDI di_Brida_C3_Cerrada, 1\MaxTime:=2\timeflag:=b_fallo_Brida_C3;
    WaitDI di_Brida_C4_Cerrada, 1\MaxTime:=2\timeflag:=b_fallo_Brida_C4;
    !
    !Fallo Centradores
    WHILE b_fallo_centrador1=TRUE DO
        TPWrite"      Esperando centrador 1 Avanzado      ";
        WaitUntil di_Centrador_1_Avanzado=1 AND di_Centrador_1_Retrocedido=0;
        b_fallo_centrador1:=FALSE;
    ENDWHILE
    TPErase;    
     WHILE b_fallo_centrador2=TRUE DO
        TPWrite"      Esperando centrador 2 Avanzado      ";
        WaitUntil di_Centrador_2_Avanzado=1 AND di_Centrador_2_Retrocedido=0;
        b_fallo_centrador2:=FALSE;
    ENDWHILE
    TPErase;
    !
    !Fallo Bridas B
    WHILE b_fallo_Brida_B1=TRUE DO
        TPWrite"      Esperando brida B1 Cerrada     ";
        WaitUntil di_Brida_B1_Cerrada=1 AND di_Brida_B1_Abierta=0;
        b_fallo_Brida_B1:=FALSE;
    ENDWHILE
    TPErase;
    WHILE b_fallo_Brida_B2=TRUE DO
        TPWrite"      Esperando brida B2 Cerrada     ";
        WaitUntil di_Brida_B2_Cerrada=1 AND di_Brida_B2_Abierta=0;
        b_fallo_Brida_B2:=FALSE;
    ENDWHILE    
    TPErase; 
    !
    !Fallo Bridas C
    TPErase;    
    WHILE b_fallo_Brida_C1=TRUE DO
        TPWrite"      Esperando brida C1 Cerrada     ";
        WaitUntil di_Brida_C1_Cerrada=1 AND di_Brida_C1_Abierta=0;
        b_fallo_Brida_C1:=FALSE;
    ENDWHILE
    TPErase;    
    WHILE b_fallo_Brida_C2=TRUE DO
        TPWrite"      Esperando brida C2 Cerrada     ";
        WaitUntil di_Brida_C2_Cerrada=1 AND di_Brida_C2_Abierta=0;
        b_fallo_Brida_C2:=FALSE;
    ENDWHILE
    TPErase;    
    WHILE b_fallo_Brida_C3=TRUE DO
        TPWrite"      Esperando brida C3 Cerrada     ";
        WaitUntil di_Brida_C3_Cerrada=1 AND di_Brida_C3_Abierta=0;
        b_fallo_Brida_C3:=FALSE;
    ENDWHILE
    TPErase;    
    WHILE b_fallo_Brida_C4=TRUE DO
        TPWrite"      Esperando brida C4 Cerrada     ";
        WaitUntil di_Brida_C4_Cerrada=1 AND di_Brida_C4_Abierta=0;
        b_fallo_Brida_C4:=FALSE;
    ENDWHILE
    TPErase;    
    !
ENDPROC
    
ENDMODULE
