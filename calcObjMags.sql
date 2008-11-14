update Object o set gMag = (SELECT avg(apMag) from DIASource ds WHERE ds.objectId = o.objectId and ds.filterId = 1);
update Object o set rMag = (SELECT avg(apMag) from DIASource ds WHERE ds.objectId = o.objectId and ds.filterId = 2);
update Object o set iMag = (SELECT avg(apMag) from DIASource ds WHERE ds.objectId = o.objectId and ds.filterId = 3);
update Object o set zMag = (SELECT avg(apMag) from DIASource ds WHERE ds.objectId = o.objectId and ds.filterId = 4);
