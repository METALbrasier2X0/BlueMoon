extends Node2D
var atracted = null
var PlayerPosition = null
var player = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if atracted == true :
		PlayerPosition = player.position
		global_position = global_position.move_toward(PlayerPosition, delta * 400)
		

func _on_body_entered(body):
	if body.name == "Player" :
		queue_free()


func _on_area_entered(area):
	if area.name == "AtractBox" :
		atracted = true
		player = area.get_parent()
