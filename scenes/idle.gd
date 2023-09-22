# idle.gd
extends StatePlayer


func enter(_msg: Dictionary={}):
	player.velocity = Vector2.ZERO
	
	# Show state above Player for Debuging
	$"../../Debug_data/VBoxContainer/L_State".set_text(name)
	

func inner_physics_process(_delta):
	if Input.is_action_pressed("left"):
		state_machine.change_state_to("walk_left")
	if  Input.is_action_pressed("right")
		state_machine.change_state_to("walk_right")
	
	player.animation.play("idle")
