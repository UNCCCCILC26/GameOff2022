extends "res://Templates/base.gd"

var balance = 300
var tutorial = false
var tutorialNum = 0
var timeLeft = 0
var orders = []

func _ready():
	$DayTime.start()
	$"Daily Balance".text = "$" + str(balance)
	if(Global.progress["resturantTutorial"] == false):
		tutorial = true
		
func tutorials(delta):
	if(tutorialNum == 0):
		$Path2D/PathFollow2D/AcceptDialog.popup(Rect2($Path2D/PathFollow2D.position, Vector2(100, 100)))
		tutorialNum = 0.5
	if(tutorialNum == 1):
		var pos = $Customers.rect_position
		$Customers/Tutorial.popup(Rect2(pos.x - 100, pos.y, 100, 100))
		tutorialNum = 1.1
		
func _process(_delta):
	$"Daily Balance".text = "$" + str(balance)
	if(not $DayTime.paused):
		timeLeft = $DayTime.time_left
	$Path2D/PathFollow2D.offset = ($DayTime.wait_time - timeLeft) * (1000/$DayTime.wait_time)
	if(popupsOpen):
		if(Input.is_action_just_released("ui_cancel")):
			popupsOpen = false
	if(tutorial):
		tutorials(_delta)

func _on_DayTime_timeout():
	print("DAYTIME OVER")
	Global.playerBalance += balance
	.shop()
	
func _on_Customers_pressed():
	$Customers/CustomerPopup.popup()
	popupsOpen = true
func _on_Squeeze_Station_pressed():
	$"Squeeze Station/SqueezePanel".popup()
	popupsOpen = true
func _on_Pour_Station_pressed():
	$"Pour Station/PourStation".popup()
	popupsOpen = true
func _on_Ice_Station_pressed():
	$"Ice Station/IceStation".popup()
	popupsOpen = true
func _on_Powder_Mix_Station_pressed():
	$"Powder Mix Station/PowderStation".popup()
	popupsOpen = true
func _on_AddOns_Station_pressed():
	$"Add-Ons Station/Add-OnsStation".popup()
	popupsOpen = true

func _on_Control_hide():
	pass



func _on_AcceptDialog_confirmed():
	tutorialNum = 1


func _on_Tutorial_confirmed():
	tutorialNum = 2 # Replace with function body.
