# walk.gd
extends StatePlayer

func enter(_msg: Dictionary={}):
	
	$"../../Debug_data/VBoxContainer/L_State".set_text(name)
	

func inner_physics_process(_delta):
	var dir = Input.get_axis("left", "right")
	if dir != 0:
		player.velocity.x = lerp(player.velocity.x, dir * player.speed, player.acceleration)
	else:
		player.velocity.x = lerp(player.velocity.x, 0.0, player.friction) # May use move_toward()

	if dir < 0 and not player.animation.is_flipped_h():
		player.animation.play("walk_left")
	elif dir > 0 and player.animation.is_flipped_h():
		player.animation.play("walk_left")
	
	player.move_and_slide()
	
	if is_equal_approx(dir, 0.0):
		state_machine.change_state_to("idle")
		
	player.animation.play("walk")
