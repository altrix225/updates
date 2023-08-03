{{"Scripts","CreatureScripts","Hosts","ClassCrossoverScript"},"Update",function(p8, p9)
		p8.TrailTimer = math.max(0,p8.TrailTimer - p9)
		p8.BlossomTimer = math.max(0,p8.BlossomTimer - p9)
		p8.SlashTimer = math.max(0,p8.SlashTimer - p9)
		p8.ZoomCooldown = math.max(0,p8.ZoomCooldown - p9)
		p8.SprintTimer = math.max(0,p8.SprintTimer - p9)
		p8.Stats.Power[4][p8.SlashPower] = 1 + (p8.SlashHits / 20);
		p8.Stats.AttackSpeed[4][p8.SlashAttack] = 1 + (p8.SlashHits / 80)
		p8.CritChance = 5 * p8.Stability
		if p8.Resources.Health < p8.Stats.MaxHealth[1]*0.6 then
			p8.Stability = 0
		end
		if p8.Id == 1 and p8.SkillGui:FindFirstChild("Zoom") then
			local l__SkillCombo__88 = p8.SkillGui.Zoom;
			l__SkillCombo__88.ChargeLabel.Visible = false
			l__SkillCombo__88.Bar.Position = UDim2.new(0, 0, (p8.ZoomCooldown) / 4, 0);
			local v89 = 1
			if p8.ZoomCooldown == 0 then
				v89 = 1;
			else
				v89 = 0;
			end;
			l__SkillCombo__88.Bar.BackgroundTransparency = v89;
		end;
		if p8.Id == 1 then
			local l__SkillCombo__88 = p8.SkillGui.SkillAether;
			l__SkillCombo__88.ChargeLabel.Text = p8.Stability;
			local v89 = 1
			
			l__SkillCombo__88.Bar.BackgroundTransparency = v89;
			local v90 = 1
			
			l__SkillCombo__88.Shade.BackgroundTransparency = v90;
		end;
		if p8.Cooldowns.Attack.Charges <= 0 and p8.Relentless then
			p8.Cooldowns.Attack.Charges = 1
			p8.Relentless = false
		end
		if p8.ZoomCooldown == 0 then
			p8.ZoomCD = false
		end
		if p8.RunState ~= "Run" and p8.Cooldowns.SkillColt.Charges == 0 then
			p8.RunState = "Run"
			p8.SpeedMultiplier = 1
			if p8.Talents[6] then
				_G.SpawnParticle({
					Name = "Particle", 
					Chromashift = true, 
					Source = p8.Id, 
					TimeSpeed = p8.TimeSpeed, 
					Position = p8.RootPart.Position, 
					Inaccuracy = math.pi * 2, 
					Duration = 0.5, 
					Speed = 0, 
					Model = "Ball", 
					Color = Color3.fromRGB(255,255,255),  
					Transparency = 0.5, 
					Size = Vector3.new(16,16,16), 
					Shrink = true, 
					Scripts = { "Particle" }
				});
				_G.PlaySound({
					Name = "LongDing", 
					Type = 1, 
					Position = p8.RootPart.CFrame.Position, 
					TimeSpeed = p8.TimeSpeed
				});
			for i,entity in pairs(_G.Entities) do
				if entity and entity.Id and entity.RootPart and (entity.RootPart.CFrame.Position - p8.RootPart.CFrame.Position).Magnitude < 30 then
			local v2 = {
				Actions = {}, 
				Name = "SkillZandatsu", 
				Amount = 20 * p8.Stats.Power[1], 
				Melee = true,
				Percentage = 0.05,
				Stagger = 44,
				ScreenShake = 3
			};

			v2.Actions[1] = { "Knockback", {
				Knockback = Vector3.new(0,0,40), 
				Duration = 0.125, 
				DecayAmount = 1
			}, "Source" };
			v2.Actions[2] = { "Particle", {
				Name = "Particle", 
				Source = p8.Id, 
				Chromashift = false, 
				Direction = p8.Direction, 
				Inaccuracy = math.pi, 
				Duration = 0.25, 
				Speed = { 30, 60 }, 
				Acceleration = -100, 
				Model = "Orb", 
				Color = p8.Color, 
				Transparency = 0, 
				Size = Vector3.new(0.1, 0.1, 1), 
				Scripts = { "Particle" }
			}, "Source", 8 };
			v2.Actions[3] = { "Particle", {
				Name = "Particle", 
				Source = p8.Id, 
				Chromashift = false, 
				Direction = p8.Direction, 
				Inaccuracy = 0.5, 
				Duration = 0.125, 
				Model = "Orb", 
				Color = p8.Color, 
				Transparency = 0, 
				Size = Vector3.new(0.25, 0.25, 8), 
				Scripts = { "Particle" }, 
				Shrink = true
			}, "Source" };
						v2.Actions[4] = { "Sound", { "SamuraiHit" }};
						if math.random(1,100) <= p8.CritChance then
							v2.Amount = v2.Amount * 2
							v2.Critical = 1
							v2.IgnoresDef = true
							table.insert(v2.Actions,{ "Status", {
								Name = "ClassCrossoverBleedStatus", 
								Duration = 2,
								Amount = 1,
								Renew = true
							} })
						end
			_G.SpawnProjectile({
				Name = "SkillSheathed", 
				Source = p8.Id, 
				Echo = true, 
				Direction = Vector3.new(0,0,1),
				Position = entity.RootPart.CFrame.Position, 
				DamageArgs = v2,
				Model = "Radius6", 
				Speed = 0.00010, 
				Pierces = -1,
				Duration = 0.4,
				Color = Color3.fromRGB(115, 190, 199)
					});
					local magnitude = (p8.RootPart.CFrame.Position - entity.RootPart.CFrame.Position).Magnitude
					local cfthing = CFrame.new(p8.RootPart.CFrame.Position,entity.RootPart.CFrame.Position) + CFrame.new(p8.RootPart.CFrame.Position,entity.RootPart.CFrame.Position).LookVector*(magnitude*1.5)

					_G.SpawnParticle({
						Name = "Particle", 
						Chromashift = true, 
						Source = p8.Source, 
						TimeSpeed = p8.TimeSpeed, 
						Position = cfthing.Position, 
						Direction = CFrame.new(p8.RootPart.CFrame.Position,entity.RootPart.CFrame.Position).LookVector*-1,
						Inaccuracy = math.pi / 12, 
						Duration = 0.25, 
						Speed = -magnitude*8*4,
						Acceleration = magnitude*4*4*2,
						Model = "SamuraiAfterimage", 
						Color = Color3.fromRGB(255,255,255),  
						Transparency = 0.5, 
						Size = Vector3.new(8.564, 5.72, 8.79), 
						Scripts = { "Particle" }
					});
					_G.PlaySound({
						Name = "ShortDing", 
						Type = 1, 
						Position = entity.RootPart.CFrame.Position, 
						TimeSpeed = entity.TimeSpeed
					});
				end
			end
			end	
			elseif p8.RunState ~= "Run" and p8.SprintTimer == 0 then
			p8.SprintTimer = 0.1
			p8.Cooldowns.SkillColt.Charges = math.max(0,p8.Cooldowns.SkillColt.Charges - 1)
			p8.Cooldowns.SkillColt.Cooldown = p8.Cooldowns.SkillColt.MaxCooldown
		end
		if p8.RunState == "RunSheathed" and p8.Talents[14] then
			p8.Stats.Unstoppable[3][p8.SheatheUnstoppableMod] = 1
			p8.Stats.HealthRegen[4][p8.SheatheRegen] = 2
		else
			p8.Stats.Unstoppable[3][p8.SheatheUnstoppableMod] = 0 
			p8.Stats.HealthRegen[4][p8.SheatheRegen] = 1
		end
		if p8.Talents[23] and p8 and p8.Humanoid and (Vector3.new(0,0,0) + p8.Humanoid.MoveDirection).Magnitude < 0.01 then
			p8.StasisTimer = math.max(0,p8.StasisTimer - p9)
			if p8.Cooldowns.SkillColt.Charges ~= p8.Cooldowns.SkillColt.MaxCharges and p8.RunState == "Run" then
				p8.Cooldowns.SkillColt.Cooldown = math.max(0,p8.Cooldowns.SkillColt.Cooldown - p9)
			end
		end
		if p8.Talents[2] and p8 and p8.Humanoid and (Vector3.new(0,0,0) + p8.Humanoid.MoveDirection).Magnitude < 0.01 then
			p8.Stats.Defense[4][p8.StillDefense] = 0.6
		elseif p8.Talents[2] then
			p8.Stats.Defense[4][p8.StillDefense] = 0.9
		end
		if p8.Talents[24] and p8 and p8.Humanoid and (Vector3.new(0,0,0) + p8.Humanoid.MoveDirection).Magnitude > 0.01 then
			if p8.Cooldowns.SkillColt.Charges ~= p8.Cooldowns.SkillColt.MaxCharges and p8.RunState == "Run" then
				p8.Cooldowns.SkillColt.Cooldown = math.max(0,p8.Cooldowns.SkillColt.Cooldown - p9)
			end
		end
		if p8.Chargeup then
			p8.ChargeupTimer = math.max(0,p8.ChargeupTimer - p9)
		end
		if p8.StasisTimer == 0 then
			p8.StasisTimer = 10
			_G.ApplyStatus(p8.Id, {
				Name = "ClassCrossoverStasis", 
				Renew = false, 
				Duration = 10,
			});
		end
		if p8.ChargeupTimer == 0 then
			p8.AnimationSpeed = 1
			p8.Chargeup = false
			p8.Stats.Unstoppable[3][p8.UnstoppableMod] = 0;
		end
		if p8.BlossomTimer == 0 and p8.ZandatsuBlossom and p8.ZandatsuHits > 0 and p8.Talents[11] then
			p8.BlossomTimer = 0.1
			for i,thingi in pairs(p8.ZandatsuTable) do
				

				if _G.Entities[thingi] and _G.Entities[thingi].RootPart then
					local magnitude = (p8.RootPart.CFrame.Position - _G.Entities[thingi].RootPart.CFrame.Position).Magnitude
					local cfthing = CFrame.new(p8.RootPart.CFrame.Position,_G.Entities[thingi].RootPart.CFrame.Position) + CFrame.new(p8.RootPart.CFrame.Position,_G.Entities[thingi].RootPart.CFrame.Position).LookVector*(magnitude*1.5)
			_G.SpawnParticle({
				Name = "Particle", 
				Chromashift = true, 
				Source = p8.Source, 
				TimeSpeed = p8.TimeSpeed, 
				Position = cfthing.Position, 
				Direction = CFrame.new(p8.RootPart.CFrame.Position,_G.Entities[thingi].RootPart.CFrame.Position).LookVector*-1,
				Inaccuracy = math.pi / 12, 
				Duration = 0.25, 
						Speed = -magnitude*8*4,
						Acceleration = magnitude*4*4*2,
						Model = "SamuraiAfterimage", 
				Color = Color3.fromRGB(255,255,255),  
				Transparency = 0.5, 
						Size = Vector3.new(8.564, 5.72, 8.79), 
				Scripts = { "Particle" }
					});
					_G.PlaySound({
						Name = "ShortDing", 
						Type = 1, 
						Position = _G.Entities[thingi].RootPart.CFrame.Position, 
						TimeSpeed = _G.Entities[thingi].TimeSpeed
					});
					_G.PlaySound({
						Name = "SamuraiHit", 
						Type = 1, 
						Position = _G.Entities[thingi].RootPart.CFrame.Position, 
						TimeSpeed = _G.Entities[thingi].TimeSpeed
					});
					for i = 1,4 do
					_G.SpawnParticle({
						Name = "Particle", 
						Source = p8.Id, 
						Chromashift = false, 
							Direction = p8.Direction, 
							TimeSpeed = p8.TimeSpeed,
							Inaccuracy = math.pi, 
							Position = _G.Entities[thingi].RootPart.CFrame.Position, 
						Duration = 0.25, 
						Speed = { 30, 60 }, 
						Acceleration = -100, 
						Model = "Orb", 
						Color = p8.Color, 
						Transparency = 0, 
						Size = Vector3.new(0.1, 0.1, 1), 
						Scripts = { "Particle" }
						})

					end
					local tp = 0
					if p8.Talents[12] then
						tp = 0.01
					end
					local v2 = {
						Source = p8.Id, 
						Target = thingi, 
						Amount = 6 * p8.Stats.Power[1], 
						TruePercentage = tp,
						Actions = {},
						IgnoresDef = true,
						Stagger = 44, 
						Name = "SkillBlossom"
					}
					if math.random(1,100) <= p8.CritChance then
						v2.Amount = v2.Amount * 2
						v2.Critical = 1
						v2.IgnoresDef = true
						table.insert(v2.Actions,{ "Status", {
							Name = "ClassCrossoverBleedStatus", 
							Duration = 2,
							Amount = 1,
							Renew = true
						} })
					end
					_G.DamageRequest(v2);
				end
			end
			p8.ZandatsuHits = p8.ZandatsuHits - 1
		end
		if p8.SlashTimer == 0 and p8.SlashActive and p8.SlashMarks > 0 and p8.Talents[1] then
			print("yes")
			for i,thingi in pairs(p8.SlashTable) do
				if thingi and i then
					
				if i and _G.Entities[i] and _G.Entities[i].RootPart then
					local magnitude = (p8.RootPart.CFrame.Position - _G.Entities[i].RootPart.CFrame.Position).Magnitude
					local cfthing = CFrame.new(p8.RootPart.CFrame.Position,_G.Entities[i].RootPart.CFrame.Position) + CFrame.new(p8.RootPart.CFrame.Position,_G.Entities[i].RootPart.CFrame.Position).LookVector*(magnitude*1.5)
					
						for i = 1,2 do
							if i and _G.Entities[i] and _G.Entities[i].RootPart then
						_G.SpawnParticle({
							Name = "Particle", 
							Source = p8.Id, 
							Chromashift = false, 
							Direction = p8.Direction, 
							TimeSpeed = p8.TimeSpeed,
							Inaccuracy = math.pi, 
							Position = _G.Entities[i].RootPart.CFrame.Position, 
							Duration = 0.25, 
							Speed = { 30, 60 }, 
							Acceleration = -100, 
							Model = "Orb", 
							Color = p8.Color, 
							Transparency = 0, 
							Size = Vector3.new(0.1, 0.1, 1), 
							Scripts = { "Particle" }
						})
							end
						end
						if i and _G.Entities[i] then
							_G.SpawnParticle({
								Name = "Particle", 
								Chromashift = true, 
								Source = p8.Source, 
								TimeSpeed = p8.TimeSpeed, 
								Position = cfthing.Position, 
								Direction = CFrame.new(p8.RootPart.CFrame.Position,_G.Entities[i].RootPart.CFrame.Position).LookVector*-1,
								Inaccuracy = math.pi / 12, 
								Duration = 0.25/2, 
								Speed = -magnitude*8*4*2,
								Acceleration = magnitude*4*4*2*2,
								Model = "SamuraiAfterimage", 
								Color = Color3.fromRGB(255,255,255),  
								Transparency = 0.5, 
								Size = Vector3.new(8.564, 5.72, 8.79), 
								Scripts = { "Particle" }
							});
							_G.PlaySound({
								Name = "LongDing", 
								Type = 1, 
								Position = _G.Entities[i].RootPart.CFrame.Position, 
								TimeSpeed = _G.Entities[i].TimeSpeed,
								SoundSpeed = 1,
							});
							_G.PlaySound({
								Name = "SamuraiHit", 
								Type = 1, 
								Position = _G.Entities[i].RootPart.CFrame.Position, 
								TimeSpeed = _G.Entities[i].TimeSpeed
							});
						local v2 = {
							Source = p8.Id, 
								Target = _G.Entities[i].Id, 
								Amount = (p8.SlashTable[i]*3) * p8.Stats.Power[1], 
							TruePercentage = 0,
							Actions = {},
							IgnoresDef = true,
							Stagger = 44, 
							Name = "SkillBlossom"
						}
						if math.random(1,100) <= p8.CritChance then
							v2.Amount = v2.Amount * 2
							v2.Critical = 1
							v2.IgnoresDef = true
							table.insert(v2.Actions,{ "Status", {
								Name = "ClassCrossoverBleedStatus", 
								Duration = 2,
								Amount = 1,
								Renew = true
								} })
								
							end
							_G.DamageRequest(v2);
							p8.SlashTable[i] = nil
						end
						
					end
				end
				
			end
			p8.SlashMarks = 0
		elseif p8.SlashActive and p8.SlashMarks <= 0 then
			p8.SlashActive = false
		end
		if p8.ZandatsuUsed == false and p8.AnimationTables[1].ActionState ~= p8.ZandatsuUsing  then
			p8:SwitchAnimation(1, p8.ZandatsuUsing)
	
		elseif  p8.AnimationTables[1].ActionState == p8.ZandatsuUsing then
			
			p8.ZandatsuUsed = true
		elseif p8.AnimationTables[1].ActionState == "" and p8.ZandatsuDone == false then
			p8.ActionFunctions.Decide()
		end
	end,}
