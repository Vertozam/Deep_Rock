class_name  Enemy 
extends CharacterBody2D

@export var speed := 200

var health := 100

var player_chase = false
var player = null




		
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if player_chase:
		position += (player.position - position) / speed
	
		



func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null
	player_chase = false
