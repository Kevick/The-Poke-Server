function Monster:onSpawn(position)
	if not self:isSummon() and self:isMonster() then
		chancesh = math.random(1, 10000)
		chancesh2 = 314
		if chancesh >= chancesh2 then
			Game.createMonster("Shiny ".. self:getName, self:getPosition)
			self:remove()
			end
	end
	return true
end

-- Example
--[[
	function Monster:onSpawn(position)
		local maxHealth = math.random(self:getHealth())
		self:addHealth(-maxHealth)
		return true
	end
]]
