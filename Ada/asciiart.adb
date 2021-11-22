-- asciiart Ada95 (gnat 8.3)
with Ada.Text_IO;
use Ada.Text_IO;

procedure Test is
   a, b, t, ca, cb : Float;
   s : Character;
   hex : constant String := "0123456789ABCDEF";
begin
   for y in -12 .. 12 loop
      for x in -39 .. 39 loop
         ca := Float(x) * 0.0458;
         cb := Float(y) * 0.08333;
         a := ca;
         b := cb;
         s := ' ';
         for i in 0 .. 15 loop
            t := a * a - b * b + ca;
            b := 2.0 * a * b + cb;
            a := t;
            if (a * a + b * b) > 4.0 then
               s := hex (i+1);
               exit;
            end if;
         end loop;
         Put(s & "");
      end loop;
      New_Line;
   end loop;
end;
