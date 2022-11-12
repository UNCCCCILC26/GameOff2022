extends "res://Actors/BaseEnemy.gd"

var moving = false

func _ready():
	base_speed = 100
	hitpoints = 6
	rng.randomize()
	var randY = rng.randi_range(1,3)*150
	var randX = rng.randf_range(50,screenSize.x-50)
	self.position = Vector2(randX,randY)
	yield(self,"Hit")
	if(rng.randi_range(0,1) == 1):
		moveRight()
	else:
		moveLeft()
