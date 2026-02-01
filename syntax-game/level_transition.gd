extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect

var tween: Tween
var next_scene_path: String = ""

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	color_rect.visible = true
	color_rect.modulate.a = 0.0

func change_scene_to_file(scene_path: String) -> void:
	if tween:
		tween.kill()

	next_scene_path = scene_path

	tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)

	# Fade to black
	tween.tween_property(color_rect, "modulate:a", 1.0, 0.8)
	tween.finished.connect(_on_fade_out_finished)

func _on_fade_out_finished():
	get_tree().change_scene_to_file(next_scene_path)

	# Fade back in
	tween = create_tween()
	tween.set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(color_rect, "modulate:a", 0.0, 0.8)
