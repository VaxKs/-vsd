local NotificationLib = {}

local runService = game:GetService("RunService")
local inputService = game:GetService("UserInputService")
local httpService = game:GetService("HttpService")
local tweenService = game:GetService("TweenService")
local guiService = game:GetService("GuiService")
local textService = game:GetService("TextService")
local players = game:GetService("Players")
local translations = {}
local baseDirectory = ("exiled/")
local exiledAssetTable = {
    ["exiled/assets/AddItem.png"] = "rbxassetid://13350763121",
    ["exiled/assets/AddRemoveIcon1.png"] = "rbxassetid://13350764147",
    ["exiled/assets/ArrowIndicator.png"] = "rbxassetid://13350766521",
    ["exiled/assets/BackIcon.png"] = "rbxassetid://13350767223",
    ["exiled/assets/BindBackground.png"] = "rbxassetid://13350767577",
    ["exiled/assets/BlatantIcon.png"] = "rbxassetid://13350767943",
    ["exiled/assets/CircleListBlacklist.png"] = "rbxassetid://13350768647",
    ["exiled/assets/CircleListWhitelist.png"] = "rbxassetid://13350769066",
    ["exiled/assets/ColorSlider1.png"] = "rbxassetid://13350769439",
    ["exiled/assets/ColorSlider2.png"] = "rbxassetid://13350769842",
    ["exiled/assets/CombatIcon.png"] = "rbxassetid://13350770192",
    ["exiled/assets/DownArrow.png"] = "rbxassetid://13350770749",
    ["exiled/assets/DiscordIcon.png"] = "rbxassetid://13546311177",
    ["exiled/assets/ExitIcon1.png"] = "rbxassetid://13350771140",
    ["exiled/assets/FriendsIcon.png"] = "rbxassetid://13350771464",
    ["exiled/assets/HoverArrow.png"] = "rbxassetid://13350772201",
    ["exiled/assets/HoverArrow2.png"] = "rbxassetid://13350772588",
    ["exiled/assets/HoverArrow3.png"] = "rbxassetid://13350773014",
    ["exiled/assets/HoverArrow4.png"] = "rbxassetid://13350773643",
    ["exiled/assets/InfoNotification.png"] = "rbxassetid://13350774006",
    ["exiled/assets/KeybindIcon.png"] = "rbxassetid://13350774323",
    ["exiled/assets/LegitModeIcon.png"] = "rbxassetid://13436400428",
    ["exiled/assets/MoreButton1.png"] = "rbxassetid://13350775005",
    ["exiled/assets/MoreButton2.png"] = "rbxassetid://13350775731",
    ["exiled/assets/MoreButton3.png"] = "rbxassetid://13350776241",
    ["exiled/assets/NotificationBackground.png"] = "rbxassetid://13350776706",
    ["exiled/assets/NotificationBar.png"] = "rbxassetid://13350777235",
    ["exiled/assets/OnlineProfilesButton.png"] = "rbxassetid://13350777717",
    ["exiled/assets/PencilIcon.png"] = "rbxassetid://13350778187",
    ["exiled/assets/PinButton.png"] = "rbxassetid://13350778654",
    ["exiled/assets/ProfilesIcon.png"] = "rbxassetid://13350779149",
    ["exiled/assets/RadarIcon1.png"] = "rbxassetid://13350779545",
    ["exiled/assets/RadarIcon2.png"] = "rbxassetid://13350779992",
    ["exiled/assets/RainbowIcon1.png"] = "rbxassetid://13350780571",
    ["exiled/assets/RainbowIcon2.png"] = "rbxassetid://13350780993",
    ["exiled/assets/RightArrow.png"] = "rbxassetid://13350781908",
    ["exiled/assets/SearchBarIcon.png"] = "rbxassetid://13350782420",
    ["exiled/assets/SettingsWheel1.png"] = "rbxassetid://13350782848",
    ["exiled/assets/SettingsWheel2.png"] = "rbxassetid://13350783258",
    ["exiled/assets/SliderArrow1.png"] = "rbxassetid://13350783794",
    ["exiled/assets/SliderArrowSeperator.png"] = "rbxassetid://13350784477",
    ["exiled/assets/SliderButton1.png"] = "rbxassetid://13350785680",
    ["exiled/assets/TargetIcon.png"] = "rbxassetid://13350786128",
    ["exiled/assets/TargetIcon1.png"] = "rbxassetid://13350786776",
    ["exiled/assets/TargetIcon2.png"] = "rbxassetid://13350787228",
    ["exiled/assets/TargetIcon3.png"] = "rbxassetid://13350787729",
    ["exiled/assets/TargetIcon4.png"] = "rbxassetid://13350788379",
    ["exiled/assets/TargetInfoIcon1.png"] = "rbxassetid://13350788860",
    ["exiled/assets/TargetInfoIcon2.png"] = "rbxassetid://13350789239",
    ["exiled/assets/TextBoxBKG.png"] = "rbxassetid://13350789732",
    ["exiled/assets/TextBoxBKG2.png"] = "rbxassetid://13350790229",
    ["exiled/assets/TextGUIIcon1.png"] = "rbxassetid://13350790634",
    ["exiled/assets/TextGUIIcon2.png"] = "rbxassetid://13350791175",
    ["exiled/assets/TextGUIIcon3.png"] = "rbxassetid://13350791758",
    ["exiled/assets/TextGUIIcon4.png"] = "rbxassetid://13350792279",
    ["exiled/assets/ToggleArrow.png"] = "rbxassetid://13350792786",
    ["exiled/assets/UpArrow.png"] = "rbxassetid://13350793386",
    ["exiled/assets/UtilityIcon.png"] = "rbxassetid://13350793918",
    ["exiled/assets/WarningNotification.png"] = "rbxassetid://13350794868",
    ["exiled/assets/WindowBlur.png"] = "rbxassetid://13350795660",
    ["exiled/assets/WorldIcon.png"] = "rbxassetid://13350796199",
    ["exiled/assets/ExiledIcon.png"] = "rbxassetid://13350808582",
    ["exiled/assets/RenderIcon.png"] = "rbxassetid://13350832775",
    ["exiled/assets/ExiledLogo1.png"] = "rbxassetid://13350860863",
    ["exiled/assets/ExiledLogo3.png"] = "rbxassetid://13350872035",
    ["exiled/assets/ExiledLogo2.png"] = "rbxassetid://13350876307",
    ["exiled/assets/ExiledLogo4.png"] = "rbxassetid://13350877564"
}

