extends "res://Templates/base.gd"

var balance = 300

func _ready():
	$DayTime.start()
	$"Daily Balance".text = "$" + str(balance)
	
func _process(_delta):
	$"Daily Balance".text = "$" + str(balance)
	$Path2D/PathFollow2D.offset = ($DayTime.wait_time - $DayTime.time_left) * (1000/$DayTime.wait_time)
	if(popupsOpen):
		if(Input.is_action_just_released("ui_cancel")):
			popupsOpen = false

func _on_DayTime_timeout():
	print("DAYTIME OVER")
	Global.playerBalance += balance
	.shop()


func _on_Customers_pressed():
	$Customers/Control.popup()
	popupsOpen = true


func _on_Squeeze_Station_pressed():
	pass # Replace with function body.


func _on_Pour_Station_pressed():
	pass # Replace with function body.


func _on_Ice_Station_pressed():
	pass # Replace with function body.


func _on_Powder_Mix_Station_pressed():
	pass # Replace with function body.


func _on_AddOns_Station_pressed():
	pass # Replace with function body.


func _on_Control_hide():
	pass

