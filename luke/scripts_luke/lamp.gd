extends Node3D

@onready var mesh_one := $Body1


var collect_state_one: float = 0.15
var collect_state_two: float = 0.4
var collect_state_three: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.




func collected_state(parts: int):
	match parts:
		1:
			var tween = create_tween().set_parallel()
			tween.tween_property(mesh_one, "mesh:material:albedo_color:a", collect_state_one, 1.0)

		2:
			var tween = create_tween().set_parallel()
			tween.tween_property(mesh_one, "mesh:material:albedo_color:a", collect_state_two, 1.0)

		3:
			var tween = create_tween().set_parallel()
			tween.tween_property(mesh_one, "mesh:material:albedo_color:a", collect_state_three, 1.0)
