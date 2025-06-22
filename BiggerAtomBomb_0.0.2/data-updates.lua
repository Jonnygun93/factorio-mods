local atom_bomb = data.raw["projectile"]["atomic-rocket"]
local atom_bomb_shockwave = data.raw["projectile"]["atomic-bomb-wave-spawns-nuke-shockwave-explosion"]
-- local atom_bomb_smoke = data.raw["projectile"]["atomic-bomb-wave-spawns-nuclear-smoke"]
local atom_bomb_fire = data.raw["projectile"]["atomic-bomb-wave-spawns-fire-smoke-explosion"]
local atom_bomb_wave = data.raw["projectile"]["atomic-bomb-wave"]
local atom_bomb_zero = data.raw["projectile"]["atomic-bomb-ground-zero-projectile"]

offset = 0
if mods["space-age"] then
    -- Space age inserts a target effect on position 2, shifting all later effects by 1. 
    offset = 3
end


-- get parameters from settings
local bomb_damage_modifier = settings.startup["atom_bomb_damage_modifier"].value
local bomb_range_modifier = settings.startup["bomb_range_modifier"].value

-- Modify damage
atom_bomb.action.action_delivery.target_effects[7 + offset].damage.amount = atom_bomb.action.action_delivery.target_effects[7 + offset].damage.amount * bomb_damage_modifier
atom_bomb_wave.action[1].action_delivery.target_effects.damage.amount = atom_bomb_wave.action[1].action_delivery.target_effects.damage.amount * bomb_damage_modifier
atom_bomb_zero.action[1].action_delivery.target_effects.damage.amount = atom_bomb_zero.action[1].action_delivery.target_effects.damage.amount * bomb_damage_modifier





-- Modify range
-- -- atom_bomb
atom_bomb.action.action_delivery.target_effects[4 + offset].full_strength_max_distance = atom_bomb.action.action_delivery.target_effects[4 + offset].full_strength_max_distance * bomb_range_modifier
atom_bomb.action.action_delivery.target_effects[4 + offset].max_distance = math.min(atom_bomb.action.action_delivery.target_effects[4 + offset].max_distance * bomb_range_modifier, 65535)
atom_bomb.action.action_delivery.target_effects[4 + offset].duration = math.min(atom_bomb.action.action_delivery.target_effects[4 + offset].duration * bomb_range_modifier, 255)
atom_bomb.action.action_delivery.target_effects[4 + offset].ease_out_duration = math.min(atom_bomb.action.action_delivery.target_effects[4 + offset].ease_out_duration * bomb_range_modifier, 255)
-- atom_bomb.action.action_delivery.target_effects[4].strength = atom_bomb.action.action_delivery.target_effects[4].strength * bomb_range_modifier
for i = 5,6 do
    atom_bomb.action.action_delivery.target_effects[i + offset].max_distance = atom_bomb.action.action_delivery.target_effects[i + offset].max_distance * bomb_range_modifier
end
atom_bomb.action.action_delivery.target_effects[10 + offset].radius = math.min(atom_bomb.action.action_delivery.target_effects[10 + offset].radius * bomb_range_modifier, 23) -- Maximum allowed radius in factorio. 
atom_bomb.action.action_delivery.target_effects[11 + offset].spawn_min_radius = math.min(atom_bomb.action.action_delivery.target_effects[11 + offset].spawn_min_radius * bomb_range_modifier,22.5)
atom_bomb.action.action_delivery.target_effects[11 + offset].spawn_max_radius = math.min(atom_bomb.action.action_delivery.target_effects[11 + offset].spawn_max_radius * bomb_range_modifier, 23.5)
for i = 12, 18 do
    atom_bomb.action.action_delivery.target_effects[i + offset].action.radius = atom_bomb.action.action_delivery.target_effects[i + offset].action.radius * bomb_range_modifier
    if i == 17 then
        atom_bomb.action.action_delivery.target_effects[i + offset].action.repeat_count = math.ceil(atom_bomb.action.action_delivery.target_effects[i + offset].action.repeat_count * math.max(1, bomb_range_modifier / 5))
    else
        atom_bomb.action.action_delivery.target_effects[i + offset].action.repeat_count = math.ceil(atom_bomb.action.action_delivery.target_effects[i + offset].action.repeat_count * bomb_range_modifier)
    end
end


-- -- others
atom_bomb_shockwave.action[1].action_delivery.target_effects[1].max_movement_distance = atom_bomb_shockwave.action[1].action_delivery.target_effects[1].max_movement_distance * bomb_range_modifier
atom_bomb_fire.action[1].action_delivery.target_effects[1].max_movement_distance = atom_bomb_fire.action[1].action_delivery.target_effects[1].max_movement_distance * bomb_range_modifier
atom_bomb_wave.action[1].action_delivery.target_effects.upper_distance_threshold = atom_bomb_wave.action[1].action_delivery.target_effects.upper_distance_threshold * bomb_range_modifier
atom_bomb_zero.action[1].action_delivery.target_effects.upper_distance_threshold = atom_bomb_zero.action[1].action_delivery.target_effects.upper_distance_threshold * bomb_range_modifier