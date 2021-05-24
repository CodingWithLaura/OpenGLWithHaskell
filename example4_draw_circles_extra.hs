import Graphics.UI.GLUT

circleList :: [(GLfloat,GLfloat,GLfloat)]
circleList = [(0.0,0.5,0.0),
              (0.0,0.0,0.0),
              (0.0,-0.5,0.0)]
radiusList :: [Float]
radiusList = [0.4,0.5,0.6]

--displayPoints = do
--  clear [ColorBuffer]
--  renderPrimitive Points
--    $mapM_ (\(x, y, z)->vertex$Vertex3 x y z) myPoints

circlePoints :: Float -> Float -> Float -> Float ->[(GLfloat,GLfloat,GLfloat)]
circlePoints radius number posX posY= [let alpha = twoPi * i /number
                                 in ( radius*(sin (alpha)) + posX  ,radius * (cos (alpha)) + posY , 0.0)
                               |i <- [1,2..number]]
                               where
                                 twoPi = 2*pi

circle radius = circlePoints radius 100 0.5 (-0.5)

--renderCircleApprox r n
--   = displayPoints (circlePoints r n) LineLoop

--renderCircle r = displayPoints (circle r) LineLoop
fillCircle r = displayPoints (circle r) Polygon 

main = do
  getArgsAndInitialize
  meinWindow "Hello Laura"
  mainLoop

meinWindow window_name = do
  createWindow window_name
  displayCallback $= fillCircle 0.25

--malt Kreis mit punkten
-- points: sind die Punkte
-- primitive Shape is Points oder Lines oder Polygon (default polygon)
displayPoints points primitiveShape = do
   renderAs primitiveShape points
   flush

renderAs figure ps = renderPrimitive figure$makeVertexes ps

makeVertexes = mapM_ (\(x,y,z)->vertex$Vertex3 x y z)
