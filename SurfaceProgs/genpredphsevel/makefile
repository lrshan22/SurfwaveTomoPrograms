
objfiles = chareq.o gravty.o ssol.o cont.o inival.o step.o \
           dcdp.o integ.o table.o denerg.o interp.o timer.o \
           deriv.o intgnd.o tsol.o difcoe.o intime.o ttl1.o  \
           divide.o mlist.o s_saito.o wnfrq.o dlist.o rdmdl.o \
           ylist.o eigfun.o runge.o energy.o funct.o spherf.o 

.PHONY : all
all:	run.saito phsevel2

run.saito: run.saito.f ${objfiles}
	g77 run.saito.f -o run.saito ${objfiles}

phsevel2: phsevel2.f ${objfiles}
	g77 phsevel2.f -o phsevel2 ${objfiles}
	

.PHONY : clean
clean: 
	rm ${objfiles}	









