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
	GlobalSignals.voice_to_clearing_two.connect(_stop_call)

func _stop_call():
	%CallTimer.stop()

func _adjust_random():
	lower_rnd = 10
	upper_rnd = 20
	voice_blocked = true


func _resume_call():
	voice_blocked = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	look_at(player.global_position)
	
func _follow_cave():	
	voice_blocked = true
	print ("voice blocked")

func _call():
	play()
	$SaifulTextAnim.play("expand")
	%CallTimer.wait_time = rng.randf_range(lower_rnd, upper_rnd)
	%CallTimer.start()


func _on_call_timer_timeout() -> void:
	if not playing and not voice_blocked:
		var player_dist: float = global_position.distance_to(player.global_position)
		print (player_dist)
		if player_dist > 6.0:
			print ("dad calling")
			play()
			$SaifulTextAnim.play("expand")
