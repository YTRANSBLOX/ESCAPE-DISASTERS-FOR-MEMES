keys: Shoot, Cue, Pocket, Power, Turn, Aim
scripts scanned: 507

===== Players.Ranscripts.PlayerScripts.Client.Main =====
1: local v_u_1 = game:GetService("Players")
2: local v2 = game:GetService("ReplicatedStorage")
3: local v3 = game:GetService("RunService")
4: local v_u_4 = game:GetService("UserInputService")
5: local v_u_5 = game:GetService("GuiService")
6: local v_u_6 = game:GetService("SoundService")
7: local v7 = v2:WaitForChild("Shared")
8: local v_u_8 = require(v7.AimStream)
9: local v_u_9 = require(v7.Config)
10: local v_u_10 = require(v7.Net)
11: local v_u_11 = require(v7.Placement)
12: local v_u_12 = require(v7.Matchmaking.PadBar)
13: local v_u_13 = require(v7.AuraQuiet)
14: local v_u_14 = require(v7.TableBuilder)
15: local v_u_15 = require(v7.CueStickBuilder)
16: local v_u_16 = require(v7.Physics.Simulation)
17: local v_u_17 = require(v7.Physics.Aim)
18: local v_u_18 = require(v7.Rules.ShotJudge)
19: local v_u_19 = require(v7.Rules.MatchEngine)
20: local v_u_20 = require(v7.Ults.Effects.TimeStop)
21: local v_u_21 = require(v7.Ults.Catalog)
22: local v_u_22 = require(v7.Rules.NiceShot)
23: local v_u_23 = require(v7.Tutorial.Steps)
24: local v24 = require(script.Parent.Audio)
25: local v25 = require(script.Parent.Avatar)
26: local v26 = require(script.Parent.BackCue)
27: local v27 = require(script.Parent.BotChat)
28: local v_u_28 = require(script.Parent.People)
29: local v_u_29 = require(script.Parent.TutorialAnchors)
30: local v_u_30 = require(script.Parent.TutorialSoft)
31: local v_u_31 = require(v7.BallCallouts)
32: local v32 = require(script.Parent.BallPulse)
33: local v_u_33 = require(script.Parent.CueAssets)
34: local v34 = require(script.Parent.CueSkinLook)
35: local v35 = require(script.Parent.Effects)
36: local v_u_36 = require(script.Parent.Camera)
37: local v37 = require(script.Parent.CameraGuard)
38: local v38 = require(script.Parent.DayCycle)
39: local v39 = require(script.Parent.FirePit)
40: local v40 = require(script.Parent.FontTest)
41: local v41 = require(script.Parent.LobbyBoards)
42: local v42 = require(script.Parent.HoleFill)
43: local v_u_43 = require(script.Parent.Guideline)
44: local v44 = require(script.Parent.Input)
45: local v45 = require(script.Parent.MapAmbience)
46: local v46 = require(script.Parent.Hub)
47: local v47 = require(script.Parent.PowerCue)
48: local v48 = require(script.Parent.SpinSelector)
49: local v_u_49 = require(script.Parent.SettingsState)
50: local v_u_50 = require(script.Parent.Freecam)
51: local v51 = require(script.Parent.ZoomHint)
52: local v52 = require(script.Parent.PadGuide)
53: local v_u_53 = require(script.Parent.PadMode)
54: local v54 = require(script.Parent.GiftDrop)
55: local v_u_55 = require(script.Parent.HubPad)
56: local v_u_56 = require(script.Parent.LuckyClient)
57: local v_u_57 = require(script.Parent.UltHud)
58: local v58 = require(script.Parent.UltPick)
59: local v59 = require(script.Parent.UltCutscene)
   ...
205: 	if v_u_113 and v_u_114 then
206: 		for _, v144 in v_u_113.state.balls do
207: 			if v144.pocketed or v144.vx == 0 and (v144.vy == 0 and (v144.z <= 0 and v144.vz == 0)) then
208: 				continue
209: 			end
210: 			local v145 = v_u_14.toWorld(v_u_114, v144.x, v144.y, v_u_9.Balls.RenderRadiusInches + v144.z)
211: 			local v146 = v_u_143
212: 			table.insert(v146, v145)
213: 		end
214: 	end
215: 	return v_u_143
216: end
217: local function v_u_152() -- name: frozenTurn
218: 	-- upvalues: (ref) v_u_110, (copy) v_u_78, (ref) v_u_118, (ref) v_u_113, (copy) v_u_20
219: 	local v148
220: 	if v_u_110 == nil then
221: 		v148 = false
222: 	else
223: 		v148 = v_u_110.shooter == v_u_78.UserId
224: 	end
225: 	if not v148 or (v_u_118 or (not v_u_113 or v_u_110.phase ~= "Frozen")) then
226: 		return false
227: 	end
228: 	if not (v_u_113:isHalted() and v_u_20.isFrozen(v_u_113.state)) then
229: 		return false
230: 	end
231: 	local v149 = v_u_113:findCueBall()
232: 	if v149 == nil or v149.pocketed then
233: 		return false
234: 	end
235: 	local v150 = v_u_113.shot
236: 	local v151 = v150 and v150.parts
237: 	if v151 then
238: 		v151 = v150.parts.strikes
239: 	end
240: 	return v151

===== Players.Ranscripts.PlayerScripts.Client.BallRenderer =====
   ...
60: 	end
61: 	local v26 = v_u_4.studs(v_u_3.Balls.RenderRadiusInches * 2)
62: 	local v27 = v_u_3.Balls.Textures[p24] or ""
63: 	local v28 = v_u_1:FindFirstChild("Assets")
64: 	if v28 then
65: 		v28 = v28:FindFirstChild(v_u_3.Balls.MeshTemplate)
66: 	end
67: 	if not (v28 and v28:IsA("MeshPart")) then
68: 		v28 = nil
69: 	end
70: 	if v28 and v27 ~= "" then
71: 		local v29 = v28:Clone()
72: 		v29.Name = p24 == 0 and "CueBall" or "Ball" .. p24
73: 		v29.Size = Vector3.new(v26, v26, v26)
74: 		v29.Anchored = true
75: 		v29.CanCollide = false
76: 		v29.CanQuery = false
77: 		v29.CastShadow = true
78: 		v29.Material = Enum.Material[v_u_3.Look.BallMaterial]
79: 		v29.Reflectance = v_u_3.Balls.Reflectance
80: 		v29.DoubleSided = v_u_3.Balls.DoubleSided
81: 		v29.Color = Color3.new(1, 1, 1)
82: 		v29.TextureID = v27
83: 		v29.Transparency = 0
84: 		v29.Parent = p23.folder
85: 		p23.parts[p24] = v29
86: 		p23.rotations[p24] = CFrame.identity
87: 		return v29
88: 	end
89: 	local v30 = Instance.new("Part")
90: 	v30.Name = p24 == 0 and "CueBall" or "Ball" .. p24
91: 	v30.Shape = Enum.PartType.Ball
92: 	v30.Size = Vector3.new(v26, v26, v26)
93: 	v30.Anchored = true
94: 	v30.CanCollide = false
95: 	v30.CanQuery = false
96: 	v30.CastShadow = true
97: 	v30.Material = Enum.Material[v_u_3.Look.BallMaterial]
98: 	v30.Reflectance = v_u_3.Balls.Reflectance
99: 	local v31 = v_u_3.Balls.Decals
100: 	local v32 = p24 >= 9
101: 	local v33 = v_u_11(p24)
102: 	if v32 and v31.StripeBand ~= "" then
   ...
345: 		end
346: 		v_u_80(v110, v116)
347: 		if v116 < 1 and v101.t < v93.FlyOffMaxSeconds then
348: 			continue
349: 		end
350: 		p91.flying[v100] = nil
351: 		p91.sunk[v100] = true
352: 		v_u_80(v110, 1)
353: 	end
354: 	for v118, v119 in p91.sinking do
355: 		v119.t = v119.t + p92
356: 		local v120 = p91:ensure(v118)
357: 		local v121 = v119.t / v93.PocketFadeSeconds
358: 		local v122 = math.clamp(v121, 0, 1)
359: 		local v123 = v_u_3.Table.PocketDropDepthInches
360: 		local v124 = 2 * v94 * v123
361: 		local v125 = v123 + (math.sqrt(v124) * v119.t + 0.5 * v94 * v119.t * v119.t)
362: 		local v126 = v93.PocketDriftInchesPerSecond * v119.t
363: 		local v127 = v_u_4.toWorld(p91.placement, v119.x + v119.dx * v126, v119.y + v119.dy * v126, v_u_3.Balls.RenderRadiusInches - v125)
364: 		local v128 = p91.yaw
365: 		local v129 = -v119.dy
366: 		local v130 = -v119.dx
367: 		local v131 = v128:VectorToWorldSpace((Vector3.new(v129, 0, v130)))
368: 		if v131.Magnitude > 1e-6 then
369: 			p91.rotations[v118] = CFrame.fromAxisAngle(v131.Unit, v93.PocketGutterSpin * p92) * p91.rotations[v118]
370: 		end
371: 		v120.CFrame = CFrame.new(v127) * p91.rotations[v118]
372: 		v_u_80(v120, v122)
373: 		if v122 < 1 then
374: 			continue
375: 		end
376: 		p91.sinking[v118] = nil
377: 		p91.sunk[v118] = true
378: 	end
379: end
380: function v_u_6.restore(p132, p133, p134, p135) -- name: restore
381: 	-- upvalues: (copy) v_u_60, (copy) v_u_80

===== Players.Ranscripts.PlayerScripts.Client.Match =====
1: local v1 = game:GetService("ReplicatedStorage"):WaitForChild("Shared")
2: local v_u_2 = require(v1:WaitForChild("Config"))
3: require(v1:WaitForChild("Placement"))
4: local v3 = v1:WaitForChild("Physics")
5: local v_u_4 = require(v3:WaitForChild("Ball"))
6: require(v3:WaitForChild("Cue"))
7: local v_u_5 = require(v3:WaitForChild("Rack"))
8: local v_u_6 = require(v3:WaitForChild("Simulation"))
9: local v_u_7 = require(v3:WaitForChild("Table"))
10: local v_u_8 = require(v1:WaitForChild("TableBuilder"))
11: local v_u_9 = require(v1:WaitForChild("Ults"):WaitForChild("Effects"):WaitForChild("TimeStop"))
12: local v_u_10 = require(v1:WaitForChild("ReplayPace"))
13: require(script.Parent:WaitForChild("BallRenderer"))
14: local v_u_11 = {}
15: v_u_11.__index = v_u_11
16: local function v_u_14(p12) -- name: resync
17: 	table.clear(p12.sunk)
18: 	for _, v13 in p12.state.balls do
   ...
135: 			p40.rackConfirmed = true
136: 			local v48 = p40.state
137: 			local v49 = p40.state
138: 			local v50 = p40.state
139: 			v48.balls = v43
140: 			v49.time = 0
141: 			v50.overrides = nil
142: 			v_u_14(p40)
143: 			p40:renderState()
144: 		end
145: 	end
146: end
147: function v_u_11.findCueBall(p51) -- name: findCueBall
148: 	-- upvalues: (copy) v_u_6
149: 	return v_u_6.findBall(p51.state, 0)
150: end
151: function v_u_11.ensureCueBall(p52) -- name: ensureCueBall
152: 	-- upvalues: (copy) v_u_6
153: 	if v_u_6.respotCueBall(p52.state) then
154: 		local v53 = v_u_6.findBall(p52.state, 0)
155: 		if v53 and p52.renderer then
156: 			p52.renderer:restore(0, v53.x, v53.y)
157: 		end
158: 	end
159: end
160: function v_u_11.setCue(p54, p55, p56) -- name: setCue
161: 	-- upvalues: (copy) v_u_6, (copy) v_u_4
162: 	local v57 = v_u_6.findBall(p54.state, 0)
163: 	if v57 ~= nil then
164: 		v_u_4.stop(v57)
165: 		v57.x = p55
166: 		v57.y = p56
167: 		v57.z = 0
168: 		v57.vz = 0
169: 		v57.pocketed = false
170: 		v57.falling = false
171: 		v57.pocket = nil
172: 		v57.tip = nil
173: 		if p54.renderer then
174: 			p54.renderer:restore(0, p55, p56)
175: 		end
176: 	end
177: end
178: function v_u_11.holdCue(p58, p59, p60, p61, p62) -- name: holdCue
179: 	p58.cueHold = {
180: 		["epoch"] = p59,
181: 		["turnId"] = p60,
182: 		["x"] = p61,
183: 		["y"] = p62
184: 	}
185: 	p58:setCue(p61, p62)
186: end
187: function v_u_11.releaseCue(p63) -- name: releaseCue
188: 	p63.cueHold = nil
189: end
190: function v_u_11.applyBalls(p64, p65) -- name: applyBalls
191: 	-- upvalues: (copy) v_u_4, (copy) v_u_6, (copy) v_u_14
192: 	if #p65 == #p64.state.balls * 4 then
193: 		for _, v66 in p64.state.balls do
194: 			local v67 = v66.id * 4
195: 			local v68 = p65[v67 + 1]
196: 			local v69 = p65[v67 + 2]
197: 			local v70 = p65[v67 + 3]
198: 			local v71 = p65[v67 + 4] == 1
199: 			v66.x = v68
   ...
267: 			local v87
268: 			if type(v86) == "table" then
269: 				local v88 = p84.ult.id
270: 				if type(v88) == "string" then
271: 					v87 = p84.ult.id
272: 				else
273: 					v87 = nil
274: 				end
275: 			else
276: 				v87 = nil
277: 			end
278: 			v85.ult = v87
279: 			local v89 = p83:findCueBall()
280: 			p83.shot.cueStart = v89 and { v89.x, v89.y } or nil
281: 			p83.tape = p84.rewind == true and {
282: 				["seq"] = p84.seq,
283: 				["times"] = {},
284: 				["frames"] = {}
285: 			} or nil
286: 		end
287: 		if p83.seq == p84.seq then
288: 			p83.assign = p84.assign
289: 			p83.streaks = v_u_82(p84)
290: 			p83.downVersion = p83.downVersion + 1
291: 		end
   ...
608: 					local v184 = v164.elapsed
609: 					v164.elapsed = math.min(v184, v183)
610: 				end
611: 			end
612: 		end
613: 		if not v164.capped and (not v164.finished and v_u_6.isAtRest(p162.state)) then
614: 			v164.finished = true
615: 			v_u_6.finishShot(p162.state, v164.events)
616: 		end
617: 		local v185 = p162.renderer
618: 		if v185 then
619: 			local v186 = p162.state.time - v179
620: 			local v187 = v_u_2.Table.PocketDropDepthInches
621: 			for _, v188 in p162.state.balls do
622: 				if v188.offTable then
623: 	

===== Players.Ranscripts.PlayerScripts.Client.Camera =====
1: local v1 = game:GetService("ReplicatedStorage")
2: local v_u_2 = game:GetService("RunService")
3: local v_u_3 = game:GetService("Workspace")
4: local v4 = v1:WaitForChild("Shared")
5: local v_u_5 = require(v4:WaitForChild("Config"))
6: local v_u_6 = require(v4:WaitForChild("Physics"):WaitForChild("Cue"))
7: local v7 = require(v4:WaitForChild("Placement"))
8: local v_u_8 = require(v4:WaitForChild("TableBuilder"))
9: local v_u_9 = {}
10: local v10 = v7.forTable(v_u_5.Hub.ActiveTableId)
11: local v_u_11 = assert(v10, "Config.Hub.ActiveTableId names no table")
12: local v_u_12 = nil
13: local v_u_13 = nil
14: local v_u_14 = false
15: local v_u_15 = {}
16: local v_u_16 = false
17: local v_u_17 = 0
18: local v_u_18 = v_u_5.Multiplayer.CameraBottomFraction
   ...
