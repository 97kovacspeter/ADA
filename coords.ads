with card_dir;
use card_dir;

package Coords is 
	--variable(s)
	type Coord is Private;
	--1,
	function Get_X(C: Coord) return Integer;
	function Get_Y(C: Coord) return Integer;
	--2,
	procedure Set_X(C: in out Coord;I:Integer);
	procedure Set_Y(C: in out Coord;I:Integer);
	--3,
	function Get_Distance(C:Coord;C2:Coord) return Integer;
	--4,
	procedure Change_To_Direction(C: in out Coord;D:Cardinal_Direction);
	--5, Map indexed with integers and contains Items
	generic
		type Item is private;
		type Map is array(Integer range <>, Integer range<>) of Item;
	function Coord_With_Array(C:Coord;M:Map) return Item;
	
Private
	type Coord Is Record
		x:Integer;
		y:Integer;
	end Record;
	
end Coords;