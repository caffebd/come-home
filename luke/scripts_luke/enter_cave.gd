extends Area3D


# Called when the node enters the scene tree for the first time.



func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("hiding")