968: 			local v483 = v482 * v482 * (3 - v482 * 2)
969: 			v470 = v_u_23 + (v_u_5.Camera.View.ZoomMax - v_u_23) * v483
970: 		end
971: 	end
972: 	if not p458 or v463.FocusWeight <= 0 then
973: 		p459 = nil
974: 	end
975: 	local v484
976: 	if v_u_16 then
977: 		v484 = v_u_282()
978: 		v_u_39 = nil
979: 	elseif v_u_36 then
980: 		if v_u_38 and v463.VerticalView == "Aim" then
981: 			local v485
982: 			v485, v484 = v_u_249(v_u_8.toWorld(v_u_11, 0, 0, 0), v_u_36, nil, nil, nil)
983: 		else
984: 			v484 = v_u_369(v_u_36, v_u_38)
985: 		end
986: 	else
987: 		local v486
988: 		v484, v486 = v_u_249(v_u_29, v_u_30, p459, nil, v470)
989: 		local v487 = v470 or v_u_23
990: 		local v488 = v_u_5.Camera.View
991: 		local v489 = v487 - v488.ZoomDefault
992: 		local v490 = v488.ZoomMax - v488.ZoomDefault

===== Players.Ranscripts.PlayerScripts.Client.Guideline =====
1: local v1 = game:GetService("ReplicatedStorage"):WaitForChild("Shared")
2: local v_u_2 = require(v1:WaitForChild("Config"))
3: require(v1:WaitForChild("Placement"))
4: local v_u_3 = require(v1:WaitForChild("TableBuilder"))
5: require(v1:WaitForChild("Physics"):WaitForChild("Aim"))
6: local v_u_4 = require(script.Parent.TutorialAnchors)
7: local v_u_5 = {}
8: v_u_5.__index = v_u_5
9: local function v_u_14(p6, p7, p8) -- name: makeStrip
10: 	-- upvalues: (copy) v_u_2
11: 	local v9 = v_u_2.Guideline
12: 	local v10 = Instance.new("Part")
13: 	v10.Name = p6
14: 	v10.Anchored = true
15: 	v10.CanCollide = false
16: 	v10.CanQuery = false
17: 	v10.CastShadow = false
   ...
