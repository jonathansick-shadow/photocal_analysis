UPDATE DIASource as s, Gray_Extinction as ge, NonGray_Extinction as nge set s.modelMag=s.psfMag - ge.kGray - nge.kNonGray where s.ccdExposureId=ge.ccdExposureId and s.ccdExposureId=nge.ccdExposureId;
