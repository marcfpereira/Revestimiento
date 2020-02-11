MODULE MainModule

    !
    !       ROBOT 3
    !
    ! set_outputs : outputs set 
    ! reset_outputs : outputs reset 
    ! home_robot : robot home position
    ! main: main routine
    ! init_cond: initial conditions routine
    ! Simulacion: inhibition plate thickness
    !

    PERS num nCod_Prog:=1;
    
    PROC set_outputs()
        !============
        ! Outputs set
        !============
        !
        SetDO do_Mesa_Free,1;
        SetDO do_Util_Free,1;
        ! Sin peticion de codigo
        SetDO do_Pet_Cod,0;
        ! Reset eco codigo programa
        SetGO Go_prog,0;
        !
        b_libera_fresa:=TRUE;
        !=============
        !EXIT PROGRAM
        !=============
    ENDPROC


    PROC reset_outputs()
        !==============
        ! Outputs reset
        !==============
        !
        reset_EndCiclos;
        Reset do_Move_Fix1;
        Reset do_En_proceso;
        Reset do_Fallo_aplic;
        Reset do_Fin_Mant;
        Reset do_Posicion_mant;
        Reset do_Fin_Fresado;
        Reset do_Fin_Cambio_caps;
        !Desactivar peticiones bridas
        Reset do_Pet_Movimiento_1;
        Reset do_Pet_Movimiento_2;
        Reset do_Pet_Movimiento_3;
        Reset do_Pet_Movimiento_4;
        Reset do_Pet_Movimiento_5;
        !Reset Bool
        reset_bool;
        !   
        !Reset Anticolisiones
        rAnticol acA1_R1, aaDeactivate;
        rAnticol acA2_R1, aaDeactivate;
        rAnticol acA3_R1, aaDeactivate;
        rAnticol acA4_R1, aaDeactivate;
        rAnticol acA5_R1, aaDeactivate;
        rAnticol acA6_R1, aaDeactivate;
        rAnticol acA7_R1, aaDeactivate;
        rAnticol acA8_R1, aaDeactivate;
        rAnticol acA1_R2, aaDeactivate;
        rAnticol acA2_R2, aaDeactivate;
        rAnticol acA3_R2, aaDeactivate;
        rAnticol acA4_R2, aaDeactivate;
        rAnticol acA5_R2, aaDeactivate;
        rAnticol acA6_R2, aaDeactivate;
        rAnticol acA7_R2, aaDeactivate;
        rAnticol acA8_R2, aaDeactivate;
        !
        !=============
        !EXIT PROGRAM
        !=============
    ENDPROC
    
    PROC reset_bool()
        !==============
        b_M1_Coger:=FALSE;
        b_M2_Coger:=FALSE;
        b_Dejar_cinta:=FALSE;
        b_cambio_elec1:=FALSE;
        b_fallo_Brida_B1:=FALSE;
        b_fallo_Brida_B2:=FALSE;
         b_fallo_Brida_C1:=FALSE;
         b_fallo_Brida_C2:=FALSE;
         b_fallo_Brida_C3:=FALSE;
         b_fallo_Brida_C4:=FALSE;
         b_fallo_Centrador1:=FALSE;
         b_fallo_Centrador2:=FALSE;
         b_fallo_sold:=FALSE;
         b_fallo_sold_perno:=FALSE;
         !
        !=============
        !EXIT PROGRAM
        !=============
    ENDPROC

    
    PROC reset_EndCiclos()
        !==============
        ! Outputs reset
        !==============
        !
        Reset do_EOCycle;
        Reset do_EOCycle2;
        Reset do_EOCycle3;
        Reset do_EOCycle4;
        Reset do_EOCycle5;
        Reset do_EOCycle6;
        Reset do_EOCycle7;
        Reset do_EOCycle8;
        Reset do_EOCycle9;
        Reset do_EOCycle10;
        Reset do_EOCycle11;
        Reset do_EOCycle12;
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
        MotionSup\On\TuneValue:=200;
        !
        !HOME
        MoveAbsJ home_pos_rob, v2000, fine, tool0;
        WHILE do_Home_R3 =0 DO
            TPWrite "Esperando Robot en Posicion Home";
            TPWrite "Ejecute la rutina set_home del modulo Display ";
        ENDWHILE
        TPErase;
        !
        MotionSup\On\TuneValue:=100;
        !
        !=============
        !EXIT PROGRAM
        !=============
        !
    ENDPROC
        
    PROC init_cond()
        !===================
        ! Initial conditions 
        !===================
        !
        GripLoad load0;
	    TPErase;
        UIMsgBox\Header:="Start","      CELULA ROBOT "\MsgLine2:=" "\MsgLine3:="              AUTER "\MsgLine4:="         Barcelona-ESPAÑA "\Buttons:=btnNone\Icon:=iconInfo\MaxTime:=3\BreakFlag:=err_var_s5;
        UIMsgBox\Header:="Start","   CARGANDO CONDICIONES INICIALES "\MsgLine2:=" "\MsgLine3:=" "\MsgLine4:=" "\MsgLine5:="      ESPERE POR FAVOR . . ."\Buttons:=btnNone\Icon:=iconInfo\MaxTime:=2\BreakFlag:=err_var_s5;
        Check_homepos;
        Check_Superv_Mov;
        TPErase;
        TPWrite " ";
        TPWrite "  ESTADO ROBOT";
        TPWrite " ";
        WaitTime 1;
        IF b_robot3_home=TRUE THEN
          TPWrite "CONDICIONES INICIALES OK";
          reset_outputs;
          set_outputs;
          WaitTime 2;
        ELSE
          UIMsgBox\Header:="ESTADO INICIAL","ESTADO ROBOT"\MsgLine2:=" "\MsgLine3:="ROBOT FUERA DE HOME"\Buttons:=btnNone\Icon:=iconError\MaxTime:=5\BreakFlag:=err_var_s5;
          init_cond;
        ENDIF
        !
        !=============
        !EXIT PROGRAM
        !=============
        !
    ENDPROC
    
 
    PROC Simulacion()
        !
        !Simulacion
        IF di_Ciclo_vacio=1 THEN
            B_Sin_Detectores:=TRUE;
        ELSE
            B_Sin_Detectores:=FALSE;
        ENDIF
        !
        !=============
        !EXIT PROGRAM
        !=============
        !
    ENDPROC

    PROC main()
        !
        !==============
        ! Main routine
        !==============
        !
        init_cond;
        !ChecK_Pieza;
        AccSet 80, 80;
        VelSet 100, 5000;
        WHILE TRUE DO
            reset_EndCiclos;
            Wait_cycle_start;
            !
            IF di_Cambio_caps = 1 OR di_Eletrodo_gastado=1 THEN
            t_Cambio_Caps;
            ENDIF
            ! PETICION DE CÓDIGO
            WHILE di_ValCod = 0 DO
                !
                SetDO do_Pet_Cod,1;
                WaitTime 0.1;
                nCod_Prog:=Gi_prog;
                SetGO Go_prog,nCod_Prog;
                Simulacion;
                !
            ENDWHILE
            !
            ! ESPERA VALIDACIÓN DE CÓDIGO
            WHILE di_ValCod=0 DO
                TPWrite "Esperando codigo valido del PLC";
            ENDWHILE
            TPErase;
            !
            IF di_ValCod=1 THEN
                TEST nCod_Prog
                CASE 1:
                    !
                    !Punto home
                    home_robot;
                    !
                    !PET. COD
                    SetDO do_Pet_Cod,0;
                    !
                    !Coger pieza de Mesa 1
                    COGER_M1;
                    !
                    !Soldar Pinza Estática
                    SOLDAR_REV_M1;
                    !
                    !Soldar Pernos Pequeños
                    PERNOS_ROSCA_M1;
                    !
                    !Soldar Pernos Grandes
                    PERNOS_SETAS_M1;
                    !
                    !Dejar en Pocayoke
                    DEJAR_POCAYOKE;
                    ! 
                    reset_bool;
                    !
                    !Punto home
                    home_robot;
                    !
                CASE 3:
                    !
                    !Punto home
                    home_robot;
                    !
                    !PET. COD
                    SetDO do_Pet_Cod,0;
                    !
                    !Coger pieza de Mesa 3
                    COGER_M3;
                    !
                    !Soldar Pinza Estática
                    SOLDAR_REV_M3;
                    !
                    !Soldar Pernos Pequeños
                    PERNOS_ROSCA_M3;
                    !
                    !Soldar Pernos Grandes
                    PERNOS_SETAS_M3;
                    !
                    !Dejar en Pocayoke
                    DEJAR_POCAYOKE;
                    ! 
                    reset_bool;
                    !
                    !Punto home
                    home_robot;
                    !
                CASE 4:
                    !
                    !Punto home
                    home_robot;
                    !
                    !PET. COD
                    SetDO do_Pet_Cod,0;
                    !
                    !Coger pieza de Mesa 4
                    COGER_M4;
                    !
                    !Soldar Puntos de Soldadura
                    SOLDAR_REV_M4;
                    !
                    !Soldar Pernos rosca
                    PERNOS_ROSCA_370;
                    !
                    !Soldar Pernos seta
                    PERNOS_SETAS_370;
                    !
                    !Comprobación Pernos OK
                    Comprobacion_Pernos;
                    !
                    !Dejar en Pocayoke
                    DEJAR_POCAYOKE_370;
                    !
                    reset_bool;
                    TPErase;
                    !
                    !Punto home
                    home_robot;
                    !
                CASE 5:
                    !PIEZA DUMMIE 380 MESA1
                    !
                    b_Dummie:=TRUE;
                    !
                    !Punto home
                    home_robot;
                    !
                    !PET. COD
                    SetDO do_Pet_Cod,0;
                    !
                    !Coger pieza de Mesa 1
                    COGER_M1;
                    !
                    !Comprobación Pernos OK
                    DEJAR_DUMMIE380;
                    !
                    reset_bool;
                    TPErase;
                    !
                    !Punto home
                    home_robot;
                    !
                    b_Dummie:=FALSE;
                    !
                CASE 7:
                    !PIEZA DUMMIE 380 MESA3
                    !
                    b_Dummie:=TRUE;
                    !
                    !Punto home
                    home_robot;
                    !
                    !PET. COD
                    SetDO do_Pet_Cod,0;
                    !
                    !Coger pieza de Mesa 3
                    COGER_M3;
                    !
                    !Comprobación Pernos OK
                    DEJAR_DUMMIE380;
                    !
                    reset_bool;
                    TPErase;
                    !
                    !Punto home
                    home_robot;
                    !
                    b_Dummie:=FALSE;
                    !
                CASE 8:
                    !PIEZA DUMMIE 370 MESA4
                    !
                    b_Dummie:=TRUE;
                    !
                    !Punto home
                    home_robot;
                    !
                    !PET. COD
                    SetDO do_Pet_Cod,0;
                    !
                    !Coger pieza de Mesa 4
                    COGER_M4;
                    !
                    !Comprobación Pernos OK
                    Comprobacion_Pernos;
                    !
                    WaitDI di_Pieza_Dummie, 1;
                    !
                    !Pieza a Rechazo
                    Descarte_pieza;
                    !
                    reset_bool;
                    TPErase;
                    !
                    !Punto home
                    home_robot;
                    !
                    b_Dummie:=FALSE;
                    !
                CASE 101:
  					!Fresado desde panel
  				    SetDO do_Pet_Cod,0;
 					WHILE di_fresado=0 DO
                        TPWrite "Esperando fin de fresado";
                    ENDWHILE
                    TPErase;
                    !
  					!Fin fresado
  					PulseDO\PLength:=0.5, do_Fin_Fresado;
                    !
				CASE 102:
  				    !Cambio caps desde panel
 					SetDO do_Pet_Cod,0;
  					WHILE di_Cambio_caps=0 DO
                        TPWrite "Esperando periso para Cambio de Caps";
                    ENDWHILE
                    TPErase;
                    !
                    t_Cambio_Caps;
  					!
				CASE 103:
  					!Martilleo desde panel
  					SetDO do_Pet_Cod,0;
  					WHILE di_Martilleo=0 DO
                        TPWrite"   Esperando permiso para apretar puntas";
                    ENDWHILE
                    TPErase;
                    !
  					t_martilleo;
  					!
  					! Fin de martilleo
  					End_of_Mart;
  					!
				CASE 100:
                    !-------------------
                    !Mantenimiento
                    !-------------------
                    !
                    !Punto home
                    home_robot;
                    !
                    SetDO do_Pet_Cod,0;
                    !
                    t_mantenimiento;
                    !
                    !Punto home
                    home_robot;
                    !
                ENDTEST
                !
            ENDIF
            !
            !RESET PETICION DE CÓDIGO
            SetDO do_Pet_Cod,0;
            nCod_Prog:=0;
            !
            IF di_Cambio_caps = 1 OR di_Eletrodo_gastado=1 THEN
            t_Cambio_Caps;
            ENDIF  
            !
            !HOME
            home_robot;
            !
        ENDWHILE
        !
        !=============
        !EXIT PROGRAM
        !=============
        !
    ENDPROC
ENDMODULE