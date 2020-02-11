MODULE MainModule

  PERS bool b_cambio_elec1:=FALSE;
  PERS bool b_libera_fresa:=TRUE;
  PERS bool b_libera_robot:=TRUE;
  VAR num n_tiempo_fresado:=1.5;
    

  PROC main()
    ! main fresado
    b_libera_robot:=TRUE;
    WHILE TRUE DO
      WHILE b_libera_fresa=TRUE AND DOutput(do_AutoOn)=1 DO
        t_fresado;
      ENDWHILE
      WaitTime 0.5;
    ENDWHILE

  ENDPROC


  PROC t_fresado()
    !======================
    ! Rutina de fresado
    !======================
    !
    !
    IF (di_Petic_fresado=1 OR b_cambio_elec1=TRUE) THEN
      !
      ! DESACTIVA SEGURIDAD ACCESO ROBOT A PINZA
      Seg_Fresado;
      !
      WHILE di_Pinza_Abierta=0 DO
        TPWrite"   Esperando Pinza Abierta ";
      ENDWHILE
      TPErase;
      WHILE di_Pinza_Cerrada=1 DO
        TPWrite"   Esperando no deteccion de Pinza Cerrada ";
      ENDWHILE
      TPErase;
      !
      !Abatible a pinza
      Reset do_Abat_Retrocedido;
      Set do_Abat_Avanzado;
      !
      !Espera abatible pos pinza
      WaitUntil di_Abat_Retrocedido=0 AND di_Abat_Avanzado=1;
      WaitTime 1;
      Reset do_Abat_Avanzado;
      SetGO go_Progr_soldad,63;
      !
      !Marcha fresa
      Set do_Giro_fresa;
      WHILE di_Giro_fresa=0 DO
        TPWrite"   Esperando Giro del motor de la fresa ";
      ENDWHILE
      TPErase;
      !
      ! GESTIÓN DE FRESADO
      IF b_cambio_elec1=TRUE THEN
          n_tiempo_fresado:=2.5;
      ELSE
          n_tiempo_fresado:=1.5;
      ENDIF
      !
      Reset do_Abrir_Pinza;
      Reset do_desaproximar_pinza;
      WaitTime 0.2;
      PulseDO\PLength:=0.4, do_aproximar_pinza;
      WaitTime 0.2;
      Set do_Cerrar_Pinza;
      WaitTime n_tiempo_fresado;
      Reset do_Cerrar_Pinza;
      Set do_desaproximar_pinza;
      WaitTime 0.1;
      SetGO go_Progr_soldad,1;
      Set do_Abrir_Pinza;
      WHILE di_Pinza_Abierta=0 DO
        TPWrite"   Esperando Pinza Abierta ";
      ENDWHILE
      TPErase;
      !
      !Paro fresa
      Reset do_Giro_fresa;
      !
      !Movimiento Retroceso Abatan
      Reset do_Abat_Avanzado;
      Set do_Abat_Retrocedido;
      WaitUntil di_Abat_Retrocedido=1 AND di_Abat_Avanzado=0;
      Reset do_Abat_Retrocedido;
      !
      !Resetea contador
      Set do_Reset_fresado;
      WHILE di_Petic_fresado=1 DO
        TPWrite"   Esperando No tener petición de fresado ";
      ENDWHILE
      TPErase;
      Reset do_Reset_fresado;
      !
      ! ACTIVA PERMISO DE ACCESO ROBOT A ZONA BASCULANTE
      b_libera_robot:=TRUE;
      b_cambio_elec1 := FALSE;
      !
    ENDIF
    !!=============
    !EXIT PROGRAM
    !=============	
  ENDPROC

  PROC Seg_Fresado()
    !
    WaitUntil b_libera_fresa=TRUE;
    b_libera_robot:=FALSE;
    WaitTime 0.5;
    WaitUntil b_libera_fresa=TRUE;
    !
  ENDPROC
ENDMODULE