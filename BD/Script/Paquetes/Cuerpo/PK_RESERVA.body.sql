create or replace PACKAGE BODY PK_RESERVA AS
/* ---------
--------
Procedimientos sencillo que no generan la necesidad de agrupación dentro de un paquete completo.
--------

*/
/*--------------------------------------------------------------------------------------------
    Procedimiento que calcula la tarifa de RESERVA de un Buque según parámetros establecidos.  
    Parámetros de entrada:      pk_reserva          Id de la reserva a la cual se le va a calcular la tarifa
    Parámetros de salida:       pv_tarifa       Tarifa de Reserva calculada
                                pm_mensaje      Mensaje de información
                                pc_error        Codigo de error 1 =  Error
                                                                0 =  Si no hay error
                                pm_error        Mensaje de error correspondiente al error, null si no hay error
    Precondiciones: Se debe haber generado una reserva asociada a un cupo
    Poscondiciones: Se guarda la tarifa en la tabla TARIFA asociandola con el id de la reserva
----------------------------------------------------------------------------------------------*/
PROCEDURE PR_CALCULAR_TARIFA_RESERVA(pk_reserva         IN reserva.k_reserva%TYPE,
                                     pv_tarifa_total    OUT tarifa.v_valor_tarifa%TYPE,
                                     pm_mensaje         OUT VARCHAR2,
                                     pc_error           OUT NUMBER,
                                     pm_error           OUT VARCHAR2) IS 
                                     
    LK_ID_NUEVA_TARIFA  TARIFA.K_TARIFA%TYPE;
    LV_BEAM             buque.v_beam%TYPE;
    LV_LOA              buque.v_loa%TYPE;
    lf_fecha_cupo       cupo.f_cupo%TYPE;
    LK_PARAM_BEAM       parametro.k_parametro%TYPE;
    LV_TARIFA_BEAM      PARAMETRO.V_VALOR_PARAMETRO%TYPE;
    LK_PARAM_LOA        parametro.k_parametro%TYPE;
    LV_TARIFA_LOA       PARAMETRO.V_VALOR_PARAMETRO%TYPE;
    LK_PARAM_PERIODO    parametro.k_parametro%TYPE;
    LV_TARIFA_PERIODO   PARAMETRO.V_VALOR_PARAMETRO%TYPE;
    LV_ID_PERIODO       periodo.k_id_periodo%TYPE;
    LV_DIAS_ANTES_PASO  NUMBER;
    
    EX_PARAMETRO_NO_ENCONTRADO      EXCEPTION;

