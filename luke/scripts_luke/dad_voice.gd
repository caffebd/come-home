extends AudioStreamPlayer3D

var player: CharacterBody3D
var rng = RandomNumberGenerator.new()

var lower_rnd: int = 5
var upper_rnd: int = 8

var voice_blocked: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	rng.randomize()
	GlobalSignals.dad_call.connect(_call)
	GlobalSignals.animal_trigger.connect(_adjust_random)
	GlobalSignals.stick_drop_forest.connect(_resume_call)
	GlobalSignals.cave_path_trigger.connect(_follow_cave)
	player = get_parent().player

func _adjust_random():
	lower_rnd = 10
	upper_rnd = 20
	voice_blocked = true


func _resume_call():
	voice_blocked = false
	_call(3)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(player.global_position)
	
func _follow_cave():	
	voice_blocked = true
	print ("voice blocked")

func _call(count:int):
	for i in count:
		print ("dad calling")
		if not playing and not voice_blocked:
			play()
			$SaifulTextAnim.play("expand")
			await get_tree().create_timer(rng.randf_range(lower_rnd, upper_rnd)).timeout
