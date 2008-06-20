UPDATE Object AS o SET gMagErr = (
	SELECT stddev_pop(ds.apMag)
	FROM DIASource AS ds
	WHERE ds.filterId = 1 AND ds.objectId = o.objectId
);

UPDATE Object AS o SET rMagErr = (
	SELECT stddev_pop(ds.apMag)
	FROM DIASource AS ds
	WHERE ds.filterId = 2 AND ds.objectId = o.objectId
);

UPDATE Object AS o SET iMagErr = (
	SELECT stddev_pop(ds.apMag)
	FROM DIASource AS ds
	WHERE ds.filterId = 3 AND ds.objectId = o.objectId
);

UPDATE Object AS o SET zMagErr = (
	SELECT stddev_pop(ds.apMag)
	FROM DIASource AS ds
	WHERE ds.filterId = 4 AND ds.objectId = o.objectId
);
