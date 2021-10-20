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
C T, S + BFM
      PARAMETER( maskLEN = 53 )

#endif /* ALLOW_RBCS */
