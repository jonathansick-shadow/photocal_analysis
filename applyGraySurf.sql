UPDATE DIASource set apMag=modelMag;
UPDATE DIASource as s, Gray_Surf as g, DIA_Poly as p SET s.apMag = s.modelMag - (g.c0 + g.cx1*p.valx1 + g.cx2*p.valx2 + g.cy1*p.valy1 + g.cy2*p.valy2 + g.cxy*p.valxy) where g.ccdExposureId = s.ccdExposureId and s.diaSourceId = p.diaSourceId;
