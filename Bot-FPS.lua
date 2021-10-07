spawn(function()
    repeat
        wait()
    until game:IsLoaded()
    local function Check(v)
        if v:IsA'Part' then
            v.Material = Enum.Material.Plastic;
        elseif v.ClassName:match'Light' then
            v:Destroy'';
        elseif v.ClassName:match'Effect' then
            pcall(function()
                v.Enabled = false;
            end);
        end;
    end;
    
    local Lighting = game:GetService'Lighting';
    for i, v in next, Lighting:GetChildren'' do
        Check(v);
    end;
    
    Lighting.DescendantAdded:Connect(Check);
    
    for i, v in next, workspace:GetDescendants() do
        Check(v);
    end;
    
    workspace.DescendantAdded:Connect(Check);
end)

spawn(function()
    repeat
        wait()
    until game:IsLoaded()
    local RemovePlrGuis = true
    local No3DRendering = true
    
    if not game['Loaded'] or not game:GetService('Players')['LocalPlayer'] then
        game['Loaded']:Wait();
        game:WaitForChild(game:GetService('Players'));
        game:GetService('Players'):WaitForChild(game:GetService('Players').LocalPlayer.Name)
    end
    
    local LP = game:GetService('Players').LocalPlayer
    --// Physics Settings
    settings().Physics.PhysicsEnvironmentalThrottle = 1
    settings().Rendering.QualityLevel = 'Level01'
    UserSettings():GetService('UserGameSettings').MasterVolume = 0
    -- Comment line 7 if you want to be able to hear your game, keep it the same if you're using it for bots.
    
    --// Hidden Functions
    setsimulationradius(0, 0)
    setfpscap(5)
    
    --// Physical/UI Derender
    for _, v in next, game:GetDescendants() do
        if v:IsA('Workspace') then
            sethiddenproperty(v, 'StreamingTargetRadius', 64)
            sethiddenproperty(v, 'StreamingPauseMode', 2)
            sethiddenproperty(v.Terrain, 'Decoration', false)
            v.Terrain.Elasticity = 0
            v.Terrain.WaterWaveSize = 0
            v.Terrain.WaterWaveSpeed = 0
            v.Terrain.WaterReflectance = 0
            v.Terrain.WaterTransparency = 1
        elseif v:IsA('RunService') and No3DRendering then
            v:Set3dRenderingEnabled(false)
            v:setThrottleFramerateEnabled(true)
        elseif v:IsA('NetworkClient') then
            v:SetOutgoingKBPSLimit(100)
        elseif v:IsA('Lighting') then
            sethiddenproperty(v, 'Technology', 2)
            v.GlobalShadows = false
            v.FogEnd = 1/0
            v.Brightness = 0
        elseif v:IsA('Model') then
            sethiddenproperty(v, 'LevelOfDetail', 1)
        elseif LP and v == LP then
            v.ReplicationFocus = nil
        elseif v:IsA('Decal') or v:IsA('Texture') or v:IsA('Beam') then
            v.Transparency = 1
        elseif v:IsA('Fire') or v:IsA('SpotLight') or v:IsA('Smoke') or v:IsA('Sparkles') then
            v.Enabled = false
        elseif v:IsA('SpecialMesh') then
            v.TextureId = ''
            v.MeshId = ''
        elseif v:IsA('ParticleEmitter') or v:IsA('Trail') then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA('BlurEffect') or v:IsA('SunRaysEffect') or v:IsA('ColorCorrectionEffect') or v:IsA('BloomEffect') or v:IsA('DepthOfFieldEffect')  then
            v.Enabled = false
        elseif v:IsA('BasePart') and not v:IsA('MeshPart') then
            v.Reflectance = 0
            v.Material = 'SmoothPlastic'
        elseif v:IsA('Pants') or v:IsA('Shirt') then
            v[v.ClassName..'Template'] = ''
        elseif v:IsA('Explosion') then
            v.BlastPressure = 0
            v.BlastRadius = 0
            v.Visible = false
            v.Position = Vector3.new(0, 0, 0)
        elseif v:IsA('ForceField') then
            v.Visible = false
        elseif v:IsA('ShirtGraphic') then
            v.Graphic = ''
        elseif v:IsA('MeshPart') then
            v.MeshId = ''
            v.TextureID = ''
            v.Reflectance = 0
            v.Material = 'SmoothPlastic'
        elseif v:IsA('CharacterMesh') then
            v.BaseTextureId = ''
            v.MeshId = ''
            v.OverlayTextureId = ''
        elseif v:IsA('Sound') then
            v.SoundId = ''
            v.Volume = 0
        elseif v:IsA('PlayerGui') and RemovePlrGuis then
            v:ClearAllChildren()
        end
    end
    
    local WorkspaceChildAdded;WorkspaceChildAdded = workspace.DescendantAdded:Connect(function(v)
        wait()
        if v:IsA('Model') then
            sethiddenproperty(v, 'LevelOfDetail', 1)
        elseif LP and v == LP then
            v.ReplicationFocus = nil
        elseif v:IsA('Decal') or v:IsA('Texture') or v:IsA('Beam') then
            v.Transparency = 1
        elseif v:IsA('Fire') or v:IsA('SpotLight') or v:IsA('Smoke') or v:IsA('Sparkles') then
            v.Enabled = false
        elseif v:IsA('SpecialMesh') then
            v.TextureId = ''
            v.MeshId = ''
        elseif v:IsA('ParticleEmitter') or v:IsA('Trail') then
            v.Lifetime = NumberRange.new(0)
        elseif v:IsA('BlurEffect') or v:IsA('SunRaysEffect') or v:IsA('ColorCorrectionEffect') or v:IsA('BloomEffect') or v:IsA('DepthOfFieldEffect')  then
            v.Enabled = false
        elseif v:IsA('BasePart') and not v:IsA('MeshPart') then
            v.Reflectance = 0
            v.Material = 'SmoothPlastic'
        elseif v:IsA('Pants') or v:IsA('Shirt') then
            v[v.ClassName..'Template'] = ''
        elseif v:IsA('Explosion') then
            v.BlastPressure = 0
            v.BlastRadius = 0
            v.Visible = false
            v.Position = Vector3.new(0, 0, 0)
        elseif v:IsA('ForceField') then
            v.Visible = false
        elseif v:IsA('ShirtGraphic') then
            v.Graphic = ''
        elseif v:IsA('MeshPart') then
            v.MeshId = ''
            v.TextureID = ''
            v.Reflectance = 0
            v.Material = 'SmoothPlastic'
        elseif v:IsA('CharacterMesh') then
            v.BaseTextureId = ''
            v.MeshId = ''
            v.OverlayTextureId = ''
        elseif v:IsA('Sound') then
            v.SoundId = ''
            v.Volume = 0
        end
    end)
end)
