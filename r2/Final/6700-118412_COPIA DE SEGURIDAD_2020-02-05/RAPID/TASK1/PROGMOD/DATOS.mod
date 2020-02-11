MODULE DATOS
    !# -----------------------------------------------
    !# ------ TOOL DATA
    !# -----------------------------------------------
    PERS tooldata t_movil:=[TRUE,[[-0.445116,16.1284,925.781],[0.560986,0.430459,-0.430459,0.560986]],[102,[0,0,0.001],[1,0,0,0],0,0,0]];
    PERS tooldata t_Pinza:=[TRUE,[[-5.73384,-612.291,554.167],[0,0.707107,-0.707107,0]],[129.5,[73.2,-25.6,288.2],[1,0,0,0],20.27,11.928,9.532]];
	!
    !# -----------------------------------------------
    !# ------ WOBJ DATA
    !# -----------------------------------------------
    TASK PERS wobjdata wObjOp90:=[FALSE,TRUE,"",[[2332.4,-612.027,59.9889],[0.999902,-0.000702004,0.000195218,-0.0139777]],[[0,0,0],[1,0,0,0]]];
    TASK PERS wobjdata wObjOp30:=[FALSE,TRUE,"",[[1885.45,-873.86,200.44],[0.999987,-0.00258433,-0.000432821,-0.00440684]],[[0,0,0],[1,0,0,0]]];
    TASK PERS wobjdata wObjOp30_viejo:=[FALSE,TRUE,"",[[1903.25,-930.711,209.245],[0.999987,-0.00258433,-0.000432821,-0.00440684]],[[0,0,0],[1,0,0,0]]];
    !
    ! Variable de posición:
    CONST jointtarget home_pos_rob:=[[-0.00112076,-56.3142,33.7493,-0.0738657,114.05,-89.6472],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget jposActual_rob1:=[[0,0,0,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST jointtarget ceros:=[[0,0,0,0,-90,0],[0,9E+09,9E+09,9E+09,9E+09,9E+09]];
	CONST jointtarget delta_pos:=[[0.1,0.1,0.1,0.1,0.1,0.1],[1,9E+09,9E+09,9E+09,9E+09,9E+09]];
    PERS jointtarget jpos_Home_old1:=[[-0.00112076,-56.3142,33.7493,-0.0738657,114.05,-89.6472],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST jointtarget jpos_Reposo_R:=[[-1.42547,-31.8904,3.46895,0.00127727,100.365,-0.00252241],[77.2025,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !
    ! Posiciones especiales:
    CONST robtarget p_fresado:=[[361.66,1425.14,545.35],[0.96493,-0.00999175,-0.00558587,0.262259],[1,1,1,1],[98.6959,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_cambio_elec:=[[-74.02,-1675.23,1501.36],[0.00386554,-0.790227,-0.612656,-0.0133931],[-2,0,0,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_mantenimiento:=[[802.58,399.97,1045.95],[0.764292,0.00196658,0.0128247,0.644739],[-1,-1,-3,0],[9E+09,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !
    CONST robtarget p_Coge_Cap_Fijo:=[[-1402.77,906.24,681.24],[0.0828904,-0.0596734,-0.979208,-0.175268],[1,-1,0,0],[89.9995,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget p_Coge_Cap_Movil:= [[-1441.13,604.22,699.27],[0.073066,-0.0578357,-0.990735,-0.0987884],[1,-1,0,0],[51.4224,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pMordazaCapSup:=[[197.35,1535.33,350.39],[0.00232206,0.995455,0.091834,0.0251013],[1,1,0,1],[133.16,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pVerificaCapSup:=[[210.81,1617.22,269.25],[0.0004711,-0.994856,-0.0919025,-0.0425978],[1,1,0,1],[133.161,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pInsertarCapSup:=[[176.95,1741.5,484.02],[0.00828279,-0.987636,-0.0915161,-0.127012],[1,1,0,1],[133,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pMordazaCapInf:=[[254.49,1548.22,467.05],[0.996287,-0.0126195,-0.010983,0.0844569],[1,1,0,1],[133.162,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pVerificaCapInf:=[[264.46,1629.23,387.53],[0.996409,-0.00503546,0.00295354,0.0844646],[1,1,0,1],[133.161,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pInsertarCapInf:=[[264.56,1689.14,516.11],[0.991569,-0.00429051,-0.0118174,0.128967],[1,1,0,1],[133.161,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pEnlaceSup:=[[-7.33,1559.12,442.05],[0.000470242,-0.994856,-0.0919041,-0.042598],[1,1,0,1],[133.161,9E+09,9E+09,9E+09,9E+09,9E+09]];
    CONST robtarget pEnlaceInf:=[[36.49,1567.79,406.34],[0.992559,-0.0121839,0.0875337,0.0837637],[1,1,0,1],[133.161,9E+09,9E+09,9E+09,9E+09,9E+09]];
        !
    ! Datos numéricos:
    VAR num nteclas:=0;
    VAR num nDif_pos:=0;
    VAR num nDif_pos1:=0;
    VAR num nDif_pos2:=0;
    VAR num nDif_pos3:=0;
    VAR num n_Tiempo_ciclo:=0;
    VAR num N_Intentos:=0;
    VAR num N_ContF:=0;
    !
    ! Variables booleanas:
    PERS bool Check_home_pos:=TRUE;
    PERS bool b_robot6_home:=TRUE;
    PERS bool b_ver_t_ciclo:=TRUE;
    PERS bool b_cycle_start:=FALSE;
    PERS bool cnt_clean:=TRUE;
    PERS bool b_presencia_cap1:=TRUE;
    PERS bool b_presencia_cap2:=TRUE;
    VAR bool b_chg_dress_tip:=FALSE;
    VAR bool b_CambCaps:=FALSE;
    VAR bool b_robot1_home:=FALSE;
    VAR bool b_cond_ini:=FALSE;
    VAR bool b_reposo_robot:=FALSE;
    VAR bool b_fallo_sold:=FALSE;
  !
    ! Bool para activar fresado
    PERS bool b_cambio_elec1:=FALSE;
    PERS bool b_libera_fresa:=TRUE;
    PERS bool b_libera_robot:=TRUE;
    PERS bool b_cambio_prensa:=FALSE;
    !
    ! Variables de pantalla:
    VAR errnum err_var_s5;
    !	
    ! Variables :
    VAR clock ck_Tiempo_ciclo;
    VAR btnres nteclas_s5;
    VAR string estado_s5;
    VAR string tiempo_ciclo_s5;
    VAR shapedata joint_space;
    VAR wztemporary wzhome1:=[0];
    VAR wzstationary wz_home:=[0];
    VAR jointtarget jposActual_rob:=[[0,0,0,0,0,0],[120,9E+09,9E+09,9E+09,9E+09,9E+09]];
    !
    ! Datos fuerza:
    PERS forcedata cap_nuevo:=[1,1];
    PERS forcedata coger_cap:=[1,1];
    PERS forcedata fresa:=[1,1];
    PERS forcedata fresado_new:=[1,1];
    !
    !-----------------------------------------------
    !Spotdata RA696
    PERS spotdata RA696SOLD010:=[1,1];
    PERS spotdata RA696SOLD012:=[1,1];
    
    !
	!CALIBRACIÓN
	PERS spotdata Spot_Calibracion:=[1,1];
    !
    CONST buttondata btnSiNo:=4;
    !
ENDMODULE

