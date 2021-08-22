local Player = game.Player.LocalPlayer

while wait() do
  script.Parent.TextLabel.Text = "Cash: "..Player.leaderstats.Cash.Value
end
