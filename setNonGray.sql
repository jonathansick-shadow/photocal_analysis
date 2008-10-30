insert into NonGray_Extinction (ccdExposureId) SELECT Raw_FPA_Exposure.rawFPAExposureId from Raw_FPA_Exposure;
update NonGray_Extinction as ng, Raw_FPA_Exposure as ex set ng.kNonGray = 0.181*ex.airmass where ng.ccdExposureId=ex.rawFPAExposureId and ex.filterId=1;
update NonGray_Extinction as ng, Raw_FPA_Exposure as ex set ng.kNonGray = 0.095*ex.airmass where ng.ccdExposureId=ex.rawFPAExposureId and ex.filterId=2;
update NonGray_Extinction as ng, Raw_FPA_Exposure as ex set ng.kNonGray = 0.089*ex.airmass where ng.ccdExposureId=ex.rawFPAExposureId and ex.filterId=3;
update NonGray_Extinction as ng, Raw_FPA_Exposure as ex set ng.kNonGray = 0.053*ex.airmass where ng.ccdExposureId=ex.rawFPAExposureId and ex.filterId=4;
