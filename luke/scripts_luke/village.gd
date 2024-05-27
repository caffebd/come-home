extends Node3D

var fade_in: bool = false

#480 test steam add id
var app_id = "480"

#func _init() -> void:
	#OS.set_environment("SteamAppID", app_id)
	#OS.set_environment("SteamGameID", app_id)	

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#steam_init()
	$path.visible = false
	GlobalSignals.emit_signal("start_house")
	#GlobalSignals.emit_signal("start_in_cave")
	await get_tree().create_timer(8.0).timeout
	GlobalSignals.emit_signal("start_game")
	#GlobalSignals.emit_signal("dad_to_mound")
	#GlobalSignals.emit_signal("start_clearing")
	#GlobalSignals.emit_signal("night_path_set_up")
	#GlobalSignals.emit_signal("fork_set_up")
	
	
	#var tween = create_tween().parallel()
	#tween.tween_property($WorldEnvironment, "environment:sky:sky_material:sky_top_color", Color("327085"), 2.0)
	#tween.tween_property($WorldEnvironment, "environment:sky:sky_material:sky_horizon_color", Color("000000"), 2.0)
	#tween.tween_property($WorldEnvironment, "environment:sky:sky_material:ground_horizon_color", Color("000000"), 2.0)
	#tween.tween_property($WorldEnvironment, "environment:volumetric_fog_albedo", Color("3c3c3c"), 2.0)
	#tween.tween_property($WorldEnvironment, "environment:volumetric_fog_emission", Color("0f2722"), 2.0)
	#tween.tween_property($WorldEnvironment, "environment:volumetric_fog_density", 0.05, 2.0)
	#tween.tween_property($sun, "light_energy", 0.0, 2.0)
	#tween.tween_property($moon, "light_energy", 0.08, 2.0)
	#%WorldEnvironment.environment.sky.sky_material.sky_top_color = Color("a1a95a")


#func steam_init():
	#Steam.steamInit()
	#var is_running = Steam.isSteamRunning()
	#if !is_running:
		#print ("ERROR.... STEAM NOT RUNNING")
		#return
	#
	#print ("STEAM RUNNING")
	#
	#var steam_id = Steam.getSteamID()
	#var steam_name = Steam.getFriendPersonaName(steam_id)
	#
	#print ("Welcome "+str(steam_name))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



