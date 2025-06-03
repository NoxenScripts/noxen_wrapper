function SetPlayerJob(source, jobName, grade)
    local player = GetPlayer(source)
    if not player then return false end

    grade = grade or 0

    if FrameworkName == 'qb' then
        return player.Functions.SetJob(jobName, grade)
    elseif FrameworkName == 'esx' then
        player.setJob(jobName, grade)
        return true
    end

    return false
end

function SetPlayerGang(source, gangName, grade)
    local player = GetPlayer(source)
    if not player then return false end

    grade = grade or 0

    if FrameworkName == 'qb' then
        return player.Functions.SetGang(gangName, grade)
    elseif FrameworkName == 'esx' then
        return false
    end

    return false
end

function SetPlayerJobDuty(source, onDuty)
    local player = GetPlayer(source)
    if not player then return false end

    if FrameworkName == 'qb' then
        player.Functions.SetJobDuty(onDuty)
        return true
    elseif FrameworkName == 'esx' then
        return true
    end

    return false
end

function IsPlayerInJob(source, jobName)
    local playerJob = GetPlayerJob(source)
    if not playerJob then return false end

    return playerJob.name == jobName
end

function IsPlayerJobGrade(source, jobName, minGrade)
    local playerJob = GetPlayerJob(source)
    if not playerJob then return false end

    return playerJob.name == jobName and playerJob.grade >= minGrade
end

function IsPlayerInGang(source, gangName)
    local playerGang = GetPlayerGang(source)
    if not playerGang then return false end

    return playerGang.name == gangName
end

function IsPlayerOnDuty(source)
    local playerJob = GetPlayerJob(source)
    if not playerJob then return false end

    return playerJob.onduty or false
end

exports('SetPlayerJob', SetPlayerJob)
exports('SetPlayerGang', SetPlayerGang)
exports('SetPlayerJobDuty', SetPlayerJobDuty)
exports('IsPlayerInJob', IsPlayerInJob)
exports('IsPlayerJobGrade', IsPlayerJobGrade)
exports('IsPlayerInGang', IsPlayerInGang)
exports('IsPlayerOnDuty', IsPlayerOnDuty)