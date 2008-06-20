UPDATE DIASource as s, Gray_Surf as g SET s.apMag = s.modelMag - polysurf(g.c0, g.cx1, g.cx2, g.cy1, g.cy2, g.cxy, s.colc, s.rowc) where g.ccdExposureId = s.ccdExposureId;
