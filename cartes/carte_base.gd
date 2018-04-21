extends RigidBody2D

export(float) var speed;
export(float) var rot;

export (int) var player;

export (int) var dmgToPlayer;

var selected
func _ready():
	selected=false;
	set_mode(MODE_STATIC)


func retourner_carte():
	if($visible.visible):
		$visible.hide()
		selected = false;
	else:
		$visible.show()
		selected = true;

func lancer(dir):
	set_mode(MODE_RIGID)
	set_linear_velocity(dir.normalized()*speed)
	set_angular_velocity(rot)
	