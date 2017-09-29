local OPCODE_LANGUAGE = 1
 
function onExtendedOpcode(player, opcode, buffer)
	if opcode == OPCODE_LANGUAGE then
		-- otclient language
		if buffer == 'en' or buffer == 'pt' then
			-- example, setting player language, because otclient is multi-language...
			-- player:setStorageValue(SOME_STORAGE_ID, SOME_VALUE)
		end
	else
		-- other opcodes can be ignored, and the server will just work fine...
	end
	if opcode == 123 then
			local poke = player:getSummons()[1] or player:getSummons()
		if buffer == "evolve" then
			if not poke:getEvolution() or poke:getEvolution() == "null" then return false end
				if player:getLevel() >= poke:getMaxLevel() then
				local pokenome = poke:getName()
				local pokepos = poke:getPosition()
				poke:remove()
			local poket = Game.createMonster(poke:getEvolution(), pokepos)
			poket:setMaster(player)
			player:say("Oh!\nMeu "..pokenome.." evoluiu para "..poket:getName().."!", TALKTYPE_ORANGE_1)
		else
				player:say("Ouch!\nEu nao posso evoluir ainda!", TALKTYPE_ORANGE_1)
			end
		else
		local pos = {buffer}
		param = buffer:split("|")
		pos2 = {x = param[1], y = param[2], z = param[3]}
		poke:moveTo(pos2)
		end
	end
end
