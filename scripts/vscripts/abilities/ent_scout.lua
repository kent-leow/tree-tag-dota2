ent_scout = class({})

function ent_scout:OnSpellStart()
    local caster = self:GetCaster()
    local duration = self:GetSpecialValueFor("wisp_duration")

    local wisp = CreateUnitByName(
        "npc_dota_ent_wisp",
        caster:GetAbsOrigin(),
        true,
        caster,
        caster,
        caster:GetTeamNumber()
    )

    wisp:SetControllableByPlayer(caster:GetPlayerID(), true)
    wisp:AddNewModifier(caster, self, "modifier_kill", { duration = duration })

    local moveSpeed = self:GetSpecialValueFor("wisp_move_speed")
    wisp:SetBaseMoveSpeed(moveSpeed)
end
