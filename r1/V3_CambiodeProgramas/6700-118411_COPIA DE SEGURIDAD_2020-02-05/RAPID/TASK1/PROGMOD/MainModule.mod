MODULE MainModule
!
! ROBOT 1
! Programa Creado por AUTER
! set_outputs : outputs set 
! reset_outputs : outputs reset 
! home_robot : robot home position
! main: main routine
! init_cond: initial conditions routinewaitdi
!Variable Petición de Código
PERS num nCod_Prog:=0;
!
!SPOTDATA
PERS spotdata spot11:=[0,0,1,1];

PROC set_outputs()
!============
! Outputs set
!============
!
! Activar seguridades
SetDO do_Mesa_Free,1;
SetDO do_Util_Free,1;
! Sin peticion de codigo
SetDO do_Pet_Cod,0;
! Reset eco codigo programa
SetGO Go_prog,0;
! Habilitación soldadura
SetDO do_Soldar_autor,1;
! Apertura agua
SetDO do_Abrir_Agua,1;
!
!=============
!EXIT PROGRAM
!=============
ENDPROC

PROC reset_outputs()
!==============
! Outputs reset
!==============
!
!Desactivar posiciones y ciclos especiales
Reset do_Fin_Fresado;
Reset do_Cambio_caps;
Reset do_Fin_Martilleo;
Reset do_EOCycle;
Reset do_Move_Fix1;
Reset do_Fallo_Aplic;
Reset do_Fin_Mant;
Reset do_Posicion_mant;
Reset do_EV_Aspiracion;
Reset do_Fallo_Cambio_Caps;
!Desactivar peticiones bridas
Reset do_Disp_A_Desact;
Reset do_Disp_A_Act;
Reset do_Disp_B_Desact;
Reset do_Disp_B_Act;
Reset do_Disp_C_Desact;
Reset do_Disp_C_Act;
Reset do_Disp_D_Desact;
Reset do_Disp_D_Act;
Reset do_Disp_E_Desact;
Reset do_Disp_E_Act;
Reset do_Disp_F_Desact;
Reset do_Disp_F_Act;
Reset do_Disp_G_Desact;
Reset do_Disp_G_Act;
Reset do_Disp_H_Desact;
Reset do_Disp_H_Act;
Reset do_Disp_I_Desact;
Reset do_Disp_I_Act;
Reset do_Disp_J_Desact;
Reset do_Disp_J_Act;
Reset do_Disp_K_Desact;
Reset do_Disp_K_Act;
Reset do_Disp_L_Desact;
Reset do_Disp_L_Act;
! Habilitar anticolisiones
rAnticol acA1_R2, aaDeactivate;
rAnticol acA2_R2, aaDeactivate;
rAnticol acA3_R2, aaDeactivate;
rAnticol acA4_R2, aaDeactivate;
rAnticol acA5_R2, aaDeactivate;
rAnticol acA6_R2, aaDeactivate;
rAnticol acA7_R2, aaDeactivate;
rAnticol acA8_R2, aaDeactivate;
rAnticol acA1_R3, aaDeactivate;
rAnticol acA2_R3, aaDeactivate;
rAnticol acA3_R3, aaDeactivate;
rAnticol acA4_R3, aaDeactivate;
rAnticol acA5_R3, aaDeactivate;
rAnticol acA6_R3, aaDeactivate;
rAnticol acA7_R3, aaDeactivate;
rAnticol acA8_R3, aaDeactivate;
!
!Desactiva memoria cambio caps
b_CambCaps:=FALSE;
!
!=============
!EXIT PROGRAM
!=============
ENDPROC


PROC home_robot()
!====================
! Robot home position
!====================
!
!Check_Superv_Mov;
!
!HOME
MoveAbsJ home_pos_rob, vmax, fine, tool0;
WaitUntil DOutput(do_Home_R1)=1;
!
!=============
!EXIT PROGRAM
!=============
ENDPROC

PROC main()
!==============
! Main routine
!==============
IF b_cond_ini=FALSE THEN
    init_cond;
