create or replace PACKAGE PK_RESERVA AS 
/* ---------
--------
Procedimientos sencillo que no generan la necesidad de agrupación dentro de un paquete completo.
--------

*/
/*--------------------------------------------------------------------------------------------
    Procedimiento que calcula la tarifa de RESERVA de un Buque según parámetros establecidos.  
    Parámetros de entrada:      pk_reserva          Id de la reserva a la cual se le va a calcular la tarifa
    Parámetros de salida:       pv_tarifa           Valor de la tarifa final calculada
                                pm_mensaje          Mensaje de información
                                pc_error            Codigo de error 1 =  Error
                                                                0 =  Si no hay error
                                pm_error        Mensaje de error correspondiente al error, null si no hay error
    Precondiciones: Se debe haber generado una reserva asociada a un cupo
    Poscondiciones: Se guarda la tarifa en la tabla TARIFA asociandola con el id de la reserva
----------------------------------------------------------------------------------------------*/
PROCEDURE PR_CALCULAR_TARIFA_RESERVA(pk_reserva         IN reserva.k_reserva%TYPE,
                                     pv_tarifa_total    OUT tarifa.v_valor_tarifa%TYPE,
                                     pm_mensaje         OUT VARCHAR2,
                                     pc_error           OUT NUMBER,
                                     pm_error           OUT VARCHAR2);
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------

/*----------------------------------------------------------------------------------------------
    Procedimiento para calcular la tarifa de CANCELACIÓN de una RESERVA según parámetros establecidos.
    Parámetros de entrada:      pk_reserva      Id de la reserva 
                                pm_mensaje      Mensaje de información    
    Parámetros de salida:       pv_tarifa       Tarifa de Cancelación calculada
                                pm_mensaje      Mensaje de información
                                pc_error        Codigo de error 1 =  Error
                                                                0 =  Si no hay error
                                pm_error        Mensaje de error correspondiente al error, null si no hay error
    Precondiciones: El código de conjunto es válido
   
----------------------------------------------------------------------------------------------*/
PROCEDURE PR_CALCULAR_TARIFA_CANCELACION(pk_reserva         IN reserva.k_reserva%TYPE,
                                         pk_agente          IN agente.k_id_agente%TYPE,
                                         pv_tarifa_total    OUT tarifa.v_valor_tarifa%TYPE,
                                         pm_mensaje         OUT VARCHAR2,
                                         pc_error           OUT NUMBER,
                                         pm_error           OUT VARCHAR2);
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------
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
                                pk_idAgente      IN agente.k_id_agente%TYPE,
                                pk_buque         IN buque.k_num_serie%TYPE,
                                pm_mensaje       OUT VARCHAR2,
                                pc_error         OUT NUMBER,
                                pm_error         OUT VARCHAR2);


END PK_RESERVA;