update Raw_FPA_Exposure as ex, DIASource as ds set ds.colc=xfoc(ex.ra,ex.decl,ds.ra,ds.decl, 1082.3, 994.6, .396)  where ex.rawFPAExposureId = ds.ccdExposureId;
update Raw_FPA_Exposure as ex, DIASource as ds set ds.rowc=yfoc(ex.ra,ex.decl,ds.ra,ds.decl, 1082.3, 994.6, .396)  where ex.rawFPAExposureId = ds.ccdExposureId;
