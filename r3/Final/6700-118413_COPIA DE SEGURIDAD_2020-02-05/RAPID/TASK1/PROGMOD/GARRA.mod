MODULE GARRA
    
    VAR bool b_fallo_Brida_B1:=FALSE;
    VAR bool b_fallo_Brida_B2:=FALSE;
    VAR bool b_fallo_Brida_C1:=FALSE;
    VAR bool b_fallo_Brida_C2:=FALSE;
    VAR bool b_fallo_Brida_C3:=FALSE;
    VAR bool b_fallo_Brida_C4:=FALSE;
    VAR bool b_fallo_Centrador1:=FALSE;
    VAR bool b_fallo_Centrador2:=FALSE;
    
PROC ABRIR_BRIDAS_GARRA_C()
    !
    !Abrir todas las bridas de la garra
    Reset do_Cerrar_Brida_C;
    Set do_Abrir_brida_C;
    !Esperando todas las bridas abiertas
    WaitDI di_Brida_C1_Abierta,1\MaxTime:=2\timeflag:=b_fallo_Brida_C1;
    WaitDI di_Brida_C2_Abierta,1\MaxTime:=2\timeflag:=b_fallo_Brida_C2;
    WaitDI di_Brida_C3_Abierta,1\MaxTime:=2\timeflag:=b_fallo_Brida_C3;
    WaitDI di_Brida_C4_Abierta,1\MaxTime:=2\timeflag:=b_fallo_Brida_C4;
    !
    !
    TPErase;    
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
PROC ABRIR_BRIDAS_GARRA_B()
    !
    !Abrir todas las bridas de la garra
    Reset do_Cerrar_Brida_B;
    Set do_Abrir_brida_B;
    !Esperando todas las bridas abiertas
    WaitDI di_Brida_B1_Abierta, 1\MaxTime:=2\TimeFlag:=b_fallo_Brida_B1;
    WaitDI di_Brida_B2_Abierta, 1\MaxTime:=2\TimeFlag:=b_fallo_Brida_B2;
    !
    !
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
    TPErase;    
    !
ENDPROC

PROC CERRAR_BRIDAS_GARRA_C()
    !
    !Cerrar todas las bridas de la garra
    Reset do_Abrir_brida_C;
    Set do_Cerrar_Brida_C;
    !Esperando todas las bridas abiertas
    WaitDI di_Brida_C1_Cerrada,1\MaxTime:=2\timeflag:=b_fallo_Brida_C1;
    WaitDI di_Brida_C2_Cerrada,1\MaxTime:=2\timeflag:=b_fallo_Brida_C2;
    WaitDI di_Brida_C3_Cerrada,1\MaxTime:=2\timeflag:=b_fallo_Brida_C3;
    WaitDI di_Brida_C4_Cerrada,1\MaxTime:=2\timeflag:=b_fallo_Brida_C4;
    !
    !
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
PROC CERRAR_BRIDAS_GARRA_B()
    !
    !Cerrar todas las bridas de la garra
    Reset do_Abrir_brida_B;
    Set do_Cerrar_Brida_B;
    !Esperando todas las bridas abiertas
    WaitDI di_Brida_B1_Cerrada, 1\MaxTime:=2\TimeFlag:=b_fallo_Brida_B1;
    WaitDI di_Brida_B2_Cerrada, 1\MaxTime:=2\TimeFlag:=b_fallo_Brida_B2;
    !
    !
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
    TPErase;    
    !
ENDPROC

PROC AVANZAR_CENTRADORES_GARRA()
    !
    Reset do_Retroceder_Centradores;
    Set do_Avanzar_Centradores;
    !Esperando todos los centradores avanzados
    WaitDI di_Centrador_1_Avanzado,1\MaxTime:=2\timeflag:=b_fallo_centrador1;
    WaitDI di_Centrador_2_Avanzado,1\MaxTime:=2\timeflag:=b_fallo_centrador2;
    !
    !
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
ENDPROC

    !------------
    

PROC RETROCEDER_CENTRADORES_GARRA()
    !
    Reset do_Avanzar_Centradores;
    Set do_Retroceder_Centradores;
    !Esperando todos los centradores retrocedidos
    WaitDI di_Centrador_1_Retrocedido,1\MaxTime:=2\timeflag:=b_fallo_centrador1;
    WaitDI di_Centrador_2_Retrocedido,1\MaxTime:=2\timeflag:=b_fallo_centrador2;
    !
    !
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
ENDPROC

ENDMODULE