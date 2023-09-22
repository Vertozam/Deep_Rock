extends CharacterBody2D

var speed := 100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	var collision_info = move_and_collide(velocity.normalized() * delta * speed)
	$Timer.start(2)
	


func _on_timer_timeout() -> void:
	queue_free()
