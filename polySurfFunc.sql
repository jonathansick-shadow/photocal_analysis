delimiter //
create function polysurf(c0 double, cx1 double, cx2 double, cy1 double, cy2 double, cxy double, x double, y double)
returns double
begin
	return c0 + x*(cx1 + cx2*x) + y*(cy1 + cy2*y) + cxy*x*y;
end
//
delimiter ;
