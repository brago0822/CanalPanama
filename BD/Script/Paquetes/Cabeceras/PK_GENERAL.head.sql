create or replace PACKAGE PK_GENERAL AS 
/* ---------
--------
Procedimientos sencillo que no generan la necesidad de agrupación dentro de un paquete completo.
--------

*/
/*--------------------------------------------------------------------------------------------
 PROCEDIMIENTO que calcula la tarifa de una reserva   
    Parámetros de entrada:      pk_reserva          Id de la reserva a la cual se le va a calcular la tarifa
    Parámetros de salida:       pc_error        Codigo de error 1 =  Error
                                                                0 =  Si no hay error
                                pm_error        Mensaje de error correspondiente al error, null si no hay error
    Precondiciones: Se debe haber generado una reserva asociada a un cupo
    Poscondiciones: Se guarda la tarifa en la tabla TARIFA asociandola con el id de la reserva
----------------------------------------------------------------------------------------------*/
PROCEDURE PR_CALCULAR_TARIFA_RESERVA(pk_reserva     IN reserva.k_reserva%TYPE,
                                    pc_error         OUT NUMBER,
                                    pm_error         OUT VARCHAR);
                            

/*------
    Procedimiento para calcular la tarifa de paso de un Buque en tiempo real.
    Parámetros de entrada:      pk_conjunto     Cod. de Conjunto
    Parámetros de salida:       pc_error        Codigo de error 1 =  Error
                                                                0 =  Si no hay error
                                pm_error        Mensaje de error correspondiente al error, null si no hay error
    Precondiciones: El código de conjunto es válido
   
----------------------------------------------------------------------------------------------*/
PROCEDURE PR_PROYECTAR_CUENTAS_COBRO(pk_conjunto      IN apartamento.k_conjunto%TYPE,
                                     pc_error         OUT NUMBER,
                                     pm_error         OUT VARCHAR);



END PK_GENERAL;