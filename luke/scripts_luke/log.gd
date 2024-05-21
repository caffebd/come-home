extends Node3D

var colliding: bool = false

var dragging: bool = true

func _ready() -> void:
	GlobalSignals.log_emit.connect(_log_emit)

func dragged(drag_marker):
	if not colliding:
		%CPUParticles3D.emitting = false
		global_position.z = drag_marker.global_position.z
		global_position.x = drag_marker.global_position.x
		


func _on_drop_area_body_entered(body: Node3D) -> void:
	colliding = true
	var z_pos = global_position.z
	var tween = create_tween()
	tween.tween_property(self, "global_position:z", z_pos + 0.6, 0.5)
	await tween.finished
	colliding = false


func _log_emit():
	%CPUParticles3D.emitting = true
