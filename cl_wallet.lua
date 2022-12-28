local ply = LocalPlayer()

surface.CreateFont( "youhave", {
	font = "Verdana", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 25,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "money", {
	font = "Arial", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 40,
	weight = 500,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )




net.Receive("postapo_wallet_open", function(len)
	money = LocalPlayer():getDarkRPVar("money")
	local wallet = vgui.Create("DFrame")
	wallet:SetSize(250, 250)
	wallet:SetTitle("                             Porte-feuilles")
	wallet:SetVisible(true)
	wallet:SetPos(ScrW()/2 - 125, ScrH()/2 - 125)
	wallet:SetDraggable( false )
	wallet:MakePopup(true)
	wallet:ShowCloseButton( false )
	wallet.Paint = function(s, w, h)
		draw.RoundedBox(10,0,0,w,h, Color(22,22,22))
		draw.SimpleText(money .. "€", "money", 125, 125, Color( 255, 255, 255, 255 ), TEXT_ALIGN_CENTER)
	end


	local closeButton = vgui.Create("Button", wallet)
	closeButton:SetPos(62.5,220)
	closeButton:SetSize(125,25)
	closeButton:SetText("Fermer")
	closeButton.DoClick = function()			
		wallet:Close()			
	end

	local amount = vgui.Create("DNumberWang", wallet)
	amount:SetSize(125,25)
	amount:SetPos(62.5,25)
	amount:SetMax(money)

	local dropButton = vgui.Create("Button", wallet)
	dropButton:SetSize(125,25)
	dropButton:SetPos(62.5,55)
	dropButton:SetText("Lâcher l'argent")
	dropButton.DoClick = function()	
		local a = tostring(amount:GetValue())
		RunConsoleCommand("darkrp", "dropmoney", a)		
		wallet:Close()		
	end

	local youhave_text = vgui.Create("DLabel", wallet)
	youhave_text:SetPos(30,90)
	youhave_text:SetSize(350,25)
	youhave_text:SetText("Tu as actuellement")
	youhave_text:SetFont("youhave")

	

end)