for i,v in pairs({baseDirectory:gsub("/", ""), "exiled", "exiled/assets"}) do
    if not isfolder(v) then makefolder(v) end
end



local function displayErrorPopup(text, func)
    local oldidentity = getidentity()
    setidentity(8)
    local ErrorPrompt = getrenv().require(game:GetService("CoreGui").RobloxGui.Modules.ErrorPrompt)
    local prompt = ErrorPrompt.new("Default")
    prompt._hideErrorCode = true
    local gui = Instance.new("ScreenGui", game:GetService("CoreGui"))
    prompt:setErrorTitle("Vape")
    prompt:updateButtons({{
        Text = "OK",
        Callback = function() 
            prompt:_close() 
            if func then func() end
        end,
        Primary = true
    }}, 'Default')
    prompt:setParent(gui)
    prompt:_open(text)
    setidentity(oldidentity)
end



local function randomString()
    local randomlength = math.random(10,100)
    local array = {}
    for i = 1, randomlength do
        array[i] = string.char(math.random(32, 126))
    end
    return table.concat(array)
end


local function removeTags(str)
    str = str:gsub("<br%s*/>", "\n")
    return (str:gsub("<[^<>]->", ""))
end


if inputService:GetPlatform() ~= Enum.Platform.Windows then
    getgenv().getsynasset = nil
    getgenv().getcustomasset = nil
    getsynasset = nil
    getcustomasset = nil
end
local getcustomasset = getsynasset or getcustomasset or function(location) return vapeAssetTable[location] or "" end
local customassetcheck = (getsynasset or getcustomasset) and true
local queueonteleport = syn and syn.queue_on_teleport or queue_on_teleport or function() end
local delfile = delfile or function(file) writefile(file, "") end




local function vapeGithubRequest(scripturl)
    if not isfile("exiled/"..scripturl) then
        local suc, res
        task.delay(15, function()
            if not res and not errorPopupShown then 
                errorPopupShown = true
                displayErrorPopup("The connection to github is taking a while, Please be patient.")
            end
        end)
        suc, res = pcall(function() return game:HttpGet("https://raw.githubusercontent.com/VaxKs/No/"..readfile("exiled/JKL.txt").."/"..scripturl, true) end)
        if not suc or res == "404: Not Found" then
            displayErrorPopup("Failed to connect to github : exiled/"..scripturl.." : "..res)
            error(res)
        end
        if scripturl:find(".lua") then res = "--This watermark is used to delete the file if its cached, remove it to make the file persist after commits.\n"..res end
        writefile("exiled/"..scripturl, res)
    end
    return readfile("exiled/"..scripturl)
end




local function downloadAsset(path)
    if customassetcheck then
        if not isfile(path) then
            task.spawn(function()
                local textlabel = Instance.new("TextLabel")
                textlabel.Size = UDim2.new(1, 0, 0, 36)
                textlabel.Text = "Downloading "..path
                textlabel.BackgroundTransparency = 1
                textlabel.TextStrokeTransparency = 0
                textlabel.TextSize = 30
                textlabel.Font = Enum.Font.SourceSans
                textlabel.TextColor3 = Color3.new(1, 1, 1)
                textlabel.Position = UDim2.new(0, 0, 0, -36)
                textlabel.Parent = GuiLibrary.MainGui
                repeat task.wait() until isfile(path)
                textlabel:Destroy()
            end)
            local suc, req = pcall(function() return vapeGithubRequest(path:gsub("exiled/assets", "assets")) end)
            if suc and req then
                writefile(path, req)
            else
                return ""
            end
        end
    end
    return getcustomasset(path)
