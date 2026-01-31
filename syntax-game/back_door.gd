extends Area2D

@export var target_scene: String = "res://playground.tscn"

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			get_tree().change_scene_to_file(target_scene)
			Input.set_custom_mouse_cursor(null)
