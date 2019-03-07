-----------------------------------------------------------------------------------------
------- INSERCIÓN DE DATOS DE PERSONA
-----------------------------------------------------------------------------------------
INSERT INTO Persona (k_id_persona,n_nombres,n_apellidos,f_nacimiento,k_tipo_identificacion,k_num_identificacion,n_genero)
VALUES (1,'Brayan','Esguerra',TO_DATE('10/06/1994','DD/MM/YYYY'),'CC',1012411340,'M');
INSERT INTO Persona (k_id_persona,n_nombres,n_apellidos,f_nacimiento,k_tipo_identificacion,k_num_identificacion,n_genero)
VALUES (2,'Juan','Perez',TO_DATE('10/03/1980','DD/MM/YYYY'),'CC',11111111,'M');
INSERT INTO Persona (k_id_persona,n_nombres,n_apellidos,f_nacimiento,k_tipo_identificacion,k_num_identificacion,n_genero)
VALUES (3,'Carlos','Quintero',TO_DATE('15/03/1970','DD/MM/YYYY'),'CC',22222222,'M');
INSERT INTO Persona (k_id_persona,n_nombres,n_apellidos,f_nacimiento,k_tipo_identificacion,k_num_identificacion,n_genero)
VALUES (4,'María','Ruiz',TO_DATE('15/03/1975','DD/MM/YYYY'),'CC',33333333,'F');
-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN COMPANIA
-----------------------------------------------------------------------------------------
INSERT INTO Compania (k_id_cliente, n_cod_cliente, n_nombre,q_telefono,n_direccion,n_pais,n_nit)
VALUES (1,'CLI-11111','BUQUES CARIBE',5555555,'CLL','COLOMBIA',12222222);
INSERT INTO Compania (k_id_cliente, n_cod_cliente, n_nombre,q_telefono,n_direccion,n_pais,n_nit)
VALUES (2,'CLI-22222','BUQUES HORIZONTE',5555551,'CLL','JAPÓN',13333333);
INSERT INTO Compania (k_id_cliente, n_cod_cliente, n_nombre,q_telefono,n_direccion,n_pais,n_nit)
VALUES (3,'CLI-33333','BUQUES ATLANTICO',5555552,'CLL','ESPAÑA',14444444);
INSERT INTO Compania (k_id_cliente, n_cod_cliente, n_nombre,q_telefono,n_direccion,n_pais,n_nit)
VALUES (4,'CLI-44444','BUQUES EUROPA',5555553,'CLL','FRANCIA',15555555);

-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN AGENTE
--REQUISITOS: SE NECESITA ID_COMPANIA, ID_PERSONA
-----------------------------------------------------------------------------------------
INSERT INTO Agente (k_id_agente,k_id_compania,k_id_persona)
VALUES (1,1,1);
INSERT INTO Agente (k_id_agente,k_id_compania,k_id_persona)
VALUES (2,2,2);
INSERT INTO Agente (k_id_agente,k_id_compania,k_id_persona)
VALUES (3,3,3);
INSERT INTO Agente (k_id_agente,k_id_compania,k_id_persona)
VALUES (4,4,4);

-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN TIPOBUQUE
-----------------------------------------------------------------------------------------
INSERT INTO TipoBuque (k_id, n_tipo,v_bean_min,v_bean_max, v_length_min,v_length_max)
VALUES (1,'Neopanamax',107,200,966,1000);
INSERT INTO TipoBuque (k_id, n_tipo,v_bean_min,v_bean_max, v_length_min,v_length_max)
VALUES (2,'Super',91,106.99,1,965.99);
INSERT INTO TipoBuque (k_id, n_tipo,v_bean_min,v_bean_max, v_length_min,v_length_max)
VALUES (3,'Regular',1,90.99,1,2);

-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN TIPOCARGA
-----------------------------------------------------------------------------------------
INSERT INTO TipoCarga (k_tipo_carga, n_nombre,n_descripcion) 
VALUES (1, 'Comercial','Tipo de Buque Comercial');
INSERT INTO TipoCarga (k_tipo_carga, n_nombre,n_descripcion) 
VALUES (2, 'Portacontenedores','Tipo de Buque Portacontenedores');
INSERT INTO TipoCarga (k_tipo_carga, n_nombre,n_descripcion) 
VALUES (3, 'Portavehiculos','Tipo de Buque Portavehiculos');
INSERT INTO TipoCarga (k_tipo_carga, n_nombre,n_descripcion) 
VALUES (4, 'Granelero','Tipo de Buque Granelero');
INSERT INTO TipoCarga (k_tipo_carga, n_nombre,n_descripcion) 
VALUES (5, 'Granelero liquido','Tipo de Buque Granelero liquido');

