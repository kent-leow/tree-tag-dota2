ent_blink = class({})

function ent_blink:OnSpellStart()
    local caster = self:GetCaster()
    local targetPoint = self:GetCursorPosition()
    local maxRange = self:GetSpecialValueFor("max_range")
    local origin = caster:GetAbsOrigin()

    local direction = targetPoint - origin
    local distance = direction:Length2D()

    if distance > maxRange then
        direction = direction:Normalized() * maxRange
        targetPoint = origin + direction
    end

    if not GridNav:IsTraversable(targetPoint) then
        targetPoint = GridNav:FindPathablePositionNearby(targetPoint, 100)
        if not targetPoint then
            self:RefundManaCost()
            return
        end
    end

    ProjectileManager:ProjectileDodge(caster)
    FindClearSpaceForUnit(caster, targetPoint, true)

    local particle = ParticleManager:CreateParticle(
        "particles/items_fx/blink_dagger_start.vpcf",
        PATTACH_ABSORIGIN, caster
    )
    ParticleManager:ReleaseParticleIndex(particle)
end
