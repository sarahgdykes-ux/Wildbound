extends Control

## Battle Scene
## Handles turn-based combat between player and enemy

signal battle_ended(result: String)
signal battle_victory
signal battle_defeat

@onready var enemy_name = $EnemyPanel/EnemyName
@onready var enemy_hp_bar = $EnemyPanel/EnemyHPBar
@onready var enemy_sprite = $EnemyPanel/EnemySprite
@onready var player_name = $PlayerPanel/PlayerName
@onready var player_hp_bar = $PlayerPanel/PlayerHPBar
@onready var player_sprite = $PlayerPanel/PlayerSprite
@onready var attack_button = $ActionMenu/AttackButton
@onready var ability_button = $ActionMenu/AbilityButton
@onready var switch_button = $ActionMenu/SwitchButton
@onready var flee_button = $ActionMenu/FleeButton
@onready var battle_log = $BattleLog

var evolution_notification = preload("res://scenes/evolution_notification.tscn")

var player_creature: CreatureInstance = null
var enemy_creature: CreatureInstance = null
var is_player_turn: bool = true
var battle_active: bool = false

func _ready():
	attack_button.pressed.connect(_on_attack)
	ability_button.pressed.connect(_on_ability)
	switch_button.pressed.connect(_on_switch)
	flee_button.pressed.connect(_on_flee)
	visible = false

func start_battle(player_creature: CreatureInstance, enemy_data: Dictionary) -> void:
	self.player_creature = player_creature
	
	# Create enemy instance
	self.enemy_creature = CreatureInstance.new()
	self.enemy_creature.initialize(enemy_data)
	self.enemy_creature.creature_id = "enemy_001"
	
	# Setup UI
	player_name.text = player_creature.species_id.capitalize()
	enemy_name.text = enemy_data.name.capitalize()
	update_hp_bars()
	
	battle_active = true
	is_player_turn = true
	visible = true
	add_log("Battle started!")
	add_log("Wild " + enemy_data.name + " appeared!")

func update_hp_bars() -> void:
	if player_creature:
		var player_hp_percent = float(player_creature.current_hp) / player_creature.get_max_hp() * 100
		player_hp_bar.value = player_hp_percent
	
	if enemy_creature:
		var enemy_hp_percent = float(enemy_creature.current_hp) / enemy_creature.get_max_hp() * 100
		enemy_hp_bar.value = enemy_hp_percent

func _on_attack():
	if not is_player_turn or not battle_active:
		return
	
	var damage = calculate_damage(player_creature, enemy_creature)
	enemy_creature.take_damage(damage)
	add_log(player_creature.species_id.capitalize() + " attacked for " + str(damage) + " damage!")
	update_hp_bars()
	
	if enemy_creature.is_fainted():
		end_battle("victory")
	else:
		is_player_turn = false
		await get_tree().create_timer(1.0).timeout
		enemy_turn()

func _on_ability():
	if not is_player_turn or not battle_active:
		return
	
	# Simplified: use first known ability
	if player_creature.known_abilities.size() > 0:
		var ability_id = player_creature.known_abilities[0]
		var damage = calculate_damage(player_creature, enemy_creature, 1.5)  # 1.5x for abilities
		enemy_creature.take_damage(damage)
		add_log(player_creature.species_id.capitalize() + " used " + ability_id + " for " + str(damage) + " damage!")
		update_hp_bars()
		
		if enemy_creature.is_fainted():
			end_battle("victory")
		else:
			is_player_turn = false
			await get_tree().create_timer(1.0).timeout
			enemy_turn()

func _on_switch():
	if not is_player_turn or not battle_active:
		return
	
	# Simplified: just skip turn for now
	add_log("Switched creatures!")
	is_player_turn = false
	await get_tree().create_timer(1.0).timeout
	enemy_turn()

func _on_flee():
	if not is_player_turn or not battle_active:
		return
	
	add_log("Ran away!")
	end_battle("flee")

func enemy_turn():
	if not battle_active:
		return
	
	var damage = calculate_damage(enemy_creature, player_creature)
	player_creature.take_damage(damage)
	add_log(enemy_creature.species_id.capitalize() + " attacked for " + str(damage) + " damage!")
	update_hp_bars()
	
	if player_creature.is_fainted():
		end_battle("defeat")
	else:
		is_player_turn = true

func calculate_damage(attacker: CreatureInstance, defender: CreatureInstance, multiplier: float = 1.0) -> int:
	var attack = attacker.current_stats.attack
	var defense = defender.current_stats.defense
	var base_damage = attack - (defense * 0.5)
	var final_damage = int(base_damage * multiplier)
	return max(1, final_damage)

func add_log(text: String) -> void:
	battle_log.text = text

func end_battle(result: String) -> void:
	battle_active = false
	
	if result == "victory":
		emit_signal("battle_victory")
		add_log("You won!")
		# Award experience
		var old_level = player_creature.level
		player_creature.add_exp(50)
		add_log(player_creature.species_id.capitalize() + " gained 50 EXP!")
		
		# Check if leveled up
		if player_creature.level > old_level:
			add_log(player_creature.species_id.capitalize() + " leveled up to " + str(player_creature.level) + "!")
			
			# Check if evolved
			if player_creature.evolution_state == "evolved":
				var notification = evolution_notification.instantiate()
				get_tree().root.add_child(notification)
				notification.show_evolution(player_creature.species_id)
				await get_tree().create_timer(2.0).timeout
				notification.queue_free()
	elif result == "defeat":
		emit_signal("battle_defeat")
		add_log("You were defeated!")
		player_creature.restore_hp()
		add_log(player_creature.species_id.capitalize() + " was restored.")
	
	emit_signal("battle_ended", result)
	
	await get_tree().create_timer(2.0).timeout
	visible = false
	queue_free()  # Free the battle scene
