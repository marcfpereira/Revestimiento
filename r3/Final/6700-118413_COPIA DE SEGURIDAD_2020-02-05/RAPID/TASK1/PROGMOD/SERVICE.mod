MODULE SERVICE
	LOCAL CONST robtarget p_comprobacion_caps:=[[470.26,-300.79,-745.89],[0.702141,-0.0827312,0.702459,-0.0818884],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	LOCAL CONST robtarget p_comprobacion_caps_sup:=[[417.40,-301.36,-750.81],[0.716487,-0.0758072,0.690586,-0.0631772],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	LOCAL CONST robtarget p_tirar_caps:=[[880.99,-151.56,-651.26],[0.706538,0.0185823,0.707211,0.0176631],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	LOCAL CONST robtarget p_tirar_caps10:=[[900.03,-428.71,-834.53],[0.706554,0.018587,0.707194,0.0176924],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	LOCAL CONST robtarget p_tirar_caps20:=[[900.03,-428.71,-834.53],[0.706554,0.018587,0.707194,0.0176924],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];

PROC Marcas()
! Robot en marcas
MoveAbsJ ceros\NoEOffs, v500, fine, tool0;
!
ENDPROC

PROC Seg_Fresado()
!
WaitUntil b_libera_robot = TRUE;
b_libera_fresa := FALSE;
!
ENDPROC


	
PROC t_martilleo()
!======================
! Martilleo
!======================
!
IF di_Pinza_Aproximada=0 THEN
	CloseHighLift gun1;
ENDIF
reset do_desaproximar_pinza;
set do_Cerrar_Pinza;
WaitDI di_Pinza_Cerrada, 1;
WaitTime 0.5;
reset do_Cerrar_Pinza;
WaitTime 1;
OpenHighLift gun1;
WaitTime 1;
!
!=============
!EXIT PROGRAM
!=============
ENDPROC

PROC t_Cambio_Caps_Manual()
    TPErase;
    !
    !HOME
    MoveAbsJ home_pos_rob\NoEOffs, vmax, z1, Tcp_Garra;
    !
    TPWrite "";
    TPWrite "";
    TPWrite "";
    TPWrite "";
    TPWrite "";
    TPWrite "";
    TPWrite "     REALIZAR CAMBIO DE CAPS MANUALMENTE        ";
    TPWrite "";
    TPWrite "";
    !
    Seg_Fresado;
    !
    !Abrir pinza
    OpenHighLift gun1;
    ! 
    !Posición cambio manual de caps
    MoveJ [[439.10,182.56,3987.72],[0.328319,0.597547,-0.305543,0.664672],[1,-1,0,5],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z1, Tcp_Garra;
    !
    !Aplicamos programa
    SetGO go_Progr_soldad, 63;
    !
    !Corta agua
    Reset do_Abrir_Agua;
    PulseDO\PLength:=20, do_EV_Aspiracion;
    WaitTime 5;
    !
    Set do_Fin_Cambio_caps;
    !
    reintentar:
    UIMsgBox\Header:="Posicion Cambio de caps R3"," "\MsgLine2:=" "\MsgLine3:="¿Ha realizado el cambio de caps?"\Buttons:=btnSiNo\Icon:=iconWarning\Result:=nteclas_s5;
    !
    TEST nteclas_s5
        CASE 6:
        !===========================
        !Continuar con el programa
        !===========================
        CASE 7:
        !===========================
        GOTO reintentar;
        !===========================
    ENDTEST
    !
    Reset do_Fin_Cambio_caps;
    !
    t_martilleo;
    !
    !Abre agua
    Set do_Abrir_Agua;
    !
    !Resetea contador 
	PulseDO\PLength:=1, do_Reset_contadores;
    !
    !HOME
    MoveAbsJ home_pos_rob\NoEOffs, vmax, z1, Tcp_Garra;
    ! 
    b_libera_fresa := TRUE;
    b_cambio_elec1:=TRUE;
    !
ENDPROC

PROC t_Cambio_Caps()
    !
    ! Trayecroria: Cambio de caps pinza
    TPErase;
    MoveAbsJ jpos_Reposo_R, vmax, fine, Tcp_Garra\WObj:=wobj0;
    !Quitar agua
    Reset do_Abrir_Agua;
    SetGO go_Progr_soldad, 1;
    ! Permiso con la fresa
    Seg_Fresado;
    ! Abatible a reposo
    WHILE di_Abat_Retrocedido=0 DO
        TPWrite"      Esperando abatible retrocedido     ";
    ENDWHILE
    TPErase;    
    MoveJ [[894.70,-1447.24,3415.31],[0.872008,-0.147459,-0.300208,-0.357398],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, Tcp_Garra\WObj:=wobj0;
    MoveJ [[-1093.83,-731.55,3590.58],[0.307568,-0.288975,0.625082,-0.656634],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, Tcp_Garra\WObj:=wobj0;
    OpenHighLift gun1;
    !    
    Repite_1:
    TPErase;
    TPWrite " ";
    TPWrite "                            ";
    TPWrite "  EJECUATNDO PROGRAMA CAMBIO DE CAPS.  ";
    TPWrite "                            ";
    TPWrite " ";
    ! Comprobacion cargador estatico de caps lleno.
    WHILE di_Cargador_Inf_Lleno=0 DO
        TPWrite"      Esperando recargar cargador de caps     ";
    ENDWHILE
    TPErase;    
    WHILE di_Cargador_Sup_Lleno=0 DO
        TPWrite"      Esperando recargar cargador de caps     ";
    ENDWHILE
    TPErase;    
   ! Comprobacion cargador movil de caps Vacio.
    WHILE di_cap_inf_Acoplado_OK = 1 OR di_cap_sup_Acoplado_OK = 1 DO
    TPWrite "                            ";
    TPWrite "  Caps ya puesto en cargador movil";
    TPWrite "                            ";
    TPWrite "        Mover cursor a repite_1     ";
    ENDWHILE
    ! Cargar PortaCaps Movil
    MoveJ [[785.28,-18.37,-906.78],[0.699416,-0.000259018,0.714704,0.00396714],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, t_pinza\WObj:=wobj_Garra_R3; 
    MoveJ [[437.03,-198.28,-764.62],[0.668528,0.230386,0.668885,0.229314],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, tCargaCaps\WObj:=wobj_Garra_R3;
    MoveJ [[436.86,-222.37,-727.77],[0.666188,0.237128,0.666504,0.236086],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v500, z10, tCargaCaps\WObj:=wobj_Garra_R3;
    MoveL [[436.83,-252.26,-690.94],[0.66618,0.237136,0.66651,0.236083],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v50, fine, tCargaCaps\WObj:=wobj_Garra_R3;
    !Comprobar que estamos en posición para cargar caps
    WHILE di_Deteccion_compr_capsula=0 DO
        TPWrite"      Esperando robot en posicion      ";
        TPWrite"        para poder cargar caps     ";
    ENDWHILE
    TPErase;    
    !Activamos cilindros para avanzar caps
    Set do_Retroceder_Cil_caps;
    Reset do_Avanzar_Cil_caps;
    WaitTime 0.5;
    !Desactivamos cilindros para avanzar caps
    Set do_Avanzar_Cil_caps;
    Reset do_Retroceder_Cil_caps;
    WaitTime 1;
    MoveL [[436.86,-222.37,-727.77],[0.666188,0.237128,0.666504,0.236085],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z1, tCargaCaps\WObj:=wobj_Garra_R3;
    MoveJ [[900.27,-354.11,-572.46],[0.706536,0.0185835,0.707213,0.017663],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, t_pinza\WObj:=wobj_Garra_R3;
    !Chequeo de caps puestos en cargador movil
    IF di_cap_inf_Acoplado_OK = 0 OR di_cap_sup_Acoplado_OK = 0 GOTO Repite_1;
    TPErase;
    TPWrite "                               ";
    TPWrite "   CAMBIANDO CAP INFERIOR      ";
    TPWrite "                               ";
    TPWrite "                               ";
    !
    OpenHighLift gun1;
    MoveJ p_tirar_caps, vmax, z200, t_pinza\WObj:=wobj_Garra_R3;
    ! TIRAR CAP INFERIOR 
    Reset do_Avanzar_cil_Mordaza;
    PulseDO\PLength:=1, do_Retro_cil_Mordaza;
    WaitTime 1;
    ! Absorción de agua
    PulseDO\High\PLength:=20, do_EV_Aspiracion;
    !
    Repite_2:
    MoveJ [[407.28,-235.57,-954.59],[0.702121,-0.0827235,0.702477,-0.0819148],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v4000, z200, t_pinza\WObj:=wobj_Garra_R3;
    MoveL [[415.18,-399.98,-773.02],[0.702096,-0.0827027,0.7025,-0.0819447],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z10, t_pinza\WObj:=wobj_Garra_R3;
    WHILE di_cilindro_Uñas_Ret=0 DO
        TPWrite"      Esperando cilindro extraccion de caps retrocedido      ";
    ENDWHILE
    TPErase;
    ! Posicion extraccion cap.
    MoveL [[460.82,-400.80,-772.07],[0.693649,-0.0851489,0.710829,-0.079522],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza\WObj:=wobj_Garra_R3;
    ! Activacion: Giro para quitar cápsula superior
    WHILE di_flow1_ok=1 DO
        TPWrite"      Esperando agua cortada     ";
    ENDWHILE
    TPErase;
    Sacar_cap;
    WaitTime 0.2;
    MoveL [[413.82,-401.04,-770.89],[0.69365,-0.0851512,0.710827,-0.0795209],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza\WObj:=wobj_Garra_R3;
    MoveL [[362.04,-420.15,-762.24],[0.693651,-0.085148,0.710827,-0.0795181],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z10, t_pinza\WObj:=wobj_Garra_R3;
    WaitTime 0.2;
    MoveL [[364.93,-458.34,-655.45],[0.693655,-0.0851568,0.710822,-0.0795157],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, t_pinza\WObj:=wobj_Garra_R3;
    Reset do_Avanzar_cil_Mordaza;
    PulseDO\PLength:=1, do_Retro_cil_Mordaza;
    WaitTime 1;
    !Stop;
    ! Espera: dientes del extractor hayan salido
    WHILE di_cilindro_Uñas_Ret=0 DO
        TPWrite"      Esperando cilindro extraccion de caps retrocedido     ";
    ENDWHILE
    TPErase;    
    WaitTime 1;
    ! Activacion: Giro para quitar cápsula superior
    !PulseDO\PLength:=1, do_Avanzar_cil_Mordaza;
    ! Espera: dientes del extractor hayan salido
    !WHILE di_cilindro_Uñas_ava=0 DO
        !TPWrite"      Esperando cilindro extraccion de caps Avanzado     ";
    !ENDWHILE
    TPErase;
    MoveL [[362.04,-420.15,-762.24],[0.693651,-0.085148,0.710827,-0.0795181],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z10, t_pinza\WObj:=wobj_Garra_R3;    
    !MoveL [[436.57,-398.52,-769.72],[0.702139,-0.0827348,0.702459,-0.0819001],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, t_pinza\WObj:=wobj_Garra_R3;
    !MoveL [[436.57,-398.52,-769.72],[0.702139,-0.0827348,0.702459,-0.0819007],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v4000, z200, t_pinza\WObj:=wobj_Garra_R3;
    ! Punto comprobacion electrodo superior
    MoveJ [[436.49,-362.01,-837.99],[0.702139,-0.0827352,0.702459,-0.0819001],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v4000, z200, t_pinza\WObj:=wobj_Garra_R3;
    MoveL p_comprobacion_caps, v100, fine, t_pinza\WObj:=wobj_Garra_R3;
    WaitTime 0.5;
    TPWrite " ";
    TPWrite " Verif. ausencia de cap...  ";
    ! Deteccion: INEXISTENCIA CAP. en porta-electrodo
    !Espera no electrodo
    IF di_presencia_cap = 1 GOTO Repite_2;
    !
    !Tirar cap Superior
    MoveJ [[470.21,-284.80,-848.82],[0.702144,-0.0827409,0.702454,-0.0818906],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v4000, z200, t_pinza\WObj:=wobj_Garra_R3;
    !MoveJ [[870.68,-284.34,-849.05],[0.702143,-0.0827403,0.702455,-0.0818913],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, t_pinza\WObj:=wobj_Garra_R3;
    !MoveJ p_tirar_caps, vmax, fine, t_pinza\WObj:=wobj_Garra_R3;
    !Reset do_Avanzar_cil_Mordaza;
    !PulseDO\PLength:=1, do_Retro_cil_Mordaza;
    !WaitTime 0.5;
    !MoveJ [[870.68,-284.34,-849.05],[0.702143,-0.0827403,0.702455,-0.0818913],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, t_pinza\WObj:=wobj_Garra_R3;
    MoveJ [[422.06,-215.58,-796.79],[0.702144,-0.0827396,0.702455,-0.0818905],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, t_pinza\WObj:=wobj_Garra_R3;
    !
    Repite_3:
    !SetGO go_Progr_soldad, 2;
    MoveJ [[422.06,-215.58,-796.79],[0.702144,-0.0827404,0.702454,-0.0818905],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, t_pinza\WObj:=wobj_Garra_R3;
    TPWrite " ";
    TPWrite "    Poniendo cap inferior     ";
    !MoveL [[431.95,-419.10,-877.46],[0.71657,-0.0931747,0.687465,-0.0723772],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v4000, z200, t_pinza\WObj:=wobj_Garra_R3;
    MoveL [[441.89,-247.71,-703.23],[0.71317,-0.0858764,0.691239,-0.0787568],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, fine, t_pinza\WObj:=wobj_Garra_R3;
    ! Posicion coger cap. superior
    MoveL [[466.20,-244.67,-695.41],[0.713154,-0.085863,0.691261,-0.0787188],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza\WObj:=wobj_Garra_R3;
    WaitTime 1;
    MoveL [[466.19,-237.75,-717.51],[0.71317,-0.085876,0.691239,-0.0787571],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza\WObj:=wobj_Garra_R3;
    MoveJ [[466.57,-192.52,-750.59],[0.713172,-0.0858773,0.691237,-0.0787536],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z10, t_pinza\WObj:=wobj_Garra_R3;
    ! Punto comprobacion electrodo superior
    MoveL p_comprobacion_caps, v100, fine, t_pinza\WObj:=wobj_Garra_R3;
    WaitTime 0.5;
    TPWrite " ";
    TPWrite " Verif. presencia de cap... ";
    ! Deteccion: EXISTENCIA CAP. en porta-electrodo
    IF di_presencia_cap = 0 GOTO Repite_3;
    !
    MoveJ [[470.13,-220.73,-826.28],[0.702143,-0.0827389,0.702454,-0.0818959],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v4000, fine, t_pinza\WObj:=wobj_Garra_R3;
    !
    TPWrite " ";
    TPWrite "  Punto apriete cap. nuevo  ";
    t_martilleo;
    Reset do_Abrir_Pinza;
    PulseDO\PLength:=1, do_aproximar_pinza;
    !
    Repite_4:
    TPErase;
    TPErase;
    TPWrite " ";
    TPWrite "   CAMBIO: CAP. SUPERIOR   ";
    TPWrite " ";
    TPWrite "   Extraccion de cap superior     ";
    MoveJ [[414.03,-243.54,-874.77],[0.702154,-0.0827523,0.702443,-0.0818836],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, t_pinza\WObj:=wobj_Garra_R3;
    !
    ! Absorción de agua
    PulseDO \High, \PLength:=20, do_EV_Aspiracion;
    MoveJ [[429.30,-361.04,-860.13],[0.71187,-0.0880823,0.692537,-0.0766547],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v4000, fine, t_pinza\WObj:=wobj_Garra_R3;
    !CloseHighLift gun1;
    WaitTime 0.5;
    Reset do_Avanzar_cil_Mordaza;
    PulseDO\PLength:=3, do_Retro_cil_Mordaza;
    MoveL [[430.10,-457.10,-818.58],[0.711869,-0.0880842,0.692537,-0.0766529],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v400, fine, t_pinza\WObj:=wobj_Garra_R3;
    ! Posicion extraccion cap superior
    MoveL [[403.35,-458.16,-816.15],[0.711867,-0.0880837,0.692539,-0.0766559],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza\WObj:=wobj_Garra_R3;
    ! Activacion: Giro para quitar cápsula superior
    WHILE di_flow1_ok=1 DO
        TPWrite"      Esperando agua cortada     ";
    ENDWHILE
    TPErase;    
    Sacar_cap;
    WaitTime 0.2;
    WHILE di_cilindro_Uñas_ava=0 DO
        TPWrite"      Esperando cilindro extraccion de caps Avanzado     ";
    ENDWHILE
    TPErase;    
    MoveL [[424.86,-457.19,-818.70],[0.711867,-0.088086,0.692539,-0.0766493],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza\WObj:=wobj_Garra_R3;
    MoveL [[429.30,-361.04,-860.13],[0.71187,-0.0880823,0.692537,-0.0766547],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v4000, z200, t_pinza\WObj:=wobj_Garra_R3;
    ! Punto comprobacion electrodo inferior
    MoveL p_comprobacion_caps_sup, v100, fine, t_pinza\WObj:=wobj_Garra_R3;
    WaitTime 0.5;
    TPWrite " ";
    TPWrite " Verif. ausencia de cap superior  ";
    ! Deteccion: INEXISTENCIA CAP. en porta-electrodo
    IF di_presencia_cap = 1 GOTO Repite_4;
    !Tirar Cap superior
    MoveJ [[470.21,-284.80,-848.82],[0.702144,-0.0827409,0.702454,-0.0818906],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v4000, z200, t_pinza\WObj:=wobj_Garra_R3;
    MoveJ [[707.45,-284.54,-848.96],[0.702153,-0.0827499,0.702445,-0.0818834],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, t_pinza\WObj:=wobj_Garra_R3;
    MoveJ p_tirar_caps, vmax, fine, t_pinza\WObj:=wobj_Garra_R3;
    Reset do_Avanzar_cil_Mordaza;
    PulseDO\PLength:=1, do_Retro_cil_Mordaza;
    WaitTime 0.5;
    MoveJ [[707.45,-284.54,-848.96],[0.702153,-0.0827499,0.702445,-0.0818834],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, t_pinza\WObj:=wobj_Garra_R3;
    MoveJ [[440.13,-215.56,-796.80],[0.702138,-0.0827326,0.70246,-0.0819002],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, t_pinza\WObj:=wobj_Garra_R3;
    !
    Repite_5:
    !
    MoveJ [[440.17,-215.56,-796.80],[0.702143,-0.08274,0.702455,-0.0818916],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v4000, z200, t_pinza\WObj:=wobj_Garra_R3;
    TPWrite " ";
    TPWrite "    Insercion de cap superior    ";
    MoveJ [[442.93,-230.93,-711.94],[0.721918,-0.0928846,0.681972,-0.0715639],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v4000, z50, t_pinza\WObj:=wobj_Garra_R3;
    MoveL [[439.18,-232.66,-690.44],[0.727892,-0.0891615,0.675728,-0.0749304],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, z5, t_pinza\WObj:=wobj_Garra_R3;
    ! Posicion coger cap. superior
    MoveL [[421.75,-233.15,-691.68],[0.727887,-0.0891555,0.675734,-0.0749348],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza\WObj:=wobj_Garra_R3;
    WaitTime 1;
    MoveL [[430.24,-225.23,-713.80],[0.727894,-0.0891621,0.675726,-0.0749306],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v100, fine, t_pinza\WObj:=wobj_Garra_R3;
    MoveL [[432.21,-194.50,-753.56],[0.727898,-0.0891681,0.675721,-0.0749328],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v1000, z5, t_pinza\WObj:=wobj_Garra_R3;
    MoveJ [[427.68,-194.67,-741.46],[0.721909,-0.0928838,0.681981,-0.0715743],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, t_pinza\WObj:=wobj_Garra_R3;
    ! Punto comprobacion electrodo superior
    MoveL p_comprobacion_caps_sup, v100, fine, t_pinza\WObj:=wobj_Garra_R3;
    WaitTime 0.5;
    TPWrite " ";
    TPWrite " Verif. presencia de cap superior";
    ! Deteccion: EXISTENCIA CAP. en porta-electrodo
    IF di_presencia_cap = 0 GOTO Repite_5;
    !
    MoveJ [[415.68,-268.62,-792.62],[0.71636,-0.0754114,0.690778,-0.0629931],[-2,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v4000, fine, t_pinza\WObj:=wobj_Garra_R3;
    !
    SetGO go_Progr_soldad, 63;
    TPWrite " ";
    TPWrite "  Punto apriete cap. nuevo  ";
    t_martilleo;
    SetGO go_Progr_soldad, 1;
    WaitTime 1;
    ! Fin cambio de caps
    PulseDO\PLength:=2, do_Fin_Cambio_caps;
    MoveJ [[-1093.83,-731.55,3590.58],[0.307568,-0.288975,0.625082,-0.656634],[-2,0,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, fine, Tcp_Garra\WObj:=wobj0;
    b_libera_fresa := TRUE;
    b_cambio_elec1:=TRUE;
    !Resetea contador 
	PulseDO\PLength:=1, do_Reset_contadores;
	MoveJ [[894.70,-1447.24,3415.31],[0.872008,-0.147459,-0.300208,-0.357398],[-1,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], vmax, z200, Tcp_Garra\WObj:=wobj0;
	MoveAbsJ jpos_Reposo_R, vmax, fine, Tcp_Garra\WObj:=wobj0;
    !
    TPErase;
    !
ENDPROC

PROC t_mantenimiento()
!======================
!En posicion de Mantenimiento
!======================
if di_presencia_1=1 OR di_presencia_2=1 THEN 
        TPWrite"Esperando Robot sin pieza";
        WaitTime 0.2;
ENDIF
!
GripLoad load0;
!
AccSet 80, 80;
!
!POS. HOME
home_robot;
!
! COMPROBACION GARRA VACIA
!
MoveJ [[267.61,1050.32,2937.13],[0.802802,0.487577,0.110709,0.324841],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v3000, z100, Tcp_Garra;
MoveJ [[-684.93,-1170.60,2766.23],[0.11099,0.355545,-0.710444,-0.597109],[-2,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v3000, z100, Tcp_Garra;
!
! Posición Mantenimiento
MoveJ p_mantenimiento, v2000, fine, Tcp_Garra;
!
Set do_Posicion_mant;
Set do_Fin_Mant;
WHILE di_Mantenimiento=1 DO
    TPWrite "Esperando de mantenimiento a Home";
ENDWHILE
TPErase;
Reset do_Posicion_mant;
!
MoveJ [[-684.93,-1170.60,2766.23],[0.11099,0.355545,-0.710444,-0.597109],[-2,0,1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v3000, z100, Tcp_Garra;
MoveJ [[267.61,1050.32,2937.13],[0.802802,0.487577,0.110709,0.324841],[1,0,-1,1],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]], v3000, z100, Tcp_Garra;
!
!POS.HOME
home_robot; 
!
!=============
!EXIT PROGRAM
!=============	
ENDPROC
	PROC Sacar_cap()
		Set do_Avanzar_cil_Mordaza;
		WaitTime 0.5;
		Reset do_Avanzar_cil_Mordaza;
		Set do_Retro_cil_Mordaza;
		WaitTime 0.2;
		Reset do_Retro_cil_Mordaza;
		Set do_Avanzar_cil_Mordaza;
		WaitTime 0.5;
		Reset do_Avanzar_cil_Mordaza;
		Set do_Retro_cil_Mordaza;
		WaitTime 0.2;
		Reset do_Retro_cil_Mordaza;
		WaitTime 0.2;
		Set do_Avanzar_cil_Mordaza;
		!WaitTime 0.5;
	ENDPROC
	
	
ENDMODULE