require("settings")

Balance = Balance or {}

Balance.incomeMult = 1.0
Balance.snowballMult = 1.0
Balance.timerMult = 1.0

function Balance:Init()
    self.incomeMult = 1.0
    self.snowballMult = 1.0
    self.timerMult = 1.0
end

function Balance:ScaleForTeamSize(infernalCount, entCount)
    local bestMatch = nil
    local bestDist = math.huge

    for _, entry in ipairs(SETTINGS.BALANCE_SCALING) do
        local dist = math.abs(entry.infernals - infernalCount) + math.abs(entry.ents - entCount)
        if dist < bestDist then
            bestDist = dist
            bestMatch = entry
        end
    end

    if bestMatch then
        self.incomeMult = bestMatch.income_mult
        self.snowballMult = bestMatch.snowball_mult
        self.timerMult = bestMatch.timer_mult
    end

    return {
        incomeMult = self.incomeMult,
        snowballMult = self.snowballMult,
        timerMult = self.timerMult,
    }
end

function Balance:GetIncomeMult()
    return self.incomeMult
end

function Balance:GetSnowballMult()
    return self.snowballMult
end

function Balance:GetTimerMult()
    return self.timerMult
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
