program trece;
type

rolete = 1..4;
revistologos = 1..3600;

user = record
	mail: string;
	rol: rolete;
	revista: string;
	dias: integer;
	end;

lista = ^nodo;

nodo = record
	el: user;
	sig: lista;
	end;

users = array [revistologos] of user;
roles = array [rolete] of integer;

	
procedure insOrd(var pri: lista; u: user);
var nuevo, ant, act: lista;
begin 
	new(nuevo); nuevo^.el := u; act:= pri; ant:= pri;
	
	while (act<>nil) and (u.dias>act^.el.dias) do begin
		ant:= act;
		act := act^.sig; 
		end;	
	if (act=ant) then
		pri:=nuevo
	else 
		ant^.sig:=nuevo;
	nuevo^.sig:=act;
end;


procedure DosMasColgados(mail: string; dias: integer; var max1, max2: integer; var mail1, mail2: string);
begin
	max1:=-1; max2:=-1;
	if (dias > max1) then begin
		max2:=max1; mail2:=mail1;
		max1:= dias; mail1:= mail;
		end;
	if (dias > max2) then begin
		max2:=dias; mail2:=mail;
		end;
end;


procedure inicRoles(var v: roles);
var i: rolete;
begin 
	for i:=1 to 4 do v[i]:=0;
end;


procedure RecorrerYProcesarUsers(us: users; var pri: lista);
var i: revistologos;
	max1, max2: integer;
	mail1, mail2: string;
	rols: roles;
begin
	inicRoles(rols);
	
	for i:=1 to 3600 do begin
		rols[us[i].rol] := rols[us[i].rol] + 1; //lo q pide inciso b)
		if (us[i].revista = 'Economica') then
			insOrd(pri, us[i]); //armar lista por lo que pide a)
		DosMasColgados(us[i].mail, us[i].dias, max1, max2, mail1, mail2); 
		end;
	writeln(mail1, max1, mail2, max2);//respondo c)
end;


//inciso a) pide nombre de usuario pero eso no esta en ningun lado asique le mande mail xd
procedure imprimirEconomicos(l: lista);
begin
	while l<>nil do writeln(l^.el.mail, l^.el.dias);
end;


procedure imprimirPorRoles(v: roles);
var i: rolete;
begin
	for i:=1 to 4 do writeln('rol:', i,'tiene estos usuarios: ', v[i]);
end;


var us: users;
	r: roles;
	pri: lista;

begin
	pri:=nil;
	leerYcargarUsers(us); //se dispone segun consigna...
	RecorrerYProcesarUsers(us, pri);
	imprimirEconomicos(pri); //respondo a)
	imprimirPorRoles(r); //respondo b)
	
end.





















