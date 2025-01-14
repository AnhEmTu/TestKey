-- Hàm thay đổi tốc độ nhân vật
function thayDoiTocDo(nguoiChoi, tocDoMoi)
    -- Kiểm tra nhân vật hợp lệ
    if nguoiChoi and nguoiChoi.Character and nguoiChoi.Character:FindFirstChild("Humanoid") then
        nguoiChoi.Character.Humanoid.WalkSpeed = tocDoMoi
        print("Tốc độ đã được thay đổi thành: " .. tocDoMoi)
    else
        print("Không tìm thấy nhân vật hoặc Humanoid!")
    end
end

-- Gọi hàm
local nguoiChoi = game.Players.LocalPlayer
thayDoiTocDo(nguoiChoi, 50) -- Tăng tốc độ lên 50