update Object o set gMag = (SELECT min(psfMag) from DIASource ds WHERE ds.objectId = o.objectId and ds.filterId = 1);
update Object o set rMag = (SELECT min(psfMag) from DIASource ds WHERE ds.objectId = o.objectId and ds.filterId = 2);
update Object o set iMag = (SELECT min(psfMag) from DIASource ds WHERE ds.objectId = o.objectId and ds.filterId = 3);
update Object o set zMag = (SELECT min(psfMag) from DIASource ds WHERE ds.objectId = o.objectId and ds.filterId = 4);
