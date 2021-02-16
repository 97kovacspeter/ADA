with Card_Dir;
use Card_Dir;
with Coords;
use Coords;
with Ada.Numerics.Discrete_Random;

package body Aircraft is 
	
	procedure Ascend(A: in out Aircraft_Type) is
	begin
		A.Is_In_The_Air:=true;
	end Ascend;
	
	procedure Land(A: in out Aircraft_Type) is
	begin
		A.Is_In_The_Air:=false;
	end Land;
	
	function Get_Is_In_The_Air(A:Aircraft_Type) return Boolean is
	begin
		return A.Is_In_The_Air;
	end Get_Is_In_The_Air;
	
	function Get_Coord(A:Aircraft_Type) return Coord is
	begin
		return A.Position;
	end Get_Coord;


	procedure Set_Coord(A: in out Aircraft_Type; C:Coord) is
	begin
		A.Position:=C;
	end Set_Coord;
	
	procedure Set_Card_Dir_Coord(A: in out Aircraft_Type; C: Cardinal_Direction) is
	begin
		Change_To_Direction(A.Position, C);
	end Set_Card_Dir_Coord;
	
	--random coordiantes
	procedure Start(A: in out Aircraft_Type) is 
		--type Rand_Range is range 0..100; --for ranged random
		package Rand_Int is new Ada.Numerics.Discrete_Random(Integer);
		use Rand_Int;
		seed: Generator;
		C: Coord;
	begin
		Rand_Int.Reset(seed);
		Set_X(C,Random(seed));
		Set_Y(C,Random(seed));
		Set_Coord(A,C);
	end Start;
	
	function Compare(A1:Aircraft_Type;A2:Aircraft_Type) return Boolean is
	begin
		if(A2.Name > A1.Name) then
			return true;
		else
			return false;
		end if;
	end Compare;
	
	function Get_Distance(A1:Aircraft_Type;A2:Aircraft_Type) return Integer is
	begin
		return Get_Distance(A1.Position, A2.Position);
	end Get_Distance;
	
	procedure Action(A: in out Aircraft_Type) is
	begin
		ActionHelp(A.Name, A.Position, A.Is_In_The_Air);
	end Action;
	
	function GetName(A: Aircraft_Type) return Id is
	begin
		return A.Name;
	end GetName;
	
	
end Aircraft;