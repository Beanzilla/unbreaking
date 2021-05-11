-- Settings
-- Mostly if particular groups of tools are "unbreakable" (Rather have an upgrade process to become uobreakable)
unbreaking_pick = true
unbreaking_axe = true
unbreaking_shovel = true
unbreaking_sword = false -- Disabled to prevent PVP from being ruthless
unbreaking_hoe = true
unbreaking_shears = true -- Only used if MineClone2 is installed
unbreaking_armors = true -- Only used if 3d_armor or MineClone2 is installed

-- Execute
dofile(minetest.get_modpath("unbreaking") .. "/tools.lua")
if unbreaking_armors then
    dofile(minetest.get_modpath("unbreaking") .. "/armor.lua")
end

minetest.log("action", "[unbreaking] Load complete!")