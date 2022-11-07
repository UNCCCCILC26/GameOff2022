extends KinematicBody2D
signal Death

var base_speed = 200
var scope_inside = false
var screenSize = Vector2(1024,600)
var velocity = Vector2(0,0)
var rng = RandomNumberGenerator.new()

func _on_Hitbox_area_shape_entered(a1,area,a3,a4):
	if(area.is_in_group("Scopes")):
		scope_inside = true

func _on_Hitbox_area_shape_exited(a1,area,a3,a4):
	if(area != null and area.is_in_group("Scopes")):
		scope_inside = false

func _process(_delta):
	if Input.is_action_just_pressed("mouse_clicked") and scope_inside == true:
		queue_free()
		emit_signal("Death")
	if position.x > screenSize.x+40 or position.x < -40:
		queue_free()

func _physics_process(_delta):
	velocity = velocity.normalized() * base_speed
	velocity = move_and_slide(velocity)

func moveRight():
	velocity.x = 1

func moveLeft():
	velocity.x = -1

func stopMovement():
	velocity.x = 0
