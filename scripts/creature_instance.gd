class_name CreatureInstance
extends Resource

## Individual creature instance
## Represents a specific creature with its own stats and history

@export var species_id: String
@export var creature_id: String
@export var level: int = 1
@export var experience: int = 0
@export var current_hp: int
@export var relationship: int = 0
@export var environmental_affinity: Dictionary = {}
@export var known_abilities: Array = []
@export var evolution_state: String = "unevolved"
@export var personality: String = "curious"

var base_stats: Dictionary = {}
var current_stats: Dictionary = {}

func _init():
	current_hp = get_max_hp()

## Load species data and calculate stats
func initialize(species_data: Dictionary) -> void:
	species_id = species_data.species_id
	base_stats = species_data.base_stats
	current_stats = calculate_stats(level)
	current_hp = current_stats.hp

## Calculate stats based on level
func calculate_stats(lvl: int) -> Dictionary:
	var stats = {}
	for stat in base_stats:
		var base_val = base_stats[stat]
		# Simple linear scaling: base + (base * 0.1 * (level - 1))
		stats[stat] = int(base_val + (base_val * 0.1 * (lvl - 1)))
	return stats

## Get maximum HP
func get_max_hp() -> int:
	return current_stats.hp if current_stats.has("hp") else base_stats.hp

## Add experience
func add_exp(amount: int) -> void:
	experience += amount
	var exp_needed = get_exp_needed_for_level(level + 1)
	if experience >= exp_needed:
		level_up()

## Get experience needed for next level
func get_exp_needed_for_level(target_level: int) -> int:
	# Simple curve: 100 * level^2
	return 100 * (target_level * target_level)

## Level up
func level_up() -> void:
	level += 1
	current_stats = calculate_stats(level)
	current_hp = get_max_hp()
	print("CreatureInstance: ", creature_id, " leveled up to ", level)
	
	# Check evolution eligibility
	check_evolution()

## Check if creature can evolve
func check_evolution() -> void:
	var species_data = DataManager.get_creature(species_id)
	if species_data.is_empty():
		return
	
	for evolution in species_data.evolution_options:
		if meets_evolution_requirements(evolution.requirements):
			evolve(evolution.target)
			return

## Check if evolution requirements are met
func meets_evolution_requirements(requirements: Dictionary) -> bool:
	# Check level requirement
	if requirements.has("level") and level < requirements.level:
		return false
	
	# Check relationship requirement
	if requirements.has("relationship") and relationship < requirements.relationship:
		return false
	
	# Check environmental affinity
	if requirements.has("environmental_affinity"):
		for element in requirements.environmental_affinity:
			var required = requirements.environmental_affinity[element]
			var current = environmental_affinity.get(element, 0)
			if current < required:
				return false
	
	return true

## Evolve creature
func evolve(target_species: String) -> void:
	print("CreatureInstance: ", creature_id, " evolving into ", target_species, "!")
	species_id = target_species
	evolution_state = "evolved"
	
	# Load new species data
	var new_species_data = DataManager.get_creature(target_species)
	if not new_species_data.is_empty():
		base_stats = new_species_data.base_stats
		current_stats = calculate_stats(level)
		current_hp = get_max_hp()

## Take damage
func take_damage(amount: int) -> void:
	current_hp -= amount
	if current_hp < 0:
		current_hp = 0

## Heal
func heal(amount: int) -> void:
	current_hp += amount
	if current_hp > get_max_hp():
		current_hp = get_max_hp()

## Check if fainted
func is_fainted() -> bool:
	return current_hp <= 0

## Restore HP
func restore_hp() -> void:
	current_hp = get_max_hp()

## Add relationship points
func add_relationship(amount: int) -> void:
	relationship += amount
	if relationship > 100:
		relationship = 100
	print("CreatureInstance: Relationship increased to ", relationship)

## Get relationship stage
func get_relationship_stage() -> String:
	if relationship < 25:
		return "New Companion"
	elif relationship < 50:
		return "Familiar"
	elif relationship < 80:
		return "Trusted"
	else:
		return "Close Bond"
