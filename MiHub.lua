-- ==========================================
-- MI HUB PERSONALIZADO (Sin librerías)
-- ==========================================

-- Servicios
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

-- URL de tu index.json (con anti-caché para móvil)
local INDEX_URL = "https://raw.githubusercontent.com/dh1468506-sketch/Mi-hub-Scripts/main/index.json?t=" .. os.time()

-- Colores del tema
local COLOR_FONDO = Color3.fromRGB(20, 20, 25)
local COLOR_PANEL = Color3.fromRGB(30, 30, 38)
local COLOR_ACENTO = Color3.fromRGB(138, 43, 226)
local COLOR_TEXTO = Color3.fromRGB(255, 255, 255)
local COLOR_TEXTO_GRIS = Color3.fromRGB(170, 170, 180)
local COLOR_HOVER = Color3.fromRGB(45, 45, 55)

-- ScreenGui principal
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MiHubGui"
ScreenGui.ResetOnSpawn = false
ScreenGui.DisplayOrder = 999999
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling -- <- LA LÍNEA MÁGICA
ScreenGui.Parent = PlayerGui

-- Botón flotante
local BotonFlotante = Instance.new("TextButton")
BotonFlotante.Size = UDim2.new(0, 55, 0, 55)
BotonFlotante.Position = UDim2.new(1, -75, 0, 100)
BotonFlotante.BackgroundColor3 = COLOR_ACENTO
BotonFlotante.BorderSizePixel = 0
BotonFlotante.Text = "M"
BotonFlotante.TextColor3 = COLOR_TEXTO
BotonFlotante.TextScaled = true
BotonFlotante.Font = Enum.Font.GothamBold
BotonFlotante.ZIndex = 100
BotonFlotante.Parent = ScreenGui

local UICornerBoton = Instance.new("UICorner")
UICornerBoton.CornerRadius = UDim.new(1, 0)
UICornerBoton.Parent = BotonFlotante

local UIStrokeBoton = Instance.new("UIStroke")
UIStrokeBoton.Color = Color3.fromRGB(255, 255, 255)
UIStrokeBoton.Thickness = 2
UIStrokeBoton.Parent = BotonFlotante

-- Ventana principal
local Ventana = Instance.new("Frame")
Ventana.Name = "VentanaPrincipal"
Ventana.Size = UDim2.new(0, 520, 0, 380)
Ventana.Position = UDim2.new(0.5, -260, 0.5, -190)
Ventana.BackgroundColor3 = COLOR_FONDO
Ventana.BorderSizePixel = 0
Ventana.Visible = false
Ventana.Active = true
Ventana.Draggable = true
Ventana.ZIndex = 1 -- Cambiado de 50 a 1
Ventana.Parent = ScreenGui

local UICornerVentana = Instance.new("UICorner")
UICornerVentana.CornerRadius = UDim.new(0, 12)
UICornerVentana.Parent = Ventana

local UIStrokeVentana = Instance.new("UIStroke")
UIStrokeVentana.Color = COLOR_ACENTO
UIStrokeVentana.Thickness = 2
UIStrokeVentana.Parent = Ventana

-- Barra superior
local BarraSuperior = Instance.new("Frame")
BarraSuperior.Size = UDim2.new(1, 0, 0, 45)
BarraSuperior.BackgroundColor3 = COLOR_PANEL
BarraSuperior.BorderSizePixel = 0
BarraSuperior.ZIndex = 2 -- Mayor que el fondo
BarraSuperior.Parent = Ventana

local UICornerBarra = Instance.new("UICorner")
UICornerBarra.CornerRadius = UDim.new(0, 12)
UICornerBarra.Parent = BarraSuperior

local Titulo = Instance.new("TextLabel")
Titulo.Size = UDim2.new(0, 300, 1, 0)
Titulo.Position = UDim2.new(0, 20, 0, -5)
Titulo.BackgroundTransparency = 1
Titulo.Text = "MI HUB DE SCRIPTS"
Titulo.TextColor3 = COLOR_TEXTO
Titulo.TextSize = 18
Titulo.Font = Enum.Font.GothamBold
Titulo.TextXAlignment = Enum.TextXAlignment.Left
Titulo.ZIndex = 3
Titulo.Parent = BarraSuperior

