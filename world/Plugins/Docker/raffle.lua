function NewRaffle(x, z)
	return {
		x = x;
		z = z;
		display = function(self)
			for px=self.x, self.x+7 do
				for pz=self.z, self.z+8 do
					setBlock(UpdateQueue,px,GROUND_LEVEL,pz,E_BLOCK_WOOL,E_META_WOOL_WHITE)
				end
			end

			for py = GROUND_LEVEL+1, GROUND_LEVEL+8 do
				for pz = self.z, self.z+8 do
					setBlock(UpdateQueue,self.x+8,py,pz,E_BLOCK_WOOL,E_META_WOOL_ORANGE)
				end
				for px = self.x, self.x+8 do
					setBlock(UpdateQueue,px,py,self.z,E_BLOCK_WOOL,E_META_WOOL_ORANGE)
					setBlock(UpdateQueue,px,py,self.z+8,E_BLOCK_WOOL,E_META_WOOL_ORANGE)
				end
			end

			for px=self.x, self.x+7 do
				for pz=self.z, self.z+8 do
					setBlock(UpdateQueue,px,GROUND_LEVEL + 8,pz,E_BLOCK_WOOL,E_META_WOOL_ORANGE)
				end
			end

			-- torch to grab
			setBlock(UpdateQueue,self.x+3,GROUND_LEVEL+6,self.z+5,E_BLOCK_TORCH,E_META_TORCH_WEST)

			-- Raffle button and sign
			setBlock(UpdateQueue,self.x+7,GROUND_LEVEL + 2,self.z + 2,E_BLOCK_WALLSIGN,E_META_CHEST_FACING_XM)
			updateSign(UpdateQueue,self.x+7,GROUND_LEVEL + 2,self.z + 2,"","RAFFLE!","---->","",2)
			setBlock(UpdateQueue,self.x+7,GROUND_LEVEL+2,self.z+3,E_BLOCK_WOODEN_BUTTON,E_BLOCK_BUTTON_XM)


		end
	}
end

function readAll(file)
	local f = io.open(file, "rb")
	local content = f:read("*all")
	f:close()
	return content
end

function lines(str)
	local t = {}
	local function helper(line) table.insert(t, line) return "" end
	helper((str:gsub("(.-)\r?\n", helper)))
	return t
end

function tablelength(t)
	local count = 0
	for _ in pairs(t) do count = count + 1 end
	return count
end

function RaffleChooseWinner()
	c = readAll("/partecipants.txt")
	t = lines(c)
	math.randomseed(os.time())
	choosen = math.random(1, tablelength(t))
	return t[choosen]
end
