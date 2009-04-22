   PACKAGE Screen IS
   ------------------------------------------------------------------
   --| Procedures for drawing pictures on ANSI Terminal Screen
   --| Author: Michael B. Feldman, The George Washington University 
   --| Last Modified: by Martin Mansfield 1/20/2009                                     
   ------------------------------------------------------------------
   
      ScreenHeight : CONSTANT Integer := 50;
      ScreenWidth : CONSTANT Integer := 132;
   
      SUBTYPE Height IS Integer RANGE 1..ScreenHeight;
      SUBTYPE Width  IS Integer RANGE 1..ScreenWidth;
    
    -- Define colors: first part of list are foreground colors 
    --                x and y are place holders adn unused
    --                last part of list are background colors
   
      Type color is (Black, Red, Green, Yellow, Blue, Magenta, Cyan, White, x, y, Blk, Rd, Grn, Yell, Blu, Mag, Cyn, Wht);
      
    -- Record used to indicate a screen position for the cursor
      TYPE Position IS RECORD
            Row   : Height := 1;
            Column: Width := 1;
         END RECORD;
   
      PROCEDURE Beep; 
   -- Pre:  none
   -- Post: the terminal beeps once
   
      PROCEDURE ClearScreen; 
   -- Pre:  none
   -- Post: the terminal screen is cleared
   
      PROCEDURE MoveCursor (To: IN Position);
   -- Pre:  To is defined
   -- Post: the terminal cursor is moved to the given position
   
      PROCEDURE Set_Color(c: color);
   -- Pre: c is a color vt100 color code Foreground Colors
   -- Post: screen color is changed so that the next thing printed
   --       will be in the selected color
   
      Procedure cursoroff;
   -- Pre: cursor either on or off
   -- Post: curson is off
   
      Procedure cursoron;
   -- Pre: cursor either on or off
   -- Post: curson is on
   
      Procedure graphicson;
   -- Pre: graphics mode is either on or off
   -- Post: graphics mode is on
   
      Procedure graphicsoff;
   -- Pre: graphics mode is either on or off
   -- Post: graphics mode is on
   
   END Screen;   
