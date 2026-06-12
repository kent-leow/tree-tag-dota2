guardian_thorns = class({})

function guardian_thorns:GetIntrinsicModifierName()
    return "modifier_guardian_thorns"
end

modifier_guardian_thorns = class({})

function modifier_guardian_thorns:IsHidden() return true end
function modifier_guardian_thorns:IsPurgable() return false end
function modifier_guardian_thorns:IsPassive() return true end

function modifier_guardian_thorns:DeclareFunctions()
    return { MODIFIER_EVENT_ON_ATTACK_LANDED }
end

function modifier_guardian_thorns:OnAttackLanded(event)
    if not IsServer() then return end
    if event.target ~= self:GetParent() then return end

    local attacker = event.attacker
    if not attacker:IsRangedAttacker() then
        local reflectPercent = self:GetAbility():GetSpecialValueFor("reflect_percent")
        local reflectDamage = event.damage * reflectPercent / 100

        ApplyDamage({
            victim = attacker,
            attacker = self:GetParent(),
            damage = reflectDamage,
            damage_type = DAMAGE_TYPE_PHYSICAL,
            ability = self:GetAbility(),
        })
    end
end
