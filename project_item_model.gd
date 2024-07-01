extends Node

class_name ProjectItemModel

var inventory: Inventory
var ledger_item: LedgerItem

func _init(in_ledger_item: LedgerItem, in_inventory:Inventory):
	ledger_item = in_ledger_item
	inventory = in_inventory

func deliver_item():
	inventory.
