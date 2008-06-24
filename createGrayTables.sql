create table Gray_Surf (
	ccdExposureId BIGINT NOT NULL,
	c0 DOUBLE NOT NULL,
	cx1 DOUBLE NOT NULL,
	cx2 DOUBLE NOT NULL,
	cy1 DOUBLE NOT NULL,
	cy2 DOUBLE NOT NULL,
	cxy DOUBLE NOT NULL,
	c0_sigma DOUBLE NOT NULL,
	cx1_sigma DOUBLE NOT NULL,
	cx2_sigma DOUBLE NOT NULL,
	cy1_sigma DOUBLE NOT NULL,
	cy2_sigma DOUBLE NOT NULL,
	cxy_sigma DOUBLE NOT NULL,
	PRIMARY KEY (ccdExposureId)
);

create table DIA_Poly (
	diaSourceId BIGINT NOT NULL,
	valx1 DOUBLE NOT NULL,
	valx2 DOUBLE NOT NULL,
	valy1 DOUBLE NOT NULL,
	valy2 DOUBLE NOT NULL,
	valxy DOUBLE NOT NULL,
	PRIMARY KEY (diaSourceId)
);
