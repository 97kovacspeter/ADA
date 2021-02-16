with Card_Dir;
use Card_Dir;
with Coords;
use Coords;

generic
	type Id is (<>);
	with function "<"(I,J: in Id) return Boolean is <>;
package Aircraft is
	
	type Aircraft_Type (Temp:Id) is private;
	function GetName (A: Aircraft_Type) return Id;
	

	procedure Ascend(A: in out Aircraft_Type);
	procedure Land(A: in out Aircraft_Type);
	
	function Get_Is_In_The_Air(A:Aircraft_Type) return Boolean;
	function Get_Coord(A:Aircraft_Type) return Coord;
	
	procedure Set_Card_Dir_Coord(A: in out Aircraft_Type;C:Cardinal_Direction);
	
	procedure Start(A: in out Aircraft_Type);
	
	function Compare(A1:Aircraft_Type;A2:Aircraft_Type) return Boolean;
	
	function Get_Distance(A1:Aircraft_Type;A2:Aircraft_Type) return Integer;
	generic	
		with procedure ActionHelp(I: out Id; C: out Coord; B: out Boolean);
		procedure Action(A: in out Aircraft_Type);
	
private

	procedure Set_Coord(A: in out Aircraft_Type; C: Coord);
	
	type Aircraft_Type (Temp:Id) is Record
		Name: Id := Temp;
		Position: Coord;
		Is_In_The_Air: Boolean := false;
	end record; 
	
end Aircraft;