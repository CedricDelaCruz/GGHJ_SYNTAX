extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
var move_speed : float = 300.0
var state : String = "idle"
var can_move : = true


@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var textbox = $"../window/CanvasLayer/Panel"



func _ready():
	sprite.play("idle_down")
	pass


func _process( delta ):
	 
	if textbox.visible:
		sprite.play("idle_side")
	else:
		direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	velocity = direction * move_speed
	
	if SetState() == true || SetDirection() == true:
		UpdateAnimation()
	
	pass


func _physics_process( delta ):
	if textbox.visible:
		return
	move_and_slide()


func SetDirection() -> bool:
	var new_dir : Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
		
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN 
	
	if new_dir == cardinal_direction:
		return false
	
	cardinal_direction = new_dir
	sprite.flip_h = cardinal_direction == Vector2.LEFT
	return true


func SetState() -> bool:
	
	var new_state : String = "idle" if direction == Vector2.ZERO else "walk"
	if new_state == state:
		return false
	state = new_state
	
	return true

func UpdateAnimation() -> void:
	if textbox.visible:
		animation_player.play("idle_down")
	else:
		sprite.play( state + "_" + AnimDirection() )
	pass

func AnimDirection() -> String:
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
