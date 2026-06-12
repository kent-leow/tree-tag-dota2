-- Minimal test framework and Dota 2 API mocks for unit testing

-- Dota 2 constants
DOTA_TEAM_GOODGUYS = 2
DOTA_TEAM_BADGUYS = 3
DOTA_TEAM_NEUTRALS = 4
DOTA_GAMERULES_STATE_HERO_SELECTION = 4
DOTA_GAMERULES_STATE_GAME_IN_PROGRESS = 8
DOTA_GAMERULES_STATE_POST_GAME = 10

-- class() utility
function class(base)
    local c = {}
    c.__index = c
    setmetatable(c, { __call = function(cls, ...)
        local instance = setmetatable({}, cls)
        if instance.constructor then instance:constructor(...) end
        return instance
    end })
    return c
end

-- Mock GameRules
MockGameRules = {
    state = DOTA_GAMERULES_STATE_HERO_SELECTION,
    winner = nil,
    teamMaxPlayers = {},
    gameTime = 0,
}

function MockGameRules:SetState(state) self.state = state end
function MockGameRules:State_Get() return self.state end
function MockGameRules:SetGameWinner(team) self.winner = team end
function MockGameRules:SetCustomGameTeamMaxPlayers(team, max) self.teamMaxPlayers[team] = max end
function MockGameRules:GetCustomGameTeamMaxPlayers(team) return self.teamMaxPlayers[team] or 0 end
function MockGameRules:SetGameTime(t) self.gameTime = t end
function MockGameRules:SetTimeOfDay(t) end
function MockGameRules:GetGameModeEntity() return MockGameModeEntity end

GameRules = MockGameRules

-- Mock GameModeEntity
MockGameModeEntity = {}
function MockGameModeEntity:SetThink() end

-- Mock PlayerResource
MockPlayerResource = {
    playerCount = 0,
    teamAssignments = {},
}

function MockPlayerResource:SetPlayerCount(count) self.playerCount = count end
function MockPlayerResource:GetPlayerCount() return self.playerCount end
function MockPlayerResource:IsValidPlayerID(id) return id >= 0 and id < self.playerCount end
function MockPlayerResource:SetCustomTeamAssignment(playerID, teamID)
    self.teamAssignments[playerID] = teamID
end
function MockPlayerResource:GetTeamAssignment(playerID) return self.teamAssignments[playerID] end

PlayerResource = MockPlayerResource

-- Mock HeroList
MockHeroList = {
    heroes = {},
}

function MockHeroList:SetHeroes(heroData)
    self.heroes = {}
    for _, data in ipairs(heroData) do
        table.insert(self.heroes, {
            GetTeamNumber = function() return data.team end,
            IsAlive = function() return data.alive end,
            IsRealHero = function() return true end,
        })
    end
end

function MockHeroList:GetAllHeroes() return self.heroes end

HeroList = MockHeroList

-- Mock event system
local eventListeners = {}
function ListenToGameEvent(event, callback, context)
    eventListeners[event] = { callback = callback, context = context }
end

function Dynamic_Wrap(tbl, funcName)
    return tbl[funcName]
end

-- Mock EntIndexToHScript
function EntIndexToHScript(index)
    return { IsRealHero = function() return true end }
end

-- Mock Vector
function Vector(x, y, z)
    local v = { x = x or 0, y = y or 0, z = z or 0 }
    setmetatable(v, {
        __sub = function(a, b)
            return Vector(a.x - b.x, a.y - b.y, a.z - b.z)
        end,
        __add = function(a, b)
            return Vector(a.x + b.x, a.y + b.y, a.z + b.z)
        end,
    })
    v.Length2D = function(self)
        return math.sqrt(self.x * self.x + self.y * self.y)
    end
    return v
end

-- Mock GridNav
MockGridNav = {
    trees = {},
}

function MockGridNav:SetTrees(treeData)
    self.trees = {}
    for _, data in ipairs(treeData) do
        local tree = {
            pos = data.pos,
            standing = data.standing,
            IsStanding = function(self) return self.standing end,
            CutDown = function(self, team) self.standing = false end,
            GetAbsOrigin = function(self) return self.pos end,
        }
        table.insert(self.trees, tree)
    end
end

function MockGridNav:GetAllTreesAroundPoint(center, radius, standing)
    local result = {}
    for _, tree in ipairs(self.trees) do
        local dist = (tree.pos - center):Length2D()
        if dist <= radius then
            if not standing or tree:IsStanding() then
                table.insert(result, tree)
            end
        end
    end
    return result
