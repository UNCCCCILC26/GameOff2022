extends KinematicBody2D

var base_speed = 200
var pointer_inside = []
var velocity = Vector2(1,0)

func _process(delta):
	if Input.is_action_just_pressed("mouse_clicked"):
		if pointer_inside.size() == 9:
			emit_signal("good")
		elif pointer_inside.size() == 8:
			emit_signal("ok")
		else:
			emit_signal("bad")

func _physics_process(_delta):
	velocity = velocity.normalized() * base_speed
	
	
	if position.x > 510 and velocity.x == base_speed:
		velocity.x = base_speed * -1
	
	if position.x < -10 and velocity.x == base_speed * -1:
		velocity.x = base_speed

	velocity = move_and_slide(velocity)

func _on_InBad_area_entered(area):
	pointer_inside.append("bad")

func _on_InBad_area_exited(area):
	pointer_inside.remove("bad")

func _on_InOk_area_entered(area):
	pointer_inside.append("ok")

func _on_InOk_area_exited(area):
	pointer_inside.remove("ok")

func _on_InGood_area_entered(area):
	pointer_inside.append("good")

func _on_InGood_area_exited(area):
	pointer_inside.remove("good")
