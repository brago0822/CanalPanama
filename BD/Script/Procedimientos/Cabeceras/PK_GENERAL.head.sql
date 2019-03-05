create or replace PACKAGE PK_ADMHOR_ESGUERRA AS 

/*--------------------------------------------------------------------------------------------
    Procedimiento para registrar el pago asociado a una cuenta de cobro.
    Parámetros de entrada:      pk_apartamento   Num. Apartamento
                                pk_conjunto     Cod. de Conjunto
                                pk_ctacobro     Num. Cta Cobro a la que se registrará el pago
                                pv_pago         Valor pagado
                                pi_formaPago    Forma de Pago
                                pf_pago         Fecha pago
    Parámetros de salida:       pc_error        Codigo de error 1 =  Error
                                                                0 =  Si no hay error
                                pm_error        Mensaje de error correspondiente al error, null si no hay error
    Precondiciones: El valor pagado, la forma y fecha de pago son valores válidos
    Poscondiciones: Se crea un nuevo registro en la tabla Pago con código de pago igual al de la cuenta de cobro,
                    y los demás valores recibidos por parámetro
----------------------------------------------------------------------------------------------*/
PROCEDURE PR_REGISTRAR_PAGO(pk_apartamento   IN apartamento.k_apartamento%TYPE,
                            pk_conjunto      IN apartamento.k_conjunto%TYPE,
                            pk_ctacobro      IN cuentacobro.k_ctacobro%TYPE,
                            pv_pago          IN cuentacobro.v_total%TYPE,
                            pi_formaPago     IN pago.i_formapago%TYPE,
                            pf_pago          IN DATE,
                            pc_error         OUT NUMBER,
                            pm_error         OUT VARCHAR);
                            

/*------
    Procedimiento para proyectar cuenta de cobro.
    Parámetros de entrada:      pk_conjunto     Cod. de Conjunto
    Parámetros de salida:       pc_error        Codigo de error 1 =  Error
                                                                0 =  Si no hay error
                                pm_error        Mensaje de error correspondiente al error, null si no hay error
    Precondiciones: El código de conjunto es válido
   
----------------------------------------------------------------------------------------------*/
PROCEDURE PR_PROYECTAR_CUENTAS_COBRO(pk_conjunto      IN apartamento.k_conjunto%TYPE,
                                     pc_error         OUT NUMBER,
                                     pm_error         OUT VARCHAR);



END PK_ADMHOR_ESGUERRA;