extends "res://Actors/BaseEnemy.gd"



func _ready():
	base_speed = 150
	hitpoints = 2
	rng.randomize()
	var randY = rng.randi_range(1,3)*150
	if(rng.randi_range(0,1) == 1):
		self.position = Vector2(-30,randY)
		moveRight()
	else:
		self.position = Vector2(screenSize.x+30,randY)
		moveLeft()
