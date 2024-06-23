extends CharacterBody2D




"""
Variable declaration for player character
"""

enum Facing {
	LEFT,
	RIGHT,
	UP,
	DOWN,
}

enum MovementState {
	IDLE,
	MOVING,
}

enum ActionState {
	IDLE,
	ATTACKING,
}
var SPEED = 200.0
var current_facing: Facing = Facing.DOWN
var current_move_state: MovementState = MovementState.IDLE
var current_action_state: ActionState = ActionState.IDLE
var current_stamina = 100

var Body = null
var Target = null
var interact = true
var attack = false


var dialogue = preload("res://Src/UI/Dialogues/Dialogue.tscn")
var instanceDialogue = dialogue.instantiate()

"""
Collision checks
"""

func _on_attack_box_body_entered(body):
	attack = true
	Target = body
	pass # Replace with function body.

func _on_attack_box_body_exited(body):
	attack = false
	Target = null
	pass # Replace with function body.
	
func _on_usebox_body_entered(body):
	interact = true
	Body = body
	
	
func _on_usebox_body_exited(body):
	interact = false
	
	
	"""
Find a better solution for new dialogue instances
"""

	if body.name == "Npc" :
		var dialogueNode = get_node_or_null('Dialogue')
		if (dialogueNode) :
			dialogueNode.free()
			
			var dialogueScene = preload("res://Src/UI/Dialogues/Dialogue.tscn")
			dialogueScene.instantiate()

	"""
function that is called when the player interacts with any object
"""
func Interact(body):
	
	if body.name == "Player" :
		interact = false
	if body.name == "Npc" :
		find_and_use_dialogue()
	else :

		#interacts with world item and sends the currently hold tool in hand to detect interactions
		body.interact(get_node('Inventory').check_required_in_inventory('axe'))

"""
function that loads the dialogue box
"""
func find_and_use_dialogue():
	var dialogueNode = get_node_or_null('Dialogue')
	if (!dialogueNode) :
		add_child(instanceDialogue)


func Attack(Target):
	if (current_action_state == ActionState.IDLE) :
		SPEED = 0
		current_action_state = ActionState.ATTACKING
		current_stamina -= 1
		match current_facing :
			Facing.DOWN:
				$AttackBox.set_position(Vector2(0, 90))
				$AttackBox.set_rotation(0)
			Facing.UP:
				$AttackBox.set_position(Vector2(0, -90))
				$AttackBox.set_rotation(0)
			Facing.LEFT:
				$AttackBox.set_position(Vector2(-90, 0))
				$AttackBox.set_rotation(deg_to_rad(90))
			Facing.RIGHT:
				$AttackBox.set_position(Vector2(90, 0))
				$AttackBox.set_rotation(deg_to_rad(90))
				
		await get_tree().create_timer(0.3).timeout
		$AttackBox.visible = true
		if attack == true && Target != null : 
			Target.interact(get_node('Inventory').check_required_in_inventory('axe'))
		await get_tree().create_timer(0.2).timeout
		$AttackBox.visible = false
		current_action_state = ActionState.IDLE
		SPEED = 200

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("ui_left", "ui_right")
	var directionY = Input.get_axis("ui_up", "ui_down")
	
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	move_and_slide()
	
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	move_and_slide()
	
	"""
	Checks the direction and state of the player
	"""

	if directionX == 1 :
		current_move_state = MovementState.MOVING
		current_facing = Facing.RIGHT
	if directionX == -1 :
		current_move_state = MovementState.MOVING
		current_facing = Facing.LEFT
	if directionY == 1 :
		current_move_state = MovementState.MOVING
		current_facing = Facing.DOWN
	if directionY == -1 :
		current_move_state = MovementState.MOVING
		current_facing = Facing.UP
	if directionX == 0 && directionY == 0:
		current_move_state = MovementState.IDLE


	if Input.is_action_just_pressed("Attack"):
		Attack(Target)
		
	if interact == true:
		if Input.is_action_just_pressed("Use"):
			Interact(Body)


	pass # Replace with function body.









