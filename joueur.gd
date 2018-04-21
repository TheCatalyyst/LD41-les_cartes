extends Area2D

export(float) var vie
export(int) var num


func _on_joueur_body_entered(body):
	vie -= 1
	body.queu_free()
