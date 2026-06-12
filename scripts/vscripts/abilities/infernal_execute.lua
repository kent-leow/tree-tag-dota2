infernal_execute = class({})

function infernal_execute:OnSpellStart()
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    local baseDamage = self:GetSpecialValueFor("base_damage")
    local missingHpPercent = self:GetSpecialValueFor("missing_hp_percent")

    local missingHP = target:GetMaxHealth() - target:GetHealth()
    local totalDamage = baseDamage + (missingHP * missingHpPercent)

    ApplyDamage({
        victim = target,
        attacker = caster,
        damage = totalDamage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        ability = self,
    })

    if not target:IsAlive() then
        self:EndCooldown()
    end
end
