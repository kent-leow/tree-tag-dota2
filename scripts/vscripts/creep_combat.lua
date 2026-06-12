require("settings")

CreepCombat = CreepCombat or {}

function CreepCombat:Init()
    ListenToGameEvent("entity_hurt", Dynamic_Wrap(CreepCombat, "OnEntityHurt"), self)
end

function CreepCombat:OnEntityHurt(event)
    local damagedUnit = EntIndexToHScript(event.entindex_killed)
    local attackerUnit = event.entindex_attacker and EntIndexToHScript(event.entindex_attacker) or nil

    if not damagedUnit or not attackerUnit then return end

    local attackerName = attackerUnit.GetUnitName and attackerUnit:GetUnitName() or nil
    local targetName = damagedUnit.GetUnitName and damagedUnit:GetUnitName() or nil

    if self:IsHiredCreep(attackerName) and damagedUnit:IsRealHero() then
        if damagedUnit:GetTeamNumber() == SETTINGS.ENT_TEAM_ID then
            self:OnCreepAttacksEnt(attackerUnit, damagedUnit, attackerName)
        end
    end
end

function CreepCombat:IsHiredCreep(unitName)
    return unitName == "npc_dota_hired_melee" or unitName == "npc_dota_hired_ranged"
end

function CreepCombat:OnCreepAttacksEnt(creep, ent, creepType)
    if creepType == "npc_dota_hired_melee" then
        ent.hp = 0
        ent.alive = false
    elseif creepType == "npc_dota_hired_ranged" then
        ent.hp = ent.hp - SETTINGS.TAVERN_RANGED_DAMAGE
        if ent.hp <= 0 then
            ent.alive = false
        end
    end
end

function CreepCombat:GetMeleeDamage()
    return SETTINGS.TAVERN_MELEE_DAMAGE
end

function CreepCombat:GetRangedDamage()
    return SETTINGS.TAVERN_RANGED_DAMAGE
end

return CreepCombat
