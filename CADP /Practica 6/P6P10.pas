{Codigo entre llaves estaba para debuggear jejoxx}
Program diez;

type 

cliente = record
	dni: integer;
	nro: integer;
	end;

lista = ^nodo;

nodo = record
	el: cliente;
	sig: lista;
	end;
	
//recordar que para inicializar lista y arrancar todo bien pri:=nil y ult:=pri
// Al agregar el primer nodo nos queda pri:= nuevo y ult := pri y asi enganchar bien todo a partir del 2do nodo que se agrega.
//Ya al invocar el proceso una segunda vez (pa agregar un segundo nodo) queda pri:=PrimerNodo (ya fijado) y ult:=nuevo (lo que se hace en el else)
// y asi hasta que dejemos de invocar el proceso...
procedure RecibirCliente(var pri, ult: lista; dni: integer); 
Var nuevo: lista;
begin
	new(nuevo); nuevo^.el.dni := dni; nuevo^.sig := nil;
	writeln('Arranco a agregar');
	if (pri = nil) then begin
		nuevo^.el.nro := 1; pri:= nuevo; 
		end
	else begin
		nuevo^.el.nro := ult^.el.nro + 1;
		ult^.sig := nuevo;
		end;
	ult:= nuevo;
end;

procedure cargarL(var pri, ult: lista);
Var dni: integer;
begin
	writeln('meter dni:');
	readln(dni);
	while (dni <> 0) do begin
		RecibirCliente(pri, ult, dni);
		writeln('meter otro dni:');
		read(dni);
		end;
end;

//Aca no necesito conocer el ultimo, solo el primero para retornar lo que me piden y borrarlo de la lista.
procedure AtenderCliente(var pri: lista);
Var aux: lista;
begin
	writeln('nro cliente a ser atendido:',pri^.el.nro);
	writeln('dni cliente a ser atendido:',pri^.el.dni);
	
	//El caso donde la lista ya esta vacia lo filtro antes de invocar el modulo
	//la lista tiene solo un nodo, tengo que borrar el primero/ultimo que tiene	
	if (pri^.sig = nil) then begin 
		dispose(pri);
		pri := nil;
		end
	{la lista tiene mas de un nodo.
	Me guardo la direccion del segundo.
	borro lo que habia en el primero.
	Ahora el primero de la lista es el segundo de antes!}
	else begin
		aux := pri^.sig;
		dispose(pri);
		pri := aux;
		end;
end;

{
procedure imprimirListaClientes(pri: lista);
begin
	while pri <> nil do begin
		writeln(pri^.el.dni);
		pri:=pri^.sig;
		end;
end;
}
Var pri, ult: lista;
	{s: integer;}

begin
	pri:= nil;
	
	cargarL(pri,ult);
	
	while (pri <> nil) do AtenderCliente(pri);
	
	{
	writeln('cant de clientes:', ult^.el.nro);
	imprimirListaClientes(pri);
	
	writeln('1 para borrar lista');readln(s);
	if s=1 then begin
		while (pri <> nil) do AtenderCliente(pri);
	end;
	}	
end.

