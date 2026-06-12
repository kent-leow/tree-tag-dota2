require("tree_manager")

infernal_fire_wave = class({})

function infernal_fire_wave:OnSpellStart()
    local caster = self:GetCaster()
    local targetPoint = self:GetCursorPosition()
    local damage = self:GetSpecialValueFor("damage")
    local waveWidth = self:GetSpecialValueFor("wave_width")
    local waveDistance = self:GetSpecialValueFor("wave_distance")
    local waveSpeed = self:GetSpecialValueFor("wave_speed")

    local origin = caster:GetAbsOrigin()
    local direction = (targetPoint - origin):Normalized()

    local projectile = {
        Ability = self,
        EffectName = "particles/units/heroes/hero_lina/lina_spell_dragon_slave.vpcf",
        vSpawnOrigin = origin,
        fDistance = waveDistance,
        fStartRadius = waveWidth / 2,
        fEndRadius = waveWidth / 2,
        Source = caster,
        bHasFrontalCone = false,
        bReplaceExisting = false,
        iUnitTargetTeam = DOTA_UNIT_TARGET_TEAM_ENEMY,
        iUnitTargetType = DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC,
        fExpireTime = GameRules:GetGameTime() + waveDistance / waveSpeed + 1,
        bDeleteOnHit = false,
        vVelocity = direction * waveSpeed,
        bProvidesVision = false,
        TreeBehavior = PROJECTILES_DESTROY,
    }

    ProjectileManager:CreateLinearProjectile(projectile)

    -- Destroy trees along the full path
    local steps = math.ceil(waveDistance / (waveWidth / 2))
    for i = 1, steps do
        local checkPoint = origin + direction * (i * waveWidth / 2)
        TreeManager:DestroyTreesInRadius(checkPoint, waveWidth / 2)
    end
end

function infernal_fire_wave:OnProjectileHitUnit(target, location)
    if not target then return end

    local damage = self:GetSpecialValueFor("damage")
    ApplyDamage({
        victim = target,
        attacker = self:GetCaster(),
        damage = damage,
        damage_type = DAMAGE_TYPE_MAGICAL,
        ability = self,
    })
end
