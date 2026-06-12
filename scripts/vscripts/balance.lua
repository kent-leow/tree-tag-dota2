require("settings")

Balance = Balance or {}

function Balance:Init()
end

function Balance:GetInfernalPower(gameMinute)
    local basePower = 100
    local earlyMultiplier = SETTINGS.INFERNAL_EARLY_POWER_MULT
    local decay = math.max(0, 1 - (gameMinute / (SETTINGS.BALANCE_CROSSOVER_MINUTE * 2)))
    return basePower * earlyMultiplier * decay + basePower * (1 - decay)
end

function Balance:GetEntPower(gameMinute)
    local basePower = 50
    local growthRate = basePower / SETTINGS.BALANCE_CROSSOVER_MINUTE
    return basePower + (growthRate * gameMinute)
end

function Balance:GetPowerDifferential(gameMinute)
    return self:GetInfernalPower(gameMinute) - self:GetEntPower(gameMinute)
end

function Balance:GetCrossoverMinute()
    for minute = 0, SETTINGS.MATCH_DURATION / 60 do
        if self:GetEntPower(minute) >= self:GetInfernalPower(minute) then
            return minute
        end
    end
    return SETTINGS.MATCH_DURATION / 60
end

function Balance:LogPowerState()
    local gameTime = GameRules:GetGameTime()
    local gameMinute = math.floor(gameTime / 60)
    local infPower = self:GetInfernalPower(gameMinute)
    local entPower = self:GetEntPower(gameMinute)
    print(string.format("[Balance] Minute %d: Infernal=%.1f Ent=%.1f Diff=%.1f",
        gameMinute, infPower, entPower, infPower - entPower))
end

return Balance