BEGIN
    -- LOS PARÁMETROS ASOCIADOS AL CÁLCULO DE LA TARIFA DE LA RESERVA SON LOS SIGUIENTES
    --1 LOA
    --2 BEAM
    --5 PERIODO
    --6 BUQUE
    
    -- RECIBO COMO PARÁMETRO (K_RESERVA) QUE YA DEBE ESTAR REGISTRADA
    -- SE BUSCAN LAS CARACTERÍSTICAS DEL BUQUE ASOCIADO A LA RESERVA
    PV_TARIFA_TOTAL := 0;
    
    LK_ID_NUEVA_TARIFA := SEQ_TARIFA.NEXTVAL;
    
    INSERT 
      INTO tarifa (
                    k_tarifa,
                    v_valor_tarifa,
                    f_calculo,
                    k_tipo_tarifa,
                    n_usuario_modifica,
                    f_fecha_modifica,
                    k_reserva,
                    k_paso,
                    k_cancelacion
                ) VALUES (
                    LK_ID_NUEVA_TARIFA,
                    NULL,
                    SYSDATE,
                    1,
                    NULL,
                    NULL,
                    PK_RESERVA,
                    NULL,
                    NULL
                );
    COMMIT;
    
    SELECT buqu.v_beam,
           buqu.v_loa,
           cupo.f_cupo
      INTO lv_beam,
           lv_loa,
           lf_fecha_cupo
      FROM RESERVA  RESE
      JOIN BUQUE    buqu ON buqu.k_num_serie = rese.k_id_buque
      JOIN cupo     cupo ON cupo.k_cupo      = rese.k_cupo
     WHERE rese.k_reserva = pk_reserva;
     
    -- Se obtiene el valor de la tarifa para BEAM
    SELECT k_parametro, V_VALOR_PARAMETRO
      INTO LK_PARAM_BEAM, lv_tarifa_beam
      FROM PARAMETRO
     WHERE v_rango_ini >= LV_BEAM AND LV_BEAM <= v_rango_fin
       AND k_tipo_parametro = 2 --BEAM
       ;
    -- Se inserta el valor del parámetro encontrado en DETALLE_TARIFA
    INSERT  
      INTO detalle_tarifa (k_detalle_tarifa,
                           k_tarifa,
                           k_parametro
    ) VALUES (
        SEQ_DETALLE_TARIFA.NEXTVAL,
        LK_ID_NUEVA_TARIFA,
        LK_PARAM_BEAM
    );
    COMMIT;
    -- Se obtiene el valor de la tarifa para LOA   
    SELECT k_parametro, V_VALOR_PARAMETRO
      INTO LK_PARAM_LOA,lv_tarifa_loa
      FROM PARAMETRO
     WHERE v_rango_ini >= LV_LOA AND LV_LOA <= v_rango_fin
       AND k_tipo_parametro = 1 --LOA
       ;
       
     -- Se inserta el valor del parámetro encontrado en DETALLE_TARIFA
    INSERT  
      INTO detalle_tarifa (k_detalle_tarifa,
                           k_tarifa,
                           k_parametro
    ) VALUES (
        SEQ_DETALLE_TARIFA.NEXTVAL,
        LK_ID_NUEVA_TARIFA,
        LK_PARAM_LOA
    );
    COMMIT;
    -- Se calcula la cantidad de días antes del paso
    SELECT TRUNC(TO_DATE(lf_fecha_cupo,'DD/MM/YYYY HH24:MI:SS')) - TRUNC(SYSDATE) 
      INTO lv_dias_antes_paso
      FROM DUAL;
    
    -- Se obtiene el período en el que se está realizando la reserva
    SELECT K_ID_PERIODO
      INTO LV_ID_PERIODO
      FROM PERIODO
     WHERE v_dias_antes_min <= lv_dias_antes_paso AND lv_dias_antes_paso <= v_dias_antes_max;
    
    -- Se obtiene la tarifa para el periodo correspondiente
    SELECT K_PARAMETRO, V_VALOR_PARAMETRO
      INTO LK_PARAM_PERIODO, lv_tarifa_periodo
      FROM PARAMETRO
     WHERE v_rango_ini = LV_ID_PERIODO AND LV_ID_PERIODO = v_rango_fin
       AND k_tipo_parametro = 5 --LOA
       ;
     -- Se inserta el valor del parámetro encontrado en DETALLE_TARIFA
    INSERT  
      INTO detalle_tarifa (k_detalle_tarifa,
                           k_tarifa,
                           k_parametro
    ) VALUES (
        SEQ_DETALLE_TARIFA.NEXTVAL,
        LK_ID_NUEVA_TARIFA,
        LK_PARAM_PERIODO
    );
    COMMIT;
    PV_TARIFA_TOTAL := lv_tarifa_beam + lv_tarifa_loa + lv_tarifa_periodo;
    
    --SE REALIA LA ACTUALIZACIÓN DE LA TARIFA DESPUÉS DE HABER SUMADO CADA UNA DE LAS TARIFAS INDIVIDUALES
    UPDATE TARIFA 
       SET v_valor_tarifa = PV_TARIFA_TOTAL 
     WHERE k_tarifa = LK_ID_NUEVA_TARIFA;
    
    pm_mensaje := pm_mensaje || ' -> La tarifa para la reserva ' || pk_reserva || ' ha sido generada correctamente';    

     pc_error := 0;-- Se encontró un responsable
     pm_error := NULL;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        pc_error := 1; 
        pm_error := '---> ERROR: UNO DE LOS PARÁMETROS PARA CALCULAR LA TARIFA NO FUE ENCONTRADO';
        ROLLBACK;
    --DBMS_OUTPUT.PUT_LINE('El nombre del responsable del apartamento ' ||  pk_apartamento || ' es: '||LN_NOMBRE || ' con teléfono ' || LQ_TELEFONO);
    WHEN OTHERS THEN
        pc_error := 1; 
        pm_error := '---> ERROR: Código = ' || sqlcode || '; Mensaje: ' || sqlerrm;   
        ROLLBACK;
END PR_CALCULAR_TARIFA_RESERVA;
/*--------------------------------------------------------------------------------------------
    Procedimiento que calcula la tarifa de CANCELACIÓN DE UNA RESERVA de un Buque según parámetros establecidos.  
    Parámetros de entrada:      pk_reserva          Id de la reserva a la cual se le va a calcular la tarifa
    Parámetros de salida:       pv_tarifa       Tarifa de Cancelación calculada
                                pm_mensaje      Mensaje de información
                                pc_error        Codigo de error 1 =  Error
                                                                0 =  Si no hay error
                                pm_error        Mensaje de error correspondiente al error, null si no hay error
    Precondiciones: Se debe haber generado una reserva asociada a un cupo
    Poscondiciones: Se guarda la tarifa en la tabla TARIFA asociandola con el id de la reserva
----------------------------------------------------------------------------------------------*/
PROCEDURE PR_CALCULAR_TARIFA_CANCELACION(pk_reserva         IN reserva.k_reserva%TYPE,
                                         pk_agente          IN agente.k_id_agente%TYPE,
                                         pv_tarifa_total    OUT tarifa.v_valor_tarifa%TYPE,
                                         pm_mensaje         OUT VARCHAR2,
                                         pc_error           OUT NUMBER,
                                         pm_error           OUT VARCHAR2) IS 
                                     
    LK_ID_NUEVA_TARIFA  TARIFA.K_TARIFA%TYPE;
    lf_fecha_cupo       cupo.f_cupo%TYPE;
    LV_DIAS_ANTELACION  NUMBER;
    LV_PORCENTAJE_MULTA NUMBER;
    LV_TARIFA_MULTA     tarifa.v_valor_tarifa%TYPE;
    LV_TARIFA_ORIGINAL  TARIFA.v_valor_tarifa%TYPE;
    LK_CANCELACION      cancelacion_reserva.k_cancelacion%TYPE;
    
    EX_PARAMETRO_NO_ENCONTRADO      EXCEPTION;

