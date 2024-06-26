extends Control
@onready var target: TextureRect = %target
@onready var text_box: ColorRect = %TextBackground
@onready var narration_box: ColorRect = %NarrationBackground
@onready var info_to_player: ColorRect = %InfoToPlayer
@onready var reading_panel: Panel = %ReadingPage
@onready var text_area: RichTextLabel = %BookText

@onready var hide_timer: ProgressBar = %HideTimer

@export var use_fade: bool = true

var target_mode = "off"

var narration_showing: bool = false
var player_info_showing: bool = false

var language: String = "en"

var using_text: String


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignals.show_speech.connect(_show_speech)
	GlobalSignals.hide_speech.connect(_hide_speech)
	GlobalSignals.show_narration.connect(_show_narration)
	GlobalSignals.hide_narration.connect(_hide_narration)
	GlobalSignals.show_player_info.connect(_show_player_info)
	GlobalSignals.hide_player_info.connect(_hide_player_info)
	GlobalSignals.start_game.connect(_start_game)
	GlobalSignals.read.connect(_read)
	GlobalSignals.hide_narration_simple.connect(_hide_narration_simple)
	%TextBackground.modulate.a = 0.0
	if use_fade:
		$Cover.modulate.a = 1.0
		$TopLid.position.y = -560.0
		$BottomLid.position.y = 1082.0
		var tween = create_tween()
		tween.tween_property(%Title, "modulate:a", 1.0, 2.0)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("use"):
		if player_info_showing:
			_hide_player_info()
		elif narration_showing:
			_hide_narration()

		
func _start_game():
	_use_fade_in()

func _show_speech(text: String):
	%Speech.text = text
	var tween = create_tween()
	tween.tween_property(text_box, "modulate:a", 1.0, 1.0)
	

func _show_narration(text: String):
	if narration_showing:
		narration_showing = false
		var tween_hide = create_tween()
		tween_hide.tween_property(narration_box, "modulate:a", 0.0, 0.5)
		await tween_hide.finished
		#Narration.hide_narration()
	%Narration.text = text
	var tween = create_tween()
	tween.tween_property(narration_box, "modulate:a", 1.0, 1.0)
	await tween.finished
	narration_showing = true
	

func _show_player_info(text: String):
	if player_info_showing:
		player_info_showing = false
		var tween_hide = create_tween()
		tween_hide.tween_property(info_to_player, "modulate:a", 0.0, 0.5)
		await tween_hide.finished
		#Narration.hide_narration()
	%InfoToPlayerText.text = text
	var tween = create_tween()
	tween.tween_property(info_to_player, "modulate:a", 1.0, 1.0)
	await tween.finished
	player_info_showing = true

func _hide_speech():
	var tween = create_tween()
	tween.tween_property(text_box, "modulate:a", 0.0, 1.0)

func _hide_narration():
	narration_showing = false
	var tween = create_tween()
	tween.tween_property(narration_box, "modulate:a", 0.0, 1.0)
	await tween.finished
	Narration.hide_narration()

func _hide_narration_simple():
	narration_showing = false
	var tween = create_tween()
	tween.tween_property(narration_box, "modulate:a", 0.0, 1.0)


func _hide_player_info():
	player_info_showing = false
	var tween = create_tween()
	tween.tween_property(info_to_player, "modulate:a", 0.0, 1.0)

func _read(text:String):
	using_text = text
	var text_language = Narration.languages[language]
	var show_text = text_language[using_text]
	text_area.text = show_text
	reading_panel.visible = true
	GlobalSignals.emit_signal("mouse_capture", true)
	
func _use_fade_in():
	var tween = create_tween()
	tween.tween_property($Cover, "modulate:a", 0.0, 3.0)
	await tween.finished
	%CloseEyes.play("open")

func back_to_cave():
	%CloseEyes.play("close")
	var tween = create_tween()
	%Title.visible = false
	tween.tween_property($Cover, "modulate:a", 1.0, 5.0)
	await tween.finished
	GlobalSignals.emit_signal("start_in_cave")
	_start_game()
	await get_tree().create_timer(5.0).timeout
	GlobalSignals.emit_signal("show_player_info", "That's what would have happened if I hadn't read those papers.")

func back_to_house():
	%CloseEyes.play("close")
	var tween = create_tween()
	%Title.visible = false
	tween.tween_property($Cover, "modulate:a", 1.0, 5.0)
	await tween.finished
	GlobalSignals.emit_signal("start_house")
	_start_game()
	await get_tree().create_timer(5.0).timeout
	GlobalSignals.emit_signal("show_player_info", "That's what would have happened if I hadn't read those papers.")


func back_to_lake():
	%CloseEyes.play("close")
	var tween = create_tween()
	%Title.visible = false
	tween.tween_property($Cover, "modulate:a", 1.0, 5.0)
	await tween.finished
	GlobalSignals.emit_signal("start_lake")
	_start_game()
	

func fade_to_end():
	var tween = create_tween()
	tween.tween_property($Cover, "modulate:a", 1.0, 3.0)
	await tween.finished
	get_tree().change_scene_to_file("res://luke/scenes_luke/narrative/outro.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	%FPS.text = "FPS " + str(Engine.get_frames_per_second())

func set_target_mode(mode:String):
	if mode == target_mode:
		return
	target_mode = mode
	if target_mode=="off":
		target.modulate.a = 145.0
	elif target_mode == "interact":
		target.modulate.a = 255.0



func _on_close_btn_pressed() -> void:
	reading_panel.mouse_filter = Control.MOUSE_FILTER_IGNORE
	text_area.mouse_filter = Control.MOUSE_FILTER_IGNORE
	reading_panel.visible = false
	GlobalSignals.emit_signal("mouse_capture", false)


func _on_en_button_pressed() -> void:
	language = "en"
	var text_language = Narration.languages[language]
	var show_text = text_language[using_text]
	text_area.add_theme_font_size_override("normal_font_size", 60)
	text_area.text = show_text


func _on_bn_button_pressed() -> void:
	language = "bn"
	var text_language = Narration.languages[language]
	var show_text = text_language[using_text]
	text_area.add_theme_font_size_override("normal_font_size", 40)
	text_area.text = show_text
