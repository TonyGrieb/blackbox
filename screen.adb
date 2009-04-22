   WITH Ada.Integer_Text_IO,ada.text_io;
   PACKAGE BODY Screen IS
   ------------------------------------------------------------------
   --| Procedures for drawing pictures on ANSI Terminal Screen
   --| These procedures will work correctly only if the actual
   --| terminal is ANSI compatible. ANSI.SYS on a DOS machine
   --| will suffice.
   --| Author: Michael B. Feldman, The George Washington University 
   --| Last Modified: Martin Mansfield 1/20/2009                                     
   ------------------------------------------------------------------
   
      PROCEDURE Beep IS
   -- Pre:  none
   -- Post: the terminal beeps once
      BEGIN
         Ada.Text_IO.Flush;
         Ada.Text_IO.Put (Item => ASCII.BEL);
      END Beep;
   
      PROCEDURE ClearScreen IS
   -- Pre:  none
   -- Post: the terminal screen is cleare   WITH Ada.Text_IO;
      BEGIN
         Ada.Text_IO.Put (Item => ASCII.ESC);
         Ada.Text_IO.Put (Item => "[2J");
         Ada.Text_IO.Flush;
      END ClearScreen;
   
      PROCEDURE MoveCursor (To: IN Position) IS
   -- Pre:  To is defined
   -- Post: the terminal cursor is moved to the given position
            BEGIN                                                
         Ada.Text_IO.Flush;
         Ada.Text_IO.Put (Item => ASCII.ESC);
         Ada.Text_IO.Put ("[");
         Ada.Integer_Text_IO.Put (Item => To.Row, Width => 1);
         Ada.Text_IO.Put (Item => ';');
         Ada.Integer_Text_IO.Put (Item => To.Column, Width => 1);
         Ada.Text_IO.Put (Item => 'f');
      END MoveCursor;  
   
      PROCEDURE Set_Color(c: color) is
      -- Pre: c is a color vt100 color code
      -- Post: screen color is changed so that the next thing printed
      --       will be in the selected color
         base: Natural := 30;
      
      BEGIN
         Ada.Text_IO.Flush;
         Ada.Text_IO.put(ASCII.ESC);
         Ada.Text_IO.put("[");
         Ada.Integer_Text_IO.put(Base + color'pos(c), width => 1);
         Ada.Text_IO.put("m");
      END Set_Color;
   
      procedure cursoroff is
   -- Pre: cursor either on or off
   -- Post: curson is off
            
      begin
         Ada.Text_IO.put(ASCII.ESC);
         Ada.Text_IO.put("[1;3;4v");
      end cursoroff;
         
      procedure cursoron is
   -- Pre: cursor either on or off
   -- Post: curson is on
      
      begin
         Ada.Text_IO.put(ASCII.ESC);
         Ada.Text_IO.put("[0;3;5v");
      end cursoron;
   
      procedure graphicson is
  -- Pre: graphics mode is either on or off
  -- Post: graphics mode is on
           
      begin
         Ada.Text_IO.put(ASCII.ESC);
         Ada.Text_IO.put("(0");
      end graphicson;
   
      procedure graphicsoff is
  -- Pre: graphics mode is either on or off
  -- Post: graphics mode is off
           
      begin
         Ada.Text_IO.put(ASCII.ESC);
         Ada.Text_IO.put("(B");
      end graphicsoff;
   
   END Screen;
