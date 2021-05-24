import Graphics.UI.GLUT


myHausVomNikolaus ::[(GLfloat,GLfloat,GLfloat)]
myHausVomNikolaus =[(-0.25,-0.25,0.0),
                    (0.25,0.25,0.0),
                    (0.25,0.25,0.0),
                    (0.25,-0.25,0.0),
                    (0.25,-0.25,0.0),
                    (-0.25,0.25,0.0),
                    (-0.25,0.25,0.0),
                    (0.0,0.5,0.0),
                    (0.0,0.5,0.0),
                    (0.25,0.25,0.0),
                    (0.25,0.25,0.0),
                    (-0.25,0.25,0.0),
                    (-0.25,0.25,0.0),
                    (-0.25,-0.25,0.0),
                    (-0.25,-0.25,0.0),
                    (0.25,-0.25,0.0)]
     
--     x
--   4  5-
--  x 6  x
--  7 13 2
--  x 8  x

myPoints :: [(GLfloat,GLfloat,GLfloat)]
myPoints =[(-0.25, 0.25, 0.0)
           ,(0.75, 0.35, 0.0)
           ,(0.75, -0.15, 0.0)
           ,((-0.75), -0.25, 0.0)]

main = do
  getArgsAndInitialize
  meinWindow "Hello Laura"
  mainLoop

meinWindow window_name = do
  createWindow window_name
  displayCallback $= malFunktion

malFunktion = do
                clearColor $= Color4 0 0 0 1
                clear [ColorBuffer]
                renderPrimitive Lines
                  $mapM_ (\(x, y, z)->vertex$Vertex3 x y z) myHausVomNikolaus
                flush
