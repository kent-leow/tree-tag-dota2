infernal_reveal = class({})

function infernal_reveal:OnSpellStart()
    local caster = self:GetCaster()
    local targetPoint = self:GetCursorPosition()
    local radius = self:GetSpecialValueFor("radius")
    local duration = self:GetSpecialValueFor("duration")

    AddFOWViewer(caster:GetTeamNumber(), targetPoint, radius, duration, true)

    local revealer = CreateModifierThinker(caster, self, "modifier_infernal_reveal_thinker", {
        duration = duration,
    }, targetPoint, caster:GetTeamNumber(), false)
end

modifier_infernal_reveal_thinker = class({})

function modifier_infernal_reveal_thinker:OnCreated()
    if not IsServer() then return end
    self:StartIntervalThink(0.5)
end

function modifier_infernal_reveal_thinker:OnIntervalThink()
    local ability = self:GetAbility()
    local radius = ability:GetSpecialValueFor("radius")
    local origin = self:GetParent():GetAbsOrigin()

    local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), origin, nil, radius,
        DOTA_UNIT_TARGET_TEAM_ENEMY, DOTA_UNIT_TARGET_HERO,
        DOTA_UNIT_TARGET_FLAG_INVULNERABLE, FIND_ANY_ORDER, false)

    for _, enemy in pairs(enemies) do
        if enemy:IsInvisible() then
            enemy:AddNewModifier(self:GetCaster(), ability, "modifier_truesight", { duration = 0.6 })
        end
    end
end