local BotonCerrar = Instance.new("TextButton")
BotonCerrar.Size = UDim2.new(0, 30, 0, 30)
BotonCerrar.Position = UDim2.new(1, -40, 0, 8)
BotonCerrar.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
BotonCerrar.BorderSizePixel = 0
BotonCerrar.Text = "X"
BotonCerrar.TextColor3 = COLOR_TEXTO
BotonCerrar.TextSize = 14
BotonCerrar.Font = Enum.Font.GothamBold
BotonCerrar.ZIndex = 3
BotonCerrar.Parent = BarraSuperior

local UICornerCerrar = Instance.new("UICorner")
UICornerCerrar.CornerRadius = UDim.new(0, 8)
UICornerCerrar.Parent = BotonCerrar

-- Barra de búsqueda
local BarraBusqueda = Instance.new("Frame")
BarraBusqueda.Size = UDim2.new(1, -40, 0, 35)
BarraBusqueda.Position = UDim2.new(0, 20, 0, 55)
BarraBusqueda.BackgroundColor3 = COLOR_PANEL
BarraBusqueda.BorderSizePixel = 0
BarraBusqueda.ZIndex = 2
BarraBusqueda.Parent = Ventana

local UICornerBusqueda = Instance.new("UICorner")
UICornerBusqueda.CornerRadius = UDim.new(0, 8)
UICornerBusqueda.Parent = BarraBusqueda

local CajaBusqueda = Instance.new("TextBox")
CajaBusqueda.Size = UDim2.new(1, -20, 1, 0)
CajaBusqueda.Position = UDim2.new(0, 10, 0, 0)
CajaBusqueda.BackgroundTransparency = 1
CajaBusqueda.Text = ""
CajaBusqueda.PlaceholderText = "🔍 Buscar script..."
CajaBusqueda.PlaceholderColor3 = COLOR_TEXTO_GRIS
CajaBusqueda.TextColor3 = COLOR_TEXTO
CajaBusqueda.TextSize = 14
CajaBusqueda.Font = Enum.Font.Gotham
CajaBusqueda.TextXAlignment = Enum.TextXAlignment.Left
CajaBusqueda.ClearTextOnFocus = false
CajaBusqueda.ZIndex = 3
CajaBusqueda.Parent = BarraBusqueda

-- Barra lateral
local BarraLateral = Instance.new("ScrollingFrame")
BarraLateral.Size = UDim2.new(0, 150, 1, -150)
BarraLateral.Position = UDim2.new(0, 20, 0, 100)
BarraLateral.BackgroundColor3 = COLOR_PANEL
BarraLateral.BorderSizePixel = 0
BarraLateral.ScrollBarThickness = 4
BarraLateral.ScrollBarImageColor3 = COLOR_ACENTO
BarraLateral.CanvasSize = UDim2.new(0, 0, 0, 0)
BarraLateral.ZIndex = 2
BarraLateral.Parent = Ventana

local UICornerLateral = Instance.new("UICorner")
UICornerLateral.CornerRadius = UDim.new(0, 8)
UICornerLateral.Parent = BarraLateral

local UIListLateral = Instance.new("UIListLayout")
UIListLateral.Padding = UDim.new(0, 5)
UIListLateral.SortOrder = Enum.SortOrder.LayoutOrder
UIListLateral.Parent = BarraLateral

local UIPaddingLateral = Instance.new("UIPadding")
UIPaddingLateral.PaddingTop = UDim.new(0, 8)
UIPaddingLateral.PaddingLeft = UDim.new(0, 8)
UIPaddingLateral.PaddingRight = UDim.new(0, 8)
UIPaddingLateral.Parent = BarraLateral

