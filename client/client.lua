local isBellPlaying = {}

for location, _ in pairs(Config.BellLocation) do
    isBellPlaying[location] = false
end

function PlayBell(location)
    local bellData = Config.BellLocation[location]
    if not bellData then
		if Config.Debug then
		print("Invalid Location: " .. tostring(location))
		end
        return
    end

    local playerCoords = GetEntityCoords(PlayerPedId())
    if #(playerCoords - bellData.coords) <= bellData.radius then
        local counter = 0
        while not Citizen.InvokeNative(0xD9130842D7226045, bellData.SoundSet, 0) and counter < 300 do
            counter = counter + 1
            Wait(0)
        end

        if Citizen.InvokeNative(0xD9130842D7226045, bellData.SoundSet, 0) then
            local soundId = GetSoundId()
            Citizen.InvokeNative(0xDCF5BA95BBF0FABA, soundId, bellData.SoundName, bellData.coords.x, bellData.coords.y, bellData.coords.z, bellData.SoundSet, false, 0, true)
            isBellPlaying[location] = true
            Wait(Config.BellThreshold * 1000)
            Citizen.InvokeNative(0x531A78D6BF27014B, bellData.SoundSet)
            Citizen.InvokeNative(0x353FC880830B88FA, soundId)
            isBellPlaying[location] = false
        end
    end
end

CreateThread(function()
    while true do
        Wait(1000)
        local currentHour = GetClockHours()

        for location, bellData in pairs(Config.BellLocation) do
            if bellData.BellStartTime <= currentHour and currentHour < bellData.BellStopTime then
                if not isBellPlaying[location] then
                    PlayBell(location)
                end
            else
                if isBellPlaying[location] then
                    Citizen.InvokeNative(0x531A78D6BF27014B, bellData.SoundSet)
                    isBellPlaying[location] = false
                end
            end
        end
    end
end)