import Graphics.UI.GLUT

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
                clearColor $= Color4 1 0 0 1
                clear [ColorBuffer]
                renderPrimitive Polygon
                  $mapM_ (\(x, y, z)->vertex$Vertex3 x y z) myPoints
                flush
