import Graphics.UI.GLUT

knopfPoses :: [(GLfloat,GLfloat,GLfloat)]
knopfPoses = [(0.0,0.1,0.0),
              (0.0,0.0,0.0),
              (0.0,(-0.1),0.0)]
knopfRadien :: [Float]
knopfRadien = [0.02,0.02,0.02]

main = do
  getArgsAndInitialize
  meinWindow "Hello Snowman"
  mainLoop

meinWindow window_name = do
  createWindow window_name
  displayCallback $= drawSnowman
  
--fillCircle r = displayCircle r 0.0 (-1.0)

drawSnowman = do
     (displayCircle 0.2 0.0 0.4)
     (displayCircle 0.25 0.0 0.0)
     (displayCircle 0.3 0.0 (-0.5))
     currentColor $= Color4 1 0.5 0 1
     (drawNose 0.0 0.4 1.0)
     --knöpfe
     currentColor $= Color4 0 0 0 1
     --(displayCircle 0.02 0.0 0.1)
     --(displayCircle 0.02 0.0 0.0)
     --(displayCircle 0.02 0.0 (-0.1))
     (drawKnopfs knopfRadien knopfPoses)
     --augen
     (displayCircle  0.02 0.1 0.5)
     (displayCircle  0.02 (-0.1) 0.5)
     flush

--      y
--      |
--      |
--      +-------------x
--               r           x       y 
drawKnopfs :: [Float] -> [(GLfloat, GLfloat, GLfloat)] -> IO ()
drawKnopfs (r:[]) ((posX,posY,_):[]) = displayCircle r posX posY
drawKnopfs (r:radien) ((posX,posY,_):restPosListe) = do
                                                    displayCircle r posX posY
                                                    drawKnopfs radien restPosListe


drawNose posX posY size = do renderAs Triangles (createNose posX posY size)
  
createNose posX posY size = [((size*(-0.2)+posX),(0.0+posY),0.0),
                             ((0.01+posX)   ,size*(0.05+posY),0.0),
                             ((0.01+posX) ,(size*(-0.05)+posY),0.0)]
                   --            /2   
                   --        1 <
                   --            \3
  
displayCircle radius posX posY = do
   renderAs Polygon (createCircle radius posX posY)
   
   
createCircle radius posX posY = circlePoints radius 100 posX posY

circlePoints :: Float -> Float -> GLfloat -> GLfloat -> [(GLfloat,GLfloat,GLfloat)]
circlePoints radius number posX posY = [let alpha = twoPi * i /number
                                 in ((radius*(sin (alpha)) + posX) ,(radius * (cos (alpha))+ posY),0.0)
                               |i <- [1,2..number]]
                               where
                                 twoPi = 2*pi

  
renderAs figure pointlist = renderPrimitive figure$makeVertexes pointlist

makeVertexes = mapM_ (\(x,y,z)->vertex$Vertex3 x y z)
                     

  
