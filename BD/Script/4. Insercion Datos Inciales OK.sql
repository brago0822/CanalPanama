-----------------------------------------------------------------------------------------
------- INSERCIÓN DE DATOS DE PERSONA
-----------------------------------------------------------------------------------------
INSERT INTO "Persona" (k_id_persona,n_nombres,n_apellidos,f_nacimiento,k_tipo_identificacion,k_num_identificacion,n_genero)
VALUES (1,'Brayan','Esguerra',TO_DATE('10/06/1994','DD/MM/YYYY'),'CC',1012411340,'M');
INSERT INTO "Persona" (k_id_persona,n_nombres,n_apellidos,f_nacimiento,k_tipo_identificacion,k_num_identificacion,n_genero)
VALUES (2,'Juan','Perez',TO_DATE('10/03/1980','DD/MM/YYYY'),'CC',11111111,'M');
INSERT INTO "Persona" (k_id_persona,n_nombres,n_apellidos,f_nacimiento,k_tipo_identificacion,k_num_identificacion,n_genero)
VALUES (3,'Carlos','Quintero',TO_DATE('15/03/1970','DD/MM/YYYY'),'CC',22222222,'M');
INSERT INTO "Persona" (k_id_persona,n_nombres,n_apellidos,f_nacimiento,k_tipo_identificacion,k_num_identificacion,n_genero)
VALUES (4,'María','Ruiz',TO_DATE('15/03/1975','DD/MM/YYYY'),'CC',33333333,'F');
-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN COMPANIA
-----------------------------------------------------------------------------------------
INSERT INTO "Compania" (k_id_cliente, n_cod_cliente, n_nombre,q_telefono,n_direccion,n_pais,n_nit)
VALUES (1,'CLI-11111','BUQUES CARIBE',5555555,'CLL','COLOMBIA',12222222);
INSERT INTO "Compania" (k_id_cliente, n_cod_cliente, n_nombre,q_telefono,n_direccion,n_pais,n_nit)
VALUES (2,'CLI-22222','BUQUES HORIZONTE',5555551,'CLL','JAPÓN',13333333);
INSERT INTO "Compania" (k_id_cliente, n_cod_cliente, n_nombre,q_telefono,n_direccion,n_pais,n_nit)
VALUES (3,'CLI-33333','BUQUES ATLANTICO',5555552,'CLL','ESPAÑA',14444444);
INSERT INTO "Compania" (k_id_cliente, n_cod_cliente, n_nombre,q_telefono,n_direccion,n_pais,n_nit)
VALUES (4,'CLI-44444','BUQUES EUROPA',5555553,'CLL','FRANCIA',15555555);

--REQUISITOS: SE NECESITA ID_COMPANIA, ID_PERSONA
INSERT INTO "Agente" (k_id_agente,k_id_compania,k_id_persona)
VALUES (1,1,1);
INSERT INTO "Agente" (k_id_agente,k_id_compania,k_id_persona)
VALUES (2,2,2);
INSERT INTO "Agente" (k_id_agente,k_id_compania,k_id_persona)
VALUES (3,3,3);
INSERT INTO "Agente" (k_id_agente,k_id_compania,k_id_persona)
VALUES (4,4,4);

-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN TIPOBUQUE
-----------------------------------------------------------------------------------------
INSERT INTO "TipoBuque" ("k_id", "n_tipo",v_bean_min,v_bean_max, v_length_min,v_length_max)
VALUES (1,'Neopanamax',107,200,966,1000);
INSERT INTO "TipoBuque" ("k_id", "n_tipo",v_bean_min,v_bean_max, v_length_min,v_length_max)
VALUES (2,'Super',91,106.99,1,965.99);
INSERT INTO "TipoBuque" ("k_id", "n_tipo",v_bean_min,v_bean_max, v_length_min,v_length_max)
VALUES (3,'Regular',1,90.99,1,2);

-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN TIPOCARGA
-----------------------------------------------------------------------------------------
INSERT INTO "TipoCarga" (k_tipo_carga, n_nombre,n_descripcion) 
VALUES (1, 'Comercial','Tipo de Buque Comercial');
INSERT INTO "TipoCarga" (k_tipo_carga, n_nombre,n_descripcion) 
VALUES (2, 'Portacontenedores','Tipo de Buque Portacontenedores');
INSERT INTO "TipoCarga" (k_tipo_carga, n_nombre,n_descripcion) 
VALUES (3, 'Portavehiculos','Tipo de Buque Portavehiculos');
INSERT INTO "TipoCarga" (k_tipo_carga, n_nombre,n_descripcion) 
VALUES (4, 'Granelero','Tipo de Buque Granelero');
INSERT INTO "TipoCarga" (k_tipo_carga, n_nombre,n_descripcion) 
VALUES (5, 'Granelero liquido','Tipo de Buque Granelero liquido');

-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN BUQUE
--      REQUISITOS: TIPOCARGA, TIPOBUQUE
-----------------------------------------------------------------------------------------
INSERT INTO "Buque" (k_num_serie, k_tipo_carga, k_tipo_buque, v_beam, v_loa, v_carga_max) 
VALUES (1,4,1,107,966,20000);
INSERT INTO "Buque" (k_num_serie, k_tipo_carga, k_tipo_buque, v_beam, v_loa, v_carga_max) 
VALUES (2,4,2,100,900,10000);
INSERT INTO "Buque" (k_num_serie, k_tipo_carga, k_tipo_buque, v_beam, v_loa, v_carga_max) 
VALUES (3,4,3,80,500,5000);
-----------------------------------------------------------------------------------------
------ INSERCIÓN DE DATOS EN CUPO
-----------------------------------------------------------------------------------------
INSERT INTO "Cupo" (k_cupo, n_tipo_esclusa,n_sentido,f_cupo) 
VALUES (1,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'));
INSERT INTO "Cupo" (k_cupo, n_tipo_esclusa,n_sentido,f_cupo) 
VALUES (2,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'));
INSERT INTO "Cupo" (k_cupo, n_tipo_esclusa,n_sentido,f_cupo) 
VALUES (3,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'));
INSERT INTO "Cupo" (k_cupo, n_tipo_esclusa,n_sentido,f_cupo) 
VALUES (4,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'));
INSERT INTO "Cupo" (k_cupo, n_tipo_esclusa,n_sentido,f_cupo) 
VALUES (5,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'));
INSERT INTO "Cupo" (k_cupo, n_tipo_esclusa,n_sentido,f_cupo) 
VALUES (6,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'));
INSERT INTO "Cupo" (k_cupo, n_tipo_esclusa,n_sentido,f_cupo) 
VALUES (7,'NEOPANAMAX','NORTE',TO_DATE('10/06/2019','DD/MM/YYYY'));