-- Área de scripts
local AreaScripts = Instance.new("ScrollingFrame")
AreaScripts.Size = UDim2.new(1, -190, 1, -150)
AreaScripts.Position = UDim2.new(0, 180, 0, 100)
AreaScripts.BackgroundColor3 = COLOR_PANEL
AreaScripts.BorderSizePixel = 0
AreaScripts.ScrollBarThickness = 4
AreaScripts.ScrollBarImageColor3 = COLOR_ACENTO
AreaScripts.CanvasSize = UDim2.new(0, 0, 0, 0)
AreaScripts.ZIndex = 2
AreaScripts.Parent = Ventana

local UICornerArea = Instance.new("UICorner")
UICornerArea.CornerRadius = UDim.new(0, 8)
UICornerArea.Parent = AreaScripts

local UIListArea = Instance.new("UIListLayout")
UIListArea.Padding = UDim.new(0, 8)
UIListArea.SortOrder = Enum.SortOrder.LayoutOrder
UIListArea.Parent = AreaScripts

local UIPaddingArea = Instance.new("UIPadding")
UIPaddingArea.PaddingTop = UDim.new(0, 10)
UIPaddingArea.PaddingLeft = UDim.new(0, 10)
UIPaddingArea.PaddingRight = UDim.new(0, 10)
UIPaddingArea.Parent = AreaScripts

-- Función de notificaciones
local function Notificar(titulo, mensaje, color)
    local Notif = Instance.new("Frame")
    Notif.Size = UDim2.new(0, 280, 0, 70)
    Notif.Position = UDim2.new(1, -300, 0, 100)
    Notif.BackgroundColor3 = COLOR_PANEL
    Notif.BorderSizePixel = 0
    Notif.ZIndex = 200
    Notif.Parent = ScreenGui
    
    local UICornerNotif = Instance.new("UICorner")
    UICornerNotif.CornerRadius = UDim.new(0, 8)
    UICornerNotif.Parent = Notif
    
    local Barra = Instance.new("Frame")
    Barra.Size = UDim2.new(0, 5, 1, 0)
    Barra.BackgroundColor3 = color or COLOR_ACENTO
    Barra.BorderSizePixel = 0
    Barra.Parent = Notif
    
    local UICornerBarraNotif = Instance.new("UICorner")
    UICornerBarraNotif.CornerRadius = UDim.new(0, 8)
    UICornerBarraNotif.Parent = Barra
    
    local TituloNotif = Instance.new("TextLabel")
    TituloNotif.Size = UDim2.new(1, -20, 0, 25)
    TituloNotif.Position = UDim2.new(0, 15, 0, 5)
    TituloNotif.BackgroundTransparency = 1
    TituloNotif.Text = titulo
    TituloNotif.TextColor3 = COLOR_TEXTO
    TituloNotif.TextSize = 14
    TituloNotif.Font = Enum.Font.GothamBold
    TituloNotif.TextXAlignment = Enum.TextXAlignment.Left
    TituloNotif.ZIndex = 201
    TituloNotif.Parent = Notif
    
    local MensajeNotif = Instance.new("TextLabel")
    MensajeNotif.Size = UDim2.new(1, -20, 0, 30)
    MensajeNotif.Position = UDim2.new(0, 15, 0, 30)
    MensajeNotif.BackgroundTransparency = 1
    MensajeNotif.Text = mensaje
    MensajeNotif.TextColor3 = COLOR_TEXTO_GRIS
    MensajeNotif.TextSize = 12
    MensajeNotif.Font = Enum.Font.Gotham
    MensajeNotif.TextXAlignment = Enum.TextXAlignment.Left
    MensajeNotif.TextWrapped = true
    MensajeNotif.ZIndex = 201
    MensajeNotif.Parent = Notif
    
    Notif.Position = UDim2.new(1, 100, 0, 100)
    TweenService:Create(Notif, TweenInfo.new(0.3, Enum.EasingStyle.Quad), {Position = UDim2.new(1, -300, 0, 100)}):Play()
    
    task.delay(4, function()
        TweenService:Create(Notif, TweenInfo.new(0.3), {Position = UDim2.new(1, 100, 0, 100)}):Play()
        task.wait(0.3)
        Notif:Destroy()
    end)
