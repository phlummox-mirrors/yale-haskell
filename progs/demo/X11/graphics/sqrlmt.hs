-- Peter Henderson's Recursive Geometry
-- Syam Gadde and Bo Whong
-- CS429 Project
-- SquareLimit User Program

module SqrLimit where
import HendersonLib
import Xlib
{-
p = File "p.pic"

q = File "q.pic"

r = File "r.pic"

s = File "s.pic"
-}
p = Grid 640 640 [((560.0,560.0),(440.0,640.0)), 
              ((640.0,560.0),(560.0,560.0)), 
	      ((520.0,440.0),(640.0,480.0)), 
	      ((400.0,480.0),(520.0,440.0)), 
	      ((480.0,360.0),(360.0,400.0)), 
	      ((480.0,360.0),(640.0,400.0)), 
	      ((480.0,280.0),(640.0,320.0)), 
	      ((320.0,320.0),(480.0,280.0)), 
	      ((280.0,400.0),(160.0,440.0)), 
	      ((160.0,240.0),(280.0,400.0)), 
	      ((160.0,440.0),(160.0,240.0)), 
	      ((120.0,480.0),(0.0,320.0)), 
	      ((0.0,320.0),(0.0,520.0)), 
	      ((120.0,480.0),(0.0,520.0)), 
	      ((240.0,640.0),(160.0,480.0)), 
	      ((400.0,480.0),(440.0,640.0)), 
	      ((320.0,320.0),(400.0,480.0)), 
	      ((160.0,120.0),(320.0,320.0)), 
	      ((0.0,0.0),(160.0,120.0)), 
	      ((640.0,240.0),(320.0,160.0)), 
	      ((640.0,40.0),(560.0,0.0)), 
	      ((520.0,40.0),(640.0,80.0)), 
	      ((480.0,0.0),(520.0,40.0)), 
	      ((480.0,80.0),(400.0,0.0)), 
	      ((640.0,120.0),(480.0,80.0)), 
	      ((480.0,160.0),(640.0,160.0)), 
	      ((320.0,0.0),(480.0,160.0)), 
	      ((240.0,40.0),(320.0,0.0)), 
	      ((0.0,0.0),(240.0,40.0))]

q = Grid 16 16 [((10.0,6.0),(9.0,4.0)), 
            ((12.0,4.0),(10.0,6.0)), 
	    ((9.0,4.0),(12.0,4.0)), 
	    ((0.0,6.0),(7.0,5.0)), 
	    ((0.0,8.0),(0.0,16.0)), 
	    ((0.0,0.0),(0.0,4.0)), 
	    ((15.0,16.0),(16.0,14.0)), 
	    ((16.0,12.0),(14.0,16.0)), 
	    ((13.0,16.0),(16.0,10.0)), 
	    ((13.0,12.0),(12.0,16.0)), 
	    ((16.0,8.0),(13.0,12.0)), 
	    ((15.0,6.0),(16.0,8.0)), 
	    ((16.0,0.0),(15.0,6.0)), 
	    ((10.0,16.0),(14.0,5.0)), 
	    ((10.0,10.0),(10.0,7.0)), 
	    ((8.0,16.0),(10.0,10.0)), 
	    ((8.0,11.0),(8.0,8.0)), 
	    ((6.0,16.0),(8.0,11.0)), 
	    ((6.0,11.0),(4.0,16.0)), 
	    ((6.0,9.0),(6.0,11.0)), 
	    ((4.0,11.0),(4.0,9.0)), 
	    ((2.0,16.0),(4.0,11.0)), 
	    ((4.0,9.0),(0.0,8.0)), 
	    ((6.0,9.0),(4.0,9.0)), 
	    ((12.0,6.0),(6.0,9.0)), 
	    ((16.0,0.0),(12.0,6.0)), 
	    ((9.0,3.0),(8.0,1.0)), 
	    ((11.0,1.0),(9.0,3.0)), 
	    ((8.0,1.0),(11.0,1.0)), 
	    ((8.0,0.0),(7.0,1.0)), 
	    ((5.0,2.0),(7.0,1.0)), 
	    ((6.0,0.0),(7.0,1.0)), 
	    ((5.0,2.0),(4.0,0.0)), 
	    ((3.0,3.0),(5.0,2.0)), 
	    ((3.0,3.0),(0.0,4.0)), 
	    ((2.0,0.0),(3.0,3.0))]

