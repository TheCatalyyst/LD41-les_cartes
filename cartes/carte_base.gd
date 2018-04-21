extends RigidBody2D

export(float) var speed;
export(float) var rot;

export (int) var player;

export (int) var dmg;

export (int) var spriteNo;

export (int) var HP;

var state #"hidden", "visible", "throwed"

func _ready():
	set_collision_mask(2)
	if(player == 1):
		set_collision_layer(1)
	else:
		set_collision_layer(4)
	
	set_mode(MODE_STATIC)

func _process(delta):
	if(HP < 1):
		queue_free();

func retourner_carte():
	if($visible.visible):
		$visible.hide()
		state = "hidden";
	else:
		$visible.show()
		state = "visible";

func lancer(dir):
	state = "throwed"
	set_collision_layer(2)
	
	if(player == 1):
		set_collision_mask(3)
	else:
		set_collision_mask(6)
	
	set_mode(MODE_RIGID)
	set_linear_velocity(dir.normalized()*speed)
	set_angular_velocity(rot)
	
func _on_carte_base_body_entered(body):
	if(body.is_in_group("Carte")):
		if (state == "hidden" || state == "visible"):
			body.OnContactCard($".");
		
		
