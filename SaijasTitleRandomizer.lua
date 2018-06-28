SaijasTitleRandomizer = {}

SaijasTitleRandomizer.name = "SaijasTitleRandomizer"

function SaijasTitleRandomizer:Initialize()
  -- ...but we don't have anything to initialize yet. We'll come back to this.
    
  d("SaijasTitleRandomizer:Initialize")
  
  numTitles = GetNumTitles()
  d("numTitles = "..numTitles)
  
  randomIdx = math.random(numTitles)
  d("randomIdx = "..randomIdx)
  
  SelectTitle(randomIdx)
end

-- Then we create an event handler function which will be called when the "addon loaded" event
-- occurs. We'll use this to initialize our addon after all of its resources are fully loaded.
function SaijasTitleRandomizer.OnAddOnLoaded(event, addonName)
  -- The event fires each time *any* addon loads - but we only care about when our own addon loads.
  d("SaijasTitleRandomizer:OnAddOnLoaded addonName = "..addonName)
  if addonName == SaijasTitleRandomizer.name then
    SaijasTitleRandomizer:Initialize()
  end
end
 
-- Finally, we'll register our event handler function to be called when the proper event occurs.
EVENT_MANAGER:RegisterForEvent(SaijasTitleRandomizer.name, EVENT_ADD_ON_LOADED, SaijasTitleRandomizer.OnAddOnLoaded)
