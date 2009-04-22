with Ada.Text_IO,Ada.Integer_Text_IO,Ada.strings,ada.numerics,Windows,Screen;

generic
type board_type is private;
type difficulty is private;
PACKAGE Board IS
	-- Setup Board (Use List/Record [BoardType] to track Windows) - Procedure (Selection : IN Difficulty; GameBoard : OUT BoardType) {Board}
	 procedure setup_board(selection: difficulty;gameboard: out board_type);	
	-- Update Board - Procedure (GameBoard : IN BoardType) {Board}
	 procedure update_board(gameboard: in board_type);
	 procedure set_mirrors(selection2: difficulty;gameboard: in out board_type);
END Board;