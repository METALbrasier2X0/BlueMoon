extends CanvasLayer
var time = 0
var speed = 3.5
var opacity = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	$CharacterSprite.modulate.a = opacity
	opacity = opacity + 0.05
	if ( time < 1.4 ):
		opacity = 0
	if ( time < 0.5 ):
		$BottomBar.set_position($BottomBar.position - Vector2(0, speed), 2000)
		$TopBar.set_position($TopBar.position + Vector2(0, speed),  2000)
		time = time + delta
	elif ( time < 1 ):
		$BottomBar.set_position($BottomBar.position - Vector2(0, speed),  3000)
		$TopBar.set_position($TopBar.position + Vector2(0, speed), 3000)
		time = time + delta
		if speed > 0: speed = speed - time
	elif ( time < 1.7 ):
		$Board.set_position($Board.position - Vector2(0, 14),  3500)
		$CharacterSprite.set_position($CharacterSprite.position - Vector2(18, 0),  3500)
		time = time + delta
	pass
