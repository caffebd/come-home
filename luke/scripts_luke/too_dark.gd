extends Area3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		if not body.has_light:
			GlobalSignals.emit_signal("show_player_info", "It's too dark to go that way. I need a light.")
		else:
			queue_free()
