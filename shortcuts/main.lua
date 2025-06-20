function initUi()
  -- app.registerUi({["menu"] = "Grid snapping on/off", ["callback"] = "gridsnap", ["accelerator"] = "g"});
  -- app.registerUi({["menu"] = "Rotation snapping on/off", ["callback"] = "rotsnap", ["accelerator"] = "r"});
  app.registerUi({["menu"] = "Fill on/off", ["callback"] = "fill", ["accelerator"] = "f"});
  app.registerUi({["menu"] = "Cycle through tools", ["callback"] = "tool", ["accelerator"] = "t"});
  app.registerUi({["menu"] = "Cycle through line style", ["callback"] = "linestyle", ["accelerator"] = "l"});
  app.registerUi({["menu"] = "Cycle through selection tools", ["callback"] = "select", ["accelerator"] = "s"});
  app.registerUi({["menu"] = "Cycle through eraser type", ["callback"] = "eraser", ["accelerator"] = "e"});
  app.registerUi({["menu"] = "Cycle through drawing type", ["callback"] = "drawingtype", ["accelerator"] = "v"});
  app.registerUi({["menu"] = "Toggle drawing type", ["callback"] = "nodrawingtype", ["accelerator"] = "<Shift>v"});
  app.registerUi({["menu"] = "Cycle through colors", ["callback"] = "color", ["accelerator"] = "c"});
  app.registerUi({["menu"] = "Toggle Scrolling", ["callback"] = "scroll", ["accelerator"] = "b"});
end


local currentFill = false
local currentRotsnap = false
local currentGridsnap = false
local currentDrawingtypeToggle = true

function gridsnap()
  currentGridsnap = not currentGridsnap
  app.uiAction({["action"]="ACTION_GRID_SNAPPING"})
  print("ACTION_GRID_SNAPPING: toggled")
end

function rotsnap()
  currentRotsnap = not currentRotsnap
  app.uiAction({["action"]="ACTION_ROTATION_SNAPPING"})
  print("ACTION_ROTATION_SNAPPING: toggled")
end

function fill()
  currentFill = not currentFill
  app.uiAction({["action"]="ACTION_TOOL_FILL", ["enabled"] = currentFill})
  print("ACTION_TOOL_FILL enabled: " .. tostring(currentFill))
end

local colorList = {
  {"black", 0x000000},
  {"green", 0x008000},
  {"lightblue", 0x00c0ff},
  {"lightgreen", 0x00ff00},
  {"blue", 0x3333cc},
  {"gray", 0x808080},
  {"red", 0xff0000},
  {"magenta", 0xff00ff},
  {"orange", 0xff8000},
  {"yellow", 0xffff00},
  {"white", 0xffffff}
}
local currentColor = 4 -- start with blue color

local linestyleList = {"PLAIN", "DASH", "DASH_DOT", "DOT"}
local currentLinestyle = 1

local selectList = {"RECT", "REGION", "OBJECT"} -- don't use play selection tool
local currentSelect = 1

local toolList = {"PEN", "ERASER", "HIGHLIGHTER", "SELECTION"}
local currentTool = 1

local eraserList = {"STANDARD", "DELETE_STROKE", "WHITEOUT"}
local currentEraser = 1

local drawingtypeList = {"TOOL_DRAW_RECT", "TOOL_DRAW_ELLIPSE", "TOOL_DRAW_ARROW", "RULER", "TOOL_DRAW_SPLINE", "SHAPE_RECOGNIZER"} -- Don't include coordinate system and default tool
local currentDrawingtype = 1

local toggleList = {"tool", "HAND"}
local currentToggle = 1

function color()
  currentColor = currentColor % #colorList + 1
  app.changeToolColor({["color"] = colorList[currentColor][2], ["selection"] = true})
  print("Color: " .. colorList[currentColor][1])
end

function linestyle()
  currentLinestyle = currentLinestyle % #linestyleList + 1
  app.uiAction({["action"] = "ACTION_TOOL_LINE_STYLE_" .. linestyleList[currentLinestyle]})
  print("ACTION_TOOL_LINE_STYLE_" .. linestyleList[currentLinestyle])
end

function select()
  currentSelect = currentSelect % #selectList + 1
  app.uiAction({["action"] = "ACTION_TOOL_SELECT_" .. selectList[currentSelect]})
  print("ACTION_TOOL_SELECT_" .. selectList[currentSelect])
end

function tool()
  currentTool = currentTool % #toolList + 1
  currentToggle = 1  -- Reset to "tool", so that next click turns on HAND mode again
  if (toolList[currentTool] == "SELECTION") then
    app.uiAction({["action"] = "ACTION_TOOL_SELECT_" .. selectList[currentSelect]})
    print("ACTION_TOOL_SELECT_" .. selectList[currentSelect])
  else
    app.uiAction({["action"] = "ACTION_TOOL_" .. toolList[currentTool]})
    print("ACTION_TOOL_" .. toolList[currentTool])
  end
end

function eraser()
  currentEraser = currentEraser % #eraserList + 1
  app.uiAction({["action"] = "ACTION_TOOL_ERASER_" .. eraserList[currentEraser]})
  print("ACTION_TOOL_ERASER_" .. eraserList[currentEraser])
end

function drawingtype()
  currentDrawingtype = currentDrawingtype % #drawingtypeList + 1
  app.uiAction({["action"] = "ACTION_" .. drawingtypeList[currentDrawingtype]})
  print("ACTION_" .. drawingtypeList[currentDrawingtype])
end

function nodrawingtype()
  currentDrawingtypeToggle = not currentDrawingtypeToggle
  app.uiAction({["action"] = "ACTION_" .. drawingtypeList[currentDrawingtype], ["enabled"] = currentDrawingtypeToggle})
  print("ACTION_" .. drawingtypeList[currentDrawingtype] .. " = " .. tostring(currentDrawingtypeToggle))
end

function scroll()
  currentToggle = currentToggle % #toggleList + 1
  if (toggleList[currentToggle] == "tool") then
    app.uiAction({["action"] = "ACTION_TOOL_" .. toolList[currentTool]})
    print("ACTION_TOOL_" .. toolList[currentTool])
  else
    app.uiAction({["action"] = "ACTION_TOOL_HAND"})
    print("ACTION_TOOL_HAND")
  end
end
