function GetPlayer(source)
    if not IsFrameworkReady() then return nil end

    if FrameworkName == 'qb' then
        return exports['qb-core']:GetPlayer(source)
    elseif FrameworkName == 'esx' then
        return Framework.GetPlayerFromId(source)
    end

    return nil
end

function GetPlayerIdentifier(source)
    local player = GetPlayer(source)
    if not player then return nil end

    if FrameworkName == 'qb' then
        return player.PlayerData.citizenid
    elseif FrameworkName == 'esx' then
        return player.getIdentifier()
    end

    return nil
end

function GetPlayerName(source)
    local player = GetPlayer(source)
    if not player then return nil end

    if FrameworkName == 'qb' then
        return player.Functions.GetName()
    elseif FrameworkName == 'esx' then
        return player.getName()
    end

    return nil
end

function GetPlayerJob(source)
    local player = GetPlayer(source)
    if not player then return nil end

    if FrameworkName == 'qb' then
        local job = player.PlayerData.job
        return {
            name = job.name,
            label = job.label,
            grade = job.grade.level,
            grade_name = job.grade.name,
            grade_label = job.grade.label,
            payment = job.payment,
            onduty = job.onduty,
            isboss = job.isboss
        }
    elseif FrameworkName == 'esx' then
        local job = player.getJob()
        return {
            name = job.name,
            label = job.label,
            grade = job.grade,
            grade_name = job.grade_name,
            grade_label = job.grade_label,
            payment = job.grade_salary,
            onduty = job.onDuty,
            isboss = false
        }
    end

    return nil
end

function GetPlayerGang(source)
    local player = GetPlayer(source)
    if not player then return nil end

    if FrameworkName == 'qb' then
        local gang = player.PlayerData.gang
        return {
            name = gang.name,
            label = gang.label,
            grade = gang.grade.level,
            grade_name = gang.grade.name,
            grade_label = gang.grade.label,
            isboss = gang.isboss
        }
    elseif FrameworkName == 'esx' then
        return nil
    end

    return nil
end

function GetPlayerMetadata(source, key)
    local player = GetPlayer(source)
    if not player then return nil end

    if FrameworkName == 'qb' then
        if key then
            return player.Functions.GetMetaData(key)
        else
            return player.PlayerData.metadata
        end
    elseif FrameworkName == 'esx' then
        if key then
            return player.getMeta(key)
        else
            return player.getMeta()
        end
    end

    return nil
end

function SetPlayerMetadata(source, key, value)
    local player = GetPlayer(source)
    if not player then return false end

    if FrameworkName == 'qb' then
        player.Functions.SetMetaData(key, value)
        return true
    elseif FrameworkName == 'esx' then
        player.setMeta(key, value)
        return true
    end

    return false
end

exports('GetPlayer', GetPlayer)
exports('GetPlayerIdentifier', GetPlayerIdentifier)
exports('GetPlayerName', GetPlayerName)
exports('GetPlayerJob', GetPlayerJob)
exports('GetPlayerGang', GetPlayerGang)
exports('GetPlayerMetadata', GetPlayerMetadata)
exports('SetPlayerMetadata', SetPlayerMetadata)