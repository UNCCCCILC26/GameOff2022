extends KinematicBody2D

func _physics_process(delta):
	var oldMousePos = get_viewport().get_mouse_position()
	yield(get_tree().create_timer(10*delta),"timeout")
	#oldMousePos.x = oldMousePos.x-30
	self.position = oldMousePos
	
