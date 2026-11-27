extends Node2D

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("reiniciar"):
		get_tree().reload_current_scene()

func _on_meta_body_entered(body: Node2D) -> void:
	if body == $Jugador:
		$Estado.text = "Meta alcanzada. Pulsa R para repetir"
