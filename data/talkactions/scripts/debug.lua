function onSay(player, words, param)
	poke = player:getSummons()[1]
	poke:soltaMagia("Practise Fire Wave")
	poke:say("Onda infernal!", TALKTYPE_ORANGE_1)
	player:say("Charmander, use Onda infernal!", TALKTYPE_ORANGE_1)
end