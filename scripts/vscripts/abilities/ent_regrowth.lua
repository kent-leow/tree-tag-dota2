require("tree_manager")
require("tree_regrowth")

ent_regrowth = class({})

function ent_regrowth:OnSpellStart()
    local caster = self:GetCaster()
    local targetPoint = self:GetCursorPosition()
    local radius = self:GetSpecialValueFor("radius")

    TreeRegrowth:InstantRegrow(targetPoint, radius)

    local particle = ParticleManager:CreateParticle(
        "particles/units/heroes/hero_treant/treant_livingarmor.vpcf",
        PATTACH_WORLDORIGIN, nil
    )
    ParticleManager:SetParticleControl(particle, 0, targetPoint)
    ParticleManager:ReleaseParticleIndex(particle)
end
