class_name Player
extends CharacterBody2D

# Movement variables
@export var speed = 150
var bullet_path = preload("res://scenes/bullet.tscn")

var current_dir = "down"

func player_movement(delta):
	if Input.is_action_pressed("left"):
		velocity.x = -speed
		velocity.y = 0
		current_dir = "left"
		$AnimatedSprite2D.play("walk_left")
	elif Input.is_action_pressed("right"):
		velocity.x = speed
		velocity.y = 0
		current_dir = "right"
		$AnimatedSprite2D.play("walk_right")
	elif Input.is_action_pressed("down"):
		velocity.x = 0
		velocity.y = speed
		current_dir = "down"
		$AnimatedSprite2D.play("walk_down")
	elif Input.is_action_pressed("up"):
		velocity.x = 0
		velocity.y = -speed
		current_dir = "up"
		$AnimatedSprite2D.play("walk_up")
	else:
		velocity.x = 0
		velocity.y = 0
		if current_dir == "left":
			$AnimatedSprite2D.play("idle_left")
		if current_dir == "right":
			$AnimatedSprite2D.play("idle_right")
		if current_dir == "down":
			$AnimatedSprite2D.play("idle_down")
		if current_dir == "up":
			$AnimatedSprite2D.play("idle_up")

	move_and_slide()
	
func shoot():
	var bullet = bullet_path.instantiate()
	get_parent().add_child(bullet)
	bullet.position = $Bullet_spawn_marker.global_position
	
	bullet.velocity = get_global_mouse_position() - bullet.position
#	var dir =  Input.get_axis("right", "left")
#	if dir > 0:
#		bullet.velocity = Vector2(-1, 0)
#	if dir < 0:
#		bullet.velocity = Vector2(1, 0)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
	player_movement(delta)
