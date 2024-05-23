extends CharacterBody3D


@export var player: CharacterBody3D

@export var animal_markers: Array[Marker3D]

var marker_index: int = -1 

var speed: float = 0.0
var max_speed: float = 3.0
const JUMP_VELOCITY = 4.5

var moving: bool = false
var target_position: Vector3
var direction: Vector3

var chasing: bool = false
var homing: bool = false

var stick_thrown_once: bool = false

#git comment

func _ready() -> void:
	GlobalSignals.animal_trigger.connect(_start_chase)
	GlobalSignals.stick_drop_forest.connect(_go_home)
	_go_home()

func _start_chase():
	print ("animal chase")
	_walk_sound()
	chasing = true
	homing = false
	moving = true
	

func _go_home():
	_stick_feedback()
	if marker_index < animal_markers.size()-1:
		marker_index += 1
	$WalkIngAnimal.stop()
	$RunningAnimal.stop()
	chasing = false
	homing = true
	moving = true

func _stick_feedback():
	if not stick_thrown_once and marker_index == 0:
		stick_thrown_once = true
		Narration.main_index = Narration.stick_worked_index
		Narration.sub_index = 0
		Narration.narrate()

func _physics_process(delta: float) -> void:
	
	if not moving: return
	
	
	if chasing:
		var player_dist: float = global_position.distance_to(player.global_position)
		if player_dist < 7.0:
			if not $RunningAnimal.playing:
				_run_sound()

		direction = global_position.direction_to(player.global_position)
		target_position = player.global_position
		
	if homing:
		direction = global_position.direction_to(animal_markers[marker_index].global_position)
		target_position = animal_markers[marker_index].global_position
	
	if global_position.distance_to(target_position) > 0.1:
		rotation.y=lerp_angle(rotation.y,atan2(velocity.x,velocity.z),.1)
		speed = lerp(speed, max_speed, 0.5)
	
		velocity = direction * speed

		move_and_slide()
	
	else:
		
		moving = false


func _walk_sound():
	$WalkIngAnimal.play()

func _run_sound():
	$WalkIngAnimal.stop()
	$RunningAnimal.play()
