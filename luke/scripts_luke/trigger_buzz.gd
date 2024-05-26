extends Area3D

@export var buzz_home: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("player"):
		GlobalSignals.emit_signal("buzz_home_set",buzz_home)
		if buzz_home == "cave":
			GlobalSignals.emit_signal("orb_to_clearing_two")
		else:
			GlobalSignals.emit_signal("voice_to_clearing_two")