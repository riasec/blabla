program piletest;
{GROUPE 1 : BOUMEHDI Ahmed-Sami, KODAIS-LOQUET Victor, LEMAIRE Erik}

type
  t_pt_liste = ^t_liste;
  t_liste = record
    data: integer;
    suivant: t_pt_liste;
  end;
                      //blabla

function estVide(liste:t_pt_liste) : boolean;
begin
     estVide:=(liste=nil);
end;

procedure empiler(var liste: t_pt_liste; data: integer);
var
  p: t_pt_liste;
begin
    new(p);
    p^.data := data;
    p^.suivant := liste;
    liste := p;
end;


procedure depiler(var liste:t_pt_liste);
var
    p, pt_cour: t_pt_liste;
begin
  if (estVide(liste)=false) then
  begin
    p := liste;
    pt_cour := p^.suivant;
    dispose(p);
    p := pt_cour;
    liste:=p;
    writeln('Fait!');
  end;
  if (estVide(liste)=true) then
     writeln('Impossible de depiler, la pile est vide');
end;

procedure afficher(liste: t_pt_liste);
var
  p: t_pt_liste;
begin
  if (liste=nil) then writeln('Pile vide.');
  p := liste;
  while p <> nil do
  begin
    writeln(p^.data);
    p := p^.suivant;
  end;
end;

procedure vider(liste: t_pt_liste);
var
  p, r: t_pt_liste;
begin
  p := liste;
  while (p <> nil) do
  begin
    r := p^.suivant;
    dispose(p);
    p := r;
  end;
end;

var
  pile : t_pt_liste;
  nombre: integer;

begin
  writeln('----- La pile est-elle vide?');
  writeln(estVide(pile));

  writeln('----- Valeurs de la liste? (entrer 12321 pour stopper la saisie)');
  readln(nombre);
  while (nombre <> 12321) do
  begin
    empiler(pile, nombre);
    readln(nombre);
  end;
  writeln('----- Affichage : ');
  afficher(pile);
  writeln('----- La pile est-elle encore vide?');
  writeln(estVide(pile));
  write('----- Depilement d''un element : ');
  depiler(pile);
  writeln('----- Affichage : ');
  afficher(pile);
  writeln('----- Fin du prog');
  readln;
  vider(pile);
end.
