extends Node2D

export(int) var num
export(float) var vie
export(Array) var pioche

var carte_select
func _ready():
	piocher_carte()
	piocher_carte()
	piocher_carte()
	piocher_carte()
	piocher_carte()
	carte_select = 0
	$Cartes.get_child(carte_select).get_child(0).retourner_carte()

func _process(delta):
	if(Input.is_action_just_pressed("action_down_" + String(num))):
		if(!$Cartes.get_child(carte_select).est_vide()):
			$Cartes.get_child(carte_select).get_child(0).retourner_carte()
		carte_select = carte_select + 1
		if(carte_select == $Cartes.get_child_count()):
			carte_select = 0
		if(!$Cartes.get_child(carte_select).est_vide()):
			$Cartes.get_child(carte_select).get_child(0).retourner_carte()
	if(Input.is_action_just_pressed("action_up_" + String(num))):
		if(!$Cartes.get_child(carte_select).est_vide()):
			$Cartes.get_child(carte_select).get_child(0).retourner_carte()
		carte_select = (carte_select - 1)
		if(carte_select < 0):
			carte_select = $Cartes.get_child_count() - 1
		if(!$Cartes.get_child(carte_select).est_vide()):
			$Cartes.get_child(carte_select).get_child(0).retourner_carte()
	if(Input.is_action_just_pressed("action_launch_" + String(num))):
		if(!$Cartes.get_child(carte_select).est_vide()):
			var dir
			if(num == 1):
				dir = Vector2(1,0)
			else:
				dir = Vector2(-1, 0)
			$Cartes.get_child(carte_select).get_child(0).lancer(dir)

func _on_Area2D_body_entered(body):
	# En espérant que ce soit une carte
	vie -= body.dmgToPlayer
	body.OnContactPlayer()
	
func piocher_carte():
	var child_id = 0
	while(child_id < $Cartes.get_child_count() && !$Cartes.get_child(child_id).est_vide()):
		child_id += 1
		
	if(child_id < $Cartes.get_child_count()):
		var carte_pioche = load(pioche[randi() % pioche.size()]).instance()
		$Cartes.get_child(child_id).add_child(carte_pioche)
	