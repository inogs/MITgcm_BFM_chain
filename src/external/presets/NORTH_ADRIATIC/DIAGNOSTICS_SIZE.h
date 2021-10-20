C $Header: /u/gcmpack/MITgcm/pkg/diagnostics/DIAGNOSTICS_SIZE.h,v 1.5 2008/02/05 15:31:19 jmc Exp $
C $Name: checkpoint64v $


C     Diagnostics Array Dimension
C     ---------------------------
C     ndiagMax   :: maximum total number of available diagnostics
C     numlists   :: maximum number of diagnostics list (in data.diagnostics)
C     numperlist :: maximum number of active diagnostics per list (data.diagnostics)
C     numLevels  :: maximum number of levels to write    (data.diagnostics)
C     numDiags   :: maximum size of the storage array for active 2D/3D diagnostics
C     nRegions   :: maximum number of regions (statistics-diagnostics)
C     sizRegMsk  :: maximum size of the regional-mask (statistics-diagnostics)
C     nStats     :: maximum number of statistics (e.g.: aver,min,max ...)
C     diagSt_size:: maximum size of the storage array for statistics-diagnostics
C Note : may need to increase "numDiags" when using several 2D/3D diagnostics,
C  and "diagSt_size" (statistics-diags) since values here are deliberately small.
      INTEGER    ndiagMax
      INTEGER    numlists, numperlist, numLevels
      INTEGER    numDiags
      INTEGER    nRegions, sizRegMsk, nStats
      INTEGER    diagSt_size
      PARAMETER( ndiagMax = 1500 ) ! CGP increase from 500 to 1000 -> to 1100 with checkpoint66j -> to 1500 with V5
      PARAMETER( numlists = 150, numperlist = 150, numLevels=2*Nr ) ! CSQ increase from 100 to 150 (EXF wind)
      PARAMETER( numDiags = 150*Nr ) ! CSQ increase from 100 to 150 (EXF wind)
      PARAMETER( nRegions = 0 , sizRegMsk = 1 , nStats = 4 )
      PARAMETER( diagSt_size = 150*Nr ) ! CSQ increase from 100 to 150 (EXF wind)


CEH3 ;;; Local Variables: ***
CEH3 ;;; mode:fortran ***
CEH3 ;;; End: ***