end

-- Limpiar área de scripts
local function LimpiarAreaScripts()
    for _, hijo in ipairs(AreaScripts:GetChildren()) do
        if hijo:IsA("TextButton") then
            hijo:Destroy()
        end
    end
    AreaScripts.CanvasSize = UDim2.new(0, 0, 0, 0)
end

-- Crear botón de script
local function CrearBotonScript(info, layoutOrder)
    local Boton = Instance.new("TextButton")
    Boton.Size = UDim2.new(1, -20, 0, 50)
    Boton.BackgroundColor3 = COLOR_PANEL
    Boton.BorderSizePixel = 0
    Boton.Text = ""
    Boton.LayoutOrder = layoutOrder
    Boton.ZIndex = 3
    Boton.Parent = AreaScripts
    
    local UICornerB = Instance.new("UICorner")
    UICornerB.CornerRadius = UDim.new(0, 8)
    UICornerB.Parent = Boton
    
    local NombreScript = Instance.new("TextLabel")
    NombreScript.Size = UDim2.new(1, -20, 0, 25)
    NombreScript.Position = UDim2.new(0, 15, 0, 5)
    NombreScript.BackgroundTransparency = 1
    NombreScript.Text = info.nombre
    NombreScript.TextColor3 = COLOR_TEXTO
    NombreScript.TextSize = 15
    NombreScript.Font = Enum.Font.GothamBold
    NombreScript.TextXAlignment = Enum.TextXAlignment.Left
    NombreScript.ZIndex = 4
    NombreScript.Parent = Boton
    
    local JuegoScript = Instance.new("TextLabel")
    JuegoScript.Size = UDim2.new(1, -20, 0, 15)
    JuegoScript.Position = UDim2.new(0, 15, 0, 28)
    JuegoScript.BackgroundTransparency = 1
    JuegoScript.Text = info.juego or "General"
    JuegoScript.TextColor3 = COLOR_TEXTO_GRIS
    JuegoScript.TextSize = 11
    JuegoScript.Font = Enum.Font.Gotham
    JuegoScript.TextXAlignment = Enum.TextXAlignment.Left
    JuegoScript.ZIndex = 4
    JuegoScript.Parent = Boton
    
    Boton.MouseEnter:Connect(function()
        TweenService:Create(Boton, TweenInfo.new(0.2), {BackgroundColor3 = COLOR_HOVER}):Play()
    end)
    Boton.MouseLeave:Connect(function()
        TweenService:Create(Boton, TweenInfo.new(0.2), {BackgroundColor3 = COLOR_PANEL}):Play()
    end)
    
    Boton.MouseButton1Click:Connect(function()
        Notificar("Cargando...", info.nombre, COLOR_ACENTO)
        local ok, err = pcall(function()
            loadstring(game:HttpGet(info.url))()
        end)
        if ok then
            Notificar("✅ Éxito", info.nombre .. " ejecutado.", Color3.fromRGB(50, 200, 50))
        else
            Notificar("❌ Error", tostring(err), Color3.fromRGB(200, 50, 50))
        end
    end)
end