BEGIN
    LV_TARIFA_MULTA := 0;
    
    
    --Se busca la fecha en la que se iba a realizar el paso
    SELECT cupo.f_cupo
      INTO lf_fecha_cupo
      FROM RESERVA  RESE
      JOIN cupo     cupo ON cupo.k_cupo      = rese.k_cupo
     WHERE rese.k_reserva = pk_reserva;
     
    -- Se calcula la cantidad de día de anterioridad para la cancelación
    SELECT TRUNC(TO_DATE(lf_fecha_cupo,'DD/MM/YYYY HH24:MI:SS')) - TRUNC(SYSDATE) 
      INTO LV_DIAS_ANTELACION
      FROM DUAL;

    -- Se obtiene el valor paramétrico que indica el porcentaje de multa que se va a cobrar por la cancelación
    SELECT V_VALOR_PARAMETRO 
      INTO LV_PORCENTAJE_MULTA
      FROM PARAMETRO
     WHERE V_RANGO_INI <=  LV_DIAS_ANTELACION AND LV_DIAS_ANTELACION <= V_RANGO_FIN
       AND k_tipo_parametro = 4;-- TIPO_PARAMETRO "CANCELACIÓN"
 
    SELECT V_VALOR_TARIFA 
      INTO LV_TARIFA_ORIGINAL
      FROM TARIFA
     WHERE K_TIPO_TARIFA = 1 -- TIPO "TARIFA RESERVA"
       AND K_RESERVA = PK_RESERVA;
     
     LV_TARIFA_MULTA := LV_TARIFA_ORIGINAL * LV_PORCENTAJE_MULTA / 100;
    
    lk_cancelacion := SEQ_CANCELACION_RESERVA.NEXTVAL;
    
    INSERT 
      INTO cancelacion_reserva (
                k_cancelacion,
                f_cancelacion,
                v_dias_antelacion,
                id_agente,
                k_reserva
            ) VALUES (
                lk_cancelacion,
                SYSDATE,
                LV_DIAS_ANTELACION,
                pk_agente,
                Pk_reserva
            );
            
    COMMIT;
    LK_ID_NUEVA_TARIFA := SEQ_TARIFA.NEXTVAL;
    
    INSERT 
      INTO tarifa (
                    k_tarifa,
                    v_valor_tarifa,
                    f_calculo,
                    k_tipo_tarifa,
                    n_usuario_modifica,
                    f_fecha_modifica,
                    k_reserva,
                    k_paso,
                    k_cancelacion
                ) VALUES (
                    LK_ID_NUEVA_TARIFA,
                    LV_TARIFA_MULTA,
                    SYSDATE,
                    2,
                    NULL,
                    NULL,
                    NULL,
                    NULL,
                    LK_CANCELACION
                );
    COMMIT;
 ----------------
     pm_mensaje := pm_mensaje || ' -> La reserva ' || pk_reserva || ' ha sido CANCELADA correctamente y generada su correspondiente Multa';    

     pc_error := 0;-- Se encontró un responsable
     pm_error := NULL;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        pc_error := 1; 
        pm_error := '---> ERROR: UNO DE LOS PARÁMETROS PARA CALCULAR LA TARIFA DE CANCELACIÓN NO FUE ENCONTRADO';
        ROLLBACK;
    --DBMS_OUTPUT.PUT_LINE('El nombre del responsable del apartamento ' ||  pk_apartamento || ' es: '||LN_NOMBRE || ' con teléfono ' || LQ_TELEFONO);
    WHEN OTHERS THEN
        pc_error := 1; 
        pm_error := '---> ERROR: Código = ' || sqlcode || '; Mensaje: ' || sqlerrm;   
        ROLLBACK;
END PR_CALCULAR_TARIFA_CANCELACION;


/*----------------------------------------------------------------------------------------------
    Procedimiento para REGISTRAR una RESERVA según parámetros establecidos.
    Parámetros de entrada:      pk_cupo         Id del cupo seleccionado
                                idAgente        Id del agente que realiza la reserva
    Parámetros de salida:       pm_mensaje      Mensaje de información
                                pc_error        Codigo de error 1 =  Error
                                                                0 =  Si no hay error
                                pm_error        Mensaje de error correspondiente al error, null si no hay error
    Precondiciones: El código de conjunto es válido
   
----------------------------------------------------------------------------------------------*/
PROCEDURE PR_REGISTRAR_RESERVA( pk_cupo          IN cupo.k_cupo%TYPE,
                                idAgente         IN agente.k_id_agente%TYPE,
                                
                                pm_mensaje       OUT VARCHAR2,
                                pc_error         OUT NUMBER,
                                pm_error         OUT VARCHAR2) IS


BEGIN

END PR_REGISTRAR_RESERVA;


END PK_RESERVA;