ENDIF
SetDO do_EOCycle,0;
WHILE TRUE DO
SetDO do_EOCycle,0;
Check_Superv_Mov;
Wait_cycle_start;
!
!PETICION DE CÓDIGO
WHILE di_ValCod<>1 DO
    SetDO do_Pet_Cod,1;
    WaitTime 0.2;
    nCod_Prog:=Gi_prog;
    SetGO Go_prog,nCod_Prog;
ENDWHILE
!
!ESPERA VALIDACIÓN DE CÓDIGO
WaitUntil di_ValCod=1;
!		
AccSet 80, 100;
VelSet 80, 5000;
!
IF di_ValCod=1 THEN
    TEST nCod_Prog
		CASE 1:
        !Petición de Código
        SetDO do_Pet_Cod,0;
        !
        !Home 
        home_robot;
        !
        !Soldar Mesa 1 Útil 5FA_813_303_A
        !SE380_M1_5FA_813_303_A;
        SE380_M1_NEW;
        !
        !Home
        home_robot;
        ! 
        !FIN DE CICLO
        End_of_cycle;
        ! 
    CASE 2:
        !Petición de Código
        SetDO do_Pet_Cod,0;
        !
        !Home 
        home_robot;
        !
        !Soldar útil 2
        SE370_M2;
        !
        !Home
        home_robot;
        ! 
        !FIN DE CICLO
        End_of_cycle;
        ! 
    CASE 3:
        !Petición de Código
        SetDO do_Pet_Cod,0;
        !
        !Home 
        home_robot;
        !
        !Soldar Mesa 3 Útil 5FA_813_303_A
        !SE380_M3_5FA_813_303_A;
        SE380_M3_NEW;
        !
        !Home
        home_robot;
        ! 
        !FIN DE CICLO
        End_of_cycle;
        ! 
    CASE 4:
        !Petición de Código
        SetDO do_Pet_Cod,0;
        !
        !Home 
        home_robot;
        !
        !Soldar útil 4
        SE370_M4;
        !
        !Home
        home_robot;
        ! 
        !FIN DE CICLO
        End_of_cycle;
        ! 
    ENDTEST
    !			
ENDIF
!    
!RESET PETICION DE CÓDIGO
SetDO do_Pet_Cod,0;
nCod_Prog:=0;
!
! PETICION CAMBIO DE CAPS DESDE SERRATRON
IF di_Eletrodo_gastado=1 OR di_Cambio_caps=1 OR di_Prealarma=1 cambcaps;
! PETICION DE FRESADO DESDE SERRATRON
IF di_Petic_fresado=1 fresado;
!
!HOME
home_robot;
!
!LIBERAMOS MESA
SetDO do_Mesa_Free,1;
!
ENDWHILE
!
!=============
!EXIT PROGRAM
!=============
ENDPROC

PROC init_cond()
!===================
! Initial conditions 
!===================
!
b_robot1_home:=FALSE;
TPErase;
!Check_Superv_Mov;
UIMsgBox\Header:="Start","      CELULA ROBOT "\MsgLine2:=" "\MsgLine3:="         AUTER "\MsgLine4:="       Dpo. ROBOTICA "\Buttons:=btnNone\Icon:=iconInfo\MaxTime:=3\BreakFlag:=err_var_s5;
UIMsgBox\Header:="Start","   CARGANDO CONDICIONES INICIALES "\MsgLine2:=" "\MsgLine3:=" "\MsgLine4:=" "\MsgLine5:="      ESPERE POR FAVOR . . ."\Buttons:=btnNone\Icon:=iconInfo\MaxTime:=2\BreakFlag:=err_var_s5;
Check_homepos;
TPErase;
TPWrite " ";
TPWrite "  ESTADO ROBOT";
TPWrite " ";
WaitTime 1;
IF Check_home_pos=TRUE THEN
    TPWrite "CONDICIONES INICIALES OK";
    reset_outputs;
    set_outputs;
    WaitTime 2;
ELSE
    UIMsgBox\Header:="ESTADO INICIAL","ESTADO ROBOT"\MsgLine2:=" "\MsgLine3:="ROBOT FUERA DE HOME"\Buttons:=btnNone\Icon:=iconError\MaxTime:=5\BreakFlag:=err_var_s5;
    init_cond;
ENDIF
b_cond_ini:=TRUE;
!
!=============
!EXIT PROGRAM
!=============
ENDPROC
!
ENDMODULE