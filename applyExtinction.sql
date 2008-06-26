UPDATE DIASource as s, NonGray_Extinction as nge set s.modelMag=s.psfMag - nge.kNonGray where s.ccdExposureId=nge.ccdExposureId;
