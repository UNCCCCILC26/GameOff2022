extends Area2D


var mouse_inside = false

func _ready():
	pass
	
func _on_Lemon_mouse_entered():
	mouse_inside = true
	pass

func _on_Lemon_mouse_exited():
	mouse_inside = false
	pass

func _process(_delta):
	if Input.is_action_just_pressed("mouse_clicked") and mouse_inside == true:
		queue_free()
	pass
