extends KinematicBody2D
signal Death

var base_speed = 200
var mouse_inside = false
var screenSize = Vector2(1024,600)
var velocity = Vector2(0,0)
var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	var randY = rng.randf_range(50,screenSize.y-50)
	if(rng.randi_range(0,1) == 1):
		self.position = Vector2(-30,randY)
		moveRight()
	else:
		self.position = Vector2(screenSize.x+30,randY)
		moveLeft()

func _on_LemonHitbox_mouse_entered():
	mouse_inside = true

func _on_LemonHitbox_mouse_exited():
	mouse_inside = false

func _process(_delta):
	if Input.is_action_just_pressed("mouse_clicked") and mouse_inside == true:
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
