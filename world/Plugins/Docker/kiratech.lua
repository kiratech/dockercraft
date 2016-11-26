-- Little helper function to draw a letter in the sky
function drawLetter(mt, offset)
for i=1,5 do
    for j=1,3 do
      if mt[i][j]==1 then
        x=i
        z=j+offset
        for pieceX=x, x+0.5
        do
          for pieceZ=z, z+0.5
          do
            setBlock(UpdateQueue, pieceX, GROUND_LEVEL + 20, pieceZ, E_BLOCK_WOOL, E_META_WOOL_RED)
          end
        end
      end
    end
  end
end

-- Draw kiratech in the sky
function drawKiratech()
  drawLetter({{1,0,1}, {1,1,0}, {1,0,0}, {1,1,0}, {1,0,1}}, 1)
  drawLetter({{0,1,0}, {0,1,0}, {0,1,0}, {0,1,0}, {0,1,0}}, 4)
  drawLetter({{1,1,1}, {1,0,1}, {1,1,1}, {1,1,0}, {1,0,1}}, 7)
  drawLetter({{1,1,1}, {1,0,1}, {1,1,1}, {1,0,1}, {1,0,1}}, 11)
  drawLetter({{1,1,1}, {0,1,0}, {0,1,0}, {0,1,0}, {0,1,0}}, 15)
  drawLetter({{1,1,1}, {1,0,0}, {1,1,1}, {1,0,0}, {1,1,1}}, 19)
  drawLetter({{1,1,1}, {1,0,0}, {1,0,0}, {1,0,0}, {1,1,1}}, 23)
  drawLetter({{1,0,1}, {1,0,1}, {1,1,1}, {1,0,1}, {1,0,1}}, 27)
end

