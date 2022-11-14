extends "res://Templates/base.gd"

var balance = 300

func _ready():
	$DayTime.start()
	$"Daily Balance".text = "$" + str(balance)
	
func _process(_delta):
	$"Daily Balance".text = "$" + str(balance)
	$Path2D/PathFollow2D.offset = ($DayTime.wait_time - $DayTime.time_left) * (1000/$DayTime.wait_time)

func _on_DayTime_timeout():
	print("DAYTIME OVER")
	Global.playerBalance += balance
	.shop()