end


local gui = Instance.new("ScreenGui")
gui.Name = randomString()
gui.DisplayOrder = 999
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
gui.OnTopOfCoreBlur = true
gui.ResetOnSpawn = false
gui.Parent = players.LocalPlayer:WaitForChild("PlayerGui")


local notificationwindow = Instance.new("Frame")
notificationwindow.BackgroundTransparency = 1
notificationwindow.Active = false
notificationwindow.Size = UDim2.new(1, 0, 1, 0)
notificationwindow.Parent = gui



local commit = "main"
for i,v in pairs(game:HttpGet("https://github.com/VaxKs/No"):split("\n")) do 
        if v:find("commit") and v:find("fragment") then 
            local str = v:split("/")[5]
            commit = str:sub(0, str:find('"') - 1)
            break
        end
    end
    if commit then
    if isfolder("exiled") then 
        makefolder("exiled")
        writefile("exiled/JKL.txt", commit)
	end
end


local function bettertween2(obj, newpos, dir, style, tim, override)
    task.spawn(function()
        local frame = Instance.new("Frame")
        frame.Visible = false
        frame.Position = obj.Position
        frame.Parent = gui
        frame:GetPropertyChangedSignal("Position"):Connect(function()
            obj.Position = UDim2.new(frame.Position.X.Scale, frame.Position.X.Offset, obj.Position.Y.Scale, obj.Position.Y.Offset)
        end)
        pcall(function()
            frame:TweenPosition(newpos, dir, style, tim, override)
        end)
        frame.Parent = nil
        task.wait(tim)
        frame:Remove()
    end)
end


notificationwindow.ChildRemoved:Connect(function()
    for i,v in pairs(notificationwindow:GetChildren()) do
        bettertween(v, UDim2.new(1, v.Position.X.Offset, 1, -(150 + 80 * (i - 1))), Enum.EasingDirection.In, Enum.EasingStyle.Sine, 0.15, true)
    end
end)


function NotificationLib.Notify(title, message, duration, icon)
    duration = duration or 5
    icon = icon or "exiled/assets/InfoNotification.png"
    
    local size = math.max(textService:GetTextSize(message, 14, Enum.Font.Gotham, Vector2.new(99999, 99999)).X + 60, 266)
    local offset = #notificationwindow:GetChildren()

    -- Create the notification frame
    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, size, 0, 75)
    frame.Position = UDim2.new(1, 0, 1, -(150 + 80 * offset))
    frame.BackgroundColor3 = Color3.new(0, 0, 0)
    frame.BackgroundTransparency = 0.5
    frame.BorderSizePixel = 0
    frame.Parent = notificationwindow

    -- Corner rounding
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 6)
    uiCorner.Parent = frame

    -- Icon
    local iconLabel = Instance.new("ImageLabel")
    iconLabel.Image = downloadAsset(icon)
    iconLabel.BackgroundTransparency = 1
    iconLabel.Position = UDim2.new(0, 10, 0, 10)
    iconLabel.Size = UDim2.new(0, iconSize, 0, iconSize)
    iconLabel.Parent = frame

    -- Title Label
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Font = Enum.Font.SourceSansBold
    titleLabel.TextSize = 18
    titleLabel.Text = title
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Position = UDim2.new(0, iconSize + 20, 0, 10)
    titleLabel.Size = UDim2.new(1, -iconSize - 30, 0, 20)
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left
    titleLabel.Parent = frame

    -- Message Label
    local messageLabel = Instance.new("TextLabel")
    messageLabel.Font = Enum.Font.SourceSans
    messageLabel.TextSize = 14
    messageLabel.Text = message
    messageLabel.TextColor3 = Color3.new(0.8, 0.8, 0.8)
    messageLabel.BackgroundTransparency = 1
    messageLabel.Position = UDim2.new(0, iconSize + 20, 0, 35)
    messageLabel.Size = UDim2.new(1, -iconSize - 30, 0, 30)
    messageLabel.TextXAlignment = Enum.TextXAlignment.Left
    messageLabel.TextYAlignment = Enum.TextYAlignment.Top
    messageLabel.TextWrapped = true
    messageLabel.Parent = frame

    -- Animation for showing the notification
    local tweenInfoIn = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.Out)
    local tweenIn = tweenService:Create(frame, tweenInfoIn, {Position = UDim2.new(1, -size - 20, 1, -(150 + 80 * offset))})
    tweenIn:Play()

    -- Remove notification after duration
    task.delay(duration, function()
        local tweenInfoOut = TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In)
        local tweenOut = tweenService:Create(frame, tweenInfoOut, {Position = UDim2.new(1, 20, 1, frame.Position.Y.Offset)})
        tweenOut:Play()
        tweenOut.Completed:Wait()
        frame:Destroy()
    end)
end

return NotificationLib

