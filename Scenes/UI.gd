extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var progressRight = $"WinProgress Right"
onready var progressLeft = $"WinProgress Left"
onready var wright = $"Winnings Right"
onready var wleft = $"Winnings Left"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func updateMaxValue():
	print(Global.DOOR)
	progressRight.set_max(Global.DOOR)
	progressLeft.set_max(Global.DOOR)

func updateProgress(v1, v2):
	progressLeft.set_value(v1)
	progressRight.set_value(v2)
	
func updateScore(v1, v2):
	wleft.set_text(String(v1))
	wright.set_text(String(v2))
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
