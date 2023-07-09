program doce;
type
disp = record
	ver: real;
	tam: real;
	ram: real;
	end;

lista = ^nodo;

nodo = record
	el: disp;
	sig: lista;
	end;

function mem_3gb_pant_5(r: disp): boolean;
var ok: boolean;
begin
	ok:=false;
	if (r.ram > 3) and (r.tam > 5) then ok:= true; 
	mem_3gb_pant_5 := ok;
end;

procedure procLista(pri: lista);
var tamProm, sumaTams, version: real;
	cantVer, cantMas3gbMax5pul, cantDisp: integer;
begin
	cantMas3gbMax5pul:=0; cantDisp:=0; sumaTams:= 0;
	
	//recorrer la lista para procesar todo.
	while (pri<>nil) do begin
		version := pri^.el.ver; cantVer:=0; 
		while (pri<>nil) and (pri^.el.ver = version) do begin
			cantVer := cantVer + 1;
			cantDisp := cantDisp + 1;
			sumaTams := sumaTams + pri^.el.tam;
			if mem_3gb_pant_5(pri^.el) then cantMas3gbMax5pul:= cantMas3gbMax5pul + 1;
			pri := pri^.sig;
			end;
		writeln(cantVer,' dispositivos de la version: ', version); //a)
		end;
	writeln(cantMas3gbMax5pul); //b)
	tamProm := sumaTams / cantDisp;
	writeln(tamProm); //c)
			
end;

var pri: lista;
begin
{lecturaycarga(pri);//dispuesto segun el ejercicio.
procLista(pri);}

end.
