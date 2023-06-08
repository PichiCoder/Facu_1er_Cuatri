program P7ej6;
type
	cats = 1..7;
	objAstr = record
		cod: integer;
		cat: cats;
		nomObj: string;
		dist: real;
		nomDes: string;
		anio: integer;
		end;
	lista = ^nodo;
	nodo = record
		dato: objAstr;
		sig: lista;
		end;
	catConteo = array[cats] of integer;

procedure leerR(var r: objAstr);
begin
	read(r.cod);read(r.cat); read(r.nomObj); read(r.dist);
	read(r.nomDes); read(r.anio);
end;

{recordar inicializar pri y ult = nil en la carga!!!}
procedure AgrAlFinal(var pri, ult: lista; r: objAstr);
var nue: lista;
begin
	new(nue); nue^.dato := r; nue^.sig := nil;
	if pri=nil then pri:=nue
	else ult^.sig:=nue;
	ult:=nue;
end;

procedure cargarL(var pri, ult: lista);
var r: objAstr;
begin
	pri:=nil; ult:=nil;
	leerR(r);
	while (r.cod <>-1) do begin
		AgrAlFinal(pri, ult, r);
		leerR(r);
		end;
end;

procedure inicV(var v: catConteo);
var i: cats;
begin
	for i:=1 to 7 do v[i]:=0;
end;

{no olvides inic maximos antes de la invocacion}
procedure MasLejanos(cod: integer; dist: real; var cod1,cod2: integer; var max1, max2: real);
begin
	if (dist > max1) then begin
		max2:= max1; cod2:= cod1; 
		max1:= dist; cod1:= cod;
		end
	else begin
		if (dist > max2) then begin
			max2:= dist; cod2:= cod;
			end;
		end;
end;

Function galileo1600(desc: string; anio: integer): boolean;
begin
	galileo1600:= (anio < 1600) and (desc = 'Galileo Galilei');
end;

Function masPares(cod: integer): boolean;
var dig, I, P: integer;
begin
	I:= 0; P:= 0;
	while (cod <> 0) do begin
		dig:= cod mod 10;
		if (dig mod 2 = 0) then P:= P + 1
		else I:= I + 1;
		cod:= cod DIV 10;
		end;
	masPares:= (P > I);
end;

procedure imprimirVecCat(v: catConteo);
var i: cats;
begin
	for i:= 1 to 7 do write('cat:',i,'observo:', v[i], 'objetos');
end;

Procedure ProcesarEInformar(pri: lista; var v: catConteo);
var 
	max1, max2: real; 
	cod1, cod2, cantGal: integer;
begin
	max1:= -1; max2:= -1; cantGal:= 0;
	inicV(v);
	while (pri <> nil) do begin
		MasLejanos(pri^.dato.cod, pri^.dato.dist, cod1, cod2, max1, max2);
		if galileo1600(pri^.dato.nomDes, pri^.dato.anio) then cantGal:= cantGal + 1;
		v[pri^.dato.cat] := v[pri^.dato.cat] + 1;
		if masPares(pri^.dato.cod) then write(pri^.dato.nomObj); // responde B.4.
		pri:= pri^.sig;
		end;
	write(cod1, cod2); // responde B.1.
	write(cantGal); // responde B.2.
	imprimirVecCat(v); // responde B.3.
end;

var pri, ult: lista;
	v: catConteo;

BEGIN
	cargarL(pri, ult);
	ProcesarEInformar(pri, v);
	
END.

