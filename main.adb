with Text_IO, Aircraft, Coords, Card_Dir;
use Text_IO, Card_Dir;

procedure main is 
	package ACrafts is new Aircraft(Integer);
	use ACrafts;
	
	procedure ACraft_Info (A: Aircraft_Type) is
	begin
		Put("Name: ");
		Put_Line(Integer'Image(GetName(A)));
		Put("coordiantes:");
		Put(Integer'Image(Coords.Get_X(Get_Coord(A))));
		Put(",");
		Put(Integer'Image(Coords.Get_Y(Get_Coord(A))));Put_Line("");
		if Get_Is_In_The_Air(A) then
			Put_Line("In the air.");Put_Line("");
		else
			Put_Line("Not in the air.");Put_Line("");
		end if;
	end ACraft_Info;
	
	procedure Set_Inside(Name: out Integer; Position: out Coords.Coord; Is_In_The_Air: out Boolean) is
	begin
		Name:=0;
		Coords.Set_X(Position,0);
		Coords.Set_Y(Position,0);
		Is_In_The_Air:= False;
	end Set_Inside;
	
	procedure Initialiser is new Action(Set_Inside);
	
	procedure Comparing (A1: Aircraft_Type; A2: Aircraft_Type) is
		Is_Greater: Boolean;
	begin
		Is_Greater:=Compare(A1,A2);
		if Is_Greater then
			Put(Integer'Image(GetName(A1)));
			Put(" is greater, than ");
			Put(Integer'Image(GetName(A2)));
		else
			Put(Integer'Image(GetName(A1)));
			Put(" is not greater, than ");
			Put(Integer'Image(GetName(A2)));
		end if;
	end Comparing;
	
	procedure Measuring (A1: Aircraft_Type; A2: Aircraft_Type) is
	begin
		Put("Distance: ");
		Put(Integer'Image(Get_Distance(A1,A2)));
	end Measuring;
		
	A1: Aircraft_Type(9);
	A2: Aircraft_Type(23);
begin
	Put_Line("Current state (start): ");Put_Line("");
	Start(A1);
	Start(A2);
	ACraft_Info(A1);
	ACraft_Info(A2);
	Put_Line("Comparing them");Put_Line("");
	Comparing(A1,A2);
	Put_Line("A1 reset");Put_Line("");
	Initialiser(A1);
	ACraft_Info(A1);
	ACraft_Info(A2);
	Put_Line("A2 reset");Put_Line("");
	Initialiser(A2);
	ACraft_Info(A1);
	ACraft_Info(A2);
	Put_Line("Ascend both");Put_Line("");
	Ascend(A1);
	Ascend(A2);
	ACraft_Info(A1);
	ACraft_Info(A2);
	Put_Line("A1 going to N direction, A2 going to S direction");Put_Line("");
	Set_Card_Dir_Coord(A1,N);
	Set_Card_Dir_Coord(A2,S);
	ACraft_Info(A1);
	ACraft_Info(A2);
	Put_Line("A1 going to E direction, A2 going to W direction");Put_Line("");
	Set_Card_Dir_Coord(A1,E);
	Set_Card_Dir_Coord(A2,W);
	ACraft_Info(A1);
	ACraft_Info(A2);
	Put_Line("A1 going to NE direction, A2 going to SE direction");Put_Line("");
	Set_Card_Dir_Coord(A1,NE);
	Set_Card_Dir_Coord(A2,SE);
	ACraft_Info(A1);
	ACraft_Info(A2);
	Put_Line("A1 going to NW direction, A2 going to SW direction");Put_Line("");
	Set_Card_Dir_Coord(A1,NW);
	Set_Card_Dir_Coord(A2,SW);
	ACraft_Info(A1);
	ACraft_Info(A2);
	Put_Line("Distance between them (the real distance is the square root of the answer for easier computing)");Put_Line("");
	Measuring(A1,A2);Put_Line("");
	Put_Line("Landing");Put_Line("");
	Land(A1);
	Land(A2);
	ACraft_Info(A1);
	ACraft_Info(A2);
	
	
	
	
	
	
	
	
	
	
	
	
end main;