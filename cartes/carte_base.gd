extends Node2D

func retourner_carte():
	if($visible.visible):
		$visible.hide()
	else:
		$visible.show()

func _on_Area2D_body_entered(body):
	# Une carte est rentrée
	# Faut faire l'action associé
	pass
