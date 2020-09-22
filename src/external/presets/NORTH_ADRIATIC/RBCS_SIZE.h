C $Header: /u/gcmpack/MITgcm/pkg/rbcs/RBCS_SIZE.h,v 1.1 2011/05/14 19:52:12 jmc Exp $
C $Name: checkpoint66j $

#ifdef ALLOW_RBCS

CBOP
C    !ROUTINE: RBCS_SIZE.h
C    !INTERFACE:

C    !DESCRIPTION:
C Contains RBCS array size (number of tracer mask)
CEOP

C---  RBCS Parameters:
C     maskLEN :: number of mask to read
      INTEGER maskLEN
C Relax for Chioggia (12 sources)
C      PARAMETER( maskLEN = 65 )
C No relax for Chioggia
      PARAMETER( maskLEN = 53 )

#endif /* ALLOW_RBCS */
