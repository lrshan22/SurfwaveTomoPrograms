      SUBROUTINE  WNFRQ(ARG1,ARG2)
      REAL*8  RMAX,RC,HC,H1,H2,ALP,WN,WN2,C,C2,FRQ,FRQ2,T,U,ENGY,DELTA
      REAL*8  A,F,Y
      COMMON/VALUE /MODE,IERROR,I,ISTEP,J,K,L,N,NSOL,ISUM,KMAX,
     1              NMAX,IBOTM,ITOP,LY,LD,ACR,ELLIP,
     2              RMAX,RC,HC,H1,H2,ALP,WN,WN2,C,C2,FRQ,FRQ2,T,
     3              U,ENGY,DELTA,
     4              A(6,6),F(20),Y(6)
      REAL*8  ARG2
C*    REAL*8  PEI/6.283185307179586/
      REAL*8 PEI
      data  PEI/6.283185307179586/
C
C PURPOSE -   TO COMPUTE WAVE NUMBER(WN), PHASE VELOCITY(C),
C     FREQUENCY(FRQ) AND PERIOD(T) FROM ARG1 AND ARG2.
C     WN2=WN**2(FLAT MODEL),  WN2=WN*(WN+1.0) (SPHERICAL MODEL)
C     C2=C**2
C     FRQ2=FRQ**2
C
      GO TO  (100,100,300,300,500,500),MODE
C
C FLAT MODEL
C ARG1=PERIOD,  ARG2=PHASE VELOCITY
C
  100 CONTINUE
      T=ARG1
      C=ARG2
      FRQ=PEI/T
      WN=FRQ/C
      WN2=WN*WN
      GO TO  1000
C
C SPHERICAL MODEL
C ARG1=PERIOD,  ARG2=PHASE VELOCITY
C IF(ARG1.LT.0)  ARG1=-(WAVE NUMBER),  ARG2=PERIOD
C
  300 CONTINUE
      IF(ARG1)  500,1000,310
  310 CONTINUE
      T=ARG1
      C=ARG2
      FRQ=PEI/T
      WN    =(FRQ*RMAX)/C-0.5D+0
      WN2   =WN*(WN+1.0D+0)
      GO TO  1000
C
C FREE OSCILLATION
C ARG1=WAVE NUMBER,  ARG2=PERIOD
C
  500 CONTINUE
      WN=ABS(ARG1)
      T=DABS(ARG2)
      FRQ=PEI/T
      C     =(FRQ*RMAX)/(WN+0.5D+0)
      WN2   =WN*(WN+1.0D+0)
      GO TO  1000
C
C EXIT
C
 1000 CONTINUE
      C2=C*C
      FRQ2=FRQ*FRQ
      RETURN
      END