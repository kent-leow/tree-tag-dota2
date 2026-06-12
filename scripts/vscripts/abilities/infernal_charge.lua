require("tree_manager")

infernal_charge = class({})

function infernal_charge:OnSpellStart()
    local caster = self:GetCaster()
    local target = self:GetCursorTarget()
    local chargeSpeed = self:GetSpecialValueFor("charge_speed")
    local damage = self:GetSpecialValueFor("damage")
    local stunDuration = self:GetSpecialValueFor("stun_duration")
    local treeWidth = self:GetSpecialValueFor("tree_destroy_width")

    local direction = (target:GetAbsOrigin() - caster:GetAbsOrigin()):Normalized()

    caster:AddNewModifier(caster, self, "modifier_infernal_charge_motion", {
        target = target:entindex(),
        speed = chargeSpeed,
        damage = damage,
        stun_duration = stunDuration,
        tree_width = treeWidth,
    })
end

modifier_infernal_charge_motion = class({})

function modifier_infernal_charge_motion:IsHidden() return true end

function modifier_infernal_charge_motion:OnCreated(params)
    if not IsServer() then return end
    self.target = EntIndexToHScript(params.target)
    self.speed = params.speed
    self.damage = params.damage
    self.stunDuration = params.stun_duration
    self.treeWidth = params.tree_width
    self:StartIntervalThink(0.03)
end

function modifier_infernal_charge_motion:OnIntervalThink()
    local parent = self:GetParent()
    local targetPos = self.target:GetAbsOrigin()
    local currentPos = parent:GetAbsOrigin()
    local direction = (targetPos - currentPos):Normalized()
    local moveDistance = self.speed * 0.03

    local newPos = currentPos + direction * moveDistance
    parent:SetAbsOrigin(newPos)

    TreeManager:DestroyTreesInRadius(newPos, self.treeWidth / 2)

    if (targetPos - newPos):Length2D() < 100 then
        ApplyDamage({
            victim = self.target,
            attacker = parent,
            damage = self.damage,
            damage_type = DAMAGE_TYPE_PHYSICAL,
            ability = self:GetAbility(),
        })
        self.target:AddNewModifier(parent, self:GetAbility(), "modifier_stunned", { duration = self.stunDuration })
        self:Destroy()
    end
end

function modifier_infernal_charge_motion:CheckState()
    return { [MODIFIER_STATE_STUNNED] = false }
end
