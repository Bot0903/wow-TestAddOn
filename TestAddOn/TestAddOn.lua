local timer = 0 local isActive = falselocal frame = CreateFrame("Frame")

local function StartTimer(seconds)
    timer = seconds
    isActive = trueendlocalfunction UpdateTimer(self, elapsed)if isActive then
        timer = timer - elapsed
        if timer <= 0 then
            isActive = false
            timer = 0
            StaticPopup_Show("FOOD_REMINDER_ALERT")
            StartTimer(300) -- Restart the timer for 5 minutes
        end end end local function OnChatCommand(msg)local seconds = tonumber(msg)
    if seconds then
        StartTimer(seconds)
        print("Timer set for " .. seconds .. " seconds.")
    else print("Usage: /foodreminder [seconds]")
    end end local function OnEvent(self, event, arg1)if event == "ADDON_LOADED"and arg1 == "FoodReminder"then
        SLASH_FOODREMINDER1 = "/foodreminder"
        SlashCmdList["FOODREMINDER"] = OnChatCommand
    end end

frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", OnEvent)
frame:SetScript("OnUpdate", UpdateTimer)

StaticPopupDialogs["FOOD_REMINDER_ALERT"] = {
    text = "Time to eat some food!",
    button1 = "OK",
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
}
