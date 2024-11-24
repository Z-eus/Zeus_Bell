Config = {}

Config.Debug = false -- Dont make true on Live Server

Config.BellLocation = {
    Valentine = {
        coords = vector3(-230.11424255371094, 797.501953125, 135.25149536132812),
        radius = 1000.0,
        SoundSet = "CHURCH_BELL_SOUNDS",
        SoundName = "VAL_SINGLE_TOLL",
        BellStartTime = 7, -- AM
        BellStopTime = 9,  -- AM
        BellThreshold = 5  -- Second
    },

    SaintDenis = {
        coords = vector3(2742.6802, -1264.7900, 58.6418),
        radius = 1000.0,
        SoundSet = "CHURCH_BELL_SOUNDS",
        SoundName = "SD_SINGLE_TOLL",
        BellStartTime = 7, -- AM
        BellStopTime = 9,  -- AM
        BellThreshold = 5  -- Second
    }

    -- You can add more --
}

-- local SoundSet(soundsetRef):    --FUS1_SOUNDS --CHURCH_BELL_SOUNDS --CHURCH_BELL_SOUNDS --GNG3_sounds --GNG2_sounds --BRT2_Sounds --RNATV2_Sounds
-- local SoundName(soundName):     --Alarm_Bell  --SD_SINGLE_TOLL     --VAL_SINGLE_TOLL    --alarm_bell  --alarm_bell  --BELL_ALARM  --Alarm