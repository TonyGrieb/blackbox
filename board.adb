    package body board is
       procedure setup_board(selection: difficulty;gameboard: out board_type) is
         width,height,x,y:  integer;
      begin --setup_board    
         screen.clearscreen;
         gameboard.length:=selection;
         gameboard.lposition.inposition.index:=null;
         gameboard.lposition.outposition.index:=null;
         Width  := (100/gameboard.length);				
         Height := (40/gameboard.length);
         for Index in 1..gameboard.length loop
            for Index2 in 'A'..character'val(gameboard.length+64) loop
               x:= 6+(height*(character'pos(Index2)-65))-character'pos(Index2)+64;
               y:= 10+(width*(Index-1))-Index;
               gameboard.box(index2,index):=windows.open((x,y),height,width);
               windows.borders(gameboard.box(index2,index),'+','|','-');
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
   end board;