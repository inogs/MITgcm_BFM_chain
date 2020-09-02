# $Header: /u/gcmpack/MITgcm/pkg/exf/data.exf,v 1.3 2003/02/18 05:33:54 dimitri Exp $
#
# *********************
# External Forcing Data
# *********************
#
 &EXF_NML_01
 useExfCheckRange   = .FALSE.
# useExfZenAlbedo    = .TRUE. # not in a namelist!
# select_ZenAlbedo   = 3
# useExfZenIncoming  = .FALSE.
 exf_albedo=0.08,
 &END

 &EXF_NML_02
 atempstartdate1   = @@START_DATE@@,
# atempstartdate1   = 20200820,
# atempstartdate2   = @@START_TIME@@,
 atempstartdate2   = 000000,
 atempperiod       = 3600.0,

 aqhstartdate1     = @@START_DATE@@,
 aqhstartdate2     = 000000,
 aqhperiod         = 3600.0,        

 uwindstartdate1   = @@START_DATE@@,
 uwindstartdate2   = 000000,
 uwindperiod       = 3600.0,

 vwindstartdate1   = @@START_DATE@@,
 vwindstartdate2   = 000000,
 vwindperiod       = 3600.0,

 swfluxstartdate1  = @@START_DATE@@,
 swfluxstartdate2  = 000000,
 swfluxperiod      = 3600.0,

 lwfluxstartdate1  = @@START_DATE@@,
 lwfluxstartdate2  = 000000,
 lwfluxperiod      = 3600.0,

 apressurestartdate1  = @@START_DATE@@,
 apressurestartdate2  = 000000,
 apressureperiod      = 3600.0,

 precipstartdate1  = @@START_DATE@@,
 precipstartdate2  = 000000,
 precipperiod      = 3600.0,

## runoffstartdate1  = @@START_DATE@@,
# runoffstartdate1  = 20200820,
## runoffstartdate2  = @@START_TIME@@,
# runoffstartdate2  = 000000,
# runoffperiod      = 3600.0,
#
#
 atempfile     = '../input/binaries/meteo/BC_atemp',
 aqhfile       = '../input/binaries/meteo/BC_aqh',
 uwindfile     = '../input/binaries/meteo/BC_uwind',
 vwindfile     = '../input/binaries/meteo/BC_vwind',
 swfluxfile    = '../input/binaries/meteo/BC_swflux',
 lwfluxfile    = '../input/binaries/meteo/BC_lwflux',
 apressurefile = '../input/binaries/meteo/BC_apress',
 precipfile    = '../input/binaries/meteo/BC_precip',
# runofffile    = '../input/binaries/...',
# runoftempfile = '../input/binaries/...',
 &END

 &EXF_NML_03
# input scaling factors
# convert precip from mm [kg/m2] to m/s
# exf_inscal_precip   =  9.26E-8,
# convert precip from kg/m2/s to m/s
# exf_inscal_precip   =  1.0E-3,
# convert apressure from hPa to Pa
# exf_inscal_apressure   =  100.,
# runoff already converted
# exf_inscal_runoff   =  1.0,
 exf_inscal_uwind   =  1.0,
 exf_inscal_vwind   =  1.0,
 exf_inscal_swflux   =  0.9,
 exf_inscal_lwflux   =  1.2,
# output scaling factors
 &END

 &EXF_NML_04
# atemp_lon0=12.0,
# atemp_lon_inc=0.02,
# atemp_lat0=43.0,
# atemp_lat_inc=151*0.02,
# atemp_nlon=226,
# atemp_nlat=151,
##
# aqh_lon0=12.0,
# aqh_lon_inc=0.02,
# aqh_lat0=43.0,
# aqh_lat_inc=151*0.02,
# aqh_nlon=226,
# aqh_nlat=151,
##
# uwind_lon0=12.0,
# uwind_lon_inc=0.02,
# uwind_lat0=43.0,
# uwind_lat_inc=151*0.02,
# uwind_nlon=226,
# uwind_nlat=151,
##
# vwind_lon0=12.0,
# vwind_lon_inc=0.02,
# vwind_lat0=43.0,
# vwind_lat_inc=151*0.02,
# vwind_nlon=226,
# vwind_nlat=151,
##
# swflux_lon0=12.0,
# swflux_lon_inc=0.02,
# swflux_lat0=43.0,
# swflux_lat_inc=151*0.02,
# swflux_nlon=226,
# swflux_nlat=151,
##
# lwflux_lon0=12.0,
# lwflux_lon_inc=0.02,
# lwflux_lat0=43.0,
# lwflux_lat_inc=151*0.02,
# lwflux_nlon=226,
# lwflux_nlat=151,
##
# apressure_lon0=12.0,
# apressure_lon_inc=0.02,
# apressure_lat0=43.0,
# apressure_lat_inc=151*0.02,
# apressure_nlon=226,
# apressure_nlat=151,
##
# precip_lon0=12.0,
# precip_lon_inc=0.02,
# precip_lat0=43.0,
# precip_lat_inc=151*0.02,
# precip_nlon=226,
# precip_nlat=151,
## 
# No interp for runoff!
#
 &END

 &EXF_NML_OBCS
 obcsNstartdate1=@@START_DATE@@,
 obcsNstartdate2=000000,
 obcsNperiod=86400.0,

 obcsSstartdate1=@@START_DATE@@,
 obcsSstartdate2=000000,
 obcsSperiod=86400.0,

 obcsEstartdate1=@@START_DATE@@,
 obcsEstartdate2=000000,
 obcsEperiod=86400.0,

 obcsWstartdate1=@@START_DATE@@,
 obcsWstartdate2=000000,
 obcsWperiod=86400.0,
 &END