end

function MockGridNav:RegrowAllTreesInRadius(center, radius)
    for _, tree in ipairs(self.trees) do
        local dist = (tree.pos - center):Length2D()
        if dist <= radius then
            tree.standing = true
        end
    end
end

GridNav = MockGridNav

-- Mock GameRules extensions
function MockGameRules:GetGameTime() return self.gameTime or 0 end

-- Dota 2 modifier state constants
MODIFIER_PROPERTY_INVISIBILITY_LEVEL = 1
MODIFIER_PROPERTY_INCOMING_DAMAGE_PERCENTAGE = 2
MODIFIER_STATE_INVISIBLE = 1
MODIFIER_STATE_ROOTED = 2
MODIFIER_STATE_DISARMED = 3
DOTA_UNIT_CAP_MOVE_NONE = 0
DOTA_UNIT_CAP_MOVE_GROUND = 1
DOTA_UNIT_CAP_MOVE_FLY = 2
DOTA_UNIT_CAP_NO_ATTACK = 0
DOTA_UNIT_CAP_MELEE_ATTACK = 1
DOTA_UNIT_CAP_RANGED_ATTACK = 2
PATTACH_WORLDORIGIN = 0
PATTACH_ABSORIGIN = 1
DOTA_UNIT_TARGET_TEAM_FRIENDLY = 1
DOTA_UNIT_TARGET_TEAM_ENEMY = 2
DOTA_UNIT_TARGET_TEAM_BOTH = 3
DOTA_UNIT_TARGET_HERO = 1
DOTA_UNIT_TARGET_BASIC = 2
DOTA_UNIT_TARGET_FLAG_NONE = 0
DOTA_UNIT_TARGET_FLAG_INVULNERABLE = 1
FIND_ANY_ORDER = 0
DAMAGE_TYPE_MAGICAL = 1
DAMAGE_TYPE_PHYSICAL = 2
MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE = 3
MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT = 4
MODIFIER_EVENT_ON_ATTACK_LANDED = 5
MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE = 6
PROJECTILES_DESTROY = 1

function IsServer() return true end

-- Mock Hero for ability tests
MockHero = {}
MockHero.__index = MockHero

function MockHero:New(teamID)
    local hero = setmetatable({}, MockHero)
    hero.team = teamID or DOTA_TEAM_GOODGUYS
    hero.position = Vector(0, 0, 0)
    hero.modifiers = {}
    hero.mana = 200
    hero.hp = 500
    hero.alive = true
    hero.playerID = 0
    hero.moveCapability = DOTA_UNIT_CAP_MOVE_GROUND
    hero.blinkDistance = 0
    return hero
end

function MockHero:GetTeamNumber() return self.team end
function MockHero:GetAbsOrigin() return self.position end
function MockHero:IsAlive() return self.alive end
function MockHero:GetPlayerID() return self.playerID end
function MockHero:SetMoveCapability(cap) self.moveCapability = cap end
function MockHero:HasModifier(name) return self.modifiers[name] ~= nil end
function MockHero:AddModifier(name)
    self.modifiers[name] = { name = name, destroyed = false, duration = 0 }
end
function MockHero:FindModifier(name) return self.modifiers[name] end
function MockHero:AddNewModifier(source, ability, modName, tbl)
    self.modifiers[modName] = {
        name = modName,
        destroyed = false,
        duration = tbl and tbl.duration or 0,
        ability = ability,
        GetAbility = function(self) return self.ability end,
        GetParent = function() return self end,
        Destroy = function(mod) mod.destroyed = true end,
        OnIntervalThink = function(mod)
            if mod.ability then
                local trees = GridNav:GetAllTreesAroundPoint(self:GetAbsOrigin(), mod.ability:GetSpecialValueFor("tree_radius"), true)
                if #trees < mod.ability:GetSpecialValueFor("min_trees") then
                    mod.destroyed = true
                end
            end
        end,
        CheckState = function(mod)
            if modName == "modifier_ent_fortify" then
                return { [MODIFIER_STATE_DISARMED] = true }
            end
            return {}
        end,
        StartIntervalThink = function() end,
    }
    return self.modifiers[modName]
end
function MockHero:FindModifierByName(name) return self.modifiers[name] end
function MockHero:SetBaseMoveSpeed(speed) self.moveSpeed = speed end
function MockHero:SetControllableByPlayer(id, val) end
function MockHero:IsRealHero() return true end

