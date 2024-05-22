extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func start_bg_music():
	%BgMusic.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.

func start_night_path_music():
	$NightPathMusic.play()
	var tween = create_tween()
	tween.tween_property(%BgMusic, "volume_db", -80.0,  10.0)
	await tween.finished
	%BgMusic.stop()
