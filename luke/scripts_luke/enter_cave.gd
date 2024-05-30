extends Area3D


# Called when the node enters the scene tree for the first time.



func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		monitoring = false
		GlobalSignals.emit_signal("hiding")
		GlobalSignals.emit_signal("orb_to_clearing_two")
		GlobalSignals.emit_signal("path_chosen", "cave")
