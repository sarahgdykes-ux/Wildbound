extends Node

## Sanctuary Manager
## Autoload singleton for managing creature storage

signal creature_added(creature_id: String)
signal creature_removed(creature_id: String)

var sanctuary: Array = []  # Array of CreatureInstance resources

func _ready() -> void:
	print("SanctuaryManager: Initialized")

## Add a creature to the sanctuary
func add_creature(creature: CreatureInstance) -> bool:
	if sanctuary.has(creature):
		print("SanctuaryManager: Creature already in sanctuary!")
		return false

	sanctuary.append(creature)
	print("SanctuaryManager: Added ", creature.creature_id, " to sanctuary")
	emit_signal("creature_added", creature.creature_id)
	return true

## Remove a creature from the sanctuary
func remove_creature(creature: CreatureInstance) -> bool:
	if not sanctuary.has(creature):
		print("SanctuaryManager: Creature not in sanctuary!")
		return false

	sanctuary.erase(creature)
	print("SanctuaryManager: Removed ", creature.creature_id, " from sanctuary")
	emit_signal("creature_removed", creature.creature_id)
	return true

## Get sanctuary size
func get_sanctuary_size() -> int:
	return sanctuary.size()

## Get all sanctuary creatures
func get_sanctuary() -> Array:
	return sanctuary

## Transfer creature from sanctuary to party
func transfer_to_party(creature: CreatureInstance) -> bool:
	if not sanctuary.has(creature):
		return false

	if PartyManager.add_creature(creature):
		remove_creature(creature)
		return true
	return false

## Transfer creature from party to sanctuary
func transfer_from_party(creature: CreatureInstance) -> bool:
	if not PartyManager.party.has(creature):
		return false

	if add_creature(creature):
		PartyManager.remove_creature(creature)
		return true
	return false
