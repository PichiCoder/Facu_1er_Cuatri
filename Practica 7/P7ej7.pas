program P7ej7;

const
dF = 24;

type
tNotas = 1..dF;

vNotas = array[tNotas] of real;

alumno = record
	nAlu: integer;
	ape: string;
	nom: string;
	mail: string;
	ing: integer;
	egr: integer;
	notas: vNotas;
	end;
	
lista = ^nodo;

nodo = record
	dato: alumno;
	sig: lista;
	end;

procedure inicV(var v: vNotas);
var i: tNotas;
begin
	for i:=1 to dF do v[i]:=0;
end; 

procedure InsOrdEnVec(var v: vNotas; n: integer);
var i,j: tNotas;
begin
	j:=1;
	while (j<dF) and (n < v[j]) do j:= j + 1;
	
	for i:=df-1 downto j do v[i+1]:= v[i];
	
	v[j] := n;
end;

procedure leerR(var a: alumno);
var i: tNotas;
	v: vNotas;
	n: integer;
begin
	read(a.nAlu); read(a.ape); read(a.nom);
	read(a.mail); read(a.ing); read(a.egr);
	inicV(v); i:= 1;
	while (i<=dF) do begin
		read(n); //leo las notas del alumno y guardo en el vector las mayores a 4 hasta llegar a las 24 materias que aprobo!
		if (n >= 4) then begin
			InsOrdEnVec(v, n);
			i:= i +1;
		end;
	a.notas := v; //pongo el vector en el campo notas del alu actual!
end;

procedure AgrAdl(var pri: lista; r: alumno);
var nue: lista;
begin
	new(nue); nue^.dato:= r; nue^.sig:=pri; pri:= nue;
end;

procedure cargarAlus(var pri: lista);
var a: alumno;
begin
	leerR(a);
	while (a.nAlu <> -1) do begin
		AgrAdl(pri, a);
		leerR(a);
		end;
end;

Function Promedio(v: vNotas): real;
var i: tNotas;
	suma: real;
begin
	suma:=0;
	for i:= 1 to dF do suma:= suma + v[i];
	Promedio:= (suma / dF);
end;

Function Impares2012(nAlu: integer; ingreso: integer): boolean;
var dig: integer;
	ok: boolean;
begin
	ok:= True;
	if (ingreso = 2012) then begin
		while (nAlu <> 0) do begin
			dig:= nAlu mod 10;
			if (dig mod 2 <> 0) then ok:= false;
			nAlu:= nAlu DIV 10;
			end;
		end
	else ok:= false;

	Impares2012:=ok;
end;

//no olvides inic mins
procedure dosMins(a: alumno; var min1, min2: integer; var alu1, alu2: alumno);
var tiempo: integer;
begin
	tiempo:= (a.egr - a.ing);
	if (tiempo < min1) then begin
		min2:= min1; alu2:= alu1;
		min1:= tiempo; alu1:= a;
		end
	else begin
		if (tiempo < min2) then begin
			min2:= tiempo; alu2:= a;
			end;
		end;
end;

procedure ProcesarEInformar(pri: lista);
var cant2012Imp, min1, min2: integer;
	alu1, alu2: alumno;
begin
	cant2012Imp:=0; min1:= 999; min2:= 999;
	while (pri <> nil) do begin
		writeln('promedio:', Promedio(pri^.dato.notas)); //2.a.
		if (Impares2012(pri^.dato.nAlu, pri^.dato.ing)) then cant2012Imp:= cant2012Imp + 1;
		dosMins(pri^.dato, min1, min2, alu1, alu2);
		pri:= pri^.sig;
		end;
	writeln('egresados 2012 nAlu impares', cant2012Imp); //2.b.
	writeln('alus con mejor tiempo de recibida', alu1.ape, alu1.nom, alu1.mail, alu2.ape, alu2.nom, alu2.mail); //2.c.
		
end;

//recordar lectura de n antes de invocar el modulo
procedure ElimAlumno(var pri: lista; n: integer; var ok: boolean);
var ant, act: lista;
begin
	ant:= pri; act:= pri;
	ok:= false;
	while (act<>nil) and (act^.dato.nAlu <> n) do begin
		ant:= act;
		act:= act^.sig;
		end;
		
	if (act <> nil) and (act^.dato.nAlu = n) then begin
		if (ant = act) then begin
			pri:= pri^.sig;
			end
		else begin
			ant^.sig:= act^.sig; 
			end;
		dispose(act);
		ok:= true;
		end;
end;

Var pri: lista;
	n: integer;
	ok: boolean;
	
BEGIN
	pri:= nil; cargarAlus(pri);
	ProcesarEInformar(pri); // 2.
	
	readln(n);
	ElimAlumno(pri, n, ok); // 3.
	
END.

