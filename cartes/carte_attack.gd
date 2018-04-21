extends "res://cartes/carte_base.gd"




func OnContactPlayer():
	queue_free()


 


func OnContactCard(card):
	if (card.player != player):
		card.HP = card.HP - dmg;





