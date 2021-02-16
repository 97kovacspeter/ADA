with Card_Dir;
use Card_Dir;

package body Coords is 
	--1,
	function Get_X(C:Coord) return Integer is
	begin
		return C.x;
	end Get_X;
	
	function Get_Y(C:Coord) return Integer is
	begin 
		return C.y;
	end Get_Y;
	--2,
	procedure Set_X(C: in out Coord;I:Integer) is
	begin
		C.x:=I;
	end Set_X;
	
	procedure Set_Y(C: in out Coord;I:Integer) is
	begin
		C.y:=I;
	end Set_Y;
	--3,
	function Get_Distance(C:Coord;C2:Coord) return Integer is
	begin
		return (C2.x-C.x)*(C2.x-C.x)+(C2.y-C.y)*(C2.y-C.y);
	end Get_Distance;
	--4,
	procedure Change_To_Direction(C: in out Coord;D:Cardinal_Direction) is
	begin
		if(D=N) then
			C.y:=C.y-1;
		end if;
		
		if(D=S) then
			C.y:=C.y+1;
		end if;
		
		if(D=E) then
			C.x:=C.x+1;
		end if;
		
		if(D=W) then
			C.x:=C.x-1;
		end if;
		
		if(D=NE) then
			C.y:=C.y-1;
			C.x:=C.x-1;
		end if;
		
		if(D=SE) then
			C.y:=C.y+1;
			C.x:=C.x-1;
		end if;
		
		if(D=SW) then
			C.y:=C.y+1;
			C.x:=C.x+1;
		end if;
		
		if(D=NW) then
			C.y:=C.y-1;
			C.x:=C.x+1;
		end if;
	end Change_To_Direction;
	--5,
	function Coord_With_Array(C:Coord;M:Map) return Item is
	begin
		return M(C.x,C.y);
	end Coord_With_Array;
	
	
end Coords;