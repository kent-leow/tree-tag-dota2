guardian_root = class({})

function guardian_root:GetIntrinsicModifierName()
    return "modifier_guardian_root"
end

modifier_guardian_root = class({})

function modifier_guardian_root:IsHidden() return true end
function modifier_guardian_root:IsPurgable() return false end
function modifier_guardian_root:IsPassive() return true end

function modifier_guardian_root:DeclareFunctions()
    return { MODIFIER_EVENT_ON_ATTACK_LANDED }
end

function modifier_guardian_root:OnAttackLanded(event)
    if not IsServer() then return end
    if event.attacker ~= self:GetParent() then return end

    local procChance = self:GetAbility():GetSpecialValueFor("proc_chance")
    if RandomInt(1, 100) <= procChance then
        local rootDuration = self:GetAbility():GetSpecialValueFor("root_duration")
        event.target:AddNewModifier(self:GetParent(), self:GetAbility(), "modifier_guardian_root_debuff", {
            duration = rootDuration,
        })
    end
end

modifier_guardian_root_debuff = class({})

function modifier_guardian_root_debuff:IsDebuff() return true end
function modifier_guardian_root_debuff:IsHidden() return false end

function modifier_guardian_root_debuff:CheckState()
    return {
        [MODIFIER_STATE_ROOTED] = true,
    }
end
