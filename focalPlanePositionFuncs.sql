delimiter //
create function xfoc(ra1 double, dec1 double, ra0 double, dec0 double, pixscale double)
returns double
begin
	declare pixradians double;

	set pixradians = pixscale * 3.14159 / (180.0 * 3600.0);

	return radians(ra1 - ra0) * cos(radians(dec0)) / pixradians;
end
//

create function yfoc(ra1 double, dec1 double, ra0 double, dec0 double, pixscale double)
returns double
begin
	declare pixradians double;

	set pixradians = pixscale * 3.14159 / (180.0 * 3600.0);

	return radians(dec1 - dec0) / pixradians;
end
//
delimiter ;
