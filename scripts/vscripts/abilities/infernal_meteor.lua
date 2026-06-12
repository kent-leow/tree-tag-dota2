require("tree_manager")

infernal_meteor = class({})

function infernal_meteor:OnSpellStart()
    local caster = self:GetCaster()
    local targetPoint = self:GetCursorPosition()
    local delay = self:GetSpecialValueFor("delay")
    local radius = self:GetSpecialValueFor("radius")
    local damage = self:GetSpecialValueFor("damage")

    local particle = ParticleManager:CreateParticle(
        "particles/units/heroes/hero_invoker/invoker_sun_strike_team.vpcf",
        PATTACH_WORLDORIGIN, nil
    )
    ParticleManager:SetParticleControl(particle, 0, targetPoint)
    ParticleManager:SetParticleControl(particle, 1, Vector(radius, 0, 0))

    Timers:CreateTimer(delay, function()
        TreeManager:DestroyTreesInRadius(targetPoint, radius)

        local enemies = FindUnitsInRadius(caster:GetTeamNumber(), targetPoint, nil, radius,
            DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
            DOTA_UNIT_TARGET_FLAG_NONE, FIND_ANY_ORDER, false)

        for _, enemy in pairs(enemies) do
            ApplyDamage({
                victim = enemy,
                attacker = caster,
                damage = damage,
                damage_type = DAMAGE_TYPE_MAGICAL,
                ability = self,
            })
        end

        ParticleManager:ReleaseParticleIndex(particle)
    end)
end