-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN BUQUE
--      REQUISITOS: TIPOCARGA, TIPOBUQUE
-----------------------------------------------------------------------------------------
INSERT INTO Buque (k_num_serie, k_tipo_carga, k_tipo_buque, v_beam, v_loa, v_carga_max) 
VALUES (1,4,1,107,966,20000);
INSERT INTO Buque (k_num_serie, k_tipo_carga, k_tipo_buque, v_beam, v_loa, v_carga_max) 
VALUES (2,4,2,100,900,10000);
INSERT INTO Buque (k_num_serie, k_tipo_carga, k_tipo_buque, v_beam, v_loa, v_carga_max) 
VALUES (3,4,3,80,500,5000);
-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN CUPO
-----------------------------------------------------------------------------------------
INSERT INTO Cupo (k_cupo, n_tipo_esclusa,n_sentido,f_cupo,n_tipo_cupo, n_estado) 
VALUES (1,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'),'NORMAL','CREADO');
INSERT INTO Cupo (k_cupo, n_tipo_esclusa,n_sentido,f_cupo,n_tipo_cupo, n_estado) 
VALUES (2,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'),'NORMAL','CREADO');
INSERT INTO Cupo (k_cupo, n_tipo_esclusa,n_sentido,f_cupo,n_tipo_cupo, n_estado) 
VALUES (3,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'),'NORMAL','ASIGNADO');
INSERT INTO Cupo (k_cupo, n_tipo_esclusa,n_sentido,f_cupo,n_tipo_cupo, n_estado) 
VALUES (4,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'),'NORMAL','ASIGNADO');
INSERT INTO Cupo (k_cupo, n_tipo_esclusa,n_sentido,f_cupo,n_tipo_cupo, n_estado) 
VALUES (5,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'),'NORMAL','CREADO');
INSERT INTO Cupo (k_cupo, n_tipo_esclusa,n_sentido,f_cupo,n_tipo_cupo, n_estado) 
VALUES (6,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'),'NORMAL','CREADO');
INSERT INTO Cupo (k_cupo, n_tipo_esclusa,n_sentido,f_cupo,n_tipo_cupo, n_estado) 
VALUES (7,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'),'NORMAL','CREADO');

-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN MEDIO_PAGO
-----------------------------------------------------------------------------------------
INSERT INTO medio_pago (k_medio_pago, n_nombre,n_descripcion) 
VALUES (1, 'ONLINE','Pago realizado a través de la misma aplicación');
INSERT INTO medio_pago (k_medio_pago, n_nombre,n_descripcion) 
VALUES (2, 'TARJETA DE CREDITO','Paso a traves de Tarjeta de Crédito registrada para la empresa');
INSERT INTO medio_pago (k_medio_pago, n_nombre,n_descripcion) 
VALUES (3, 'TRANSFERENCIA','Pago por tarnsferencia a través de Banco externo a la aplicación');

-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN TIPO_PARAMETRO
-----------------------------------------------------------------------------------------
INSERT INTO tipo_parametro (k_tipo_parametro, n_nombre, n_descripcion, n_sigla)
VALUES (1,'LOA','Length Over All - Eslora','LOA');
INSERT INTO tipo_parametro (k_tipo_parametro, n_nombre, n_descripcion, n_sigla)
VALUES (2,'BEAM','Ancho - Manga','BEAM');
INSERT INTO tipo_parametro (k_tipo_parametro, n_nombre, n_descripcion, n_sigla)
VALUES (3,'PORCENTAJE CARGA','Porcentaje de Carga al momento del paso con el que se establecerá una tarifa','CARG');
INSERT INTO tipo_parametro (k_tipo_parametro, n_nombre, n_descripcion, n_sigla)
VALUES (4,'CANCELACION','Parámetros para calcular tarifa de Cancelación según días de antelación en PORCENTAJE','CANC');
INSERT INTO tipo_parametro (k_tipo_parametro, n_nombre, n_descripcion, n_sigla)
VALUES (5,'PERIODO','Parámetro para establecer tarifa según días establecidos para cada período','PERI');
INSERT INTO tipo_parametro (k_tipo_parametro, n_nombre, n_descripcion, n_sigla)
VALUES (6,'CLASIFICACION BUQUE','Parámetro para establecer tarifa según Clase de Buque','CLBU');
INSERT INTO tipo_parametro (k_tipo_parametro, n_nombre, n_descripcion, n_sigla)
VALUES (7,'SUBASTA','Parámetros para tope mínimo de subastas','SUBA');
INSERT INTO tipo_parametro (k_tipo_parametro, n_nombre, n_descripcion, n_sigla)
VALUES (8,'CUPO','Parámetro para definir el máximo de cupos diarios disponibles según períodos establecidos','CUPO');

-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN PARAMETRO
--      REQUISITOS TIPO_PARAMETRO
-----------------------------------------------------------------------------------------
---***** PARAMETROS BEAM Y LOA PARA TARIFA
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (1,'BEAM1',0,79.99,2,5500,'01/01/2019','31/12/2019');
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (2,'BEAM2',80,90.99,2,10500,'01/01/2019','31/12/2019');
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (3,'BEAM3',91,107,2,25000,'01/01/2019','31/12/2019');
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (4,'BEAM4',107.01,999999,2,35000,'01/01/2019','31/12/2019');
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (5,'LOA1',0,300,1,2500,'01/01/2019','31/12/2019');
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (6,'LOA2',300.01,899.99,1,18500,'01/01/2019','31/12/2019');
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (7,'LOA3',900,966,1,35000,'01/01/2019','31/12/2019');
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (8,'LOA4',966.01,999999,1,35000,'01/01/2019','31/12/2019');
--**** PARÁMETROS CUPO
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (9,'CUPOS2019',0,0,8,8,'01/01/2019','31/12/2019');-- CUANDO NO EXISTEN UN RANGO SE DEJA EN VALOR 0 Y SÓLO SE ESTABLECE EL VALOR PARÁMETRO
--**** PARÁMETROS CANCELACIÓN
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (10,'CANCEL1',0,3.99,4,100,'01/01/2019','31/12/2019');-- VALOR EN PORCENTAJE DE MULTA POR CANCELACIÓN
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (11,'CANCEL2',4,6.99,4,80,'01/01/2019','31/12/2019');-- VALOR EN PORCENTAJE DE MULTA POR CANCELACIÓN
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (12,'CANCEL3',7,20.99,4,70,'01/01/2019','31/12/2019');-- VALOR EN PORCENTAJE DE MULTA POR CANCELACIÓN
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (13,'CANCEL4',21,89.99,4,60,'01/01/2019','31/12/2019');-- VALOR EN PORCENTAJE DE MULTA POR CANCELACIÓN
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (14,'CANCEL5',90,179.99,4,50,'01/01/2019','31/12/2019');-- VALOR EN PORCENTAJE DE MULTA POR CANCELACIÓN
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (15,'CANCEL6',180,364.99,4,20,'01/01/2019','31/12/2019');-- VALOR EN PORCENTAJE DE MULTA POR CANCELACIÓN
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (16,'CANCEL7',365,999999,4,10,'01/01/2019','31/12/2019');-- VALOR EN PORCENTAJE DE MULTA POR CANCELACIÓN
-- **** PARAMETROS SUBASTA
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (17,'SUBASTA_NEOPANAMAX',0,0,7,50000,'01/01/2019','31/12/2019');-- VALOR EN DOLARES PARA TOPE MÍNIMO
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (18,'SUBASTA_SUPER',0,0,7,35000,'01/01/2019','31/12/2019');-- VALOR EN DOLARES PARA TOPE MÍNIMO
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (19,'SUBASTA_REGULAR',0,0,7,15000,'01/01/2019','31/12/2019');-- VALOR EN DOLARES PARA TOPE MÍNIMO
-- *** PARAMETROS PERIODO
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (20,'PERIODO 1',1,1,5,5000,'01/01/2019','31/12/2019');-- VALOR EN DOLARES PARA TOPE MÍNIMO
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (21,'PERIODO 2',2,2,5,4000,'01/01/2019','31/12/2019');-- VALOR EN DOLARES PARA TOPE MÍNIMO
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (22,'PERIODO 3',3,3,5,3000,'01/01/2019','31/12/2019');-- VALOR EN DOLARES PARA TOPE MÍNIMO
INSERT INTO parametro (k_parametro,n_nombre,v_rango_ini,v_rango_fin, k_tipo_parametro, v_valor_parametro, f_vigencia_ini,f_vigencia_fin)
VALUES (23,'PERIODO ESPECIAL',4,4,5,2000,'01/01/2019','31/12/2019');-- VALOR EN DOLARES PARA TOPE MÍNIMO


----- INSERCIÓN DE DATOS DE PERÍODOS
INSERT INTO periodo (k_id_periodo,n_nombre,v_dias_antes_min,v_dias_antes_max,n_descripcion)
VALUES (1,'PERIODO 1',22,365,'PERIODO NORMAL');
INSERT INTO periodo (k_id_periodo,n_nombre,v_dias_antes_min,v_dias_antes_max,n_descripcion)
VALUES (2,'PERIODO 2',4,21,'PERIODO NORMAL');
INSERT INTO periodo (k_id_periodo,n_nombre,v_dias_antes_min,v_dias_antes_max,n_descripcion)
VALUES (3,'PERIODO 3',2,3,'PERIODO NORMAL');
INSERT INTO periodo (k_id_periodo,n_nombre,v_dias_antes_min,v_dias_antes_max,n_descripcion)
VALUES (4,'PERIODO ESPECIAL',366,730,'PERIODO ESPECIAL, PARA COMERCIALES, PASAJEROS');
----------------------------------------------------------------------
--- INSERCIÓN DE DATOS DE RESERVA DE PRUEBA
---- rqeuisitos: PERIODO, BUQUE, AGENTE, CUPO
----------------------------------------------------------------------
INSERT INTO reserva (k_reserva,n_cod_cliente, k_id_buque,f_reserva,k_cupo, k_agente, k_periodo, i_estado, n_usuario_modifica_estado,f_fecha_modifica_estado)
     VALUES (1,'CODCLIE1', 1, SYSDATE, 1,1,1,'PENDIENTE',NULL,NULL);
INSERT INTO reserva (k_reserva,n_cod_cliente, k_id_buque,f_reserva,k_cupo, k_agente, k_periodo, i_estado, n_usuario_modifica_estado,f_fecha_modifica_estado)
     VALUES (2,'CODCLIE1', 1, SYSDATE, 2,1,1,'CANCELADA',NULL,NULL);
INSERT INTO reserva (k_reserva,n_cod_cliente, k_id_buque,f_reserva,k_cupo, k_agente, k_periodo, i_estado, n_usuario_modifica_estado,f_fecha_modifica_estado)
     VALUES (3,'CODCLIE1', 1, SYSDATE, 3,2,1,'FINALIZADA',NULL,NULL);
INSERT INTO reserva (k_reserva,n_cod_cliente, k_id_buque,f_reserva,k_cupo, k_agente, k_periodo, i_estado, n_usuario_modifica_estado,f_fecha_modifica_estado)
     VALUES (4,'CODCLIE1', 1, SYSDATE, 4,2,1,'PAGADA',NULL,NULL);

-----------------------------------------------------------------------
--- INSERCIÓN DATOS DE CANCELACION_RESERVA 
-----------------------------------------------------------------------
INSERT INTO cancelacion_reserva (k_cancelacion, f_cancelacion, v_dias_antelacion, id_agente, k_reserva) 
VALUES (1, SYSDATE, 120, 1, 2);
------------------------------------------------------------------
-- INSERCIÓN DE DATOS EN TIPO_TARIFA
INSERT INTO tipo_tarifa ( k_tipo_tarifa, n_nombre_tarifa, n_descripcion)
VALUES (1,'TARIFA RESERVA','TARIFA GENERADA AL REALIZAR UNA RESERVA');
INSERT INTO tipo_tarifa ( k_tipo_tarifa, n_nombre_tarifa, n_descripcion)
VALUES (2,'TARIFA CANCELACION','TARIFA GENERADA AL CANCELAR UNA RESERVA');
INSERT INTO tipo_tarifa ( k_tipo_tarifa, n_nombre_tarifa, n_descripcion)
VALUES (3,'TARIFA PASO','TARIFA GENERADA AL REALIZAR EL PASO EN TIEMO REAL POR EL CANAL');
------------------------------------------------------------------
-----------------------------------------------------------------------
----- INSERCIÓN DE DATOS EN TARIFA
---- REQUISITOS SERVICIO_COBRADO
-----------------------------------------------------------------------SELECT * FROM TARIFA;
INSERT INTO tarifa (k_tarifa,v_valor_tarifa, f_calculo, k_tipo_tarifa, n_usuario_modifica, f_fecha_modifica,k_reserva,k_paso,k_cancelacion)
VALUES (1,17500,SYSDATE,1,NULL,NULL,1,NULL,NULL);
INSERT INTO tarifa (k_tarifa,v_valor_tarifa, f_calculo, k_tipo_tarifa, n_usuario_modifica, f_fecha_modifica,k_reserva,k_paso,k_cancelacion)
VALUES (2,60000,SYSDATE,2,NULL,NULL,NULL,NULL,2);

-----------------------------------------------------------------------
------ INSERCIÓN DATOS DETALLE_TARIFA
--- REQUISITOS: TARIFA Y PARAMETRO
-----------------------------------------------------------------------
--** DETALLE DE LA CANCELACIÓN 1
INSERT INTO detalle_tarifa ( k_detalle_tarifa, k_tarifa, k_parametro) 
VALUES (1,1,14);

--** DETALLE DE LA RESERVA 1
INSERT INTO detalle_tarifa ( k_detalle_tarifa, k_tarifa, k_parametro) 
VALUES (2,2,3); --TARIFA PARA PARÁMETRO BEAM3
INSERT INTO detalle_tarifa ( k_detalle_tarifa, k_tarifa, k_parametro) 
VALUES (3,2,7);-- TARIFA PARA PARÁMETRO LOA3


