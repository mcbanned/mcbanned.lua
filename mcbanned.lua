-- LocalScript trong StarterPlayerScripts

local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Tạo một ScreenGui để chứa các thành phần của menu
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = playerGui

-- Tạo một Frame làm menu chính (kích thước 25x10)
local menuFrame = Instance.new("Frame")
menuFrame.Size = UDim2.new(0, 0, 0, 0)  -- Bắt đầu với kích thước 0 (ẩn menu)
menuFrame.Position = UDim2.new(0.5, -375, 0.5, -200)  -- Vị trí menu ở trung tâm màn hình
menuFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60) -- Màu nền menu (màu xám đậm)
menuFrame.Visible = false -- Menu ẩn cho đến khi nhập đúng số
menuFrame.Parent = screenGui

-- Tạo UICorner để làm bo tròn các góc của menu
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 20)  -- Bo góc menu với bán kính là 20
corner.Parent = menuFrame

-- Tạo một Gradient màu nền cho menu để tạo hiệu ứng hiện đại
local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(45, 45, 45)),  -- Màu tối ở trên
    ColorSequenceKeypoint.new(1, Color3.fromRGB(25, 25, 25))   -- Màu tối nhẹ ở dưới
})
gradient.Parent = menuFrame

-- Tạo logo con vịt hình vuông
local duckLogo = Instance.new("TextButton")
duckLogo.Size = UDim2.new(0, 60, 0, 60)  -- Kích thước logo con vịt
duckLogo.Position = UDim2.new(0.5, -30, 0.5, -250)  -- Vị trí logo con vịt
duckLogo.BackgroundColor3 = Color3.fromRGB(255, 255, 0) -- Màu nền của logo (vàng)
duckLogo.Text = "🦆"  -- Đây là emoji con vịt
duckLogo.TextSize = 30
duckLogo.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Màu chữ (đen)
duckLogo.Parent = screenGui

-- Tạo UICorner để làm bo tròn các góc của logo
local logoCorner = Instance.new("UICorner")
logoCorner.CornerRadius = UDim.new(0, 30)  -- Bo góc logo với bán kính là 30 (tạo góc tròn)
logoCorner.Parent = duckLogo

-- Tạo TextBox để người dùng nhập số
local inputBox = Instance.new("TextBox")
inputBox.Size = UDim2.new(0, 200, 0, 50)  -- Kích thước TextBox
inputBox.Position = UDim2.new(0.5, -200, 0.5, 50)  -- Vị trí TextBox
inputBox.PlaceholderText = "Enter Code"  -- Hiển thị hướng dẫn nhập
inputBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  -- Nền trắng
inputBox.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Màu chữ đen
inputBox.TextSize = 24  -- Kích thước chữ
inputBox.Parent = screenGui

-- Tạo nút "ENTER" bên cạnh TextBox
local enterButton = Instance.new("TextButton")
enterButton.Size = UDim2.new(0, 100, 0, 50)  -- Kích thước nút ENTER
enterButton.Position = UDim2.new(0.5, 20, 0.5, 50)  -- Vị trí nút ENTER
enterButton.Text = "ENTER"  -- Chữ trên nút ENTER
enterButton.TextSize = 24
enterButton.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Màu chữ đen
enterButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)  -- Màu nền xanh lá
enterButton.Parent = screenGui

-- Thêm một TextLabel hướng dẫn người dùng nhập mã
local instructionLabel = Instance.new("TextLabel")
instructionLabel.Size = UDim2.new(0, 300, 0, 50)
instructionLabel.Position = UDim2.new(0.5, -150, 0.5, -100)
instructionLabel.Text = "Enter code: E9125F"
instructionLabel.TextSize = 24
instructionLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- Màu chữ trắng
instructionLabel.TextAlign = Enum.TextAlign.Center
instructionLabel.BackgroundTransparency = 1  -- Không có nền
instructionLabel.Parent = screenGui

-- Tạo tween cho menu để xuất hiện và ẩn đi một cách mượt mà
local tweenService = game:GetService("TweenService")

local tweenInfo = TweenInfo.new(
    0.5,  -- Thời gian tween (0.5 giây)
    Enum.EasingStyle.Quad,  -- Kiểu easing (mượt mà)
    Enum.EasingDirection.Out,  -- Hướng easing
    0,  -- Lặp lại bao nhiêu lần
    false,  -- Lặp lại lần ngược lại
    0  -- Độ trễ
)

-- Tween để menu mở ra từ giữa màn hình
local tweenIn = tweenService:Create(menuFrame, tweenInfo, {Size = UDim2.new(0, 750, 0, 400), Visible = true, Position = UDim2.new(0.5, -375, 0.5, -200)})
-- Tween để menu thu lại vào giữa màn hình và ẩn đi
local tweenOut = tweenService:Create(menuFrame, tweenInfo, {Size = UDim2.new(0, 0, 0, 0), Visible = false, Position = UDim2.new(0.5, -375, 0.5, -200)})

-- Kiểm tra mã khi người dùng nhấn ENTER hoặc nhấn Enter trong TextBox
local function checkCode()
    -- So sánh mã người dùng nhập vào với mã đúng
    if inputBox.Text == "E9125F" then
        -- Nếu mã đúng, mở menu
        tweenIn:Play()
    else
        -- Nếu mã sai, hiển thị thông báo sai
        local errorMessage = Instance.new("TextLabel")
        errorMessage.Size = UDim2.new(0, 300, 0, 50)
        errorMessage.Position = UDim2.new(0.5, -150, 0.5, -150)
        errorMessage.Text = "Invalid Code"
        errorMessage.TextSize = 24
        errorMessage.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Màu chữ đỏ
        errorMessage.TextAlign = Enum.TextAlign.Center
        errorMessage.BackgroundTransparency = 1  -- Không có nền
        errorMessage.Parent = screenGui
        -- Thông báo sẽ biến mất sau 3 giây
        wait(3)
        errorMessage:Destroy()
    end
end

-- Khi nhấn vào nút "ENTER", kiểm tra mã
enterButton.MouseButton1Click:Connect(function()
    checkCode()  -- Gọi hàm kiểm tra mã khi nhấn ENTER
end)

-- Kiểm tra mã khi người dùng nhấn Enter trong TextBox
inputBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        checkCode()  -- Gọi hàm kiểm tra mã khi nhấn Enter
    end
end)

-- Khi nhấn vào logo con vịt, menu sẽ mở hoặc đóng
duckLogo.MouseButton1Click:Connect(function()
    if menuFrame.Size == UDim2.new(0, 0, 0, 0) then
        -- Nếu menu đang đóng, mở nó lên
        tweenIn:Play()
    else
        -- Nếu menu đang mở, thu nhỏ và ẩn nó đi
        tweenOut:Play()
    end
end)