r = Grid 32 32 [((32.0,0.0),(24.0,8.0)), 
            ((32.0,4.0),(30.0,2.0)), 
	    ((28.0,4.0),(32.0,8.0)), 
	    ((32.0,12.0),(26.0,6.0)), 
	    ((24.0,8.0),(32.0,16.0)), 
	    ((22.0,0.0),(24.0,8.0)), 
	    ((22.0,12.0),(12.0,0.0)), 
	    ((32.0,20.0),(22.0,12.0)), 
	    ((24.0,26.0),(10.0,22.0)), 
	    ((32.0,32.0),(24.0,26.0)), 
	    ((16.0,28.0),(24.0,32.0)), 
	    ((6.0,26.0),(16.0,28.0)), 
	    ((16.0,32.0),(4.0,28.0)), 
	    ((2.0,30.0),(8.0,32.0)), 
	    ((0.0,32.0),(16.0,16.0)), 
	    ((0.0,24.0),(10.0,12.0)), 
	    ((4.0,8.0),(0.0,16.0)), 
	    ((28.0,20.0),(32.0,24.0)), 
	    ((16.0,16.0),(28.0,20.0)), 
	    ((4.0,8.0),(16.0,16.0)), 
	    ((2.0,4.0),(4.0,8.0)), 
	    ((2.0,4.0),(0.0,8.0)), 
	    ((0.0,0.0),(2.0,4.0))]

s = Grid 32 32 [((24.0,0.0),(32.0,0.0)), 
            ((0.0,0.0),(16.0,0.0)), 
	    ((30.0,14.0),(32.0,12.0)), 
	    ((32.0,8.0),(28.0,10.0)), 
	    ((26.0,6.0),(32.0,4.0)), 
	    ((26.0,6.0),(24.0,0.0)), 
	    ((30.0,14.0),(26.0,6.0)), 
	    ((32.0,16.0),(30.0,14.0)), 
	    ((30.0,16.0),(26.0,18.0)), 
	    ((30.0,22.0),(30.0,16.0)), 
	    ((26.0,18.0),(30.0,22.0)), 
	    ((24.0,24.0),(20.0,20.0)), 
	    ((24.0,18.0),(24.0,24.0)), 
	    ((20.0,20.0),(24.0,18.0)), 
	    ((20.0,0.0),(22.0,12.0)), 
	    ((14.0,6.0),(16.0,0.0)), 
	    ((14.0,16.0),(16.0,20.0)), 
	    ((14.0,6.0),(14.0,16.0)), 
	    ((20.0,24.0),(16.0,20.0)), 
	    ((32.0,32.0),(20.0,24.0)), 
	    ((16.0,28.0),(32.0,32.0)), 
	    ((8.0,28.0),(16.0,28.0)), 
	    ((0.0,32.0),(8.0,28.0)), 
	    ((0.0,24.0),(4.0,30.0)), 
	    ((0.0,20.0),(14.0,24.0)), 
	    ((0.0,16.0),(16.0,20.0)), 
	    ((0.0,12.0),(14.0,16.0)), 
	    ((0.0,8.0),(14.0,12.0)), 
	    ((0.0,4.0),(14.0,6.0))]

quartet p1 p2 p3 p4 =
  Above 1 (Beside 1 p1 1 p2) 1 (Beside 1 p3 1 p4) 

cyc p1 =
  quartet p1 (Rot (Rot (Rot p1))) (Rot p1) (Rot (Rot p1))

t = quartet p q r s 

u = cyc (Rot q)

side1 = quartet Nil Nil (Rot t) t

side2 = quartet side1 side1 (Rot t) t

corner1 = quartet Nil Nil Nil u

corner2 = quartet corner1 side1 (Rot side1) u

pseudocorner = quartet corner2 side2 (Rot side2) (Rot t)

pseudolimit = cyc pseudocorner

nonet p1 p2 p3 p4 p5 p6 p7 p8 p9 = 
  Above 1 (Beside 1 p1 2 (Beside 1 p2 1 p3))
        2 (Above 1 (Beside 1 p4 2 (Beside 1 p5 1 p6))
	         1 (Beside 1 p7 2 (Beside 1 p8 1 p9)))

corner = nonet corner2 side2 side2
               (Rot side2) u (Rot t)
	       (Rot side2) (Rot t) (Rot q)

squarelimit = cyc corner

final host = draw host corner ((0,0),(500,0),(0,500)) (0,0,500,500)
skewedfinal host = draw host squarelimit ((0,0),(600,200),(200,600)) (0,0,800,800)

main = getEnv "DISPLAY" exit $ \ host ->
       xHandleError ( \ (XError msg) -> appendChan stdout msg exit done) $
       final host
