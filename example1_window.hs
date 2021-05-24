import Graphics.UI.GLUT

main = do
  getArgsAndInitialize
  meinWindow "Hello Laura"
  mainLoop

meinWindow window_name = do
  createWindow window_name
  displayCallback $= malFunktion

malFunktion = do
                clear [ColorBuffer]
