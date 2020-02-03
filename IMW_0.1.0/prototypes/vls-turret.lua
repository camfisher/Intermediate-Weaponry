function vls_turret_sheet(inputs)
return
{
  layers = 
  {
    {
      filename = "__IMW__/graphics/entity/VLS-turret-sheet.png",
      priority = "medium",
      scale = 0.6,
      width = 180,
      height = 180,
	  direction_count = 1,
      frame_count = 12,
      line_length = 3,
      axially_symmetrical = false,
      run_mode = inputs.run_mode and inputs.run_mode or "forward",
	  animation_speed = inputs.animation_speed or 0.0625,
	  shift = { 0.0, -0.25 },
    }
  }
}
end

-- entity
data:extend(
{
  {
    type = "ammo-turret",
    name = "vls-turret",
    icon = "__IMW__/graphics/icons/VLS-turret-icon.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation"},
    minable = {mining_time = 1, result = "vls-turret"},
    max_health = 500,
    corpse = "medium-remnants",
    collision_box = {{-0.3, -0.3 }, {0.3, 0.3}},
    selection_box = {{-.5, -.5 }, {.5, .5}},
    preparing_speed = 0.005,
    dying_explosion = "medium-explosion",
    inventory_size = 1,
    automated_ammo_count = 10,
    attacking_speed = 0.03125,
	preparing_speed = 0.03125,
	
    folded_animation = vls_turret_sheet{direction_count = 1, line_length = 1, run_mode = "forward"},
    preparing_animation = vls_turret_sheet{direction_count = 1, line_length = 3, run_mode = "forward"},
    prepared_animation = vls_turret_sheet{},
    attacking_animation = vls_turret_sheet{},
    folding_animation = vls_turret_sheet{direction_count = 1, line_length = 3, run_mode = "backward", animation_speed = 0.03125},
	
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    
    attack_parameters =
    {
      type = "projectile",
      ammo_category = "rocket",
      cooldown = 720,
      projectile_creation_distance = 1.75,
      projectile_center = {0, 0},
      damage_modifier = 1.25,
      shell_particle =
      {
        name = "shell-particle",
        direction_deviation = 0.1,
        speed = 0.1,
        speed_deviation = 0.03,
        center = {0, 0},
        creation_distance = -1.925,
        starting_frame_speed = 0.2,
        starting_frame_speed_deviation = 0.1
      },
      range = 50,
      min_range = 20,
      sound =
      {
        {
            filename = "__base__/sound/fight/rocket-launcher.ogg",
            volume = 2.0
        }
      },
    },
    call_for_help_radius = 46
  },
})

--item
data:extend({
  {
    type = "item",
    name = "vls-turret",
    icon = "__IMW__/graphics/icons/vls-turret-icon.png",
    icon_size = 32,
    --flags = {"goes-to-quickbar"},
    subgroup = "defensive-structure",
    order = "b[turret]-c[base]-a[cannon-turret]",
    place_result = "vls-turret",
    stack_size = 50,
  },
})


--recipe
data:extend({
  {
    type = "recipe",
    name = "vls-turret",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
      {"gun-turret", 1},
      {"iron-plate", 10},
      {"advanced-circuit", 2},
	  {"rocket-launcher", 1}
    },
    result = "vls-turret",
  },
})
