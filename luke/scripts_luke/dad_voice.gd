extends AudioStreamPlayer3D

@export var player: CharacterBody3D
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	GlobalSignals.dad_call.connect(_call)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(player.global_position)

func _call(count:int):
	for i in count:
		print ("dad calling")
		play()
		$SaifulTextAnim.play("expand")
		await get_tree().create_timer(rng.randf_range(5,10)).timeout