193: 	v49.Material = Enum.Material.Neon
194: 	local v50 = v_u_2.Guideline.Color
195: 	v49.Color = Color3.fromRGB(v50[1], v50[2], v50[3])
196: 	v49.Transparency = 1
197: 	v49.Size = Vector3.new(0.05, 0.01, 1)
198: 	v49.Parent = v_u_18
199: 	v44.objectStub = {
200: 		["part"] = v49,
201: 		["texture"] = nil
202: 	}
203: 	local _ = v_u_2.Guideline
204: 	local v51 = Instance.new("Part")
205: 	v51.Name = "CueStub"
206: 	v51.Anchored = true
207: 	v51.CanCollide = false
208: 	v51.CanQuery = false
209: 	v51.CastShadow = false
210: 	v51.Material = Enum.Material.Neon
211: 	local v52 = v_u_2.Guideline.Color
212: 	v51.Color = Color3.fromRGB(v52[1], v52[2], v52[3])
213: 	v51.Transparency = 1
214: 	v51.Size = Vector3.new(0.05, 0.01, 1)
215: 	v51.Parent = v_u_18
216: 	v44.cueStub = {
217: 		["part"] = v51,
   ...
493: 			return
494: 		else
495: 			local v139
496: 			if p93 and p93.object then
497: 				v139 = p93.object + v103 - v104
498: 			else
499: 				v139 = v105 * p90.objectShare
500: 			end
501: 			local v140
502: 			if p93 and p93.cue then
503: 				v140 = p93.cue + v103 - v104
504: 			elseif p90.contact == "ball" then
505: 				v140 = v105 * v100.CueStubScale * p90.cueShare
506: 			else
507: 				v140 = v105 * v100.RailStubScale
508: 			end
509: 			if p90.contact == "ball" and v100.MinStubInches <= v139 then
510: 				local v141 = p90.ghostX + p90.objectDirX * (v104 + 2 * v103)
511: 				local v142 = p90.ghostY + p90.objectDirY * (v104 + 2 * v103)
512: 				v_u_87(p89.objectStub, p89.placement, v141, v142, v141 + p90.objectDirX * v139, v142 + p90.objectDirY * v139, v100.StubTransparency)
513: 			else
514: 				local v143 = p89.objectStub
515: 				v143.part.Transparency = 1
516: 				if v143.texture then
517: 					v143.texture.Transparency = 1

===== Players.Ranscripts.PlayerScripts.Client.Input =====
1: local v_u_1 = game:GetService("ContextActionService")
2: local v_u_2 = game:GetService("UserInputService")
3: local v3 = game:GetService("ReplicatedStorage"):WaitForChild("Shared")
4: local v_u_4 = require(v3:WaitForChild("Config"))
5: local v_u_5 = require(v3:WaitForChild("Physics"):WaitForChild("Cue"))
6: local v_u_6 = require(v3:WaitForChild("ShotInput"))
7: local v_u_7 = require(v3:WaitForChild("PadMath"))
8: local v_u_8 = require(script.Parent.TutorialAnchors)
9: local v_u_9 = {}
10: v_u_9.__index = v_u_9
11: function v_u_9.new() -- name: new
12: 	-- upvalues: (copy) v_u_4, (copy) v_u_9
13: 	local v10 = {
14: 		["angle"] = 0,
15: 		["spinX"] = 0,
16: 		["spinY"] = 0,
17: 		["spinEditing"] = false,
18: 		["spinListeners"] = {},
19: 		["spinEditingListeners"] = {},
20: 		["elevation"] = v_u_4.Cue.CueElevationDegrees,
21: 		["elevationListeners"] = {},
22: 		["elevationDir"] = 0,
23: 		["stickElevation"] = 0,
24: 		["elevationAccum"] = nil,
25: 		["elevationTime"] = 0,
26: 		["elevationNext"] = 0,
27: 		["enabled"] = true,
28: 		["aimListeners"] = {},
29: 		["tickListeners"] = {},
30: 		["shootListeners"] = {},
31: 		["powerListeners"] = {},
32: 		["zoomListeners"] = {},
33: 		["leaveListeners"] = {},
34: 		["dragInput"] = nil,
35: 		["dragLastX"] = 0,
36: 		["dragLastTime"] = 0,
37: 		["degreesSinceTick"] = 0,
38: 		["power"] = nil,
39: 		["powerSuppressed"] = false,
40: 		["pinchScale"] = nil,
41: 		["stickAim"] = 0,
42: 		["stickZoom"] = 0,
43: 		["stickSpinX"] = 0,
44: 		["stickSpinY"] = 0,
45: 		["spinModifier"] = false,
46: 		["level"] = 0,
47: 		["levelUp"] = false,
48: 		["levelDown"] = false,
49: 		["padPower"] = false,
50: 		["nudgeDir"] = 0,
51: 		["nudgeTime"] = 0,
52: 		["nudgeNext"] = 0,
53: 		["gamepadBound"] = false,
54: 		["placeAllowed"] = false,
55: 		["placeModifier"] = false,
56: 		["stickPlaceX"] = 0,
57: 		["stickPlaceY"] = 0,
58: 		["placeMoveListeners"] = {},
59: 		["placeEndListeners"] = {}
60: 	}
61: 	local v11 = v_u_9
62: 	local v12 = setmetatable(v10, v11)
63: 	v12:connectDrag()
64: 	return v12
65: end
66: function v_u_9.onAim(p13, p14) -- name: onAim
67: 	local v15 = p13.aimListeners
68: 	table.insert(v15, p14)
69: end
70: function v_u_9.onTick(p16, p17) -- name: onTick
71: 	local v18 = p16.tickListeners
72: 	table.insert(v18, p17)
73: end
74: function v_u_9.onShoot(p19, p20) -- name: onShoot
75: 	local v21 = p19.shootListeners
76: 	table.insert(v21, p20)
77: end
78: function v_u_9.onPower(p22, p23) -- name: onPower
79: 	local v24 = p22.powerListeners
80: 	table.insert(v24, p23)
81: end
82: function v_u_9.onZoom(p25, p26) -- name: onZoom
83: 	local v27 = p25.zoomListeners
84: 	table.insert(v27, p26)
85: end
86: function v_u_9.onLeave(p28, p29) -- name: onLeave
87: 	local v30 = p28.leaveListeners
88: 	table.insert(v30, p29)
89: end
90: function v_u_9.onPlaceMove(p31, p32) -- name: onPlaceMove
   ...
139: function v_u_9.setElevation(p52, p53) -- name: setElevation
140: 	-- upvalues: (copy) v_u_6
141: 	local v54 = v_u_6.roundElevation(p53)
142: 	if v54 ~= nil and v54 ~= p52.elevation then
143: 		p52.elevation = v54
144: 		for _, v55 in p52.elevationListeners do
145: 			v55(v54)
146: 		end
147: 	end
148: end
149: function v_u_9.stepElevation(p56, p57) -- name: stepElevation
150: 	-- upvalues: (copy) v_u_4
151: 	p56:setElevation(p56.elevation + p57 * v_u_4.Cue.ElevationStepDegrees)
152: end
153: function v_u_9.resetElevation(p58) -- name: resetElevation
154: 	-- upvalues: (copy) v_u_4
155: 	p58:setElevation(v_u_4.Cue.CueElevationDegrees)
156: end
157: function v_u_9.onElevation(p59, p60) -- name: onElevation
158: 	local v61 = p59.elevationListeners
159: 	table.insert(v61, p60)
160: end
161: function v_u_9.holdElevation(p62, p63) -- name: holdElevation
162: 	-- upvalues: (copy) v_u_4
163: 	p62.elevationDir = not p62.spinEditing and 0 or p63
164: 	if p62.elevationDir ~= 0 then
165: 		p62.elevationTime = 0
166: 		p62.elevationNext = v_u_4.Input.ElevationRepeatDelay
167: 		p62:stepElevation(p62.elevat

===== Players.Ranscripts.PlayerScripts.Client.Avatar =====
1: local v_u_1 = game:GetService("Players")
2: local v2 = game:GetService("ReplicatedStorage"):WaitForChild("Shared")
3: local v_u_3 = require(v2:WaitForChild("AvatarPose"))
4: local v_u_4 = require(v2:WaitForChild("Config"))
5: local v_u_5 = require(v2:WaitForChild("CueClearance"))
6: require(v2:WaitForChild("Placement"))
7: require(v2:WaitForChild("ShooterStance"))
8: local v_u_6 = require(script.Parent.ShooterPoser)
9: local v_u_7 = {}
10: v_u_7.__index = v_u_7
11: local v_u_8 = Enum.HumanoidStateType.Freefall
12: local function v_u_16(p_u_9, p10) -- name: holdFooting
13: 	-- upvalues: (copy) v_u_8
14: 	if p_u_9.footing then
15: 		return
16: 	else
17: 		local v11 = p10:FindFirstChildOfClass("Humanoid")
18: 		local v_u_12 = p10:FindFirstChild("HumanoidRootPart")
19: 		if v11 and (v_u_12 and (v_u_12:IsA("BasePart") and v_u_12.Anchored)) then
20: 			local v_u_13 = {
   ...
67: 		["pitchShown"] = nil,
68: 		["pitchTarget"] = nil,
69: 		["pitchKey"] = nil,
70: 		["pitchState"] = nil,
71: 		["pitchQuery"] = nil,
72: 		["footing"] = nil,
73: 		["frame"] = v_u_3.newFrame(),
74: 		["out"] = {
75: 			["visible"] = false,
76: 			["tip"] = nil,
77: 			["pitch"] = nil,
78: 			["tip"] = CFrame.identity,
79: 			["pitch"] = v_u_4.Cue.CueElevationDegrees
80: 		},
81: 		["pitchTarget"] = v_u_4.Cue.CueElevationDegrees,
82: 		["pitchKey"] = table.create(6, 0),
83: 		["pitchQuery"] = {
84: 			["cueX"] = 0,
85: 			["cueY"] = 0,
86: 			["angle"] = 0,
87: 			["spinX"] = 0,
88: 			["spinY"] = 0,
89: 			["floorDegrees"] = nil,
90: 			["floorDegrees"] = v_u_4.Cue.CueElevationDegrees
91: 		}
92: 	}
93: 	local v18 = v_u_7
94: 	local v_u_19 = setmetatable(v17, v18)
95: 	local v20 = v_u_1.LocalPlayer
96: 	local function v26(p21) -- name: onCharacter
97: 		-- upvalues: (copy) v_u_19, (ref) v_u_8, (ref) v_u_6
98: 		local v22 = v_u_19.poser
99: 		if v22 then
100: 			v22:destroy()
101: 		end
102: 		local v23 = v_u_19
   ...
167: 		if v34 == nil then
168: 			return
169: 		end
170: 		p31.footing = nil
171: 		if v34.conn then
172: 			v34.conn:Disconnect()
173: 		end
174: 		if v34.humanoid.Parent then
175: 			v34.humanoid:SetStateEnabled(v_u_8, v34.enabled)
176: 		end
177: 	end
178: end
179: function v_u_7.newTurn(p35) -- name: newTurn
180: 	-- upvalues: (copy) v_u_7
181: 	if not v_u_7.stroking(p35) then
182: 		p35.frozenValid = false
183: 	end
184: 	p35.liveValid = false
185: 	p35.memory = nil
186: 	p35.pitchShown = nil
187: 	p35.pitchState = nil
188: end
189: function v_u_7.strike(p36, p37, p38, p39) -- name: strike
190: 	-- upvalues: (copy) v_u_4, (copy) v_u_6
191: 	local v40 = p36.poser
   ...
196: 			["body"] = nil,
197: 			["cueX"] = 0,
198: 			["cueY"] = 0,
199: 			["angle"] = 0,
200: 			["spinX"] = 0,
201: 			["spinY"] = 0,
202: 			["pitch"] = nil,
203: 			["pull"] = 0,
204: 			["gap"] = nil,
205: 			["memory"] = nil,
206: 			["placement"] = v41.placement,
207: 			["body"] = v_u_4.Stance.DefaultBody,
208: 			["pitch"] = v_u_4.Cue.CueElevationDegrees
209: 		}
210: 		p36.frozen = v42
211: 		local v43 = v41.placement
212: 		local v44 = v41.body
213: 		v42.placement = v43
214: 		v42.body = v44
215: 		local v45 = p38 or v41.cueX
216: 		local v46 = p39 or v41.cueY
217: 		v42.cueX = v45
218: 		v42.cueY = v46
219: 		local v47 = v41.angle
220: 		local v48 = v41.spinX
221: 		local v49 = v41.spinY
222: 		v42.angle = v47
223: 		v42.spinX = v48
224: 		v42.spinY = v49
225: 		local v50 = v41.pitch
226: 		local v51 = v41.memory
227: 		v42.pitch = v50
228: 		v42.memory = v51
229: 		v42.pull = 0
230: 		v42.gap = nil
231: 		p36.frozenValid = true
232: 		local v52 = v_u_6.compose(v42, p36.frame)
233: 		v40:strike(v_u_4.Cue.CueRestGapInches * v_u_4.Table.StudsPerInch + math.clamp(p37, 0, 1) * v_u_4.Cue.CuePullBackStuds * v52.pullLimit, false, v_u_4.Avatar.Stroke.Seconds, v_u_6.idleSpot(v42.placement, v52))
234: 	end
235: end
236: function v_u_7.ballMoving(p53) -- name: ballMoving
237: 	local v54 = p53.poser
238: 	if v54 then
239: 		v54:ballMoving()
240: 	end
241: end
242: fu

===== Players.Ranscripts.PlayerScripts.Client.Audio =====
   ...
215: 			local v70 = v62.PlaybackSpeed
216: 			v69(v68 / math.max(v70, 0.05) + 0.5, v67)
217: 		end
218: 	end
219: end
220: function v_u_10.bonus(p71, p72, p73) -- name: bonus
221: 	-- upvalues: (copy) v_u_5
222: 	local v74 = v_u_5.Audio.Bonus
223: 	local v75 = v74.StreakSemitoneSteps
224: 	local v76 = v74.BaseSemitones
225: 	local v77 = p71.streak + 1
226: 	local v78 = #v75
227: 	p71:playAt("PocketBonus", p72, v74, p73, true, 2 ^ ((v76 + v75[math.min(v77, v78)]) / 12))
228: 	p71.streak = p71.streak + 1
229: 	p71.pocketedThisShot = true
230: end
231: function v_u_10.niceClap(p79, p80) -- name: niceClap
232: 	-- upvalues: (copy) v_u_5
233: 	p79:playAt("NiceClap", p80, v_u_5.Audio.NiceClap, 0, true)
234: end
235: function v_u_10.attach(p_u_81, p_u_82) -- name: attach
236: 	-- upvalues: (copy) v_u_5, (copy) v_u_7, (copy) v_u_9
237: 	p_u_82:onEvent(function(p83)
238: 		-- upvalues: (ref) v_u_5, (ref) v_u_7, (copy) p_u_82, (ref) v_u_9, (copy) p_u_81
239: 		local v84 = v_u_5.Audio
   ...
259: 			for v90, v91 in p_u_81.recent do
260: 				if v85 - v91.clock <= v84.Bonus.LateSeconds then
261: 					continue
262: 				end
263: 				p_u_81.recent[v90] = nil
264: 			end
265: 			for v92, v93 in p_u_81.granted do
266: 				if v93 >= p_u_82.epoch then
267: 					continue
268: 				end
269: 				p_u_81.granted[v92] = nil
270: 			end
271: 			p_u_81:playAt("CueStrike", v87, v84.Strike, p83.speed)
272: 			return
273: 		elseif p83.type == "pocket" then
274: 			p_u_81:playAt("PocketDrop", v87, v84.Pocket, p83.speed, true)
275: 			if p83.ball == 0 then
276: 				p_u_81.streak = 0
277: 				p_u_81.pocketedThisShot = false
278: 				return
279: 			else
280: 				local v94 = ("%d:%d:%d"):format(p_u_82.epoch, p_u_82.seq, p83.ball)
281: 				if p_u_81.owed[v94] then
282: 					p_u_81.owed[v94] = nil
283: 					p_u_81:bonus(v87, p83.speed)
284: 				else
285: 					p_u_81.recent[v94] = {
286: 						["at"] = v87,
   ...
352: function v_u_10.resetStreak(p102) -- name: resetStreak
353: 	p102.streak = 0
354: 	p102.pocketedThisShot = false
355: 	table.clear(p102.owed)
356: 	table.clear(p102.recent)
357: 	table.clear(p102.granted)
358: end
359: function v_u_10.tick(p103, p104) -- name: tick
360: 	-- upvalues: (copy) v_u_5
361: 	local v105 = os.clock()
362: 	if v105 - p103.lastTick >= v_u_5.Audio.MinSecondsBetweenTicks then
363: 		p103.lastTick = v105
364: 		p103:playAt("AimTick", p104, v_u_5.Audio.Tick, 0)
365: 	end
366: end
367: function v_u_10.clockTick(p106, p107) -- name: clockTick
368: 	-- upvalues: (copy) v_u_5
369: 	local v108 = v_u_5.Audio.ClockTick
370: 	local v109 = p106.clock
371: 	if v109 == nil then
372: 		v109 = Instance.new("Sound")
373: 		v109.Name = "ClockTick"
374: 		v109.SoundId = v108.Id
375: 		v109.PlaybackRegionsEnabled = true
376: 		v109.PlaybackRegion = NumberRange.new(v108.Region[1], v108.Region[2])

===== Players.Ranscripts.PlayerScripts.Client.Effects =====
1: local v1 = game:GetService("ReplicatedStorage")
2: local v_u_2 = game:GetService("Debris")
3: local v_u_3 = game:GetService("RunService")
4: local v_u_4 = game:GetService("TweenService")
5: local v5 = v1:WaitForChild("Shared")
6: local v_u_6 = require(v5:WaitForChild("Config"))
7: local v_u_7 = require(v5:WaitForChild("Strings"))
8: require(v5:WaitForChild("Physics"):WaitForChild("Ball"))
9: local v_u_8 = require(v5:WaitForChild("Progression"):WaitForChild("Catalog"))
10: local v_u_9 = require(v5:WaitForChild("CueStickBuilder"))
11: local v_u_10 = require(v5:WaitForChild("CueSkins"))
12: local v_u_11 = require(v5:WaitForChild("CueSkins"):WaitForChild("Motion"))
13: local v_u_12 = require(v5:WaitForChild("CueSkins"):WaitForChild("Textures"))
14: local v_u_13 = require(script.Parent.CueAssets)
15: local v_u_14 = require(script.Parent.CuePiece)
16: local v_u_15 = require(script.Parent.CueVfx)
17: local v_u_16 = require(script.Parent.HudParts)
18: local v_u_17 = require(script.Parent.UIAnim)
19: local v_u_18 = require(script.Parent.People)
20: local v_u_19 = {}
21: v_u_19.__index = v_u_19
22: local function v_u_21(p20) -- name: color
23: 	return Color3.fromRGB(p20[1], p20[2], p20[3])
24: end
25: local v_u_22 = {}
26: function v_u_19.styleFor(p23) -- name: styleFor
27: 	-- upvalues: (copy) v_u_6, (copy) v_u_22, (copy) v_u_10, (copy) v_u_19
28: 	local v24 = v_u_6.Effects.Styles
   ...
46: 				local v36 = v29.Trail.Core
47: 				local v37 = table.clone(v35)
48: 				if v36 then
49: 					for v38, v39 in v36 do
50: 						v37[v38] = v39
51: 					end
52: 				end
53: 				v32.Core = v37
54: 			end
55: 			v26 = {
56: 				["Trail"] = v32
57: 			}
58: 			local v40 = v28.Pocket
59: 			local v41 = v29.Pocket
60: 			local v42 = table.clone(v40)
61: 			if v41 then
62: 				for v43, v44 in v41 do
63: 					v42[v43] = v44
64: 				end
65: 			end
66: 			v26.Pocket = v42
67: 			v26.Skin = v27
68: 			v_u_22[p23] = v26
69: 		end
70: 		return v26
71: 	end
72: 	if p23 == nil or v24[p23] == nil then
73: 		p23 = v25
74: 	end
75: 	local v45 = v_u_22[p23]
76: 	if v45 == nil then
77: 		local v46 = v24[v25]
78: 		local v47 = v24[p23]
79: 		v45 = {}
80: 		local v48 = v46.Trail
81: 		local v49 = v47.Trail
82: 		local v50 = table.clone(v48)
83: 		if v49 then
84: 			for v51, v52 in v49 do
85: 				v50[v51] = v52
86: 			end
87: 		end
88: 		v45.Trail = v50
89: 		local v53 = v46.Pocket
90: 		local v54 = v47.Pocket
91: 		local v55 = table.clone(v53)
92: 		if v54 then
93: 			for v56, v57 in v54 do
94: 				v55[v56] = v57
95: 			end
96: 		end
97: 		v45.Pocket = v55
98: 		v_u_22[p23] = v45
99: 	end
100: 	return v45
101: end
102: function v_u_19.styleOfCue(p58) -- name: styleOfCue
103: 	-- upvalues: (copy) v_u_8, (copy) v_u_6, (copy) v_u_10
104: 	local v59 = v_u_8.get(p58) or v_u_8.get(v_u_6.Cue.DefaultStyle)
105: 	if v59 and v_u_10.has(v59.Id) then
106: 		local v60 = v_u_10.get(v59.Id)
107: 		if v60 and (v60.Style or (v60.TrailEmitters or v60.Pocket)) then
108: 			return "skin:" .. v59.Id
109: 		end
110: 	end
111: 	if v59 then
112: 		return v59.Effect
113: 	else
114: 		return v_u_6.Effects.DefaultStyle
115: 	end
116: end
117: function v_u_19.new(p61, p62) -- name: new
118: 	-- upvalues: (copy) v_u_6, (copy) v_u_19
119: 	local v63 = Instance.new("Folder")
   ...
163: 				p_u_69.followConnection = nil
164: 			end
165: 			p_u_69.followId = p70
166: 			p_u_69.followPlayer = nil
167: 		end
168: 		local v_u_71 = v_u_18.owner(p70)
169: 		if v_u_71 == nil then
170: 			p_u_69:setStyle(v_u_6.Effects.DefaultStyle)
171: 		else
172: 			p_u_69.followPlayer = v_u_71
173: 			local function v72() -- name: dress
174: 				-- upvalues: (copy) p_u_69, (ref) v_u_19, (ref) v_u_9, (copy) v_u_71
175: 				p_u_69:setStyle(v_u_19.styleOfCue(v_u_9.equippedCue(v_u_71)))
176: 			end
177: 			p_u_69.followConnection = v_u_71:GetAttributeChangedSignal(v_u_6.Cue.EquippedAttribute):Connect(v72)
178: 			p_u_69:setStyle(v_u_19.styleOfCue(v_u_9.equippedCue(v_u_71)))
179: 		end
180: 	end
181: end
182: local functi

===== Players.Ranscripts.PlayerScripts.Client.PowerCue =====
1: local v_u_1 = game:GetService("ContentProvider")
2: local v2 = game:GetService("ReplicatedStorage")
3: local v_u_3 = game:GetService("RunService")
4: local v_u_4 = game:GetService("TweenService")
5: local v_u_5 = game:GetService("UserInputService")
6: local v6 = v2:WaitForChild("Shared")
7: local v_u_7 = require(v6:WaitForChild("Config"))
8: local v_u_8 = require(v6:WaitForChild("Strings"))
9: local v_u_9 = require(v6:WaitForChild("CueArt"))
10: local v_u_10 = require(v6:WaitForChild("CueStickBuilder"))
11: local v_u_11 = require(v6:WaitForChild("Progression"):WaitForChild("Catalog"))
12: local v_u_12 = require(v6:WaitForChild("CueSkins"))
13: local v_u_13 = require(v6:WaitForChild("PullGesture"))
14: local v_u_14 = require(script.Parent.HudParts)
15: local v_u_15 = require(script.Parent.TutorialAnchors)
16: local v_u_16 = v_u_7.UI.Kit
17: local v_u_17 = {}
18: v_u_17.__index = v_u_17
19: local function v_u_19(p18) -- name: rgb
20: 	return Color3.fromRGB(p18[1], p18[2], p18[3])
21: end
22: local function v_u_35(p20, p21, p22) -- name: rainbowAt
23: 	-- upvalues: (copy) v_u_7
24: 	local v23 = v_u_7.Ranks.ChatRainbow
   ...
28: 		local v27 = (v26 / 12 - p20) % 1 * v24
29: 		local v28 = math.floor(v27)
30: 		local v29 = v23[v28 % v24 + 1]
31: 		local v30 = Color3.fromRGB(v29[1], v29[2], v29[3])
32: 		local v31 = v23[(v28 + 1) % v24 + 1]
33: 		local v32 = p21:Lerp(v30:Lerp(Color3.fromRGB(v31[1], v31[2], v31[3]), v27 - v28), p22)
34: 		local v33 = ColorSequenceKeypoint.new
35: 		local v34 = v26 / 12
36: 		table.insert(v25, v33(v34, v32))
37: 	end
38: 	return ColorSequence.new(v25)
39: end
40: local function v_u_56(p36, p37, p38) -- name: buildCue
41: 	-- upvalues: (copy) v_u_7, (copy) v_u_11, (copy) v_u_12, (copy) v_u_1, (copy) v_u_9
42: 	local v39 = v_u_7.UI
43: 	local v40 = v_u_11.style(p37)
44: 	local v41 = Instance.new("Frame")
45: 	v41.Name = "Cue"
46: 	v41.AnchorPoint = Vector2.new(0.5, 0)
47: 	v41.Position = UDim2.fromScale(0.5, 0)
48: 	v41.Size = UDim2.new(0, p38, v_u_7.UI.PowerCueLengthScale, 0)
49: 	v41.BackgroundTransparency = 1
50: 	v41.ZIndex = 2
51: 	v41.Parent = p36
52: 	local v42 = v_u_11.get(p37)
53: 	local v43 = v_u_12.index
54: 	if v42 then
55: 		p37 = v42.Id
56: 	end
57: 	local v44 = v43(p37)
58: 	if not v44 or v44.Thumb == "" then
59: 		local v45 = v_u_9.slices(v40, v39.PowerCueSlices)
60: 		for v46, v47 in v45 do
61: 			local v48 = Instance.new("Frame")
62: 			v48.Name = ("Slice%02d"):format(v46)
63: 			v48.AnchorPoint = Vector2.new(0.5, 0)
64: 			v48.Position = UDim2.fromScale(0.5, v47.offset)
65: 			local v49 = UDim2.new
66: 			local v50 = v47.width * p38
67: 			local v51 = math.round(v50)
68: 			v48.Size = v49(0, math.max(1, v51), v47.length, 1)
69: 			local v52 = v47.color
70: 			v48.BackgroundColor3 = Color3.fromRGB(v52[1], v52[2], v52[3])
71: 			v48.BorderSizePixel = 0
   ...
79: 			v53.Parent = v48
80: 		end
81: 		return v41
82: 	end
83: 	local v_u_54 = Instance.new("ImageLabel")
84: 	v_u_54.Name = "Art"
85: 	v_u_54.BackgroundTransparency = 1
86: 	v_u_54.Image = v44.Thumb
87: 	v_u_54.ScaleType = Enum.ScaleType.Fit
88: 	v_u_54.AnchorPoint = Vector2.new(0.5, 0.5)
89: 	v_u_54.Position = UDim2.fromScale(0.5, 0.5)
90: 	v_u_54.SizeConstraint = Enum.SizeConstraint.RelativeYY
91: 	local v55 = 1 / v39.PowerCueArtLength
92: 	v_u_54.Size = UDim2.fromScale(v55, v55)
93: 	v_u_54.Rotation = -v39.PowerCueArtLeanDegrees
94: 	v_u_54.ZIndex = 2
95: 	v_u_54.Parent = v41
96: 	task.spawn(function()
97: 		-- upvalues: (ref) v_u_1, (copy) v_u_54
98: 		v_u_1:PreloadAsync({ v_u_54 })
99: 	end)
100: 	return v41
101: end
102: function v_u_17.new(p57, p58) -- name: new
103: 	-- upvalues: (copy) v_u_7, (copy) v_u_16, (copy) v_u_15, (copy) v_u_19, (copy) v_u_35, (copy) v_u_56, (copy) v_u_14, (copy) v_u_8, (copy) v_u_17
104: 	local v59 = v_u_7.UI
105: 	local v60 = Instance.new("ScreenGui")
106: 	v60.Name = "PowerSafeProbe"
107: 	v60.ScreenInsets = Enum.ScreenInsets.None
108: 	v60.IgnoreGuiInset = true
109: 	v60.ResetOnSpawn = fals

===== Players.Ranscripts.PlayerScripts.Client.SpinSelector =====
   ...
88: 	v_u_39.BackgroundTransparency = v_u_36.OverlayTransparency
89: 	v_u_39.AutoButtonColor = false
90: 	v_u_39.Selectable = false
91: 	v_u_39.Visible = false
92: 	local v_u_41 = v_u_16(v_u_38, "SpinToggle", "")
93: 	v_u_41.AnchorPoint = Vector2.new(0, 0.5)
94: 	v_u_41.Position = UDim2.new(0, v_u_36.ToggleMarginPx, 0.5, 0)
95: 	v_u_41.BackgroundTransparency = 1
96: 	v_u_41.Size = UDim2.fromOffset(v_u_36.ToggleSizePx, v_u_36.ToggleSizePx)
97: 	v_u_41.ZIndex = v_u_39.ZIndex + 1
98: 	local v42 = v_u_36.ToggleSizePx
99: 	local v_u_43 = Instance.new("Frame")
100: 	v_u_43.Name = "CueBall"
101: 	v_u_43.Size = UDim2.fromOffset(v42, v42)
102: 	local v44 = v_u_36.BallColor
103: 	v_u_43.BackgroundColor3 = Color3.fromRGB(v44[1], v44[2], v44[3])
104: 	v_u_43.BorderSizePixel = 0
105: 	v_u_43.ZIndex = v_u_41.ZIndex + 1
106: 	v_u_43.Parent = v_u_41
107: 	local v45 = UDim.new(0.5, 0)
108: 	local v46 = Instance.new("UICorner")
109: 	v46.CornerRadius = v45
110: 	v46.Parent = v_u_43
111: 	v_u_43.AnchorPoint = Vector2.new(0.5, 0.5)
112: 	v_u_43.Position = UDim2.fromScale(0.5, 0.5)
   ...
118: 	v48.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
119: 	v48.Parent = v_u_43
120: 	local v50 = Instance.new("ImageLabel")
121: 	v50.Name = "Gloss"
122: 	v50.BackgroundTransparency = 1
123: 	v50.Image = v_u_7.Art.BallGloss
124: 	v50.Size = UDim2.fromScale(1, 1)
125: 	v50.ZIndex = v_u_43.ZIndex + 1
126: 	v50.Parent = v_u_43
127: 	v_u_43.Active = false
128: 	v_u_43.Selectable = false
129: 	local v_u_51 = v_u_33(v_u_43, v_u_36.IconDotSizePx)
130: 	local v_u_52 = v_u_6.text(v_u_41, "CueAngle", v_u_36.TextSizePx, "")
131: 	v_u_52.TextWrapped = false
132: 	v_u_52.AnchorPoint = Vector2.new(0.5, 0)
133: 	v_u_52.Position = UDim2.new(0.5, 0, 1, 6)
134: 	v_u_52.Size = UDim2.new(1, 0, 0, v_u_36.AngleBadgeHeightPx)
135: 	v_u_52.BackgroundTransparency = 0
136: 	local v53 = v_u_7.Colors.Blue
137: 	v_u_52.BackgroundColor3 = Color3.fromRGB(v53[1], v53[2], v53[3])
138: 	v_u_52.BorderSizePixel = 0
139: 	v_u_52.ZIndex = v_u_41.ZIndex + 1
140: 	v_u_52.Visible = false
141: 	local v54 = UDim.new(0.5, 0)
142: 	local v55 = Instance.new("UICorner")
   ...
155: 	v_u_59.Active = false
156: 	v_u_59.ZIndex = v_u_41.ZIndex + 1
157: 	v_u_59.Visible = false
158: 	v_u_59.Parent = v_u_38
159: 	local v_u_60 = v_u_36.BallSizePx + v_u_36.GapPx + v_u_36.AngleColumnPx
160: 	local v61 = v_u_36.PanelWidthPx
161: 	local v62 = v_u_60 + v_u_36.MarginPx * 2
162: 	local v_u_63 = math.max(v61, v62)
163: 	local v64 = v_u_36.MarginPx
164: 	local v_u_65 = v_u_26(v_u_59, "StrikeTarget", v_u_36.BallSizePx)
165: 	v_u_65.Selectable = false
166: 	local v_u_66 = v_u_33(v_u_65, v_u_36.DotSizePx)
167: 	local v_u_67 = v_u_16(v_u_59, "CueAngle", "")
168: 	v_u_67.BackgroundTransparency = 1
169: 	v_u_67.AutoButtonColor = false
170: 	v_u_67.Selectable = false
171: 	local v_u_68 = Instance.new("Frame")
172: 	v_u_68.Name = "Track"
173: 	v_u_68.AnchorPoint = Vector2.new(0.5, 0)
174: 	local v69 = v_u_7.Colors.White
175: 	v_u_68.BackgroundColor3 = Color3.fromRGB(v69[1], v69[2], v69[3])
176: 	v_u_68.BorderSizePixel = 0
177: 	v_u_68.Active = false
178: 	v_u_68.ZIndex = v_u_67.ZIndex + 1
179: 	v_u_68.Parent = v_u_67
   ...
271: 		["toggle"] = nil,
272: 		["badge"] = nil,
273: 		["input"] = nil,
274: 		["enabled"] = true,
275: 		["root"] = v_u_38,
276: 		["toggle"] = v_u_41,
277: 		["badge"] = v_u_52,
278: 		["input"] = p_u_35
279: 	}, v100)
280: 	local v_u_102 = nil
281: 	local function v109(p103, p104) -- name: refresh
282: 		-- upvalues: (ref) v_u_4, (copy) v_u_36, (copy) v_u_66, (copy) v_u_51
283: 		local v105 = p103 / v_u_4.Cue.MaxSpinOffset
284: 		local v106 = p104 / v_u_4.Cue.MaxSpinOffset
285: 		local v107 = v_u_36.DotSizePx / 2
286: 		v_u_66.Position = UDim2.new(0.5 + v105 / 2, -v105 * v107, 0.5 - v106 / 2, v106 * v107)
287: 		local v108 = v_u_36.IconDotSizePx / 2
288: 		v_u_51.Position = UDim2.new(0.5 + v105 / 2, -v105 * v108, 0.5 - v106 / 2, v106 * v108)
289: 	end
290: 	p_u_35:onSpin(v109)
291: 	v109(p_u_35.spinX,

===== Players.Ranscripts.PlayerScripts.Client.MatchHUD =====
   ...
499: 	local v155 = v_u_85(v153)
500: 	table.insert(v154, v155)
501: 	local v156 = v_u_85(v153)
502: 	table.insert(v154, v156)
503: 	local v157 = v_u_85(v153)
504: 	table.insert(v154, v157)
505: 	local v158 = {}
506: 	for _ = 1, 8 do
507: 		local v159 = v_u_9.ball
508: 		table.insert(v158, v159(v153))
509: 	end
510: 	local v160 = v_u_9.note(v153, "OpenTable", v_u_19.StatusSize, v_u_17.OpenTable)
511: 	local v161 = v_u_25(v153, "OpenPocketed")
512: 	local v162 = {}
513: 	for v163 = 1, 15 do
514: 		if v163 == 8 then
515: 			continue
516: 		end
517: 		local v164 = v_u_9.ball(v161)
518: 		v164.id = v163
519: 		table.insert(v162, v164)
520: 	end
521: 	return {
522: 		["root"] = nil,
523: 		["portraits"] = nil,
   ...
542: 	v_u_169.snapshot = nil
543: 	v_u_169.localUserId = not v_u_1.LocalPlayer and 0 or v_u_1.LocalPlayer.UserId
544: 	v_u_169.lastNow = workspace:GetServerTimeNow()
545: 	v_u_169.connections = {}
546: 	v_u_169.alive = true
547: 	v_u_169.placing = false
548: 	v_u_169.placingBlocked = false
549: 	v_u_169.invalidTarget = false
550: 	v_u_169.modalMode = nil
551: 	v_u_169.respondedVote = nil
552: 	v_u_169.width = 0
553: 	v_u_169.avatarCache = {}
554: 	v_u_169.shoneTurn = nil
555: 	v_u_169.downIds = {}
556: 	v_u_169.root = v_u_25(p166, "MultiplayerHUD")
557: 	v_u_169.root.ZIndex = 2
558: 	v_u_169.root.Size = UDim2.fromScale(1, 1)
559: 	v_u_169.root.Visible = false
560: 	local v170 = Instance.new("ScreenGui")
561: 	v170.Name = "TopbarRoom"
562: 	v170.ScreenInsets = Enum.ScreenInsets.TopbarSafeInsets
563: 	v170.ResetOnSpawn = false
564: 	local v171
565: 	if v_u_1.LocalPlayer then
566: 		v171 = v_u_1.LocalPlayer:FindFirstChildOfClass("PlayerGui")
   ...
611: 	v_u_169.noUltsText.TextWrapped = false
612: 	v_u_169.noUlts = false
613: 	v_u_169.redoPill = v_u_9.pill(v_u_169.topBar, "SecondChance", v_u_9.color(v_u_24.PillColor))
614: 	v_u_169.redoPill.Visible = false
615: 	v_u_169.redoText = v_u_27(v_u_169.redoPill, "Words", v_u_7.UI.Ults.NoUltsTextPx, v_u_17.SecondChance:format(v_u_7.Ults.Shared.RewindRedoSeconds))
616: 	v_u_169.redoText.TextWrapped = false
617: 	v_u_169.ultReserve = 0
618: 	v_u_169.leave = v_u_28(v_u_169.topBar, "", function()
619: 		-- upvalues: (copy) v_u_169
620: 		v_u_169:openLeave()
621: 	end, "Red", "Door")
622: 	v_u_9.setMinHit(v_u_169.leave, v_u_19.TouchTargetPx)
623: 	v_u_169.turnGroup = v_u_25(v_u_169.root, "TurnPopup")
624: 	v_u_169.turnGroup.AnchorPoint = Vector2.new(0.5, 0)
625: 	v_u_169.turnGroup.Visible = false
626: 	v_u_169.turnScale = Instance.new("UIScale")
627: 	v_u_169.turnScale.Parent = v_u_169.turnGroup
628: 	v_u_169.turnIcon = v_u_9.icon(v_u_169.turnGroup, "Cue")
629: 	v_u_169.turnTitle = v_u_27(v_u_169.turnGroup, "Title", v_u_19.TurnPopupTitleSize, "")
630: 	v_u_169.turnTitle.TextWrapped = false
631: 	v_u_169.turnBall = v_u_9.ball(v_u_169.turnGroup)
632: 	v_u_169.turnBall.root.Visible = false
633: 	v_u_169.turnIsGroup = false
634: 	v_u_169.turnHeld = false
635: 	v_u_169.popupSeconds = v_u_19.TurnPopupSeconds
636: 	v_u_169.groupEpoch = nil
637: 	v_u_169.knownGroup = nil
638: 	v_u_169.turnKey = ""
639: 	v_u_169.turnShooter = ""
640: 	v_u_169.turnStart = 0
641: 	v_u_169.soloShown = nil
642: 	v_u_169.setup = v_u_9.pill(v_u_169.root, "Setup")
643: 	v_u_169.setup.AnchorPoint = Vector2.new(0.5, 1)
644: 	v_u_169.setupLine = v_u_49(v_u_169.setup, "Hint", "Hand", v_u_19.StatusSize)
645: 	v_u_169.setupLine.root.Size = UDim2.fromScale(1, 1)
646: 	v_u_169.setupLabel = v_u_169.setupLine.text
647: 	v_u_169.setupLabel.TextWrapped = false
648: 	v_u_169.foulGroup = v_u_25(v_u_169.root, "FoulPopup")
649: 	v_u_169.foulGroup.AnchorPoint = Vector2.new(0.5, 0)
650: 	v_u_169.foulGroup.Visible = false
651: 	v_u_169.foulScale = Instance.new("UIScale")
   ...
1206: 	p336.voteProgress.Text = p336.snapshot.solo and "" or v_u_17.ClocksContinue
1207: 	v_u_3.SelectedObject = p336.no
1208: end
1209: function v_u_22.openLeave(p343) -- name: openLeave
1210: 	local v344 = p343.snapshot
1211: 	if v344 and (v344.phase ~= 

===== Players.Ranscripts.PlayerScripts.Client.MatchTargets =====
1: local v_u_1 = game:GetService("ContextActionService")
2: local v2 = game:GetService("ReplicatedStorage")
3: local v_u_3 = game:GetService("UserInputService")
4: local v_u_4 = game:GetService("GuiService")
5: local v5 = v2:WaitForChild("Shared")
6: local v_u_6 = require(v5:WaitForChild("Config"))
7: local v_u_7 = require(v5:WaitForChild("Strings"))
8: local v_u_8 = require(v5:WaitForChild("Placement"))
9: local v_u_9 = require(v5:WaitForChild("PadMath"))
10: local v_u_10 = require(v5:WaitForChild("Bots"):WaitForChild("ShotFinder"))
11: local v11 = v5:WaitForChild("Rules")
12: local v_u_12 = require(v11:WaitForChild("CuePlacement"))
13: local v_u_13 = require(v11:WaitForChild("MatchEngine"))
14: local v_u_14 = require(v11:WaitForChild("ShotJudge"))
15: local v_u_15 = require(script.Parent.HudParts)
16: local v_u_16 = require(script.Parent.PadMode)
17: local v_u_17 = require(script.Parent.TutorialAnchors)
18: local v_u_18 = v_u_6.Multiplayer
19: local v_u_19 = v_u_18.Style
20: local v_u_20 = v_u_15.tone
21: local v_u_21 = {}
22: v_u_21.__index = v_u_21
23: local function v_u_33(p22, p23, p24, p25) -- name: ring
24: 	-- upvalues: (copy) v_u_19, (copy) v_u_20, (copy) v_u_15
   ...
91: local v_u_41 = {
92: 	[Enum.KeyCode.DPadLeft] = Vector2.new(-1, 0),
93: 	[Enum.KeyCode.DPadRight] = Vector2.new(1, 0),
94: 	[Enum.KeyCode.DPadUp] = Vector2.new(0, -1),
95: 	[Enum.KeyCode.DPadDown] = Vector2.new(0, 1)
96: }
97: function v_u_21.new(p42, p43, p44, p45) -- name: new
98: 	-- upvalues: (copy) v_u_21, (copy) v_u_33, (copy) v_u_19, (copy) v_u_20, (copy) v_u_7, (copy) v_u_6, (copy) v_u_17, (copy) v_u_15, (copy) v_u_3
99: 	local v46 = v_u_21
100: 	local v_u_47 = setmetatable({}, v46)
101: 	v_u_47.snapshot = nil
102: 	v_u_47.enabled = true
103: 	v_u_47.onPocket = p43
104: 	v_u_47.onMove = p44
105: 	v_u_47.onCommit = p45
106: 	v_u_47.connections = {}
107: 	v_u_47.pockets = {}
108: 	v_u_47.dots = {}
109: 	v_u_47.elapsed = 0
110: 	v_u_47.previewX = nil
111: 	v_u_47.previewY = nil
112: 	v_u_47.committedX = nil
113: 	v_u_47.committedY = nil
114: 	v_u_47.dirty = false
115: 	v_u_47.seq = 0
   ...
118: 	v_u_47.grabY = 0
119: 	v_u_47.stickHolding = false
120: 	v_u_47.padPick = nil
121: 	v_u_47.padMoved = false
122: 	v_u_47.padBound = false
123: 	v_u_47.blocked = false
124: 	v_u_47.root = Instance.new("Frame")
125: 	v_u_47.root.Name = "MatchSetupTargets"
126: 	v_u_47.root.BackgroundTransparency = 1
127: 	v_u_47.root.Size = UDim2.fromScale(1, 1)
128: 	v_u_47.root.Parent = p42
129: 	for v_u_48 = 1, 6 do
130: 		local v49, v50, v51, v52 = v_u_33(v_u_47.root, "Pocket" .. v_u_48, v_u_19.TargetSize, v_u_20("Blue"))
131: 		v52.Text = string.format(v_u_7.Match.PocketLabel, v_u_48)
132: 		v49.BackgroundColor3 = v_u_20("Gold")
133: 		v49.ZIndex = 2
134: 		local v53 = Instance.new("ImageLabel")
135: 		v53.Name = "PadGlow" .. v_u_48
136: 		v53.AnchorPoint = Vector2.new(0.5, 0.5)
137: 		v53.BackgroundTransparency = 1
138: 		v53.Image = v_u_6.UI.Kit.Art.SoftGlow
139: 		v53.ImageColor3 = v_u_20("Gold")
140: 		v53.ImageTransparency = v_u_19.PadPickGlowTransparency
141: 		v53.Active = false
142: 		v53.Visible = false
143: 		v53.ZIndex = 1
144: 		v53.Parent = v_u_47.root
145: 		local v54 = Instance.new("ImageLabel")
146: 		v54.Name = "PocketArrow" .. v_u_48
147: 		v54.AnchorPoint = Vector2.new(0.5, 0.5)
148: 		v54.BackgroundTransparency = 1
149: 		v54.Image = v_u_6.UI.Kit.Icons.ArrowWhite
150: 		v54.ScaleType = Enum.ScaleType.Fit
151: 		v54.Active = false
152: 		v54.Visible = false
153: 		v54.ZIndex = 3
154: 		v54.Parent = v_u_47.root
155: 		local v55 = v54:Clone()
156: 		v55.Name = "PocketArrowB" .. v_u_48
157: 		v55.Parent = v_u_47.root
158: 		local v_u_56 = {
159: 			["id"] = nil,
160: 			["button"] = nil,
161: 			["stroke"] = nil,
162: 			["ink"] = nil,
163: 			["caption"] = nil,
164: 			["glow"] = nil,
165: 			["arrow"] = nil,
166: 			["arrow2"] = nil,
167: 			["hover"] = false,
168: 			["padHover"] = false,
169: 			["id"] = v_u_48,
170: 			["button"] = v49,
171: 		

===== Players.Ranscripts.PlayerScripts.Client.WatchedShooters =====
1: local v_u_1 = game:GetService("Players")
2: local v2 = game:GetService("ReplicatedStorage")
3: local v_u_3 = game:GetService("Workspace")
4: local v4 = v2:WaitForChild("Shared")
5: local v_u_5 = require(v4:WaitForChild("AimStream"))
6: local v_u_6 = require(v4:WaitForChild("AvatarPose"))
7: local v_u_7 = require(v4:WaitForChild("Config"))
8: local v_u_8 = require(v4:WaitForChild("CueClearance"))
9: local v_u_9 = require(v4:WaitForChild("CueStickBuilder"))
10: local v_u_10 = require(v4:WaitForChild("Placement"))
11: require(v4:WaitForChild("ShooterStance"))
12: local v_u_11 = require(v4:WaitForChild("Rules"):WaitForChild("MatchEngine"))
13: require(script.Parent:WaitForChild("Match"))
14: local v_u_12 = require(script.Parent:WaitForChild("ShooterPoser"))
15: local v_u_13 = require(script.Parent:WaitForChild("People"))
16: local v_u_14 = {}
17: v_u_14.__index = v_u_14
18: local v_u_15 = {
19: 	["Intro"] = true,
20: 	["Placement"] = true,
21: 	["Aiming"] = true
22: }
23: function v_u_14.new(p16) -- name: new
24: 	-- upvalues: (copy) v_u_6, (copy) v_u_10, (copy) v_u_7, (copy) v_u_14
25: 	local v17 = {}
26: 	for _, v18 in p16 do
27: 		local v19 = {
28: 			["cue"] = nil,
29: 			["frame"] = nil,
30: 			["inputs"] = nil,
31: 			["query"] = nil,
32: 			["clearance"] = nil,
33: 			["tableId"] = nil,
   ...
60: 				["body"] = nil,
61: 				["cueX"] = 0,
62: 				["cueY"] = 0,
63: 				["angle"] = 0,
64: 				["spinX"] = 0,
65: 				["spinY"] = 0,
66: 				["pitch"] = nil,
67: 				["pull"] = 0,
68: 				["gap"] = nil,
69: 				["memory"] = nil,
70: 				["placement"] = v_u_10.new(0, 0, 0, 0),
71: 				["body"] = v_u_7.Stance.DefaultBody,
72: 				["pitch"] = v_u_7.Cue.CueElevationDegrees
73: 			},
74: 			["query"] = {
75: 				["cueX"] = 0,
76: 				["cueY"] = 0,
77: 				["angle"] = 0
78: 			},
79: 			["clearance"] = {
80: 				["valid"] = false,
81: 				["angle"] = 0,
82: 				["x"] = 0,
83: 				["y"] = 0,
84: 				["seq"] = 0,
85: 				["version"] = 0,
86: 				["elevation"] = 0,
87: 				["degrees"] = 0
88: 			},
89: 			["elevation"] = v_u_7.Cue.CueElevationDegrees
90: 		}
91: 		v17[v18] = v19
92: 	end
93: 	local v20 = {
94: 		["slots"] = v17,
95: 		["source"] = {
96: 			["cueOf"] = {},
97: 			["snapshots"] = {},
98: 			["matches"] = {},
99: 			["aims"] = {},
100: 			["shots"] = {}
101: 		},
   ...
307: 				if v64:stroking() then
308: 					v64:cancelStroke()
309: 				end
310: 				p53.memory = nil
311: 				p53.pitch = nil
312: 				p53.frozen = false
313: 				p53.strikeSeq = nil
314: 				p53.sincePose = (1 / 0)
315: 				p53.composed = false
316: 			end
317: 			local v67 = p56.aims[p54]
318: 			local v68 = v60:isBusy()
319: 			local v69 = v60:findCueBall()
320: 			local v70 = v_u_15[v59.phase] == true and not v68
321: 			if v70 then
322: 				if v69 == nil then
323: 					v70 = false
324: 				else
325: 					v70 = not v69.pocketed
326: 				end
327: 			end
328: 			local v71
329: 			if v70 then
330: 				if v67 == nil then
331: 					v71 = false
   ...
335: 			else
336: 				v71 = v70
337: 			end
338: 			if v71 and (v67 and v69) then
339: 				local v72 = v67.shown
340: 				local v73 = v69.x
341: 				local v74 = v69.y
342: 				local v75 = v67.shownPull
343: 				p53.angle = v72
344: 				p53.x = v73
345: 				p53.y = v74
346: 				p53.pull = v75
347: 				p53.elevation = v67.elevation or v_u_7.Cue.CueElevationDegrees
348: 			end
349: 			local v76 = not v71 and (v70 and p53.composed)
350: 			if v76 then
351: 				v76 = v64.state == "aim"
352: 			end
353: 			if v68 then
354: 				if p53.strikeSeq == v60.seq then
355: 					v68 = false
356: 				else
357: 					v68 = v64.state == "aim"
358: 				end
359: 			end
   ...
389: 				end
390: 				local v87 = p53.sincePose
391: 				p53.sincePose = 0
392: 				if not p53.frozen or p53.pitch == nil then
393: 					local v88 = v_u_52(p53, v60)
394: 					local v89 = p53.pitch
395: 					if v89 then
396: 						v88 = v_u_8.ease(v89, v88, v87)
397: 					end
398: 					p53.pitch = v88
399: 				end
400: 				local v90 = v_u_6.measureBody(v63) or v_

===== Players.Ranscripts.PlayerScripts.Client.ShooterPoser =====
1: local v1 = game:GetService("ReplicatedStorage"):WaitForChild("Shared")
2: local v_u_2 = require(v1:WaitForChild("AvatarPose"))
3: local v_u_3 = require(v1:WaitForChild("Config"))
4: local v_u_4 = require(v1:WaitForChild("CueStickBuilder"))
5: local v_u_5 = require(v1:WaitForChild("Placement"))
6: local v_u_6 = require(v1:WaitForChild("PoseMath"))
7: local v_u_7 = require(v1:WaitForChild("ShooterStance"))
8: local v_u_8 = {}
9: v_u_8.__index = v_u_8
10: local v_u_9 = v_u_3.Avatar.Profiles
11: local v_u_10 = v_u_7.area()
12: local v_u_11 = {
13: 	["ballXIn"] = 0,
14: 	["ballYIn"] = 0,
15: 	["angle"] = 0,
16: 	["spinX"] = 0,
17: 	["spinY"] = 0,
18: 	["pitchDegrees"] = 0,
19: 	["pull"] = 0,
   ...
28: 	["x"] = 0,
29: 	["y"] = 0
30: }
31: local function v_u_22(p13, p14, p15, p16, p17) -- name: spotAt
32: 	-- upvalues: (copy) v_u_5
33: 	local v18 = v_u_5.fromTableStuds
34: 	local v19 = Vector3.new(v18(p13, p14, p15, p16))
35: 	local v20, _, v21 = v_u_5.aimVector(p13, p17)
36: 	return CFrame.lookAt(v19, v19 + Vector3.new(v20, 0, v21))
37: end
38: function v_u_8.compose(p23, p24) -- name: compose
39: 	-- upvalues: (copy) v_u_3, (copy) v_u_10, (copy) v_u_11, (copy) v_u_7, (copy) v_u_5, (copy) v_u_12, (copy) v_u_4, (copy) v_u_9
40: 	debug.profilebegin("ShooterPoser.compose")
41: 	local v25 = v_u_3.Cue
42: 	local v26 = p23.placement
43: 	local v27 = v_u_10
44: 	local v28 = v_u_11
45: 	local v29 = v_u_11
46: 	local v30 = p23.cueX
47: 	local v31 = p23.cueY
48: 	v28.ballXIn = v30
49: 	v29.ballYIn = v31
50: 	local v32 = v_u_11
51: 	local v33 = v_u_11
52: 	local v34 = v_u_11
53: 	local v35 = p23.angle
   ...
90: 	local v63 = v47.rootY
91: 	local v64 = v47.rootZ
92: 	local v65 = v47.yaw
93: 	local v66 = v_u_5.fromTableStuds
94: 	local v67 = Vector3.new(v66(v26, v62, v63, v64))
95: 	local v68, _, v69 = v_u_5.aimVector(v26, v65)
96: 	p24.root = CFrame.lookAt(v67, v67 + Vector3.new(v68, 0, v69))
97: 	p24.floorY = v26.y
98: 	p24.mode = v47.mode
99: 	p24.supportY = v26.y + v47.supportZ
100: 	p24.lean = v47.lean
101: 	p24.torsoDegrees = v47.torsoDegrees
102: 	local v70 = (v48 - v25.CueRestGapInches * v_u_3.Table.StudsPerInch) / v25.CuePullBackStuds
103: 	p24.pull = math.clamp(v70, 0, 1)
104: 	p24.tip = v61
105: 	p24.gripAlong = v47.gripFromTipStuds
106: 	p24.cueLength = v25.CueLengthStuds
107: 	p24.look = v53
108: 	local v71 = v_u_9[v47.mode]
109: 	if v71 then
110: 		v71 = v71.LiftFrom
111: 	end
112: 	local v72
113: 	if v71 then
114: 		local v73 = v47.lean
115: 		if v71 >= 1 then
116: 			v72 = v73 >= 1 and 1 or 0
117: 		else
118: 			local v74 = (v73 - v71) / (1 - v71)
   ...
664: 		local v265 = v_u_205.lift
665: 		p249.lean = v264
666: 		p249.backLegLift = v265
667: 		local v266 = v_u_205.hand
668: 		local v267 = v_u_205.supportY
669: 		p249.offHand = v266
670: 		p249.supportY = v267
671: 	end
672: end
673: function v_u_8.pose(p269, p270, p271, p272) -- name: pose
674: 	-- upvalues: (copy) v_u_2, (copy) v_u_153, (copy) v_u_6, (copy) v_u_137, (copy) v_u_143, (copy) v_u_128, (copy) v_u_268, (copy) v_u_204
675: 	if not p269.destroyed then
676: 		debug.profilebegin("ShooterPoser")
677: 		local v273 = v_u_2.rig(p269.character)
678: 		local v274
679: 		if v273 then
680: 			v274 = v273.root
681: 		else
682: 			v274 = p269.character:FindFirstChild("HumanoidRootPart")
683: 			v273 = nil
684: 			if not (v274 and v274:IsA("BasePart")) then
685: 				v274 = nil
686: 			end
687: 		end
688: 		if p270 == "rest" then
   ...
788: 			p292.strokeFrom = 0
789: 			p292.movingAt = nil
790: 			p292.idleSpot = nil
791: 		end
792: 	end
793: end
794: function v_u_8.stroking(p294) -- name: stroking
795: 	return p294.state == "stroke"
796: end
797: function v_u_8.setFade(p295, p296, p297) -- name: setFade
798: 	-- upvalues: (copy) v_u_2, (copy) v_u_114
799: 	local v298 = p295.isLocal
800: 	assert(v298, "ShooterPoser.setFade is for the local player\'s own character only")
801: 	if p295.destroyed then
802: 		return
803: 	else
804: 		local v299 = v_u_2.rig(p295.character)
805: 

===== Players.Ranscripts.PlayerScripts.Client.Hub =====
1: local v_u_1 = game:GetService("Players")
2: local v2 = game:GetService("ReplicatedStorage")
3: local v_u_3 = game:GetService("UserInputService")
4: local v_u_4 = game:GetService("Workspace")
5: local v5 = v2:WaitForChild("Shared")
6: local v_u_6 = require(v5:WaitForChild("AimStream"))
7: local v_u_7 = require(v5:WaitForChild("Config"))
8: local v_u_8 = require(v5:WaitForChild("CueStickBuilder"))
9: local v_u_9 = require(v5:WaitForChild("Net"))
10: local v_u_10 = require(v5:WaitForChild("Placement"))
11: local v_u_11 = require(script.Parent:WaitForChild("BallRenderer"))
12: local v_u_12 = require(script.Parent:WaitForChild("CueSkinLook"))
13: local v_u_13 = require(script.Parent:WaitForChild("Match"))
14: local v_u_14 = require(script.Parent:WaitForChild("WatchedShooters"))
15: local v_u_15 = {}
16: v_u_15.__index = v_u_15
17: function v_u_15.new(p16) -- name: new
18: 	-- upvalues: (copy) v_u_10, (copy) v_u_3, (copy) v_u_7, (copy) v_u_11, (copy) v_u_8, (copy) v_u_12, (copy) v_u_14, (copy) v_u_15, (copy) v_u_13, (copy) v_u_9
19: 	local v17 = Instance.new("Folder")
20: 	v17.Name = "Balls"
21: 	v17.Parent = p16
22: 	local v18 = v_u_10.rows()[1]
23: 	local v19 = v_u_10.forTable(v18.id)
24: 	local v20 = {}
25: 	local v21 = {}
26: 	local v22 = v_u_3.TouchEnabled
   ...
29: 	end
30: 	local v23
31: 	if v22 then
32: 		v23 = v_u_7.Hub.RenderedTablesPhone
33: 	else
34: 		v23 = v_u_7.Hub.RenderedTables
35: 	end
36: 	local v24 = v_u_10.tableCount
37: 	for v25 = 1, math.min(v23, v24()) do
38: 		local v26 = v_u_11.new
39: 		table.insert(v20, v26(v17, v19, v25))
40: 		local v27 = v_u_8.build(p16)
41: 		v27.Name = ("WatchedCue_%d"):format(v25)
42: 		v_u_8.setVisible(v27, false)
43: 		v_u_12.attach(v27, {
44: 			["aura"] = true
45: 		})
46: 		table.insert(v21, v27)
47: 	end
48: 	local v28 = {
49: 		["folder"] = nil,
50: 		["matches"] = nil,
51: 		["pool"] = nil,
52: 		["boundTo"] = nil,
53: 		["seats"] = nil,
   ...
93: 		v_u_9.get("SnapshotRequest"):FireServer()
94: 	end)
95: 	return v30
96: end
97: function v_u_15.onSeatChanged(p33, p34) -- name: onSeatChanged
98: 	local v35 = p33.seatListeners
99: 	table.insert(v35, p34)
100: end
101: function v_u_15.onShotRejected(p36, p37) -- name: onShotRejected
102: 	local v38 = p36.rejectListeners
103: 	table.insert(v38, p37)
104: end
105: function v_u_15.reportAim(p39, p40, p41, p42, p43, p44, p45, p46) -- name: reportAim
106: 	-- upvalues: (copy) v_u_9
107: 	local v47 = p39.snapshots[p40]
108: 	if v47 then
109: 		v_u_9.get("AimUpdate"):FireServer(p40, p41, v47.epoch, v47.turnId, p42, p44, p45, p46, p43)
110: 	end
111: end
112: function v_u_15.onSnapshot(p48, p49) -- name: onSnapshot
113: 	local v50 = p48.snapshotListeners
114: 	table.insert(v50, p49)
115: end
116: function v_u_15.action(p51, p52, p53) -- name: action
117: 	-- upvalues: (copy) v_u_9
118: 	local v54 = p51.mySeat
119: 	if v54 then
120: 		v54 = p51.snapshots[p51.mySeat]
121: 	end
   ...
286: 		return
287: 	end
288: end
289: function v_u_15.listen(p_u_94) -- name: listen
290: 	-- upvalues: (copy) v_u_1, (copy) v_u_9, (copy) v_u_6, (copy) v_u_93
291: 	local v_u_95 = v_u_1.LocalPlayer.UserId
292: 	v_u_9.get("ShotRejected").OnClientEvent:Connect(function(p96)
293: 		-- upvalues: (copy) p_u_94
294: 		for _, v97 in p_u_94.rejectListeners do
295: 			v97(typeof(p96) ~= "string" and "?" or p96)
296: 		end
297: 	end)
298: 	v_u_9.get("AimBroadcast").OnClientEvent:Connect(function(p98)
299: 		-- upvalues: (ref) v_u_9, (ref) v_u_6, (copy) p_u_94
300: 		if typeof(p98) == "table" then
301: 			local v99 = {}
302: 			for v100 = 1, #p98, v_u_9.AimStride do
303: 				local v101 = v_u_6.read(p98, v100)
304: 				if not v101 then
305: 					continue
306: 				end
307: 				v99[v101.id] = true
308: 				local v102 = p_u_94.aims[v101.id]
309: 				if v102 and v102.by == v101.by then
310: 					v102.angle = v101.angle
311: 					local v103 = v101.x
312: 					local v104 = v101.y
313: 					v102.x = v103
314: 					v102.y = v104
   ...
390: 			end
391: 		end
392: 	end)
393

===== Players.Ranscripts.PlayerScripts.Client.HudParts =====
   ...
892: 	v290.AnchorPoint = Vector2.new(0.5, 0.5)
893: 	v290.Position = UDim2.fromScale(0.5, 0.52)
894: 	v290.Size = UDim2.fromScale(2, 2)
895: 	v290.ZIndex = 3
896: 	v290.Parent = v288
897: 	local v291 = Instance.new("ImageLabel")
898: 	v291.Name = "Gloss"
899: 	v291.BackgroundTransparency = 1
900: 	v291.Image = v_u_9.Art.BallGloss
901: 	v291.Size = UDim2.fromScale(1, 1)
902: 	v291.ZIndex = 4
903: 	v291.Parent = v282
904: 	local v292 = v_u_10.icon(v281, "X", "Pocketed")
905: 	v292.AnchorPoint = Vector2.new(0.5, 0.5)
906: 	v292.Position = UDim2.fromScale(0.5, 0.5)
907: 	v292.Size = UDim2.fromScale(0.95, 0.95)
908: 	v292.ZIndex = 5
909: 	v292.Visible = false
910: 	local v293 = Instance.new("UIScale")
911: 	v293.Parent = v281
912: 	return {
913: 		["root"] = nil,
914: 		["sphere"] = nil,
915: 		["ring"] = nil,
916: 		["band"] = nil,

===== Players.Ranscripts.PlayerScripts.Client.Progression =====
   ...
5: local v5 = v2:WaitForChild("Shared")
6: local v_u_6 = require(v5:WaitForChild("Config"))
7: local v_u_7 = require(v5:WaitForChild("Net"))
8: local v_u_8 = require(v5:WaitForChild("Progression"):WaitForChild("Ranks"))
9: local v_u_9 = require(script.Parent.Banner)
10: local v_u_10 = require(script.Parent.CashFlyer)
11: local v_u_11 = require(script.Parent.ChatTags)
12: local v_u_12 = require(script.Parent.MoneyRainFx)
13: local v_u_13 = require(script.Parent.OwnerMessage)
14: local v_u_14 = require(script.Parent.InventoryMenu)
15: local v_u_15 = require(script.Parent.ItemState)
16: local v_u_16 = require(script.Parent.BoostPill)
17: local v_u_17 = require(script.Parent.CuePreview)
18: local v_u_18 = require(script.Parent.LuckClover)
19: local v_u_19 = require(script.Parent.MenuColumn)
20: local v_u_20 = require(script.Parent.Menus)
21: local v_u_21 = require(script.Parent.MoneyHud)
22: local v_u_22 = require(script.Parent.Nameplates)
23: local v_u_23 = require(script.Parent.NewRankPopup)
24: local v_u_24 = require(script.Parent.RankHud)
25: local v_u_25 = require(script.Parent.TutorialAnchors)
26: local v_u_26 = require(script.Parent.ResultScreen)
27: local v_u_27 = require(script.Parent.RewardChips)
28: local v_u_28 = require(script.Parent.Roadmap)
29: local v_u_29 = require(script.Parent.RankClaimBlock)
   ...
130: 	-- upvalues: (copy) v_u_8, (copy) v_u_1
131: 	local v93, v94 = v_u_8.at(p92 - 1)
132: 	local v95, v96 = v_u_8.at(p92)
133: 	local v97 = v_u_8.rewardFor(p92)
134: 	local v98 = {
135: 		["kind"] = "Up",
136: 		["before"] = nil,
137: 		["after"] = nil,
138: 		["reward"] = nil,
139: 		["newTier"] = nil,
140: 		["rewards"] = nil,
141: 		["rewardBlocks"] = nil,
142: 		["rewardCues"] = nil,
143: 		["rewardSpins"] = nil,
144: 		["held"] = true,
145: 		["paid"] = true,
146: 		["catchUp"] = nil,
147: 		["before"] = {
148: 			["tier"] = v93,
149: 			["division"] = v94,
150: 			["index"] = p92 - 1
151: 		},
152: 		["after"] = {
153: 			["tier"] = v95,
154: 			["division"] = v96,
   ...
157: 		["reward"] = v97.money,
158: 		["newTier"] = v95 ~= v93,
159: 		["rewards"] = {
160: 			{
161: 				["index"] = p92,
162: 				["money"] = v97.money,
163: 				["blocks"] = table.clone(v97.blocks),
164: 				["cue"] = v97.cue,
165: 				["spins"] = v97.spins
166: 			}
167: 		},
168: 		["rewardBlocks"] = table.clone(v97.blocks),
169: 		["rewardCues"] = v97.cue and { v97.cue } or {},
170: 		["rewardSpins"] = v97.spins
171: 	}
172: 	local v99 = v_u_1.LocalPlayer
173: 	local v100 = v99:GetAttribute("RankCatchUpFrom")
174: 	local v101 = v99:GetAttribute("RankCatchUp")
175: 	local v102
176: 	if type(v100) == "number" and (type(v101) == "number" and v100 < p92) then
177: 		v102 = p92 <= v101
178: 	else
179: 		v102 = false
180: 	end
181: 	v98.catchUp = v102

===== Players.Ranscripts.PlayerScripts.Client.NewRankPopup =====
   ...
2: local v_u_2 = game:GetService("GuiService")
3: local v3 = game:GetService("ReplicatedStorage")
4: local v_u_4 = game:GetService("RunService")
5: local v_u_5 = game:GetService("TweenService")
6: local v_u_6 = game:GetService("UserInputService")
7: local v7 = v3:WaitForChild("Shared")
8: local v_u_8 = require(v7:WaitForChild("Config"))
9: local v_u_9 = require(v7:WaitForChild("Strings"))
10: local v10 = v7:WaitForChild("Progression")
11: local v_u_11 = require(v10:WaitForChild("Format"))
12: local v_u_12 = require(v10:WaitForChild("Ranks"))
13: local v_u_13 = require(script.Parent.ChatTags)
14: local v_u_14 = require(script.Parent.CueThumb)
15: local v_u_15 = require(script.Parent.GuiQA)
16: local v_u_16 = require(script.Parent.HudParts)
17: local v_u_17 = require(script.Parent.RankBadge)
18: local v_u_18 = require(script.Parent.RewardChips)
19: local v_u_19 = require(script.Parent.ScreenBlur)
20: local v_u_20 = require(script.Parent.UIAnim)
21: local v_u_21 = require(script.Parent.UISound)
22: local v_u_22 = v_u_8.UI.Progress.NewRank
23: local v_u_23 = v_u_8.UI.Kit
24: local v_u_24 = v_u_9.Progress
25: local v_u_25 = v_u_8.LuckyBlocks.Order
26: local v_u_26 = {}
   ...
108: 	local v65 = {}
109: 	if p64 > 0 then
110: 		local v66 = {
111: 			["kind"] = "Money",
112: 			["text"] = nil,
113: 			["tint"] = nil,
114: 			["text"] = v_u_11.moneyDelta(p64),
115: 			["tint"] = v_u_27("Green")
116: 		}
117: 		table.insert(v65, v66)
118: 	end
119: 	local v67 = p63.rewardBlocks
120: 	local v68 = p63.rewardCues
121: 	if type(v67) ~= "table" and (type(v68) ~= "table" and p63.preview == true) then
122: 		v67, v68 = v_u_52(p63)
123: 	end
124: 	if type(v67) == "table" then
125: 		for _, v69 in v_u_25 do
126: 			local v70 = v67[v69]
127: 			local v71 = (type(v70) ~= "number" or (v70 ~= v70 or (v70 == (1 / 0) or v70 <= 0))) and 0 or math.floor(v70)
128: 			if v71 <= 0 then
129: 				continue
130: 			end
131: 			local v72 = {
132: 				["kind"] = "Block",
   ...
139: 		end
140: 	end
141: 	local v73 = v_u_18.spinsSpec((v_u_62(p63)))
142: 	if v73 then
143: 		table.insert(v65, v73)
144: 	end
145: 	if type(v68) == "table" then
146: 		for _, v74 in v68 do
147: 			if type(v74) ~= "string" then
148: 				continue
149: 			end
150: 			local v75 = {
151: 				["kind"] = "Cue",
152: 				["id"] = nil,
153: 				["text"] = nil,
154: 				["id"] = v74,
155: 				["text"] = v_u_14.cueName(v74)
156: 			}
157: 			table.insert(v65, v75)
158: 		end
159: 	end
160: 	if p63.newTier == true then
161: 		local v76 = v_u_34(p63.after)
162: 		local v77 = v_u_13.tagFor(v76)
163: 		if v77 then
   ...
427: 		v127.TextWrapped = false
428: 		v127.Position = UDim2.fromOffset(0, v125)
429: 		v127.Size = UDim2.fromOffset(v_u_22.Width, v_u_22.NameHeight)
430: 		v127.ZIndex = 4
431: 		v_u_106.height = v_u_106.height + v_u_22.NameHeight
432: 	end
433: 	local v128 = v_u_22.Width
434: 	v_u_106.width = math.max(v128, v124)
435: 	v110.Size = UDim2.fromOffset(v_u_22.Width, v_u_106.height)
436: 	local v129 = v_u_106.rewardAt + v_u_22.ItemFlyAfter
437: 	for _, v130 in v_u_106.chips do
438: 		local v131 = v130.spec.kind
439: 		if v131 ~= "Block" and (v131 ~= "Cue" and v131 ~= "Spins") or v102.held == true then
440: 			continue
441: 		end
442: 		local v132 = v_u_106.flights
443: 		table.insert(v132, {
444: 			["chip"] = v130,
445: 			["at"] = v129
446: 		})
447: 		v129 = v129 + v_u_22.ItemFlyStagger
448: 	end
449: 	v_u_106.continue = v_u_16.candy(v_u_111, v_u_24.Continue, function()
450: 		-- upvalues: (ref) v_u_21, (copy) p_u_100
451: 		v_u_21.play("Click")

===== Players.Ranscripts.PlayerScripts.Client.Roadmap =====
   ...
4: local v_u_4 = game:GetService("RunService")
5: local v_u_5 = game:GetService("TextService")
6: local v_u_6 = game:GetService("TweenService")
7: local v_u_7 = game:GetService("UserInputService")
8: local v8 = v3:WaitForChild("Shared")
9: local v_u_9 = require(v8:WaitForChild("Config"))
10: local v_u_10 = require(v8:WaitForChild("Strings"))
11: local v11 = v8:WaitForChild("Progression")
12: local v_u_12 = require(v11:WaitForChild("Catalog"))
13: local v_u_13 = require(v11:WaitForChild("Format"))
14: local v_u_14 = require(v11:WaitForChild("Ranks"))
15: local v_u_15 = require(script.Parent.ChatTags)
16: local v_u_16 = require(script.Parent.CueThumb)
17: local v_u_17 = require(script.Parent.HudParts)
18: local v_u_18 = require(script.Parent.MenuFrame)
19: local v_u_19 = require(script.Parent.Menus)
20: local v_u_20 = require(script.Parent.RankBadge)
21: local v_u_21 = require(script.Parent.BlockIcon)
22: require(script.Parent.Stage)
23: local v_u_22 = require(script.Parent.UIAnim)
24: local v_u_23 = require(script.Parent.UISound)
25: local v_u_24 = v_u_9.UI.Progress.Roadmap
26: local v_u_25 = v_u_9.UI.Kit
27: local v_u_26 = v_u_10.Progress
28: local v_u_27 = Enum.Font[v_u_25.Font]
   ...
554: 	p179.rewardsTitle = v182
555: 	local v183 = v_u_17.frame(v181, "Tiles")
556: 	v183.AnchorPoint = Vector2.new(0.5, 0.5)
557: 	p179.tileHolder = v183
558: 	local v184 = Instance.new("UIScale")
559: 	v184.Name = "Nudge"
560: 	v184.Parent = v183
561: 	p179.nudge = v184
562: 	local v185 = {
563: 		["money"] = v_u_130(v183, "Money", "CashStack", v_u_26.RewardMoney, false),
564: 		["block"] = v_u_130(v183, "Block", "Block", nil, false),
565: 		["chat"] = v_u_130(v183, "ChatTag", v_u_40, v_u_26.RewardChatTag, false),
566: 		["cue"] = v_u_130(v183, "Cue", "Cue", nil, true),
567: 		["spins"] = v_u_130(v183, "Spins", "UltSpin", nil, false)
568: 	}
569: 	v185.money.value.AutoLocalize = false
570: 	v185.chat.value.RichText = true
571: 	v185.chat.value.AutoLocalize = false
572: 	v185.block.value.TextYAlignment = Enum.TextYAlignment.Top
573: 	v185.cue.value.TextYAlignment = Enum.TextYAlignment.Top
574: 	v185.spins.value.TextYAlignment = Enum.TextYAlignment.Top
575: 	v185.spins.value.AutoLocalize = false
576: 	p179.tiles = v185
577: 	p179.tileOrder = {
578: 		v185.money,
   ...
1435: 		else
1436: 			v597 = v_u_10.Menus.Rewards.SpinMany:format(v596)
1437: 		end
1438: 		local v598 = v_u_13.moneyDelta(not v594 and 0 or v594.Money)
1439: 		local v_u_599 = v_u_10.Ranks.ChatTag:format(string.upper(v593))
1440: 		local v600, v601 = v_u_560(v594)
1441: 		local v602 = not v600 and "" or (v_u_39[v600] or v600)
1442: 		if v601 > 1 then
1443: 			v602 = v_u_26.RewardBlockCount:format(v602, v601)
1444: 		end
1445: 		local v603
1446: 		if v594 then
1447: 			v603 = v594.Cue
1448: 		else
1449: 			v603 = nil
1450: 		end
1451: 		local v604 = v603 or v_u_12.tierCue(v569)
1452: 		local v605
1453: 		if v604 then
1454: 			v605 = v_u_16.cueName(v604)
1455: 		else
1456: 			v605 = v_u_26.TierCue:format(v593)
1457: 		end
1458: 		v_u_592.money.value.Text = v598
1459: 		v_u_592.block.value.Text = v602
1460: 		v_u_565(v_u_592.block, v600)
1461: 		v_u_592.chat.value.Text = v_u_15.tagFor(v569) or v_u_599
1462: 		v_u_592.cue.value.Text = v605
1463: 		v_u_16.set(v_u_592.cue.icon, v604 or v_u_12.Default)
1464: 		v_u_592.spins.value.Text = v597
1465: 		v_u_592.spins.frame.Visible = v596 > 0
1466: 		local v_u_606 = {}
1467: 		local v_u_607 = {}
1468: 		local v_u_608 = {}

===== Players.Ranscripts.PlayerScripts.Client.PadGuide =====
1: local v1 = game:GetService("ReplicatedStorage"):WaitForChild("Shared")
2: local v_u_2 = require(v1:WaitForChild("Config"))
3: local v3 = require(v1:WaitForChild("Strings"))
4: local v_u_4 = require(script.Parent.HudParts)
5: local v_u_5 = require(script.Parent.PadMode)
6: local v_u_6 = v_u_2.UI.PadGuide
7: local v7 = v3.PadGuide
8: local v8 = v3.Ults.Pick.Pad
9: local v9 = v_u_2.Input.Gamepad.Shoot
10: local v_u_10 = {
11: 	{
12: 		["set"] = "aim",
13: 		["row"] = 1,
14: 		["keys"] = nil,
15: 		["arrows"] = "sideways",
16: 		["words"] = nil,
17: 		["keys"] = { Enum.KeyCode.Thumbstick1 },
18: 		["words"] = v7.Turn
19: 	},
20: 	{
21: 		["set"] = "aim",
22: 		["row"] = 1,
23: 		["keys"] = nil,
24: 		["words"] = nil,
25: 		["keys"] = { Enum.KeyCode.DPadLeft, Enum.KeyCode.DPadRight },
26: 		["words"] = v7.FineAim
27: 	},
28: 	{
29: 		["set"] = "aim",
30: 		["row"] = 1,
31: 		["keys"] = nil,
32: 		["arrows"] = "updown",
33: 		["words"] = nil,
34: 		["keys"] = { Enum.KeyCode.Thumbstick2 },
35: 		["words"] = v7.Zoom
36: 	},
37: 	{
38: 		["set"] = "aim",
39: 		["row"] = 2,
40: 		["keys"] = nil,
41: 		["words"] = nil,
42: 		["keys"] = { (v_u_5.key(v9.Up)) },
43: 		["words"] = v7.PowerUp
44: 	},
45: 	{
46: 		["set"] = "aim",
47: 		["row"] = 2,
48: 		["keys"] = nil,
49: 		["words"] = nil,
50: 		["keys"] = { (v_u_5.key(v9.Down)) },
51: 		["words"] = v7.PowerDown
52: 	},
53: 	{
54: 		["set"] = "aim",
55: 		["row"] = 2,
56: 		["keys"] = nil,
57: 		["words"] = nil,
58: 		["keys"] = { (v_u_5.key(v9.Fire)) },
59: 		["words"] = v7.Shoot
60: 	},
61: 	{
62: 		["set"] = "aim",
63: 		["row"] = 3,
64: 		["keys"] = nil,
65: 		["words"] = nil,
66: 		["keys"] = { Enum.KeyCode.ButtonL1 },
67: 		["words"] = v7.SpinAngle
68: 	},
69: 	{
70: 		["set"] = "aim",
71: 		["row"] = 3,
   ...
111: 	},
112: 	{
113: 		["set"] = "call",
114: 		["row"] = 1,
115: 		["keys"] = nil,
116: 		["words"] = nil,
117: 		["keys"] = {
118: 			Enum.KeyCode.DPadLeft,
119: 			Enum.KeyCode.DPadRight,
120: 			Enum.KeyCode.DPadUp,
121: 			Enum.KeyCode.DPadDown
122: 		},
123: 		["words"] = v7.MovePocket
124: 	},
125: 	{
126: 		["set"] = "call",
127: 		["row"] = 1,
128: 		["keys"] = nil,
129: 		["words"] = nil,
130: 		["keys"] = { Enum.KeyCode.ButtonA },
131: 		["words"] = v7.PickPocket
132: 	},
133: 	{
134: 		["set"] = "block",
135: 		["row"] = 1,
136: 		["keys"] = nil,
137: 		["words"] = nil,
138: 		["keys"] = { Enum.KeyCode.ButtonR2 },
139: 		["words"] = v7.PlaceBlock
140: 	},
141: 	{
142: 		["set"] = "block",
143: 		["row"] = 1,

===== Players.Ranscripts.PlayerScripts.Client.CueThumb =====
1: local v1 = game:GetService("ReplicatedStorage")
2: local v_u_2 = game:GetService("RunService")
3: local v3 = v1:WaitForChild("Shared")
4: local v4 = require(v3:WaitForChild("Config"))
5: local v_u_5 = require(v3:WaitForChild("Strings"))
6: local v_u_6 = require(v3:WaitForChild("Progression"):WaitForChild("Catalog"))
7: local v_u_7 = require(v3:WaitForChild("CueSkins"))
8: local v_u_8 = v4.UI.Kit
9: local v_u_9 = v_u_8.Icons
10: local v_u_10 = v_u_8.Rarity
11: local v_u_11 = v4.UI.Menu.Rarity
12: local v_u_12 = v4.UI.Menu.Thumb
13: local v_u_13 = v4.Ranks.Colors
14: local v_u_14 = {}
15: local function v_u_16(p15) -- name: rgb
16: 	return Color3.fromRGB(p15[1], p15[2], p15[3])
17: end
18: local function v_u_25(p17, p18) -- name: darker
19: 	local v19 = {}
20: 	local v20 = p17[1] * p18 + 0.5
21: 	local v21 = math.floor(v20)
22: 	local v22 = p17[2] * p18 + 0.5
23: 	local v23 = math.floor(v22)
24: 	local v24 = p17[3] * p18 + 0.5
25: 	__set_list(v19, 1, {v21, v23, (math.floor(v24))})
26: 	return v19
27: end
28: local v_u_26 = {
29: 	{
30: 		["name"] = "Outline",
31: 		["icon"] = "CueOutline"
32: 	},
33: 	{
34: 		["name"] = "Shaft",
35: 		["icon"] = "CueShaft"
36: 	},
37: 	{
38: 		["name"] = "Tip",
39: 		["icon"] = "CueTip"
40: 	},
41: 	{
42: 		["name"] = "Ring",
43: 		["icon"] = "CueRing"
44: 	},
45: 	{
46: 		["name"] = "Forearm",
47: 		["icon"] = "CueForearm"
48: 	},
49: 	{
50: 		["name"] = "Rainbow",
51: 		["icon"] = "CueRainbow"
52: 	},
53: 	{
54: 		["name"] = "Accent",
55: 		["icon"] = "CueAccent"
56: 	},
57: 	{
58: 		["name"] = "Wrap",
59: 		["icon"] = "CueWrap"
60: 	},
61: 	{
62: 		["name"] = "Cap",
63: 		["icon"] = "CueCap"
64: 	},
65: 	{
66: 		["name"] = "Gloss",
67: 		["icon"] = "CueGloss"
68: 	},
69: 	{
70: 		["name"] = "Silhouette",
71: 		["icon"] = "CueSilhouette"
72: 	}
73: }
74: local v_u_27 = Color3.new(1, 1, 1)
75: function v_u_14.new(p28, p29, p30) -- name: new
76: 	-- upvalues: (copy) v_u_26, (copy) v_u_9, (copy) v_u_14
77: 	local v31 = Instance.new("Frame")
78: 	v31.Name = "CueThumb"
79: 	v31.BackgroundTransparency = 1
80: 	v31.BorderSizePixel = 0
81: 	v31.Size = UDim2.fromScale(1, 1)
82: 	for v32, v33 in v_u_26 do
83: 		local v34 = Instance.new("ImageLabel")
84: 		v34.Name = v33.name
85: 		v34.BackgroundTransparency = 1
86: 		v34.BorderSizePixel = 0
87: 		v34.ScaleType = Enum.ScaleType.Fit
88: 		v34.Size = UDim2.fromScale(1, 1)
89: 		v34.Image = v_u_9[v33.icon] or ""
90: 		v34.ZIndex = v32
   ...
145: 				local v50
146: 				if v46 then
147: 					local v51 = v_u_12.SilhouetteColor
148: 					v50 = Color3.fromRGB(v51[1], v51[2], v51[3])
149: 				else
150: 					v50 = v_u_27
151: 				end
152: 				v48.ImageColor3 = v50
153: 			end
154: 		end
155: 		local v52
156: 		if v46 then
157: 			v52 = (v_u_9.CueSilhouette or "") == ""
158: 		else
159: 			v52 = v46
160: 		end
161: 		local v53 = {
162: 			["Shaft"] = v45.Shaft,
163: 			["Tip"] = v45.Tip or v_u_12.TipColor,
164: 			["Ring"] = v45.Ring,
165: 			["Forearm"] = v45.Forearm,
166: 			["Accent"] = v45.Accent,
167: 			["Wrap"] = v45.Wrap,
168: 			["Cap"] = v45.Cap or v_u_25(v45.Wrap, v_u_12.CapShade)
169: 		}
   ...
245: end
246: function v_u_14.rarityOf(p65) -- name: rarityOf
247: 	-- upvalues: (copy) v_u_6
248: 	local v66 = v_u_6.get(p65)
249: 	return not v66 and "Default" or v66.Rarity
250: end
251: function v_u_14.rarityName(p67) -- name: rarityName
252: 	-- upvalues: (copy) v_u_5
253: 	return v_u_5.Items.Rarities[p67] or p67
254: end
255: function v_u_14.cueName(p68) -- name: cueName
256: 	-- upvalues: (copy) v_u_5
257: 	return v_u_5.Items.Cues[p68] or p68
258: end
259: local v_u_69 = {}
260: local v_u_70 = nil
261: local v_u_71 = {
262: 	{ 0.18, 0.2 },
263: 	{ 0.8, 0.14 },
264: 	{ 0.62, 0.42 },
265: 	{ 0.26, 0.58 },
266: 	{ 0.86, 0.66 },
267: 	{ 0.44, 0.12 },
268: 	{ 0.12, 0.84 }
269: }

===== Players.Ranscripts.PlayerScripts.Client.MenuColumn =====
1: local v_u_1 = game:GetService("Players")
2: local v_u_2 = game:GetService("ProximityPromptService")
3: local v3 = game:GetService("ReplicatedStorage")
4: local v_u_4 = game:GetService("TextService")
5: local v_u_5 = game:GetService("UserInputService")
6: local v_u_6 = game:GetService("GuiService")
7: local v7 = v3:WaitForChild("Shared")
8: local v_u_8 = require(v7:WaitForChild("Config"))
9: local v9 = require(v7:WaitForChild("Strings"))
10: local v_u_10 = require(script.Parent.CuesStrike)
11: local v_u_11 = require(script.Parent.GuiQA)
12: local v_u_12 = require(script.Parent.HudParts)
13: local v_u_13 = require(script.Parent.PadMode)
14: local v_u_14 = require(script.Parent.ItemState)
15: local v_u_15 = require(script.Parent.LuckyClient)
16: local v_u_16 = require(script.Parent.UIAnim)
17: local v_u_17 = require(script.Parent.UISound)
18: local v_u_18 = require(script.Parent.UltSpinState)
19: local v_u_19 = require(script.Parent.TutorialAnchors)
20: local v_u_20 = v_u_8.UI.Menu.Column
21: local v_u_21 = v_u_8.Multiplayer.Style
22: local v_u_22 = v_u_8.UI.Kit
   ...
763: 		if p265.dot.Visible then
764: 			v_u_16.bounce(p265.dot)
765: 		end
766: 	end
767: 	if v267 ~= p265.dot.Visible then
768: 		if v267 then
769: 			v_u_16.popIn(p265.dot)
770: 			return
771: 		end
772: 		p265.dot.Visible = false
773: 	end
774: end
775: local function v_u_274() -- name: newCues
776: 	-- upvalues: (copy) v_u_14
777: 	local v269 = v_u_14.items()
778: 	local v270
779: 	if type(v269) == "table" then
780: 		local v271 = v269.cues
781: 		v270 = type(v271) ~= "table" and {} or v269.cues
782: 	else
783: 		v270 = {}
784: 	end
785: 	local v272 = 0
786: 	for _, v273 in v270 do
787: 		if type(v273) ~= "table" or v273.new ~= true then

===== Players.Ranscripts.PlayerScripts.Client.Banner =====
1: local v_u_1 = game:GetService("Players")
2: local v2 = game:GetService("ReplicatedStorage")
3: local v_u_3 = game:GetService("TextService")
4: local v4 = v2:WaitForChild("Shared")
5: local v_u_5 = require(v4:WaitForChild("Config"))
6: local v_u_6 = require(v4:WaitForChild("Net"))
7: local v_u_7 = require(v4:WaitForChild("Strings"))
8: local v_u_8 = require(v4:WaitForChild("Progression"):WaitForChild("Format"))
9: local v_u_9 = require(v4:WaitForChild("Ults"):WaitForChild("Catalog"))
10: local v_u_10 = require(script.Parent.ChatTags)
11: local v_u_11 = require(script.Parent.CueThumb)
12: local v_u_12 = require(script.Parent.HudParts)
13: local v_u_13 = require(script.Parent.Menus)
14: local v_u_14 = require(script.Parent.PullCutscene)
15: local v_u_15 = require(script.Parent.UIAnim)
16: local v_u_16 = require(script.Parent.UISound)
17: local v_u_17 = v_u_5.UI.Menu.Banner
18: local v_u_18 = v_u_5.Multiplayer.Style
19: local v_u_19 = v_u_5.UI.Kit
20: local v_u_20 = v_u_7.Banner
21: local v_u_21 = Enum.Font[v_u_19.Font]
22: local v_u_22 = v_u_5.UI.Progress.RankHud.ReyesColors
23: local function v_u_32(p23) -- name: sequence
   ...
50: end
51: function v_u_33.new(p38, p39) -- name: new
52: 	-- upvalues: (copy) v_u_33, (copy) v_u_12, (copy) v_u_17, (copy) v_u_19, (copy) v_u_32, (copy) v_u_22, (copy) v_u_20, (copy) v_u_13, (copy) v_u_5, (copy) v_u_6
53: 	local v40 = v_u_33
54: 	local v_u_41 = setmetatable({}, v40)
55: 	v_u_41.screen = p38
56: 	v_u_41.avoid = p39 and p39.avoid or {}
57: 	v_u_41.alive = true
58: 	v_u_41.inMatch = false
59: 	v_u_41.queue = {}
60: 	v_u_41.current = nil
61: 	v_u_41.currentUntil = 0
62: 	v_u_41.partyTurnUntil = 0
63: 	v_u_41.up = false
64: 	v_u_41.shownKey = nil
65: 	v_u_41.fallbackPartyEnds = nil
66: 	v_u_41.fallbackPartyBuyer = nil
67: 	v_u_41.restartSaid = nil
68: 	v_u_41.connections = {}
69: 	local v42 = v_u_12.frame(p38, "Banner")
70: 	v42.AnchorPoint = Vector2.new(0.5, 0)
71: 	v42.ZIndex = v_u_17.ZIndex
72: 	v42.Visible = false
73: 	v_u_41.root = v42
74: 	local v43 = v_u_12.card(v42, "Card", v_u_19.PillCornerPx)
   ...
117: 				if type(p54) == "table" then
118: 					v_u_41:onBanner(p54)
119: 				end
120: 			end
121: 			table.insert(v52, v53:Connect(v55))
122: 		else
123: 			warn("[8ball] Banner: no Banner remote")
124: 		end
125: 	end)
126: 	task.spawn(function()
127: 		-- upvalues: (ref) v_u_6, (copy) v_u_41
128: 		local v56 = v_u_6.get
129: 		local v57, v58 = pcall(v56, "CueFound")
130: 		if v57 and (typeof(v58) == "Instance" and v58:IsA("RemoteEvent")) then
131: 			local v59 = v_u_41.connections
132: 			local v60 = v58.OnClientEvent
133: 			local function v62(p61)
134: 				-- upvalues: (ref) v_u_41
135: 				if type(p61) == "table" then
136: 					v_u_41:onFound(p61)
137: 				end
138: 			end
139: 			table.insert(v59, v60:Connect(v62))
140: 		else
141: 			warn("[8ball] Banner: no CueFound remote")
142: 		end
143: 	end)
144: 	task.spawn(function()
145: 		-- upvalues: (copy) v_u_41, (ref) v_u_17
146: 		while v_u_41.alive do
147: 			v_u_41:tick()
148: 			task.wait(v_u_17.TickSeconds)
149: 		end
150: 	end)
151: 	return v_u_41
152: end
153: function v_u_33.onBanner(p63, p64) -- name: onBanner
   ...
439: 		return
440: 	elseif v125 then
441: 		p121:show(v125, v_u_12.tone("Gold"), nil, "restart")
442: 		return
443: 	else
444: 		local v126 = os.clock()
445: 		local v127, v128 = p121:party(v122)
446: 		local v129 = p121.current
447: 		if v129 and p121.currentUntil <= v126 then
448: 			v129 = nil
449: 			p121.current = nil
450: 			if v127 and #p121.queue > 0 then
451: 				p121.partyTurnUntil = v126 + v_u_17.PartyTurnSeconds
452: 			end
453: 		end
454: 		local v130
455: 		if v127 == nil then
456: 			v130 = false
457: 		elseif v126 < p121.partyTurnUntil then
458: 			v130 = true
459: 		else
460: 			v130 = false
461: 		end
462: 		while not v129 and (not v130 and #p121.queue > 0) do
463: 			local v131 = table.remove(p121.queue, 1)
464: 			if v126 - v131.at <= v_u_17.MaxAgeSeconds then
465: 				p121.current = v13

===== Players.Ranscripts.PlayerScripts.Client.InventoryMenu =====
1: local v_u_1 = game:GetService("ContentProvider")
2: local v_u_2 = game:GetService("ContextActionService")
3: local v_u_3 = game:GetService("GuiService")
4: local v4 = game:GetService("ReplicatedStorage")
5: local v_u_5 = game:GetService("UserInputService")
6: local v6 = v4:WaitForChild("Shared")
7: local v7 = require(v6:WaitForChild("Config"))
8: local v_u_8 = require(v6:WaitForChild("Strings"))
9: local v_u_9 = require(v6:WaitForChild("Progression"):WaitForChild("Catalog"))
10: local v_u_10 = require(script.Parent.CashFlyer)
11: local v_u_11 = require(script.Parent.CuesRail)
12: local v_u_12 = require(script.Parent.GuiQA)
13: local v_u_13 = require(script.Parent.HudParts)
14: local v_u_14 = require(script.Parent.InventoryCues)
15: local v_u_15 = require(script.Parent.InventoryIndex)
16: local v_u_16 = require(script.Parent.ItemState)
17: local v_u_17 = require(script.Parent.MenuFrame)
18: local v_u_18 = require(script.Parent.Menus)
19: local v_u_19 = require(script.Parent.UIAnim)
20: local v_u_20 = require(script.Parent.UISound)
21: local v_u_21 = v7.UI.Inventory.Rail
22: local v_u_22 = v_u_8.Menus.Titles
23: local v_u_23 = { "Cues", "Index" }
24: local v_u_24 = Enum.ContextActionPriority.High.Value + 20
25: local v_u_25 = Enum.ContextActionPriority.High.Value + 25
26: return {
27: 	["new"] = function(p26, p_u_27) -- name: new
28: 		-- upvalues: (copy) v_u_17, (copy) v_u_22, (copy) v_u_11, (copy) v_u_18, (copy) v_u_5, (copy) v_u_16, (copy) v_u_3, (copy) v_u_13, (copy) v_u_20, (copy) v_u_19, (copy) v_u_10, (copy) v_u_23, (copy) v_u_14, (copy) v_u_15, (copy) v_u_21, (copy) v_u_8, (copy) v_u_9, (copy) v_u_2, (copy) v_u_25, (copy) v_u_24, (copy) v_u_1, (copy) v_u_12
29: 		local v_u_28 = v_u_17.new(p26, {
30: 			["name"] = "Inventory",
31: 			["title"] = nil,
32: 			["icon"] = nil,
33: 			["money"] = true,
34: 			["moneyPlus"] = nil,
35: 			["title"] = v_u_22.Inventory,
   ...
39: 				v_u_18.open("Shop", "Money")
40: 			end
41: 		})
42: 		local v_u_29 = {
43: 			["frame"] = nil,
44: 			["deps"] = nil,
45: 			["lastItems"] = nil,
46: 			["frame"] = v_u_28,
47: 			["deps"] = p_u_27
48: 		}
49: 		local v_u_30 = {}
50: 		local v_u_31 = {}
51: 		local v_u_32 = "Cues"
52: 		local v_u_33 = {}
53: 		local v_u_34 = nil
54: 		function v_u_29.span(p35) -- name: span
55: 			-- upvalues: (copy) v_u_28
56: 			local v36 = v_u_28.geo
57: 			local v37 = not v36 and 0 or v36.t
58: 			local v38 = p35[1] + (p35[2] - p35[1]) * v37 + 0.5
59: 			return math.floor(v38)
60: 		end
61: 		function v_u_29.gamepad() -- name: gamepad
62: 			-- upvalues: (ref) v_u_5
63: 			local v39 = v_u_5:GetLastInputType().Name
   ...
85: 			-- upvalues: (copy) v_u_31
86: 			return v_u_31[p44] == true
87: 		end
88: 		function v_u_29.hold(p45, p46) -- name: hold
89: 			-- upvalues: (copy) v_u_31, (ref) v_u_3, (ref) v_u_13, (copy) v_u_29, (copy) v_u_28
90: 			if not v_u_31[p45] then
91: 				v_u_31[p45] = true
92: 				local v47 = v_u_3.SelectedObject == p45
93: 				v_u_13.setEnabled(p45, false, false)
94: 				local v48, v49 = pcall(p46)
95: 				v_u_31[p45] = nil
96: 				if not v48 then
97: 					warn("[8ball] Cues: " .. tostring(v49))
98: 				end
99: 				v_u_29.refresh()
100: 				if v47 and (v_u_28:isOpen() and (v_u_3.SelectedObject == nil and (p45.Parent ~= nil and (p45.Selectable and v_u_29.isShown(p45))))) then
101: 					v_u_3.SelectedObject = p45
102: 				end
103: 				v_u_29.ensureSelection()
104: 			end
105: 		end
106: 		function v_u_29.notice(p50, p51) -- name: notice
107: 			-- upvalues: (copy) v_u_28
108: 			if v_u_28:isOpen() then
109: 				v_u_28:notice(p50, p51)
   ...
145: 				if v60 then
146: 					v60:land(p59)
147: 				else
148: 					v_u_20.play("CashLand")
149: 				end
150: 				local v61 = v_u_28.moneyCash
151: 				if v61 and v_u_28:isOpen() then
152: 					v_u_19.thump(v61)
153: 				end
154: 			end
155: 		}
156: 		local v63 = Instance.new("ScreenGui")
157: 		v63.Name = "CuesCashFlyer"
158: 		v63.ResetOnSpawn = false
159: 		v63.IgnoreGuiInset = true
160: 		v63.Scr

===== Players.Ranscripts.PlayerScripts.Client.TradeMenu =====
1: local v_u_1 = game:GetService("GuiService")
2: local v_u_2 = game:GetService("Players")
3: local v3 = game:GetService("ReplicatedStorage")
4: local v_u_4 = game:GetService("UserInputService")
5: local v5 = v3:WaitForChild("Shared")
6: local v_u_6 = require(v5:WaitForChild("Config"))
7: local v_u_7 = require(v5:WaitForChild("Net"))
8: local v_u_8 = require(v5:WaitForChild("Strings"))
9: local v_u_9 = require(script.Parent.CueThumb)
10: local v_u_10 = require(script.Parent.GuiQA)
11: local v_u_11 = require(script.Parent.HudParts)
12: local v_u_12 = require(script.Parent.ItemState)
13: local v_u_13 = require(script.Parent.MenuFrame)
14: local v_u_14 = require(script.Parent.Menus)
15: local v_u_15 = require(script.Parent.BlockIcon)
16: local v_u_16 = require(script.Parent.UIAnim)
17: local v_u_17 = require(script.Parent.UISound)
18: local v_u_18 = v_u_6.UI.Trade
19: local v_u_19 = v_u_6.UI.Kit
20: local v_u_20 = v_u_8.Trade
21: local v_u_21 = v_u_6.Trade.MaxSideItems

===== Players.Ranscripts.PlayerScripts.Client.LuckyOpening =====
   ...
534: 	end
535: end
536: function v_u_24.sell(p_u_172) -- name: sell
537: 	-- upvalues: (copy) v_u_12, (copy) v_u_8
538: 	local v_u_173 = p_u_172.choice
539: 	local v_u_174 = p_u_172.card
540: 	if v_u_173 and (v_u_174 and not p_u_172.selling) then
541: 		p_u_172.selling = true
542: 		v_u_174:setBusy(true)
543: 		local v_u_175 = p_u_172.playId
544: 		task.spawn(function()
545: 			-- upvalues: (ref) v_u_12, (copy) v_u_173, (copy) p_u_172, (copy) v_u_175, (copy) v_u_174, (ref) v_u_8
546: 			local v176 = v_u_12.request("ItemRequest", "SellCue", v_u_173.cueId, 1)
547: 			p_u_172.selling = false
548: 			local v177
549: 			if v176.ok then
550: 				local v178 = v176.money
551: 				v177 = type(v178) ~= "number" and 0 or v176.money
552: 			else
553: 				v177 = 0
554: 			end
555: 			local v179 = p_u_172.open
556: 			if v179 then
557: 				if p_u_172.playId == v_u_175 then
558: 					v179 = p_u_172.card == v_u_174

===== Players.Ranscripts.PlayerScripts.Client.RewardChips =====
1: local v1 = game:GetService("ReplicatedStorage")
2: local v_u_2 = game:GetService("RunService")
3: local v_u_3 = game:GetService("TextService")
4: local v4 = v1:WaitForChild("Shared")
5: local v5 = require(v4:WaitForChild("Config"))
6: local v_u_6 = require(v4:WaitForChild("Strings"))
7: local v_u_7 = require(script.Parent.BlockIcon)
8: local v_u_8 = require(script.Parent.CueThumb)
9: local v_u_9 = require(script.Parent.HudParts)
10: local v10 = require(script.Parent.RewardsParts)
11: local v_u_11 = require(script.Parent.UIAnim)
12: local v_u_12 = require(script.Parent.UISound)
13: local v_u_13 = v5.UI.Progress.Chips
14: local v14 = v5.UI.Kit
15: local v_u_15 = Enum.Font[v14.Font]
16: local v_u_16 = {}
17: local v_u_17 = { "Inventory" }
18: local v_u_18 = v10.SpinTiles
19: function v_u_16.tilesFor(p19) -- name: tilesFor
20: 	-- upvalues: (copy) v_u_18, (copy) v_u_17
   ...
81: 	}
82: 	local v42
83: 	if v39 == 1 then
84: 		v42 = v40.SpinOne
85: 	else
86: 		v42 = v40.SpinMany:format(v39)
87: 	end
88: 	v41.text = v42
89: 	return v41
90: end
91: local function v_u_49(p43, p44, p45) -- name: makePicture
92: 	-- upvalues: (copy) v_u_8, (copy) v_u_9, (copy) v_u_7
93: 	if p44 == "Cue" then
94: 		return v_u_8.new(p43, p45 or "")
95: 	end
96: 	if p44 ~= "Block" then
97: 		local v46 = p44 == "Money" and "CashSingle" or (p44 == "Spins" and "UltSpin" or (p44 == "Lucky" and "Lucky" or "ChatTag"))
98: 		return v_u_9.icon(p43, v46, "Picture")
99: 	end
100: 	local v47 = v_u_9.frame(p43, "Picture")
101: 	local v48 = v_u_7.new(v47, p45 or "", false)
102: 	v48.root.ZIndex = 2
103: 	v48.viewport.ZIndex = 2
104: 	if v48.fallback then
105: 		v48.fallback.ZIndex = 2

===== Players.Ranscripts.PlayerScripts.Client.Tutorial =====
   ...
244: 		v92 = v_u_33.ArrowHelp
245: 	else
246: 		v92 = v_u_33.JoinTable
247: 	end
248: 	v91:say(v92)
249: 	return "arrow" .. tostring(v85) .. tostring(v90)
250: end
251: local v_u_94 = ""
252: local v_u_95 = "aim"
253: local v_u_96 = 0
254: local v_u_97 = "combo"
255: local v_u_98 = 0
256: local function v_u_101() -- name: lessonPocket
257: 	-- upvalues: (copy) v_u_26
258: 	local v99 = v_u_26:GetAttribute("TutorialTable")
259: 	local v100 = v_u_26:GetAttribute("TutorialAimPocket")
260: 	if type(v99) == "number" and (v99 > 0 and (type(v100) == "number" and v100 > 0)) then
261: 		return v99, v100
262: 	else
263: 		return nil, nil
264: 	end
265: end
266: local v_u_102 = v_u_12.key(v_u_7.Input.Gamepad.Shoot.Up)
267: local function v_u_107(p103) -- name: shootPrompt
268: 	-- upvalues: (ref) v_u_28, (copy) v_u_102, (copy) v_u_13, (ref) v_u_27, (copy) v_u_33
269: 	if p103 == "gamepad" then
270: 		v_u_28:gesture("hold", v_u_102)
271: 	else
272: 		v_u_28:gesture("pull", v_u_13.guiTarget("PowerBar"))
273: 	end
274: 	local v104 = v_u_27
275: 	local v105 = v_u_33.Shoot
276: 	local v106
277: 	if p103 == "gamepad" then
278: 		v106 = v105.Gamepad
279: 	elseif p103 == "touch" then
280: 		v106 = v105.Touch
281: 	else
282: 		v106 = v105.Mouse
283: 	end
284: 	v104:say(v106)
285: end
286: local function v_u_128(p108, p109) -- name: aimLesson
287: 	-- upvalues: (copy) v_u_11, (copy) v_u_26, (copy) v_u_34, (ref) v_u_95, (ref) v_u_96, (ref) v_u_27, (copy) v_u_25, (ref) v_u_98, (copy) v_u_18, (copy) v_u_35, (ref) v_u_30, (copy) v_u_101, (ref) v_u_28, (copy) v_u_33, (copy) v_u_107
288: 	local v110 = os.clock()
289: 	if p109 then
290: 		v_u_11.resetTurn()
291: 		local v111 = v_u_26:GetAttribute("TutorialAimAngle")
292: 		if type(v111) == "number" then
293: 			local v112 = v_u_11.suggestAim
294: 			local v113 = v_u_34.AimOffsetDegrees
295: 			v112(v111 + math.rad(v113))
296: 		end
297: 		v_u_95 = "aim"
298: 		v_u_96 = v110
299: 	end
300: 	v_u_27:dim(nil)
301: 	if v_u_95 == "aim" and v_u_11.turned() >= v_u_34.AimTurnedDegrees then
302: 		v_u_25.report("Lesson", "Aimed")
303: 		v_u_95 = "zoom"
304: 		v_u_96 = v110
305: 		v_u_98 = v_u_18.getZoom()
306: 	end
307: 	if v_u_95 == "zoom" then
308: 		local v114 = v_u_18.getZoom()
309: 		local v115 = v_u_98
310: 		local v116 = v114 / math.max(v115, 0.001)
311: 		local v117 = v_u_98 / math.max(v114, 0.001)
312: 		local v118 = math.max(v116, v117)
313: 		if v_u_34.ZoomedOut <= v114 or v_u_34.ZoomMovedRatio <= v118 then
314: 			v_u_25.report("Lesson", "Zoomed")
   ...
330: 	if v_u_95 == "aim" then
331: 		v_u_30:hide()
332: 	else
333: 		v_u_30:show(v_u_101())
334: 	end
335: 	if v_u_95 == "aim" then
336: 		if p108 == "gamepad" then
337: 			v_u_28:gesture("stick", Enum.KeyCode.Thumbstick1)
338: 		else
339: 			v_u_28:gesture("swipe", p108 == "mouse")
340: 		end
341: 		local v119 = v_u_27
342: 		local v120 = v_u_33.Aim
343: 		local v121
344: 		if p108 == "gamepad" then
345: 			v121 = v120.Gamepad
346: 		elseif p108 == "touch" then
347: 			v121 = v120.Touch
348: 		else
349: 			v121 = v120.Mouse
350: 		end
351: 		v119:say(v121)
352: 	elseif v_u_95 == "zoom" then
353: 		if p108 == "gamepad" then
354: 			v_u_28:gesture("stickY", Enum.KeyCode.Thumbstick2)
   ...
380: 		elseif p108 == "touch" then
381: 			v127 = v126.Touch
382: 		else
383: 			v127 = v126.Mouse
384: 		end
385: 		v125:say(v127)
386: 	elseif v_u_95 == "zoomed" then
387: 		v_u_28:hide()
388: 		v_u_27:say(v_u_33.ZoomDone)
389: 	else
390: 		v_u_107(p108)
391: 	end
392: 	return "Aim" .. v_u_95
393: end
394: local function v_u_145(p129, p130) -- name: comboLesson
395: 	-- upvalues: (copy) v_u_26, (copy) v_u_11, (ref) v_u_96, (ref) v_u_97, (ref) v_u_30, (ref) v_u_27, (ref) v_u_31, (copy) v_u_34, (ref) v_u_28, (copy) v_u_33, (copy) v_u_107
396: 	local v131 = os.clock()
397: 	if p130 then
398: 		local v132 = v_u_26:GetAttribute("TutorialAimAngle")
399: 		if type(v132) == "number" then
400: 			v_u_11.suggestAim(v132)
401: 		end
402: 		v_u_96 = v131
403: 		v_u_97 = "
