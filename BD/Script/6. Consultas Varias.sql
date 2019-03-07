
--LISTADO DE CUPOS DISPONIBLES CUALQUIER DIA

SELECT * FROM CUPO WHERE n_estado = 'CREADO';


SELECT TARI.K_RESERVA ID_SERVICIO, TARI.V_VALOR_TARIFA TARIFA, tita.n_nombre_tarifa SERVICIO
  FROM TARIFA TARI
  JOIN TIPO_TARIFA TITA ON tita.k_tipo_tarifa = tari.k_tipo_tarifa
  AND tari.k_tipo_tarifa = 1
UNION ALL
SELECT TARI.K_CANCELACION ID_SERVICIO, TARI.V_VALOR_TARIFA TARIFA , tita.n_nombre_tarifa SERVICIO
  FROM TARIFA TARI
  JOIN TIPO_TARIFA TITA ON tita.k_tipo_tarifa = tari.k_tipo_tarifa
  AND tari.k_tipo_tarifa = 2
UNION ALL
SELECT TARI.K_PASO ID_SERVICIO, TARI.V_VALOR_TARIFA TARIFA, tita.n_nombre_tarifa SERVICIO
  FROM TARIFA TARI
  JOIN TIPO_TARIFA TITA ON tita.k_tipo_tarifa = tari.k_tipo_tarifa
  AND tari.k_tipo_tarifa = 3;