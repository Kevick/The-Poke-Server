function onUse(player, item, position)
	local pokeid = i:getAttack()
	local creature = player
	local pokename = db.query("SELECT `name` FROM `pokes` WHERE `id` = "..pokeid..";")
	local pokelevel = db.query("SELECT `level` FROM `pokes` WHERE `id` = "..pokeid..";")
	local balltype = db.query("SELECT `bt` FROM `pokes` WHERE `id` = "..pokeid..";")
	local balleffon = balls_effect[balltype].on
	local balleffoff = balls_effect[balltype].off
	local poke = Game.createMonster(pokename, creature:getPosition())
	local maxHealth = db.query("SELECT `vidatotal` FROM `pokes` WHERE `id` = "..pokeid..";")
	if item:getID() == BALLS_MORTO then
		 player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Seu pokémon está morto!")
		end
	if item:getID() == BALLS_BACK and #creature:getSummons() == 1 then
		position:sendMagicEffect(balleffon, poke:getPosition())
		poke:remove()
		item:transform(balls[balltype].normal)
		db.query("UPDATE `pokes` WHERE `id` = "..pokeid.." SET `vida`= "..poke:getHealth()..";")
		creature:say("Volte, "..pokename.."!", TALKTYPE_ORANGE_1)
		end
	if itemType(item(uid)):getSlotPosition() ~= 176 then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Use a pokebola no lugar certo!")
		end
	if #creature:getSummons() > 1 then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, "Você só pode ter um pokemon!")
		end
	poke:setMaster(player)
	creature:say(pokename.." eu escolho você!", TALKTYPE_ORANGE_1)
	position:sendMagicEffect(balleffon, poke:getPosition())
	item:transform(balls[balltype].uso)
	poke:setMaxHealth(maxHealth + (maxHealth*(player:getLevel()/100)))
	pooke:addHealth(maxHealth - poke:getHealth())
	return true		
end