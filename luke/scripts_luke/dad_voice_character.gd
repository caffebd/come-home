extends CharacterBody3D

@export var player: CharacterBody3D

@export var to_house_markers: Array[Marker3D]

var use_check_points: Array[Marker3D]

enum {HOUSEPATH}

var  speed = 10.0


var target_position: Vector3

var check_index:int = 0#

var moving: bool = false

var sense_player: bool = false

func _ready() -> void:
	GlobalSignals.fork_set_up.connect(_fork_set_up)
	GlobalSignals.follow_voice.connect(_follow_voice)
	#print ("hosue markers "+str(to_house_markers.size()))
	#_fork_set_up()


	

func _fork_set_up():
	_set_check_points(HOUSEPATH)

func _follow_voice():
	print ("follwo dad voice")
	_set_check_points(HOUSEPATH)
	_next_position()

func _physics_process(delta: float) -> void:
	var player_dist: float = global_position.distance_to(player.global_position)
	#print (player_dist)
	if player_dist < 8.0 and sense_player:
		print ("PLAYER CLOSE")
		sense_player = false
		_next_position()
		#%SenseTimer.start()
	
	if not moving: return

	var direction = global_position.direction_to(target_position)
	if global_position.distance_to(target_position) > 0.2:
		sense_player = false
		#rotation.y=lerp_angle(rotation.y,atan2(velocity.x,velocity.z),.1)
		speed = lerp(speed, 4.0, 0.5)
		velocity = direction * speed
	else:
		moving = false
		sense_player = true

	move_and_slide()


func _next_position():
	print (use_check_points.size())
	if check_index < use_check_points.size():
		target_position = use_check_points[check_index].global_position
		moving = true
		sense_player = true
		#_check_for_narration(use_check_points[check_index].name)
		print ("select next")
		check_index += 1
		GlobalSignals.emit_signal("dad_call", 3)
	else:
		print ("select done")
		moving = false
		sense_player = false
		check_index = 0


func _set_check_points(phase):
	use_check_points.clear()
	match phase:
		HOUSEPATH:
			use_check_points = to_house_markers.duplicate()
	
