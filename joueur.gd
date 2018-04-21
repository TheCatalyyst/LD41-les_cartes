extends Node2D

export(int) var nb_cartes
export(int) var carte_select
export(float) var vie
export(Array) var pioche

func _ready():
	piocher_carte()
	piocher_carte()
	piocher_carte()
	piocher_carte()
	piocher_carte()

func _process(delta):
	if(Input.is_action_just_pressed("ui_up")):
		carte_select = (carte_select + 1) % nb_cartes
		$Cartes.get_child(carte_select).retourner_carte()
	if(Input.is_action_just_pressed("ui_down")):
		carte_select = (carte_select - 1) % nb_cartes
		$Cartes.get_child(carte_select).retourner_carte()

func _on_Area2D_body_entered(body):
	vie -= 1
	
func piocher_carte():
	var child_id = 0
	while(child_id < $Cartes.get_child_count() && !$Cartes.get_child(child_id).est_vide()):
		child_id += 1
		
	if(child_id < $Cartes.get_child_count()):
		var carte_pioche = load(pioche[randi() % pioche.size()]).instance()
		$Cartes.get_child(child_id).add_child(carte_pioche)
	