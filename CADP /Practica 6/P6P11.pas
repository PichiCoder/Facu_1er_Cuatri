Program once;

type

egresado = record
	nalu: integer;
	prom: real;
	ape: string;
	end;
	
lista = ^nodo;

nodo = record
	el: egresado;
	sig: lista;
	end;
	
vector = array [1..10] of egresado;

procedure leerR(var r: egresado);
begin
	read(r.ape); read(r.prom); read(r.nalu);
end;
	
procedure agrAdel(var pri: lista; r: egresado);
var nue: lista;
begin
	new(nue); nue^.el := r; nue^.sig := pri; pri:=nue;
end;

procedure cargarL(var pri:lista);
var r: egresado;
begin
	leerR(r);
	while r.nalu <> 0 do begin
		agrAdel(pri, r);
		leerR(r);
		end;
end;

procedure inicV(var v: vector);
var i: integer;
begin
	for i:=1 to 10 do v[i].nalu := 0;
end;

procedure insOrdEnV(var v: vector; r: egresado);
var i,j:integer;
begin
	i:=0;
	while (i<=10) and (r.prom<v[i].prom) do i:=i+1;
	//si i<=10, se que el prom del egresado entra en el top 10 actual (ascendente) y ese i es la posicion donde tengo que insertarlo.
	//Pero antes tengo que hacer el corrimiento en el vector de los valores que ya estaban guardados en el !
	if i<=10 then begin
		for j:=10 downto i do begin 
			v[i+1]:=v[i]; 
			end;
		v[i]:=r;
		end;
end;

procedure bestTen(pri: lista; var v: vector);
begin
	inicV(v);
	{la lista la recorro entera...}
	while pri<>nil do begin
		insOrdEnV(v, pri^.el);
		pri:= pri^.sig;	
		end;
end;

procedure imprimirVector(v: vector);
var i:integer;
begin
	for i:=1 to 10 do writeln(v[i].ape ,v[i].nalu);
end;


var l: lista;
	v: vector;

begin
	l:= nil;
	cargarL(l);
	bestTen(l, v);
	imprimirVector(v);

end.















