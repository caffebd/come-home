extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignals.light_state.connect(_light_state)


func _light_state(state):
	if state:
		GlobalSignals.emit_signal("dark_place", true)
		queue_free()


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		if not body.has_light:
			GlobalSignals.emit_signal("show_player_info", "It was too dark to go that way. I needed a light.")
		elif body.has_light and not body.light_on:
			GlobalSignals.emit_signal("show_player_info", "I needed to turn on my light.")
		else:
			GlobalSignals.emit_signal("dark_place", true)
			queue_free()
