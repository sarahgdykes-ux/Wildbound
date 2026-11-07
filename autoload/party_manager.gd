extends Node

## Party Manager
## Autoload singleton for managing the active party

signal party_changed
signal creature_added(creature_id: String)
signal creature_removed(creature_id: String)

const MAX_PARTY_SIZE = 4

var party: Array = []  # Array of CreatureInstance resources

func _ready() -> void:
	print("PartyManager: Initialized")

## Add a creature to the party
func add_creature(creature: CreatureInstance) -> bool:
	if party.size() >= MAX_PARTY_SIZE:
		print("PartyManager: Party is full!")
		return false

	if party.has(creature):
		print("PartyManager: Creature already in party!")
		return false

	party.append(creature)
	print("PartyManager: Added ", creature.creature_id, " to party")
	emit_signal("creature_added", creature.creature_id)
	emit_signal("party_changed")
	return true

## Remove a creature from the party
func remove_creature(creature: CreatureInstance) -> bool:
	if not party.has(creature):
		print("PartyManager: Creature not in party!")
		return false

	party.erase(creature)
	print("PartyManager: Removed ", creature.creature_id, " from party")
	emit_signal("creature_removed", creature.creature_id)
	emit_signal("party_changed")
	return true

## Get party size
func get_party_size() -> int:
	return party.size()

## Check if party is full
func is_full() -> bool:
	return party.size() >= MAX_PARTY_SIZE

## Get all party members
func get_party() -> Array:
	return party

## Get party member by index
func get_party_member(index: int) -> CreatureInstance:
	if index >= 0 and index < party.size():
		return party[index]
	return null

## Swap party members
func swap_members(index1: int, index2: int) -> bool:
	if index1 < 0 or index1 >= party.size():
		return false
	if index2 < 0 or index2 >= party.size():
		return false

	var temp = party[index1]
	party[index1] = party[index2]
	party[index2] = temp
	emit_signal("party_changed")
	return true

## Clear party
func clear_party() -> void:
	party.clear()
	emit_signal("party_changed")
