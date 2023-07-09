program P7ej8;

type
codMotivo = 1..7;

fecha = record
	dia: integer;
	mes: 1..12;
	anio: 1900..2023;
	end;
	
hora = record
	horas: 0..23;
	minutos: 0..59;
	segundos: 0..59;
	end;

transferencia = record
	nroOrigen: integer;
	DNItitOrigen: integer;
	nroDest: integer;
	DNItitDestino: integer;
	fech: fecha;
	hor: hora;
	monto: real;
	cod: codMotivo;
	end;
	
lista = ^nodo;

nodo = record
	dato: transferencia;
	sig: lista;
	end;	
	
contador = array[codMotivo] of integer;

{siguientes 4 modulos ya dispuestos para cargar la lista de transferencias que no posee un orden}

{inicializar pri en el ppal!!!}
procedure leerHora(var h: hora);
begin
end;
procedure leerFecha(var f: fecha);
begin
end;
procedure leerTransf(var t: transferencia);
begin
end;
procedure cargarTransf(var pri: lista);
begin
end;



BEGIN
	
	
END.