-- Crear botón de juego
local function CrearBotonJuego(nombreJuego, listaScripts, layoutOrder)
    local Boton = Instance.new("TextButton")
    Boton.Size = UDim2.new(1, -16, 0, 35)
    Boton.BackgroundColor3 = COLOR_FONDO
    Boton.BorderSizePixel = 0
    Boton.Text = nombreJuego
    Boton.TextColor3 = COLOR_TEXTO
    Boton.TextSize = 13
    Boton.Font = Enum.Font.Gotham
    Boton.LayoutOrder = layoutOrder
    Boton.ZIndex = 3
    Boton.Parent = BarraLateral
    
    local UICornerBJ = Instance.new("UICorner")
    UICornerBJ.CornerRadius = UDim.new(0, 6)
    UICornerBJ.Parent = Boton
    
    Boton.MouseButton1Click:Connect(function()
        LimpiarAreaScripts()
        for i, info in ipairs(listaScripts) do
            CrearBotonScript(info, i)
        end
        task.wait()
        AreaScripts.CanvasSize = UDim2.new(0, 0, 0, UIListArea.AbsoluteContentSize.Y + 20)
    end)
    
    Boton.MouseEnter:Connect(function()
        TweenService:Create(Boton, TweenInfo.new(0.2), {BackgroundColor3 = COLOR_HOVER}):Play()
    end)
    Boton.MouseLeave:Connect(function()
        TweenService:Create(Boton, TweenInfo.new(0.2), {BackgroundColor3 = COLOR_FONDO}):Play()
    end)
end

-- Cargar hub
local function CargarHub()
    Notificar("Cargando...", "Obteniendo scripts de GitHub", COLOR_ACENTO)
    
    local exito, resultado = pcall(function()
        local respuesta = game:HttpGet(INDEX_URL)
        return HttpService:JSONDecode(respuesta)
    end)
    
    if not exito or not resultado then
        Notificar("❌ Error", "No se pudo cargar la lista de scripts.", Color3.fromRGB(200, 50, 50))
        return
    end
    
    if #resultado == 0 then
        Notificar("⚠️ Vacío", "No hay scripts aprobados aún.", Color3.fromRGB(200, 200, 50))
        return
    end
    
    local juegos = {}
    for _, script in ipairs(resultado) do
        local juego = script.juego or "General"
        if not juegos[juego] then
            juegos[juego] = {}
        end
        table.insert(juegos[juego], script)
    end
    
    for _, hijo in ipairs(BarraLateral:GetChildren()) do
        if hijo:IsA("TextButton") then
            hijo:Destroy()
        end
    end
    
    local orden = 1
    for nombreJuego, listaScripts in pairs(juegos) do
        CrearBotonJuego(nombreJuego, listaScripts, orden)
        orden = orden + 1
    end
    task.wait()
    BarraLateral.CanvasSize = UDim2.new(0, 0, 0, UIListLateral.AbsoluteContentSize.Y + 16)
    
    local primerJuego = next(juegos)
    if primerJuego then
        LimpiarAreaScripts()
        for i, info in ipairs(juegos[primerJuego]) do
            CrearBotonScript(info, i)
        end
        task.wait()
        AreaScripts.CanvasSize = UDim2.new(0, 0, 0, UIListArea.AbsoluteContentSize.Y + 20)
    end
    
    Notificar("✅ Listo", #resultado .. " scripts cargados.", Color3.fromRGB(50, 200, 50))
end

-- Buscador
CajaBusqueda:GetPropertyChangedSignal("Text"):Connect(function()
    local texto = CajaBusqueda.Text:lower()
    if texto == "" then
        CargarHub()
        return
    end
    
    LimpiarAreaScripts()
    local exito, resultado = pcall(function()
        return HttpService:JSONDecode(game:HttpGet(INDEX_URL))
    end)
    
    if exito and resultado then
        local orden = 1
        for _, info in ipairs(resultado) do
            if info.nombre:lower():find(texto) or (info.juego and info.juego:lower():find(texto)) then
                CrearBotonScript(info, orden)
                orden = orden + 1
            end
        end
        task.wait()
        AreaScripts.CanvasSize = UDim2.new(0, 0, 0, UIListArea.AbsoluteContentSize.Y + 20)
    end
end)

-- Abrir/Cerrar
BotonFlotante.MouseButton1Click:Connect(function()
    Ventana.Visible = not Ventana.Visible
    if Ventana.Visible then
        BotonFlotante.Text = "✕"
    else
        BotonFlotante.Text = "M"
    end
end)

BotonCerrar.MouseButton1Click:Connect(function()
    Ventana.Visible = false
    BotonFlotante.Text = "M"
end)

-- Iniciar
CargarHub()
