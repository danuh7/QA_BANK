
-- INNER JOIN QUE DEVUELVE DATOS PERSONALES DE UN CLIENTE EN ESPECIFICO
select primer_nombre, segundo_nombre, apellido_paterno, apellido_materno from cliente 
INNER JOIN cuenta on cliente.id_cliente = cuenta.id_cliente;

-- INNER JOIN QUE DEVUELVE EL TIPO DE CUENTA Y EL BANCO
select tipo_cuenta.nombre, banco.nombre from cuenta 
INNER JOIN tipo_cuenta on tipo_cuenta.id_tipo_cuenta = cuenta.id_tipo_cuenta 
INNER JOIN banco on banco.id_banco = cuenta.id_banco;

-- INNER JOIN QUE DEVUELVE EL TIPO DE OPERAICON Y LA FORMA DE PAGO
select tipo_operacion.nombre, forma_pago.nombre from operacion
INNER JOIN tipo_operacion on tipo_operacion.id_tipo = operacion.id_tipo_operacion 
INNER JOIN
forma_pago on
forma_pago.id_forma = operacion.id_forma;


-- INNE RJOIN QUE DEVUELVE FECHA, HORA Y CANTIDAD, IDEAL PARA SIMULA RUN TICKET DE BANCO

SELECT fecha, hora, monto, id_operacion FROM operacion;
