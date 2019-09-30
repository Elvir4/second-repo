program List1D;

type
  list = ^tlist;
  tlist = record
    info: integer;
    next: list;
  end;
var
  first: list;
  n:byte;
procedure menu;
begin
  writeln ('1 - Add before element');
  writeln ('2 - Add after element');
  writeln ('3 - Remove element');
  writeln ('4 - Show List');
  writeln ('0 - Exit');
  writeln;
end;

function Search (key:integer):list;
var temp:list;
begin
   temp := first;
   while temp <> nil do begin
    if (temp^.info = key) then begin
      Search := temp;
      break;
    end
   else if temp = nil then result := nil
   else temp := temp^.next;
   end;
end;

function Search_before(key:integer):list;
var temp, prev :list;
begin
   prev := nil;
   temp := first;
   while temp <> nil do begin
         if temp^.info = key then begin
             result := prev;
             break;
         end
         else if temp = nil then result := nil
         else  begin
               prev := temp;
               temp := temp^.next;
         end;
   end;

end;

procedure before;
var
  temp, fin, fin2: list;
  element, element_add: integer;
begin
   if first = nil then begin
      write('Enter your FIRST element: '); readln(element_add);
      new(first);
      first^.info := element_add;
      first^.next := nil;
   end

   else begin
        write('Enter BEFORE which element you want to add: '); readln(element);
        fin := search(element);
        fin2 := search_before(element);
        if fin = nil then writeln ('WRONG ELEMENT')

        else if fin = first then begin
            write('Enter your element: '); readln(element_add);
            new(temp);
            temp^.info := element_add;
            temp^.next := first;
            first := temp;
        end

        else begin
            write('Enter your element: '); readln(element_add);
            new(temp);
            temp^.info := element_add;
            fin2^.next := temp;
            temp^.next := fin;
        end;
   end;
   writeln;
end;

procedure after;
var
  element_add, element: integer;
  temp, fin : list;
begin
   if first = nil then begin
      write('Enter your FIRST element: '); readln(element_add);
      new(first);
      first^.info := element_add;
      first^.next := nil;
   end
   else begin
        write('Enter AFTER which element you want to add: '); readln(element);
        fin := search(element);
        if fin = nil then writeln ('WRONG ELEMENT')
        else begin
             write('Enter your element: '); readln(element_add);
             new(temp);
             temp^.info := element_add;
             temp^.next := fin^.next;
             fin^.next := temp;
        end;
   end;
   writeln;
end;

procedure remove;
var element: integer;
    fin, fin2, temp :list;
begin
  if first = nil then writeln(' EMPTY ')
  else begin
      write('Which element you want remove? '); readln(element);
      fin := search(element);
      fin2 := search_before(element);
      if fin = nil then writeln(' WRONG ELEMENT ')

      else if fin = first then begin
         temp := first;
         first := fin^.next;
         dispose(temp);
      end

      else begin
         temp := fin;
         fin2^.next := fin^.next;
         dispose(temp);
      end;
  end;
  writeln;
end;

procedure show;
var temp : list;
begin
   if first = nil then writeln (' EMPTY ')
   else begin
        temp := first;
        while temp <> nil do begin
              write(temp^.info, ' ');
              temp := temp^.next;
              end;
      writeln;
   end;
   writeln;
end;

begin
first := nil;
menu;
   repeat
   write ('Number'); readln(n);
   writeln;
   case n of
   1:before;
   2:after;
   3:remove;
   4:show;

   end;

   until n = 0;
end.
