    package body board is
       procedure setup_board(selection: difficulty;gameboard: out board_type) is
         width,height,x,y:  integer;
      begin --setup_board    
         screen.clearscreen;
         case selection is
            when easy => gameboard.length:=5;
            when intermediate => gameboard.length:=6;
            when hard => gameboard.length:=6;
            when insane => gameboard.length:=10;
            when others => null;
         end case;
         gameboard.lposition.inposition.index:=null;
         gameboard.lposition.outposition.index:=null;
         Width  := (100/gameboard.length);				
         Height := (40/gameboard.length);
         for Index in 1..gameboard.length loop
            for Index2 in 'A'..character'val(gameboard.length+64) loop
               x:= 6+(height*(character'pos(Index2)-65))-character'pos(Index2)+64;
               y:= 10+(width*(Index-1))-Index;
               gameboard.box(index2,index).window:=windows.open((x,y),height,width);
               windows.borders(gameboard.box(index2,index).window,'+','|','-');
            end loop;
         end loop;
         for index in 1..gameboard.length loop
            screen.movecursor(((50/gameboard.length)*index,1));ada.text_io.put(character'val(index+64));
            screen.movecursor((1,(20/gameboard.length)*index));ada.integer_text_io.put(index);
         end loop;
      end setup_board;
       procedure update_board(gameboard: board_type) is
      begin --update_board
      --screen.movecursor((1,50));
         setup_board(gameboard.length,gameboard);
         case gameboard.carrotposition.side is
            when top => screen.movecursor((gamboard.carrotposition.index*(50/gameboard.length),1));ada.text_io.put('v');
            when left => screen.movecursor((2,gamboard.carrotposition.index*(20/gameboard.length)));ada.text_io.put('>'); 
            when right => screen.movecursor((140,gamboard.carrotposition.index*(20/gameboard.length)));ada.text_io.put('<');
            when bottom => screen.movecursor((gamboard.carrotposition.index*(50/gameboard.length),44));ada.text_io.put('^');
            when others => null;
         end case;
         if gameboard.lposition.inposition.index/=null then
            case gameboard.lposition.inposition.side is
               when top => screen.movecursor((gamboard.lposition.inposition.index*(50/gameboard.length),2));ada.text_io.put('|');
               when left => screen.movecursor((3,gamboard.lposition.inposition.index*(20/gameboard.length)));ada.text_io.put('-'); 
               when right => screen.movecursor((139,gamboard.lposition.inposition.index*(20/gameboard.length)));ada.text_io.put('-');
               when bottom => screen.movecursor((gamboard.lposition.inposition.index*(50/gameboard.length),43));ada.text_io.put('|');
               when others => null;
            end case;
         end if;
         if gameboard.lposition.outposition.index/=null then
            case gameboard.lposition.outposition.side is
               when top => screen.movecursor((gamboard.lposition.outposition.index*(50/gameboard.length),2));ada.text_io.put('|');
               when left => screen.movecursor((3,gamboard.lposition.outposition.index*(20/gameboard.length)));ada.text_io.put('-'); 
               when right => screen.movecursor((139,gamboard.lposition.outposition.index*(20/gameboard.length)));ada.text_io.put('-');
               when bottom => screen.movecursor((gamboard.lposition.outposition.index*(50/gameboard.length),43));ada.text_io.put('|');
               when others => null;
            end case;
         end if;
      end update_board;
       procedure set_mirrors(selection2: difficulty;gameboard: in out board_type) is
         type Rand_Range is range 1..gameboard.length*gameboard.length;

         Num : integer;
          package Rand_Int is new Ada.Numerics.Discrete_Random(Rand_Range);
         seed : Rand_Int.Generator;
			mirrors:integer;
         dup:integer:=0;
         mirror_array: array (1..30) of integer;
			mirrors_set: array(1..30) of integer;
      begin --set_mirrors
         Rand_Int.Reset(seed);
         case selection2 is
            when easy => mirrors:=5;
            when intermediate => mirrors:=10;
            when hard => mirrors:=15;
            when insane => mirrors:=30;
            when others => null;
         end case;
         for index in 1..mirrors loop
      	mirror_array(index):=0;
      	end loop;
      	for index in 1..mirrors loop
      	Num := Rand_Range'Image(Rand_Int.Random(seed));
      	for index2 in 1..mirrors loop
      	if Num = mirror_array(index2) then
      	dup:=1;
      	end if;
      	end loop;
      	if dup=1 then
      	index:=index-1;
      	else
      	mirror_array(index):=Num;
      	end if;
      	end loop;
      	for index in 1..mirrors loop
      	for index2 in character range'A'..'J' loop
      	gameboard.box(index2,index).mirror:=false;
      	end loop;
      	end loop;
      	for index in 1..mirrors loop
      	if mirror_array(index) <= gameboard.length then
      	gameboard.box('A',mirror_array(index)).mirror:=true;
			if Rand_Range'Image(Rand_Int.Random(seed)) > 50 then
			gameboard.box('A',mirror_array(index)).angle:=true;
			else
			gameboard.box('A',mirror_array(index)).angle:=false;
			end if;
      	elsif mirror_array(index) <= gameboard.length*2 then
      	gameboard.box('B',mirror_array(index)-(gameboard.length)).mirror:=true;
			if Rand_Range'Image(Rand_Int.Random(seed)) > 50 then
			gameboard.box('B',mirror_array(index)-(gameboard.length)).angle:=true;
			else
			gameboard.box('B',mirror_array(index)-(gameboard.length)).angle:=false;
			end if;
      	elsif mirror_array(index) <= gameboard.length*3 then
      	gameboard.box('C',mirror_array(index)-(gameboard.length*2)).mirror:=true;
			if Rand_Range'Image(Rand_Int.Random(seed)) > 50 then
			gameboard.box('C',mirror_array(index)-(gameboard.length*2)).angle:=true;
			else
			gameboard.box('C',mirror_array(index)-(gameboard.length*2)).angle:=false;
			end if;
      	elsif mirror_array(index) <= gameboard.length*4 then
      	gameboard.box('D',mirror_array(index)-(gameboard.length*3)).mirror:=true;
			if Rand_Range'Image(Rand_Int.Random(seed)) > 50 then
			gameboard.box('D',mirror_array(index)-(gameboard.length*3)).angle:=true;
			else
			gameboard.box('D',mirror_array(index)-(gameboard.length*3)).angle:=false;
			end if;
      	elsif mirror_array(index) <= gameboard.length*5 then
      	gameboard.box('E',mirror_array(index)-(gameboard.length*4)).mirror:=true;
			if Rand_Range'Image(Rand_Int.Random(seed)) > 50 then
			gameboard.box('E',mirror_array(index)-(gameboard.length*4)).angle:=true;
			else
			gameboard.box('E',mirror_array(index)-(gameboard.length*4)).angle:=false;
			end if;
      	elsif mirror_array(index) <= gameboard.length*6 then
      	gameboard.box('F',mirror_array(index)-(gameboard.length*5)).mirror:=true;
			if Rand_Range'Image(Rand_Int.Random(seed)) > 50 then
			gameboard.box('F',mirror_array(index)-(gameboard.length*5)).angle:=true;
			else
			gameboard.box('F',mirror_array(index)-(gameboard.length*5)).angle:=false;
			end if;
      	elsif mirror_array(index) <= gameboard.length*7 then
      	gameboard.box('G',mirror_array(index)-(gameboard.length*6)).mirror:=true;
			if Rand_Range'Image(Rand_Int.Random(seed)) > 50 then
			gameboard.box('G',mirror_array(index)-(gameboard.length*6)).angle:=true;
			else
			gameboard.box('G',mirror_array(index)-(gameboard.length*6)).angle:=false;
			end if;
      	elsif mirror_array(index) <= gameboard.length*8 then
      	gameboard.box('H',mirror_array(index)-(gameboard.length*7)).mirror:=true;
			if Rand_Range'Image(Rand_Int.Random(seed)) > 50 then
			gameboard.box('H',mirror_array(index)-(gameboard.length*7)).angle:=true;
			else
			gameboard.box('H',mirror_array(index)-(gameboard.length*7)).angle:=false;
			end if;
      	elsif mirror_array(index) <= gameboard.length*9 then
      	gameboard.box('I',mirror_array(index)-(gameboard.length*8)).mirror:=true;
			if Rand_Range'Image(Rand_Int.Random(seed)) > 50 then
			gameboard.box('I',mirror_array(index)-(gameboard.length*8)).angle:=true;
			else
			gameboard.box('I',mirror_array(index)-(gameboard.length*8)).angle:=false;
			end if;
      	else
      	gameboard.box('J',mirror_array(index)-(gameboard.length*9)).mirror:=true;
			if Rand_Range'Image(Rand_Int.Random(seed)) > 50 then
			gameboard.box('J',mirror_array(index)-(gameboard.length*9)).angle:=true;
			else
			gameboard.box('J',mirror_array(index)-(gameboard.length*9)).angle:=false;
			end if;
      	end if;
      	end loop;
      end set_mirrors;
   end board;