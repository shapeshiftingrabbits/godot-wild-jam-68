extends Node2D

@export var current_object: ForgeableItemData
@export var missions: Array[Mission]

var reputation: int = 0
@onready var dialogue_box: DialogueBox = $IncomingOrder/DialogueBox

# Called when the node enters the scene tree for the first time.
func _ready():
	set_to_initial_state()
	
func set_to_initial_state():
	$ReputationLabel.text = "Reputation: " + str(reputation)
	$OutgoingOrder.hide()
	$Forge.disable()
	dialogue_box.start("1")

func _on_dialogue_box_dialogue_ended():
	$Forge.start_process_with_object(current_object)

func _on_forge_forged():
	$OutgoingOrder.show()

func _on_outgoing_order_turned_in(reputation_gain):
	reputation += reputation_gain

	var mission_name = dialogue_box.get_variable("{{mission_name}}")

	var mission: Mission = missions.filter(func(item): return item.name == mission_name).pick_random()
	var challenge_capacity: int = dialogue_box.get_variable("{{challenge_capacity}}")

	var result = RunMission.do(challenge_capacity, mission.challenges)

	print(result)
	# todo: select next order
	set_to_initial_state()
