extends CanvasLayer

# Notifies the Main code that the button has ben pressed
signal start_game

func show_message(text):
	$Message.text = "Ready?"
	$Message.show()
	$MessageTimer.start()
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
