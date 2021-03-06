
MODULE Soldadura

    PROC Control_Agua()
        WHILE di_flow1_ok=0 OR di_flow2_ok=0 DO
            TPWrite "Caudal de agua insuficiente";
            WaitTime 0.2;
        ENDWHILE
    ENDPROC

    PROC Soldar(\switch Aproximado | switch AbrirTotal)
        !
        TPErase;
        SetDO do_Soldar_autor,1;
        SetDO do_Abrir_Agua,1;
        Reset do_EV_Aspiracion;
        !
        Control_Agua;
        !
        IF di_Fallo_sold=1 PulseDO\PLength:=2,do_Reset_fallos;
        !
        !Desde pinza desaproximada, aproxima y cierra
        IF di_Pinza_Abierta=1 AND di_Pinza_Aproximada=0 THEN
            Reset do_Abrir_Pinza;
            Reset do_Cerrar_Pinza;
            Reset do_desaproximar_pinza;
            SetDO do_aproximar_pinza,1;
            Wait_input di_Pinza_Abierta,0\Message:="Esperando inicio aproximacion pinza";
            TPErase;
            !Reset do_aproximar_pinza;
            !Reset do_Abrir_Pinza;
            SetDO do_Cerrar_Pinza,1;
        ELSEIF di_Pinza_Abierta=0 AND di_Pinza_Aproximada=1 THEN
            !Desde aproximada, cierra
            Reset do_aproximar_pinza;
            Reset do_Abrir_Pinza;
            SetDO do_Cerrar_Pinza,1;
        ENDIF
        !
        SetDO do_Cerrar_Pinza,1;
        WHILE di_Pinza_Cerrada=0 DO
            TPWrite "Esperado pinza cerrada";
        ENDWHILE
        TPErase;
        !
        !ACTIVA SOLD
        b_fallo_sold:=TRUE;
        Reset do_Marcha_sold;
        SetDO do_Marcha_sold,1;
        WaitDI di_FK,1;

        !
        Reset do_Marcha_sold;
        N_Intentos:=0;
        !
        !APROX
        IF Present(Aproximado) THEN
            Reset do_Cerrar_Pinza;
            SetDO do_desaproximar_pinza,1;
            WHILE di_Pinza_Aproximada=0 OR di_Pinza_Cerrada=1 DO
                TPWrite "Esperado pinza aproximada";
            ENDWHILE
            TPErase;
            Reset do_desaproximar_pinza;
        ENDIF
        !
        IF Present(AbrirTotal) THEN
            Reset do_Cerrar_Pinza;
            SetDO do_desaproximar_pinza,1;
            Reset do_aproximar_pinza;
            SetDO do_Abrir_Pinza,1;
            WHILE di_Pinza_Abierta=0 OR di_Pinza_Aproximada=1 DO
                TPWrite "Esperado pinza abierta";
            ENDWHILE
            TPErase;
            Reset do_desaproximar_pinza;
        ENDIF
        !
    ENDPROC

    PROC Prueba_spot()
        !APROX. PINZA
        Reset do_Abrir_Pinza;
        Reset do_Cerrar_Pinza;
        Reset do_desaproximar_pinza;
        SetDO do_aproximar_pinza,1;
        WHILE di_Pinza_Aproximada=0 DO
            TPWrite "Esperado pinza aproximada";
        ENDWHILE
        TPErase;
        !
        SpotL [[863.54,0.74,1358.59],[0.99991,-0.000631255,0.0129631,-0.00334254],[-1,-1,-1,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]],vmax,gun1,RA696SOLD010\CloseHLift,t_Pinza;
        Stop;
        Stop;
        !
    ENDPROC

ENDMODULE