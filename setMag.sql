UPDATE Object AS o SET gMag = (
	SELECT avg(ds.apMag)
	FROM DIASource AS ds
	WHERE ds.filterId = 1 AND ds.objectId = o.objectId
);

UPDATE Object AS o SET rMag = (
	SELECT avg(ds.apMag)
	FROM DIASource AS ds
	WHERE ds.filterId = 2 AND ds.objectId = o.objectId
);

UPDATE Object AS o SET iMag = (
	SELECT avg(ds.apMag)
	FROM DIASource AS ds
	WHERE ds.filterId = 3 AND ds.objectId = o.objectId
);

UPDATE Object AS o SET zMag = (
	SELECT avg(ds.apMag)
	FROM DIASource AS ds
	WHERE ds.filterId = 4 AND ds.objectId = o.objectId
);