-- Mock Ability
MockAbility = {}
MockAbility.__index = MockAbility

function MockAbility:New(name, caster, specialValues)
    local ab = setmetatable({}, MockAbility)
    ab.name = name
    ab.caster = caster
    ab.specialValues = specialValues or {}
    ab.cursorPosition = Vector(0, 0, 0)
    ab.cooldownStarted = false
    ab.refunded = false
    ab.manaCost = 0
    return ab
end

function MockAbility:GetCaster() return self.caster end
function MockAbility:GetCursorPosition() return self.cursorPosition end
function MockAbility:GetSpecialValueFor(key) return self.specialValues[key] or 0 end
function MockAbility:RefundManaCost() self.refunded = true end
function MockAbility:StartCooldown() self.cooldownStarted = true end

function MockAbility:OnSpellStart()
    if self.caster.mana and self.manaCost > 0 then
        self.caster.mana = self.caster.mana - self.manaCost
    end
    self.cooldownStarted = true

    local abilityClass = _G[self.name]
    if abilityClass and abilityClass.OnSpellStart then
        local proxy = setmetatable({}, { __index = function(_, k)
            if k == "GetCaster" then return function() return self.caster end
            elseif k == "GetCursorPosition" then return function() return self.cursorPosition end
            elseif k == "GetSpecialValueFor" then return function(_, key) return self.specialValues[key] or 0 end
            elseif k == "RefundManaCost" then return function() self.refunded = true end
            else return rawget(self, k) end
        end })
        abilityClass.OnSpellStart(proxy)
    end
end

-- Mock CreateUnitByName
MockCreateUnit = { lastCreated = nil }

function CreateUnitByName(unitName, position, findClear, owner, abilitySource, team)
    local unit = {
        unitName = unitName,
        position = position,
        team = team,
        hp = 1,
        moveSpeed = 350,
        controllable = false,
        killModifierDuration = 0,
    }
    unit.SetControllableByPlayer = function(self, id, val) self.controllable = true end
    unit.AddNewModifier = function(self, source, ability, modName, tbl)
        if modName == "modifier_kill" then
            self.killModifierDuration = tbl.duration
        end
    end
    unit.SetBaseMoveSpeed = function(self, speed) self.moveSpeed = speed end
    unit.GetTeamNumber = function(self) return self.team end
    MockCreateUnit.lastCreated = unit
    return unit
end

-- Mock ParticleManager
ParticleManager = {}
function ParticleManager:CreateParticle(name, attach, entity) return 1 end
function ParticleManager:SetParticleControl(id, cp, vec) end
function ParticleManager:ReleaseParticleIndex(id) end

-- Mock ProjectileManager
ProjectileManager = {}
function ProjectileManager:ProjectileDodge(unit) end

-- Mock FindClearSpaceForUnit
function FindClearSpaceForUnit(unit, position, doFindClear)
    unit.position = position
    if unit.blinkDistance ~= nil then
        unit.blinkDistance = (position - Vector(0, 0, 0)):Length2D()
    end
end

-- Mock GridNav extensions
MockGridNav.impassablePoints = {}
function MockGridNav:IsTraversable(point)
    for _, p in ipairs(self.impassablePoints) do
        if (p - point):Length2D() < 1 then return false end
    end
    return true
end
function MockGridNav:FindPathablePositionNearby(point, range)
    return nil
end

-- Test runner
function RunTests(testSuite, suiteName)
    local passed = 0
    local failed = 0

    for name, func in pairs(testSuite) do
        if type(func) == "function" and name:sub(1, 5) == "test_" then
            -- Reset mocks
            MockGameRules.winner = nil
            MockGameRules.state = DOTA_GAMERULES_STATE_HERO_SELECTION
            MockGameRules.teamMaxPlayers = {}
            MockPlayerResource.teamAssignments = {}
            MockHeroList.heroes = {}

            local success, err = pcall(func, testSuite)
            if success then
                passed = passed + 1
                print("[PASS] " .. suiteName .. ":" .. name)
            else
                failed = failed + 1
                print("[FAIL] " .. suiteName .. ":" .. name .. " - " .. err)
            end
        end
    end

    print(string.format("\n%s: %d passed, %d failed", suiteName, passed, failed))
    if failed > 0 then
        error(suiteName .. " has failing tests")
    end
end
