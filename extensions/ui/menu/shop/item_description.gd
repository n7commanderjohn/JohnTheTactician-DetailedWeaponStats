extends ItemDescription

# Brief overview of what the changes in this file do...
# Expands weapon stats

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const MYMOD_LOG = "JohnTheTactician-DetailedWeaponStats" # ! Change `MODNAME` to your actual mod's name
const MOD_DIR = "JohnTheTactician-DetailedWeaponStats/" # name of the folder that this file is in

# ! hard copying these from the Utils and weapon data to prevent crashes
const SECONDARY_FONT_COLOR = Color(234.0 / 255, 226.0 / 255, 176.0 / 255, 1)
const GOLD_COLOR = Color(118.0 / 255, 1, 118.0 / 255, 1)
const GRAY_COLOR_STR = "#555555"
const POS_COLOR_STR = "#00ff00"
const NEG_COLOR_STR = "red"

var col_a = "[color=#" + SECONDARY_FONT_COLOR.to_html() + "]"
var col_neutral_a = "[color=white]"
var col_pos_a = "[color=" + POS_COLOR_STR + "]"
var col_neg_a = "[color=" + NEG_COLOR_STR + "]"
var col_b = "[/color]"
var init_a = " [color=" + GRAY_COLOR_STR + "]| "

# var col_a = "[color=#" + Utils.SECONDARY_FONT_COLOR.to_html() + "]"
# var col_neutral_a = "[color=white]"
# var col_pos_a = "[color=" + Utils.POS_COLOR_STR + "]"
# var col_neg_a = "[color=" + Utils.NEG_COLOR_STR + "]"
# var col_b = "[/color]"
# var init_a = " [color=" + Utils.GRAY_COLOR_STR + "]| "



# Called when the node enters the scene tree for the first time.
func _ready():
	ModLoaderLog.info("Inside of _ready() of item_description.gd", MYMOD_LOG)



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func set_item(item_data)->void :
	.set_item(item_data)
	###todo and test
	if item_data is WeaponData:
		# var want_text = {tr("STAT_DAMAGE"):0,tr("CRITICAL"):1,tr("COOLDOWN"):2}
		# var stat_text = get_weapon_stats().bbcode_text
		# var stats_array = stat_text.split("\n")
		# var dmg = 1.0
		# var pro_nb = 1.0
		# var crit_chance = 0.0
		# var crit_dmg = 1.0
		# var atk_spd = 1.0
		# for array in stats_array:
		# 	if want_text.size() == 0:break
		# 	for stat_name in want_text:
		# 		if array.find(stat_name):
		# 			var values = get_value_array(array)
		# 			ModLoaderLog.info(str(values), "weaponstats")
		# 			match want_text[stat_name]:
		# 				0:
		# 					dmg = values.front()
		# 					if values.size()>1:
		# 						pro_nb = values.back()
		# 				1:
		# 					crit_chance = values.back() / 100.0
		# 					crit_dmg = values.front()
		# 				2:
		# 					atk_spd = values.front()

		var weapstats = get_weapon_stats()
		# var weapstats2 = weapstats if expand_indefinitely else _weapon_stats_scrolled

		# weapstats2.append_bbcode("\nOriginal CritChance: " + get_crit_chance_text(crit_chance))
		_weapon_stats.append_bbcode("\nThe Stats: " + str(WeaponService.init_base_stats(_weapon_stats)))
		# weapstats2.append_bbcode("\nThe Stats: " + str(WeaponService.init_base_stats(weapstats2)))
		ModLoaderLog.info(str(WeaponService.init_base_stats(_weapon_stats)), "weaponstats")
		ModLoaderLog.info(str(WeaponService.init_base_stats(item_data)), "item_data")
		# weapstats2.append_bbcode("\nOriginal CritChance: " + str(WeaponService.init_base_stats(weapstats2)))
		# weapstats2.append_bbcode("\nOriginal Damage: " + get_dmg_text_with_scaling_stats(dmg))
		# weapstats2.append_bbcode("\nOriginal Cooldown: " + get_cooldown_text(atk_spd))
		_weapon_stats.append_bbcode("\nOriginal CritChance: " + str(WeaponService.init_base_stats(_weapon_stats)))

# var description_regex = RegEx.new()
# func get_value_array(strs:String)->Array:#():
# 	var cs = []
# 	var _error = description_regex.compile("(?<=\\])x?-?[0-9]\\.?[0-9]*s?(?=\\[)|(?<=\\])x+-?[0-9]+(?= (\\(|\\[))") #查找特征
# 	var decs = strs
# 	var results = description_regex.search_all(decs)
# 	if results:
# 		for i in results:
# 			var ss = i.get_string()
# 			ss = ss.replace("x","")
# 			ss = ss.replace("s","")
# 			ss = ss.to_float()
# 			if ss != null:
# 				cs.append(ss)
# 			if cs.size() > 1:break
# 	return cs
		

func get_dmg_text_with_scaling_stats(damage)->String:
	return "scaling damage: " + str(damage)
# 		var a = get_col_a(damage, base_stats.damage)
# 		var dmg_text = a + str(damage) + col_b
		
# 		var text = dmg_text if nb_projectiles == 1 else dmg_text + "x" + str(nb_projectiles)
		
# 		if damage != base_stats.damage:
# 			var initial_dmg_text = str(base_stats.damage) if nb_projectiles == 1 else str(base_stats.damage) + "x" + str(nb_projectiles)
# 			text += init_a + initial_dmg_text + col_b
		
# 		text += " (" + WeaponService.get_scaling_stats_icons(p_scaling_stats) + ")"
		
# 		return text
	

func get_crit_chance_text(crit_chance)->String:
	return "crit damage: " + str(crit_chance)
# 	# var original = .get_crit_chance_text(base_stats)
# 	var a = get_col_a(crit_chance, base_stats.crit_chance)
# 	var original = a + str(max(crit_chance * 100.0, 0)) + col_b
	
# 	var modified = original if crit_chance == base_stats.crit_chance else original+"%)" + init_a + "(" + str(max(base_stats.crit_chance * 100.0, 0))

# 	# ModLoaderLog.info("original crit string", original)
# 	# ModLoaderLog.info("modded crit string", modified)
	
# 	return modified

func get_cooldown_text(cooldown)->String:
	return "cooldown: " + str(cooldown)
# 	var original = .get_cooldown_text(base_stats, multiplier)

# 	var cd = get_cooldown_value(base_stats)
# 	var base_cd = get_base_cooldown_value(base_stats)
# 	var a = get_col_a( - cd, - base_cd)
# 	# return a + str(stepify(cd * multiplier, 0.01)) + "s" + col_b

# 	var modified = original if cd == base_cd else a + str(stepify(cd * multiplier, 0.01)) + "s" + col_b + init_a + str(stepify(base_cd * multiplier, 0.01)) + "s"  + col_b
# 	# ModLoaderLog.info("modded cooldown string", modified)

# 	return modified
