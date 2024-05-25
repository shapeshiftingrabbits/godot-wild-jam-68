extends Node

@onready var order_pool: OrderPool = %OrderPool

func _on_fill_in_reward_dialogue_done(reward_dialogue):
	order_pool.insert_order(reward_dialogue)
