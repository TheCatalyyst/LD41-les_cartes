extends "res://cartes/carte_base.gd"




func OnContactPlayer():
	queue_free()




func OnContactCard(CardPlayer):
	if (CardPlayer != player):
		queue_free()

