data:extend(
{
  {
    type = "technology",
    name = "vls-turret-unlock",
    icon_size = 128,
    icon = "__IMW__/graphics/technology/vls-turret-tech.png",
    effects = 
    {
        {
          type = "unlock-recipe",
          recipe = "vls-turret"
        },
      },
    prerequisites = {"turrets", "rocketry"}, 
    unit =
    {
      count = 100,
      ingredients = {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
      },
      time = 30,
    },
    upgrade = true,
    order = "e-c-c-a"
  },
})
