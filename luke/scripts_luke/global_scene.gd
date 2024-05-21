extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func start_bg_music():
	%BgMusic.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func start_night_path_music():
	%BgMusic.stop()
	$NightPathMusic.play()
