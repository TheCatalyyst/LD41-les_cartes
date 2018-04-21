extends RigidBody2D

export(float) var speed;
export(float) var rot;

func _ready():
	set_mode(MODE_STATIC)


func retourner_carte():
	if($visible.visible):
		$visible.hide()
	else:
		$visible.show()

func _on_Area2D_body_entered(body):
	# Une carte est rentrée
	# Faut faire l'action associé
	
	# à faire en héritage dans le modèle de carte précis ?
	
	pass
func lancer(dir):
	set_mode(MODE_RIGID)
	set_linear_velocity(dir.normalized*speed)
	set_angular_velocity(rot)
	