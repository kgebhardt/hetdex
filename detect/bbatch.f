
      character a0(100)*120,a1*20,a2*20
      open(unit=1,file="rtall",status='old')
      open(unit=11,file="out",status='unknown')

      n=0
      do i=1,100000
         read(1,*,end=666)
         n=n+1
      enddo
 666  continue
      rewind(1)
      np=int(float(n)/200./20.)+1
      write(*,*) "Number of tasks,bins = ",n,np
c      write(*,*) "Enter number to bin "
c      read *,nb
      nb=14

      do i=1,n
         nb0=0
         do j=1,nb
            nb0=nb0+1
c            read(1,1001,end=667) a1,x2,x3,x4,x5,x6,i7,a2
            read(1,*,end=667) a1,x2,x3,x4,x5,x6,i7,a2
            write(a0(j),1003) a1,x2,x3,x4,x5,x6,i7,a2
         enddo
 667     continue
c         print *,nb,nb0
         if(nb0.eq.nb) then
            write(11,1002) (a0(j),j=1,nb)
         else
            do j=nb0+1,nb
               a0(j)="echo Hi"
            enddo
            write(11,1002) (a0(j),j=1,nb)
            goto 668
         endif
      enddo
 668  continue
      close(1)
 1001 format(a120)
 1002 format(a80,13(" ; ",a80))
 1003 format(a6,2(1x,f11.6),1x,f4.1,2(1x,f7.1),1x,i6,1x,a13)

      end
