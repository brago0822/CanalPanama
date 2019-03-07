--- 1. LISTADO DE RESERVAS
CREATE OR REPLACE FORCE VIEW V_LISTADO_RESERVAS (CODIGO_CLIENTE, FECHA_RESERVA_REALIZADA, FECHA_FUTURO_PASO, TIPO_BUQUE, SENTIDO, PERIODO, ESTADO) AS 
SELECT rese.n_cod_cliente codigo_cliente,
       rese.f_reserva     fecha_reserva_realizada,
       cupo.f_cupo        fecha_futuro_paso,
       tibu.n_tipo        tipo_buque,
       cupo.n_sentido     sentido,
       peri.n_nombre      periodo,
       rese.i_estado      estado
  FROM RESERVA      RESE
  JOIN BUQUE        buqu on buqu.k_num_serie = rese.k_id_buque
  JOIN tipobuque    TIBU ON tibu.k_id = buqu.k_tipo_buque
  JOIN cupo         cupo ON cupo.k_cupo = rese.k_cupo
  JOIN periodo      peri ON peri.k_id_periodo = rese.k_periodo;
