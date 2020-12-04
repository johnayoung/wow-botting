local DRData = LibStub("DRData-1.0")

function keyMmTpxBKowi()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local xBrZgGkQNVRwF = 0

    xBrZgGkQNVRwF = UnitHealth("target")
    xBrZgGkQNVRwF = xBrZgGkQNVRwF / 1000
    xBrZgGkQNVRwF = (xBrZgGkQNVRwF + .5) - (xBrZgGkQNVRwF + .5) % 1

    if (xBrZgGkQNVRwF > 15000000) then xBrZgGkQNVRwF = 15000000 end
    if (xBrZgGkQNVRwF < 0) then xBrZgGkQNVRwF = 0 end
    if (xBrZgGkQNVRwF > 0) and (xBrZgGkQNVRwF < 1) then xBrZgGkQNVRwF = 1 end

    ztWumCHmVPtuB = xBrZgGkQNVRwF
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    lwRebAUabPQTe.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

local function mNPNdrkPhPmao()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local hfDQEJiBafsqD = 0

    hfDQEJiBafsqD = UnitHealthMax("target")
    hfDQEJiBafsqD = hfDQEJiBafsqD / 1000
    hfDQEJiBafsqD = (hfDQEJiBafsqD + .5) - (hfDQEJiBafsqD + .5) % 1

    if (hfDQEJiBafsqD > 15000000) then hfDQEJiBafsqD = 15000000 end
    if (hfDQEJiBafsqD < 0) then hfDQEJiBafsqD = 0 end
    if (hfDQEJiBafsqD > 0) and (hfDQEJiBafsqD < 1) then hfDQEJiBafsqD = 1 end

    ztWumCHmVPtuB = hfDQEJiBafsqD
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    uklEgDACeaCaw.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function EIxWJgPhhcinh()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local VUvcuDsnqgcdG = 0

    local xMTPlFzsYENxQ = 2;
    local HNELhXWZmcRKG = GetSpellCritChance(xMTPlFzsYENxQ);
    local FKHzDUcXLWhLu;

    FKHzDUcXLWhLu = {};
    FKHzDUcXLWhLu[xMTPlFzsYENxQ] = HNELhXWZmcRKG;

    for i = (xMTPlFzsYENxQ + 1), 7 do
        local mrLfDjZsZCcWu = GetSpellCritChance(i);
        HNELhXWZmcRKG = min(HNELhXWZmcRKG, mrLfDjZsZCcWu);
        FKHzDUcXLWhLu[i] = mrLfDjZsZCcWu;
    end

    VUvcuDsnqgcdG = HNELhXWZmcRKG * 10000
    VUvcuDsnqgcdG = VUvcuDsnqgcdG + 0.5 - (VUvcuDsnqgcdG + 0.5) % 1

    ztWumCHmVPtuB = VUvcuDsnqgcdG
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    rohGVPEfNGXNK.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function KRHLjBEfzolZB(iCksJWcqzQoZl)
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local xBrZgGkQNVRwF = 0

    xBrZgGkQNVRwF = UnitHealth(iCksJWcqzQoZl)
    xBrZgGkQNVRwF = xBrZgGkQNVRwF / 1000
    xBrZgGkQNVRwF = (xBrZgGkQNVRwF + .5) - (xBrZgGkQNVRwF + .5) % 1

    if (xBrZgGkQNVRwF > 15000000) then xBrZgGkQNVRwF = 15000000 end
    if (xBrZgGkQNVRwF < 0) then xBrZgGkQNVRwF = 0 end
    if (xBrZgGkQNVRwF > 0) and (xBrZgGkQNVRwF < 1) then xBrZgGkQNVRwF = 1 end

    local sVtwqWAnkfOGY = 1
    if iCksJWcqzQoZl == "player" then
        sVtwqWAnkfOGY = 1
    elseif iCksJWcqzQoZl == "boss1" then
        sVtwqWAnkfOGY = 2
    elseif iCksJWcqzQoZl == "focus" then
        sVtwqWAnkfOGY = 3
    end

    ztWumCHmVPtuB = xBrZgGkQNVRwF
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    nTFfQOmuBvQJc[sVtwqWAnkfOGY].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                                   pdAFRJZsxtADy, 1)
end

function hlNgIedIKKPAm()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local FindAuraByName = AuraUtil.FindAuraByName
    local fGOnDaGCrDycL = GetSpellInfo(110310)
    local _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, FWGZmsFLTTRSf =
        FindAuraByName(fGOnDaGCrDycL, "player", "HARMFUL")

    if FWGZmsFLTTRSf ~= nil then
        if FWGZmsFLTTRSf > 999999 then FWGZmsFLTTRSf = 0 end
        if FWGZmsFLTTRSf < 0 then FWGZmsFLTTRSf = 0 end
    else
        FWGZmsFLTTRSf = 0
    end

    local HvsiKdwDquZxb = 0
    if UnitIsUnit("target", "focus") == true then
        HvsiKdwDquZxb = 1
    elseif UnitIsUnit("target", "boss1") == true then
        HvsiKdwDquZxb = 2
    elseif UnitIsUnit("target", "boss2") == true then
        HvsiKdwDquZxb = 3
    elseif UnitIsUnit("target", "boss3") == true then
        HvsiKdwDquZxb = 4
    elseif UnitIsUnit("target", "boss4") == true then
        HvsiKdwDquZxb = 5
    elseif UnitIsUnit("target", "arena1") == true then
        HvsiKdwDquZxb = 6
    elseif UnitIsUnit("target", "arena2") == true then
        HvsiKdwDquZxb = 7
    elseif UnitIsUnit("target", "arena3") == true then
        HvsiKdwDquZxb = 8
    elseif UnitIsUnit("target", "party1") == true then
        HvsiKdwDquZxb = 9
    elseif UnitIsUnit("target", "party2") == true then
        HvsiKdwDquZxb = 10
    elseif UnitIsUnit("target", "party3") == true then
        HvsiKdwDquZxb = 11
    elseif UnitIsUnit("target", "party4") == true then
        HvsiKdwDquZxb = 12
    elseif UnitIsUnit("target", "player") == true then
        HvsiKdwDquZxb = 13
    end

    FWGZmsFLTTRSf = HvsiKdwDquZxb * 1000 + FWGZmsFLTTRSf
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(FWGZmsFLTTRSf)
    ENMsIuBKtjNfW.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function ozVqiODwYGCkY()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local WqOoQnubKfskM, nAlqECgYGHSVR, AZlLLdhqOpGjk = 1, 0, 0

    local XubLmwUXTLJIs = GetInventoryItemLink("player", GetInventorySlotInfo(
                                                   "Trinket0Slot"))

    if XubLmwUXTLJIs ~= nil then

        local XsAQjvTynUqzT = GetItemInfoInstant(XubLmwUXTLJIs)

        if GetItemInfo(XsAQjvTynUqzT) ~= nil then
            local BVEHJwIbHqYoK, ODVZLeGTplPXI, PcSJjHIJFpqxF =
                GetItemCooldown(XsAQjvTynUqzT)
            if (BVEHJwIbHqYoK > 0 and ODVZLeGTplPXI > 0) then
                AZlLLdhqOpGjk =
                    ((BVEHJwIbHqYoK) + (ODVZLeGTplPXI) - (GetTime())) * 100
                AZlLLdhqOpGjk = AZlLLdhqOpGjk + 0.5 - (AZlLLdhqOpGjk + 0.5) % 1
            end

            if PcSJjHIJFpqxF == 1 then
                local _, KQlZaRjfnpdRf = GetItemSpell(XsAQjvTynUqzT)
                if KQlZaRjfnpdRf ~= nil then nAlqECgYGHSVR = 1 end
            end
        end
    end

    if AZlLLdhqOpGjk > 999999 then AZlLLdhqOpGjk = 999999 end
    ztWumCHmVPtuB = WqOoQnubKfskM * 10000000 + nAlqECgYGHSVR * 1000000 +
                        AZlLLdhqOpGjk
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    VgHPchcKEFpdk.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function DOiipqymGBceH()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local WqOoQnubKfskM, nAlqECgYGHSVR, AZlLLdhqOpGjk = 1, 0, 0

    local XubLmwUXTLJIs = GetInventoryItemLink("player", GetInventorySlotInfo(
                                                   "Trinket1Slot"))

    if XubLmwUXTLJIs ~= nil then

        local XsAQjvTynUqzT = GetItemInfoInstant(XubLmwUXTLJIs)

        if GetItemInfo(XsAQjvTynUqzT) ~= nil then
            local BVEHJwIbHqYoK, ODVZLeGTplPXI, PcSJjHIJFpqxF =
                GetItemCooldown(XsAQjvTynUqzT)
            if (BVEHJwIbHqYoK > 0 and ODVZLeGTplPXI > 0) then
                AZlLLdhqOpGjk =
                    ((BVEHJwIbHqYoK) + (ODVZLeGTplPXI) - (GetTime())) * 100
                AZlLLdhqOpGjk = AZlLLdhqOpGjk + 0.5 - (AZlLLdhqOpGjk + 0.5) % 1
            end

            if PcSJjHIJFpqxF == 1 then
                local _, KQlZaRjfnpdRf = GetItemSpell(XsAQjvTynUqzT)
                if KQlZaRjfnpdRf ~= nil then nAlqECgYGHSVR = 1 end
            end
        end
    end

    if AZlLLdhqOpGjk > 999999 then AZlLLdhqOpGjk = 999999 end
    ztWumCHmVPtuB = WqOoQnubKfskM * 10000000 + nAlqECgYGHSVR * 1000000 +
                        AZlLLdhqOpGjk
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    ccEVoMhptXpJd.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function UHOSoliCtFokV()
    for i = 1, 5 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB, fpalSofuSBmBQ, DNskEjhrJlUBE, MEjlLouWXYAnw,
              hckDmoxHlRChw = 0, 0, 0, 0, 0
        local vPzOINHiTDMQj = "none"

        if GetTotemInfo(i) ~= nil then
            if select(1, GetTotemInfo(i)) then
                _, vPzOINHiTDMQj, MEjlLouWXYAnw, hckDmoxHlRChw = GetTotemInfo(i)
            end

            if vPzOINHiTDMQj == "Infernal" or vPzOINHiTDMQj == "Totem Mastery" or
                vPzOINHiTDMQj == "Darkglare" or vPzOINHiTDMQj == "Shadowfiend" or
                vPzOINHiTDMQj == "Mindbender" then
                if (MEjlLouWXYAnw > 0 and hckDmoxHlRChw > 0) then
                    DNskEjhrJlUBE = ((MEjlLouWXYAnw) + (hckDmoxHlRChw) -
                                        (GetTime())) * 100
                    DNskEjhrJlUBE =
                        DNskEjhrJlUBE + 0.5 - (DNskEjhrJlUBE + 0.5) % 1
                else
                    DNskEjhrJlUBE = 0
                end
                fpalSofuSBmBQ = 1
            end
        end

        if DNskEjhrJlUBE > 999999 then DNskEjhrJlUBE = 0 end

        ztWumCHmVPtuB = fpalSofuSBmBQ * 10000000 + DNskEjhrJlUBE
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(ztWumCHmVPtuB)
        uQZPeHQbPjQSv[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function TKGOffkVFzFjR(iCksJWcqzQoZl)
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local hfDQEJiBafsqD = 0

    hfDQEJiBafsqD = UnitHealthMax(iCksJWcqzQoZl)
    hfDQEJiBafsqD = hfDQEJiBafsqD / 1000
    hfDQEJiBafsqD = (hfDQEJiBafsqD + .5) - (hfDQEJiBafsqD + .5) % 1

    if (hfDQEJiBafsqD > 15000000) then hfDQEJiBafsqD = 15000000 end
    if (hfDQEJiBafsqD < 0) then hfDQEJiBafsqD = 0 end
    if (hfDQEJiBafsqD > 0) and (hfDQEJiBafsqD < 1) then hfDQEJiBafsqD = 1 end

    local sVtwqWAnkfOGY = 1
    if iCksJWcqzQoZl == "player" then
        sVtwqWAnkfOGY = 1
    elseif iCksJWcqzQoZl == "boss1" then
        sVtwqWAnkfOGY = 2
    elseif iCksJWcqzQoZl == "focus" then
        sVtwqWAnkfOGY = 3
    end

    ztWumCHmVPtuB = hfDQEJiBafsqD
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    wsoyAbKPmQnyL[sVtwqWAnkfOGY].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                                   pdAFRJZsxtADy, 1)
end

function dvvJrtZLVqYnM()
    for i = 1, 3 do
        local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
        local ztWumCHmVPtuB, DNskEjhrJlUBE = 0, 0

        DNskEjhrJlUBE = (OOBGaHRwETpbJ[i] - GetTime()) * 100
        DNskEjhrJlUBE = DNskEjhrJlUBE + 0.5 - (DNskEjhrJlUBE + 0.5) % 1

        if DNskEjhrJlUBE > 999999 then DNskEjhrJlUBE = 0 end
        if DNskEjhrJlUBE < 0 then DNskEjhrJlUBE = 0 end

        ztWumCHmVPtuB = DNskEjhrJlUBE
        kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
            wxQgThLybVsqq(ztWumCHmVPtuB)
        dwMDMPHVUWVlQ[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                           pdAFRJZsxtADy, 1)
    end
end

function qwEiXQkSsXjes()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local JZIPHIjXImHkO, uKKxTibSonQWc = 0, 0

    if not ECeWfMBmAxTXQ then
        JZIPHIjXImHkO = C_Covenants.GetActiveCovenantID();
        uKKxTibSonQWc = C_Soulbinds.GetActiveSoulbindID();
    end

    if (not JZIPHIjXImHkO or JZIPHIjXImHkO == 0) then JZIPHIjXImHkO = 0 end
    if (not uKKxTibSonQWc or uKKxTibSonQWc == 0) then uKKxTibSonQWc = 0 end

    ztWumCHmVPtuB = uKKxTibSonQWc * 1000 + JZIPHIjXImHkO
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    byqwKSlutSDiB.t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy,
                                    1)
end

function oyzkYLezjADGj()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local PEpiJxyJWZIvD = 0

    PEpiJxyJWZIvD = UnitHealth("target")

    local ADZVlrteTkYXO, vFOKKGrkSWdGd = 0, 0

    ADZVlrteTkYXO = math.floor(PEpiJxyJWZIvD / 1000000)
    vFOKKGrkSWdGd = PEpiJxyJWZIvD % 1000000

    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ADZVlrteTkYXO)
    ItAkKoPULoXnK[1].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(vFOKKGrkSWdGd)
    ItAkKoPULoXnK[2].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
end

function TXTSYqpULbZOO()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0
    local PEpiJxyJWZIvD = 0

    PEpiJxyJWZIvD = UnitHealthMax("target")

    local ADZVlrteTkYXO, vFOKKGrkSWdGd = 0, 0

    ADZVlrteTkYXO = math.floor(PEpiJxyJWZIvD / 1000000)
    vFOKKGrkSWdGd = PEpiJxyJWZIvD % 1000000

    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ADZVlrteTkYXO)
    RkWSzPLeeUPMW[1].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(vFOKKGrkSWdGd)
    RkWSzPLeeUPMW[2].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
end

function LNEvTRKvCtuLP()
    local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
    local ztWumCHmVPtuB = 0

    ztWumCHmVPtuB = BDTigvOHYVLBM()
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    UofRHoPCyWzBW[1].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
    ztWumCHmVPtuB = hhtkdpvvuefWD()
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    UofRHoPCyWzBW[2].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
    ztWumCHmVPtuB = MwiQeZGIplAcu()
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    UofRHoPCyWzBW[3].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
    ztWumCHmVPtuB = dAHnrtuGjcBSP()
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    UofRHoPCyWzBW[4].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
    ztWumCHmVPtuB = FQUGZoLdjSZHq()
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    UofRHoPCyWzBW[5].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
    ztWumCHmVPtuB = mvDrvtHjLvoHm()
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    UofRHoPCyWzBW[6].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
    ztWumCHmVPtuB = mcwcTgyOTqoiM()
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    UofRHoPCyWzBW[7].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
    ztWumCHmVPtuB = MRRuihgAGzDsg()
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    UofRHoPCyWzBW[8].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
    ztWumCHmVPtuB = IKguVgznBigGy()
    kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = wxQgThLybVsqq(ztWumCHmVPtuB)
    UofRHoPCyWzBW[9].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                       pdAFRJZsxtADy, 1)
end

function sIcSEPIjgpRQM()
    if not ECeWfMBmAxTXQ then
        local GalfdtknYniZV = C_Soulbinds.GetSoulbindData(
                                  C_Soulbinds.GetActiveSoulbindID());
        local IjYKilojpXYou = {}
        if (not GalfdtknYniZV) then return end

        local ojwbUOdIZYCWE = GalfdtknYniZV["tree"]
        local mVLUUusjGZKWH = ojwbUOdIZYCWE["nodes"]

        for _, gbdRCMqjFBqwS in pairs(mVLUUusjGZKWH) do
            local TwNiKWoeySYUD = gbdRCMqjFBqwS.spellID
            local ewKhKmFNiCeIV = gbdRCMqjFBqwS.conduitID
            local pfVhUVXBawWXO = gbdRCMqjFBqwS.conduitRank
            local niciJFwzhuYYr = gbdRCMqjFBqwS.state

            if niciJFwzhuYYr == 3 then
                if TwNiKWoeySYUD == 0 then
                    if ewKhKmFNiCeIV ~= 0 then
                        local DrFluiZphIIRx =
                            C_Soulbinds.GetConduitSpellID(ewKhKmFNiCeIV,
                                                          pfVhUVXBawWXO);
                        TwNiKWoeySYUD = DrFluiZphIIRx
                    else
                        TwNiKWoeySYUD = 0
                    end
                end

                if (TwNiKWoeySYUD) then
                    IjYKilojpXYou[#IjYKilojpXYou + 1] = TwNiKWoeySYUD
                end
            end
        end

        for i = 1, 8 do
            local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
            local CwBDAoJvyXkzt = 0

            if IjYKilojpXYou[i] ~= nil then
                CwBDAoJvyXkzt = IjYKilojpXYou[i]
            end

            kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
                wxQgThLybVsqq(CwBDAoJvyXkzt)
            FZmeZlXnoDvhx[i].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                               pdAFRJZsxtADy, 1)
        end
    end
end

function ZLWHlwJdRgwpC()
    if not ECeWfMBmAxTXQ then
        if UnitExists("target") then
            local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
            local oyZGZURLCAydu = 0
            oyZGZURLCAydu =
                tonumber(UnitGUID("target"):match("-(%d+)-%x+$"), 10)
            kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
                wxQgThLybVsqq(oyZGZURLCAydu)
            QdeCpzbsvWyMN[1].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                               pdAFRJZsxtADy, 1)
        end
        if UnitExists("focus") then
            local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
            local oyZGZURLCAydu = 0
            oyZGZURLCAydu = tonumber(UnitGUID("focus"):match("-(%d+)-%x+$"), 10)
            kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
                wxQgThLybVsqq(oyZGZURLCAydu)
            QdeCpzbsvWyMN[2].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                               pdAFRJZsxtADy, 1)
        end
        if UnitExists("boss1") then
            local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
            local oyZGZURLCAydu = 0
            oyZGZURLCAydu = tonumber(UnitGUID("boss1"):match("-(%d+)-%x+$"), 10)
            kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
                wxQgThLybVsqq(oyZGZURLCAydu)
            QdeCpzbsvWyMN[3].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                               pdAFRJZsxtADy, 1)
        end
        if UnitExists("boss2") then
            local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
            local oyZGZURLCAydu = 0
            oyZGZURLCAydu = tonumber(UnitGUID("boss2"):match("-(%d+)-%x+$"), 10)
            kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
                wxQgThLybVsqq(oyZGZURLCAydu)
            QdeCpzbsvWyMN[4].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                               pdAFRJZsxtADy, 1)
        end
        if UnitExists("boss3") then
            local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
            local oyZGZURLCAydu = 0
            oyZGZURLCAydu = tonumber(UnitGUID("boss3"):match("-(%d+)-%x+$"), 10)
            kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
                wxQgThLybVsqq(oyZGZURLCAydu)
            QdeCpzbsvWyMN[5].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                               pdAFRJZsxtADy, 1)
        end
        if UnitExists("boss4") then
            local kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy = 0, 0, 0
            local oyZGZURLCAydu = 0
            oyZGZURLCAydu = tonumber(UnitGUID("boss4"):match("-(%d+)-%x+$"), 10)
            kRyYXXoAvBipb, EnvRTEjelASnx, pdAFRJZsxtADy =
                wxQgThLybVsqq(oyZGZURLCAydu)
            QdeCpzbsvWyMN[6].t:SetColorTexture(kRyYXXoAvBipb, EnvRTEjelASnx,
                                               pdAFRJZsxtADy, 1)
        end
    end
end

local InRaid = false

function kOvFUUlAJNSZX(self, elapsed)
    if NHIGRekPcpKuz == false then
        NHIGRekPcpKuz = true
        GvnbMdrUAfOON = GvnbMdrUAfOON + elapsed
        obekxfZrbLPvc = obekxfZrbLPvc + elapsed

        if GvnbMdrUAfOON >= dOCedRtknaBVB / 1000 then

            cWqyodvSOHlIV()
            AkpyPPjLrfDjC()
            YVKODTSjoVNeh()
            ntTLcPxvrcYhG()
            rsSDogDUdxQFn()
            bKLrwNHMyqtrI()
            qwEiXQkSsXjes()
            sIcSEPIjgpRQM()

            if IsInRaid() then
                InRaid = true
                for i = 1, GetNumGroupMembers() do
                    UyMnHrqoHXrUm(98 + 3 * i, 100 + 3 * i, "raid" .. i)
                end

                JfxqsRpMEhBMw()
                lZBvhttfnNNvR()
                for i = 1, GetNumGroupMembers() do
                    AxdcctZfpCbAX(98 + 3 * i, 100 + 3 * i, "raid" .. i)
                end
            elseif InRaid == true then
                InRaid = false
                for i = 1, 40 do
                    UyMnHrqoHXrUm(98 + 3 * i, 100 + 3 * i, "raid" .. i)
                end
                JfxqsRpMEhBMw()
                lZBvhttfnNNvR()
                for i = 1, 40 do
                    AxdcctZfpCbAX(98 + 3 * i, 100 + 3 * i, "raid" .. i)
                end
            end

            GvnbMdrUAfOON = 0
        end

        if obekxfZrbLPvc >= RPxfjYgjQkLtO / 1000 then

            ObBHupdfBPsyW()
            EIxWJgPhhcinh()
            UyMnHrqoHXrUm(1, 10, "player")
            UyMnHrqoHXrUm(11, 20, "target")
            UyMnHrqoHXrUm(21, 30, "focus")
            UyMnHrqoHXrUm(31, 40, "arena1")
            UyMnHrqoHXrUm(41, 50, "arena2")
            UyMnHrqoHXrUm(51, 60, "arena3")
            for i = 1, GetNumSubgroupMembers() do
                UyMnHrqoHXrUm(51 + 10 * i, i * 10 + 60, "party" .. i)
            end
            for i = 1, 4 do
                UyMnHrqoHXrUm(218 + 3 * i, i * 3 + 220, "boss" .. i)
            end
            UyMnHrqoHXrUm(233, 235, "pet")
            AxdcctZfpCbAX(1, 10, "player")
            AxdcctZfpCbAX(11, 20, "target")
            AxdcctZfpCbAX(21, 30, "focus")
            AxdcctZfpCbAX(31, 40, "arena1")
            AxdcctZfpCbAX(41, 50, "arena2")
            AxdcctZfpCbAX(51, 60, "arena3")
            for i = 1, GetNumSubgroupMembers() do
                AxdcctZfpCbAX(51 + 10 * i, i * 10 + 60, "party" .. i)
            end
            for i = 1, 4 do
                AxdcctZfpCbAX(218 + 3 * i, i * 3 + 220, "boss" .. i)
            end
            AxdcctZfpCbAX(233, 235, "pet")
            DMawmxoqnjTIm()
            epNHASMwrFTEc()
            lnbLRqZtNHvuE()
            fkaFYfOUgQKJz()
            itEzSZTKgscWL()
            TpyEqynuVcWDR()
            AuQpEXWMiiNhm()
            vBEOQPBrsYoTp()
            ClHoEORHGVXUY()
            aUtJXTXCLidHa()
            ddmkxzIrzzHAQ()
            vGTRPohHWUqjk()
            tgheBOXYtPsTn()
            teudMeqPtGaYY()
            keyMmTpxBKowi()
            mNPNdrkPhPmao()
            zwihGksbgrgdl()
            jrJJNebFTqhQK()
            TKGOffkVFzFjR("player")
            TKGOffkVFzFjR("boss1")
            TKGOffkVFzFjR("focus")
            KRHLjBEfzolZB("player")
            KRHLjBEfzolZB("boss1")
            KRHLjBEfzolZB("focus")
            ozVqiODwYGCkY()
            DOiipqymGBceH()
            UHOSoliCtFokV()
            xncbmosEILbXi()
            dvvJrtZLVqYnM()
            hlNgIedIKKPAm()
            oyzkYLezjADGj()
            TXTSYqpULbZOO()
            sHvBiByZHfrEW()
            LNEvTRKvCtuLP()
            ZLWHlwJdRgwpC()

            obekxfZrbLPvc = 0
        end

        if fmSBINvqnRXMc ~= true then GJmfOFUwDaoJo() end

        NHIGRekPcpKuz = false
    end
end

function MIUlPEOxALWrx(self, event, ...)
    if event == "ADDON_LOADED" then
        local arg1, arg2, arg3, arg4 = ...
        if (arg1 == "SmallAddonWOW") then
            QihWLYdqLuiMM()
            nLnPggPMjxABi()
            XoDqepaunXBje()
            SetCVar("synchronizeSettings", "0")

            SlashCmdList["SMALL"] = function(xXjmvgWIhSNmM, ...)
                hKgSNmJQbuxwq(xXjmvgWIhSNmM)
            end
            SLASH_SMALL1 = "/small"
        end
    end

    if event == "PLAYER_ENTERING_WORLD" then
        SetCVar("nameplateMaxDistance", 100)
        SetCVar("nameplateShowAll", "1")

        if GetCVar("nameplateShowEnemies") == "0" then
            SetCVar("nameplateShowEnemies", "1")
        end
        if GetCVar("nameplateShowFriends") == "1" then
            SetCVar("nameplateShowFriends", "0")
        end

        SetCVar("nameplateOtherBottomInset", 0.1)
        SetCVar("nameplateOtherTopInset", 0.08)
    end

    if event == "COMBAT_LOG_EVENT_UNFILTERED" then
        local _, cDBekGhCHIrRk, _, tPwkDYNXDDTmC, _, uvgBNlYDcLwVb, _,
              QKuJZqEbeOuar, KypYAisiLlWGv, FsgQEzPbHCcud, _, ciaQhlaWbaOEK,
              OdtFYYCelLuOK, _, uLPCvMdXFJHvE = CombatLogGetCurrentEventInfo()

        if tPwkDYNXDDTmC == UnitGUID('player') then
            if cDBekGhCHIrRk == "SPELL_CAST_FAILED" then
                local rand_uLPCvMdXFJHvE_ = uLPCvMdXFJHvE
                if (rand_uLPCvMdXFJHvE_ == "Target needs to be in front of you.") then
                    ggZswsqKCCdpj = true
                end
                if (rand_uLPCvMdXFJHvE_ == "Target not in line of sight") then
                    YyZBiwslrwUvj = true
                end
            end
            if cDBekGhCHIrRk == "SPELL_CAST_SUCCESS" then
                ggZswsqKCCdpj = false
                YyZBiwslrwUvj = false
                BZkSkPTnavBKR = OdtFYYCelLuOK
            end
        end

        if bit.band(uvgBNlYDcLwVb, COMBATLOG_OBJECT_REACTION_HOSTILE) > 0 then
            if cDBekGhCHIrRk == "SPELL_CAST_SUCCESS" then
                if wFAjvbxBSDTxZ[OdtFYYCelLuOK] then
                    MkSBABgwnDNyO = OdtFYYCelLuOK
                    C_Timer.After(1.5, TPNapfaNAxTJK)
                end
            end
        end

        if select(2, IsInInstance()) == "arena" then
            if cDBekGhCHIrRk == "SPELL_AURA_APPLIED" then
                if (uLPCvMdXFJHvE == "DEBUFF" and
                    DRData:GetSpellCategory(ciaQhlaWbaOEK)) then
                    local isPlayer = (bit.band(FsgQEzPbHCcud,
                                               COMBATLOG_OBJECT_TYPE_PLAYER) ==
                                         COMBATLOG_OBJECT_TYPE_PLAYER or
                                         bit.band(FsgQEzPbHCcud,
                                                  COMBATLOG_OBJECT_CONTROL_PLAYER) ==
                                         COMBATLOG_OBJECT_CONTROL_PLAYER)
                    debuffGained(ciaQhlaWbaOEK, KypYAisiLlWGv, QKuJZqEbeOuar,
                                 (bit.band(FsgQEzPbHCcud,
                                           COMBATLOG_OBJECT_REACTION_HOSTILE) ==
                                     COMBATLOG_OBJECT_REACTION_HOSTILE),
                                 isPlayer)
                end

            elseif (cDBekGhCHIrRk == "SPELL_AURA_REFRESH") then
                if (uLPCvMdXFJHvE == "DEBUFF" and
                    DRData:GetSpellCategory(ciaQhlaWbaOEK)) then
                    local isPlayer = (bit.band(FsgQEzPbHCcud,
                                               COMBATLOG_OBJECT_TYPE_PLAYER) ==
                                         COMBATLOG_OBJECT_TYPE_PLAYER or
                                         bit.band(FsgQEzPbHCcud,
                                                  COMBATLOG_OBJECT_CONTROL_PLAYER) ==
                                         COMBATLOG_OBJECT_CONTROL_PLAYER)
                    local isHostile = (bit.band(FsgQEzPbHCcud,
                                                COMBATLOG_OBJECT_REACTION_HOSTILE) ==
                                          COMBATLOG_OBJECT_REACTION_HOSTILE)
                    debuffFaded(ciaQhlaWbaOEK, KypYAisiLlWGv, QKuJZqEbeOuar,
                                isHostile, isPlayer)
                    debuffGained(ciaQhlaWbaOEK, KypYAisiLlWGv, QKuJZqEbeOuar,
                                 isHostile, isPlayer)
                end

            elseif (cDBekGhCHIrRk == "SPELL_AURA_REMOVED") then
                if (uLPCvMdXFJHvE == "DEBUFF" and
                    DRData:GetSpellCategory(ciaQhlaWbaOEK)) then
                    local isPlayer = (bit.band(FsgQEzPbHCcud,
                                               COMBATLOG_OBJECT_TYPE_PLAYER) ==
                                         COMBATLOG_OBJECT_TYPE_PLAYER or
                                         bit.band(FsgQEzPbHCcud,
                                                  COMBATLOG_OBJECT_CONTROL_PLAYER) ==
                                         COMBATLOG_OBJECT_CONTROL_PLAYER)
                    debuffFaded(ciaQhlaWbaOEK, KypYAisiLlWGv, QKuJZqEbeOuar,
                                (bit.band(FsgQEzPbHCcud,
                                          COMBATLOG_OBJECT_REACTION_HOSTILE) ==
                                    COMBATLOG_OBJECT_REACTION_HOSTILE), isPlayer)
                end

            elseif (cDBekGhCHIrRk == "PARTY_KILL") then
                resetDR(QKuJZqEbeOuar)
            end

            if cDBekGhCHIrRk == "SPELL_CAST_SUCCESS" then
                if bit.band(uvgBNlYDcLwVb, COMBATLOG_OBJECT_REACTION_HOSTILE) >
                    0 then
                    if interrupts[OdtFYYCelLuOK] then
                        if tPwkDYNXDDTmC == UnitGUID("arena1") or tPwkDYNXDDTmC ==
                            UnitGUID("arenapet1") then
                            OOBGaHRwETpbJ[1] =
                                GetTime() + interrupts[OdtFYYCelLuOK]
                        elseif tPwkDYNXDDTmC == UnitGUID("arena2") or
                            tPwkDYNXDDTmC == UnitGUID("arenapet2") then
                            OOBGaHRwETpbJ[2] =
                                GetTime() + interrupts[OdtFYYCelLuOK]
                        elseif tPwkDYNXDDTmC == UnitGUID("arena3") or
                            tPwkDYNXDDTmC == UnitGUID("arenapet3") then
                            OOBGaHRwETpbJ[3] =
                                GetTime() + interrupts[OdtFYYCelLuOK]
                        end
                    end
                end
            end

        end

    end
end

local kgZeSRMtlmiCd, DrzrWfCXrOGZe = GetPhysicalScreenSize()
local BanITlKUnWFGs = GetScreenWidth() / kgZeSRMtlmiCd

local parent = CreateFrame("Frame", "cBQJZgzRJmYOn", UIParent)
parent:SetSize(1801, 1)
parent:SetPoint("TOPLEFT", 0, 0)
parent.t = parent:CreateTexture()
parent.t:SetColorTexture(0, 0, 0, 1)
parent.t:SetAllPoints(parent)
parent:SetScale(BanITlKUnWFGs)
parent:RegisterEvent("ADDON_LOADED")
parent:RegisterEvent("PLAYER_ENTERING_WORLD")
parent:RegisterEvent("UNIT_SPELLCAST_SENT")
parent:RegisterEvent("UI_ERROR_MESSAGE")
parent:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
parent:SetFrameStrata("TOOLTIP");

function QihWLYdqLuiMM()

    for i = 1, 50 do
        DQwWgnOrbdOOn[i] = CreateFrame("Frame", "", parent);
        DQwWgnOrbdOOn[i]:SetSize(1, 1);
        DQwWgnOrbdOOn[i]:SetPoint("TOPLEFT", i - 1, 0)
        DQwWgnOrbdOOn[i].t = DQwWgnOrbdOOn[i]:CreateTexture()
        DQwWgnOrbdOOn[i].t:SetColorTexture(0, 0, 0, 1)
        DQwWgnOrbdOOn[i].t:SetAllPoints(DQwWgnOrbdOOn[i])
        DQwWgnOrbdOOn[i]:Show()
    end

    for i = 1, 50 do
        bXNgElZWhLYFT[i] = CreateFrame("Frame", "", parent);
        bXNgElZWhLYFT[i]:SetSize(1, 1);
        bXNgElZWhLYFT[i]:SetPoint("TOPLEFT", 49 + i, 0)
        bXNgElZWhLYFT[i].t = bXNgElZWhLYFT[i]:CreateTexture()
        bXNgElZWhLYFT[i].t:SetColorTexture(0, 0, 0, 1)
        bXNgElZWhLYFT[i].t:SetAllPoints(bXNgElZWhLYFT[i])
        bXNgElZWhLYFT[i]:Show()
    end

    for i = 1, 50 do
        vkXJfdsboBlQd[i] = CreateFrame("Frame", "", parent);
        vkXJfdsboBlQd[i]:SetSize(1, 1);
        vkXJfdsboBlQd[i]:SetPoint("TOPLEFT", 99 + i, 0)
        vkXJfdsboBlQd[i].t = vkXJfdsboBlQd[i]:CreateTexture()
        vkXJfdsboBlQd[i].t:SetColorTexture(0, 0, 0, 1)
        vkXJfdsboBlQd[i].t:SetAllPoints(vkXJfdsboBlQd[i])
        vkXJfdsboBlQd[i]:Show()
    end

    for i = 1, 50 do
        NaIOeiYildZGe[i] = CreateFrame("Frame", "", parent);
        NaIOeiYildZGe[i]:SetSize(1, 1);
        NaIOeiYildZGe[i]:SetPoint("TOPLEFT", 149 + i, 0)
        NaIOeiYildZGe[i].t = NaIOeiYildZGe[i]:CreateTexture()
        NaIOeiYildZGe[i].t:SetColorTexture(0, 0, 0, 1)
        NaIOeiYildZGe[i].t:SetAllPoints(NaIOeiYildZGe[i])
        NaIOeiYildZGe[i]:Show()
    end

    for i = 1, 50 do
        oDWWEYQNseTSy[i] = CreateFrame("Frame", "", parent);
        oDWWEYQNseTSy[i]:SetSize(1, 1);
        oDWWEYQNseTSy[i]:SetPoint("TOPLEFT", 199 + i, 0)
        oDWWEYQNseTSy[i].t = oDWWEYQNseTSy[i]:CreateTexture()
        oDWWEYQNseTSy[i].t:SetColorTexture(0, 0, 0, 1)
        oDWWEYQNseTSy[i].t:SetAllPoints(oDWWEYQNseTSy[i])
        oDWWEYQNseTSy[i]:Show()
    end

    for i = 1, 54 do
        qgkKHxCAooERw[i] = CreateFrame("Frame", "", parent);
        qgkKHxCAooERw[i]:SetSize(1, 1);
        qgkKHxCAooERw[i]:SetPoint("TOPLEFT", 249 + i, 0)
        qgkKHxCAooERw[i].t = qgkKHxCAooERw[i]:CreateTexture()
        qgkKHxCAooERw[i].t:SetColorTexture(0, 0, 99 / 255, 1)
        qgkKHxCAooERw[i].t:SetAllPoints(qgkKHxCAooERw[i])
        qgkKHxCAooERw[i]:Show()
    end

    for i = 1, 50 do
        NAQVvowgxCWyG[i] = CreateFrame("Frame", "", parent);
        NAQVvowgxCWyG[i]:SetSize(1, 1);
        NAQVvowgxCWyG[i]:SetPoint("TOPLEFT", 303 + i, 0)
        NAQVvowgxCWyG[i].t = NAQVvowgxCWyG[i]:CreateTexture()
        NAQVvowgxCWyG[i].t:SetColorTexture(0, 0, 0, 1)
        NAQVvowgxCWyG[i].t:SetAllPoints(NAQVvowgxCWyG[i])
        NAQVvowgxCWyG[i]:Show()
    end

    for i = 1, 15 do
        xrEPDICXhjciW[i] = CreateFrame("Frame", "", parent);
        xrEPDICXhjciW[i]:SetSize(1, 1);
        xrEPDICXhjciW[i]:SetPoint("TOPLEFT", 353 + i, 0)
        xrEPDICXhjciW[i].t = xrEPDICXhjciW[i]:CreateTexture()
        xrEPDICXhjciW[i].t:SetColorTexture(0, 0, 0, 1)
        xrEPDICXhjciW[i].t:SetAllPoints(xrEPDICXhjciW[i])
        xrEPDICXhjciW[i]:Show()
    end

    for i = 1, 15 do
        WPxwhIVZPPKDD[i] = CreateFrame("Frame", "", parent);
        WPxwhIVZPPKDD[i]:SetSize(1, 1);
        WPxwhIVZPPKDD[i]:SetPoint("TOPLEFT", 368 + i, 0)
        WPxwhIVZPPKDD[i].t = WPxwhIVZPPKDD[i]:CreateTexture()
        WPxwhIVZPPKDD[i].t:SetColorTexture(0, 0, 0, 1)
        WPxwhIVZPPKDD[i].t:SetAllPoints(WPxwhIVZPPKDD[i])
        WPxwhIVZPPKDD[i]:Show()
    end

    for i = 1, 15 do
        aXBteOLAAKwYk[i] = CreateFrame("Frame", "", parent);
        aXBteOLAAKwYk[i]:SetSize(1, 1);
        aXBteOLAAKwYk[i]:SetPoint("TOPLEFT", 383 + i, 0)
        aXBteOLAAKwYk[i].t = aXBteOLAAKwYk[i]:CreateTexture()
        aXBteOLAAKwYk[i].t:SetColorTexture(0, 0, 0, 1)
        aXBteOLAAKwYk[i].t:SetAllPoints(aXBteOLAAKwYk[i])
        aXBteOLAAKwYk[i]:Show()
    end

    for i = 1, 235 do
        vOZfQnmZSgiAU[i] = CreateFrame("Frame", "", parent);
        vOZfQnmZSgiAU[i]:SetSize(1, 1);
        vOZfQnmZSgiAU[i]:SetPoint("TOPLEFT", 397 + 2 * i, 0)
        vOZfQnmZSgiAU[i].t = vOZfQnmZSgiAU[i]:CreateTexture()
        vOZfQnmZSgiAU[i].t:SetColorTexture(0, 0, 0, 1)
        vOZfQnmZSgiAU[i].t:SetAllPoints(vOZfQnmZSgiAU[i])
        vOZfQnmZSgiAU[i]:Show()

        OdhictMAifVoF[i] = CreateFrame("Frame", "", parent);
        OdhictMAifVoF[i]:SetSize(1, 1);
        OdhictMAifVoF[i]:SetPoint("TOPLEFT", 398 + 2 * i, 0)
        OdhictMAifVoF[i].t = OdhictMAifVoF[i]:CreateTexture()
        OdhictMAifVoF[i].t:SetColorTexture(0, 0, 0, 1)
        OdhictMAifVoF[i].t:SetAllPoints(OdhictMAifVoF[i])
        OdhictMAifVoF[i]:Show()
    end

    for i = 1, 235 do
        OWWVEBYxMGAjz[i] = CreateFrame("Frame", "", parent);
        OWWVEBYxMGAjz[i]:SetSize(1, 1);
        OWWVEBYxMGAjz[i]:SetPoint("TOPLEFT", 1297 + 2 * i, 0)
        OWWVEBYxMGAjz[i].t = OWWVEBYxMGAjz[i]:CreateTexture()
        OWWVEBYxMGAjz[i].t:SetColorTexture(0, 0, 0, 1)
        OWWVEBYxMGAjz[i].t:SetAllPoints(OWWVEBYxMGAjz[i])
        OWWVEBYxMGAjz[i]:Show()

        WQeHqTsKziTSi[i] = CreateFrame("Frame", "", parent);
        WQeHqTsKziTSi[i]:SetSize(1, 1);
        WQeHqTsKziTSi[i]:SetPoint("TOPLEFT", 1298 + 2 * i, 0)
        WQeHqTsKziTSi[i].t = WQeHqTsKziTSi[i]:CreateTexture()
        WQeHqTsKziTSi[i].t:SetColorTexture(0, 0, 0, 1)
        WQeHqTsKziTSi[i].t:SetAllPoints(WQeHqTsKziTSi[i])
        WQeHqTsKziTSi[i]:Show()
    end

    for i = 1, 10 do
        CMkMjDrKYQCwb[i] = CreateFrame("Frame", "", parent);
        CMkMjDrKYQCwb[i]:SetSize(1, 1);
        CMkMjDrKYQCwb[i]:SetPoint("TOPLEFT", 899 + i, 0)
        CMkMjDrKYQCwb[i].t = CMkMjDrKYQCwb[i]:CreateTexture()
        CMkMjDrKYQCwb[i].t:SetColorTexture(0, 0, 0, 1)
        CMkMjDrKYQCwb[i].t:SetAllPoints(CMkMjDrKYQCwb[i])
        CMkMjDrKYQCwb[i]:Show()
    end

    for i = 1, 100 do
        gcXBWgydWvVao[i] = CreateFrame("Frame", "", parent);
        gcXBWgydWvVao[i]:SetSize(1, 1);
        gcXBWgydWvVao[i]:SetPoint("TOPLEFT", 909 + i, 0)
        gcXBWgydWvVao[i].t = gcXBWgydWvVao[i]:CreateTexture()
        gcXBWgydWvVao[i].t:SetColorTexture(0, 0, 0, 1)
        gcXBWgydWvVao[i].t:SetAllPoints(gcXBWgydWvVao[i])
        gcXBWgydWvVao[i]:Show()
    end

    for i = 1, 3 do
        CvuOnCDWyMNzW[i] = CreateFrame("Frame", "", parent);
        CvuOnCDWyMNzW[i]:SetSize(1, 1);
        CvuOnCDWyMNzW[i]:SetPoint("TOPLEFT", 1009 + i, 0)
        CvuOnCDWyMNzW[i].t = CvuOnCDWyMNzW[i]:CreateTexture()
        CvuOnCDWyMNzW[i].t:SetColorTexture(0, 0, 0, 1)
        CvuOnCDWyMNzW[i].t:SetAllPoints(CvuOnCDWyMNzW[i])
        CvuOnCDWyMNzW[i]:Show()
    end

    for i = 1, 4 do
        lWMnWcPaYzOTh[i] = CreateFrame("Frame", "", parent);
        lWMnWcPaYzOTh[i]:SetSize(1, 1);
        lWMnWcPaYzOTh[i]:SetPoint("TOPLEFT", 1275 + i, 0)
        lWMnWcPaYzOTh[i].t = lWMnWcPaYzOTh[i]:CreateTexture()
        lWMnWcPaYzOTh[i].t:SetColorTexture(0, 0, 0, 1)
        lWMnWcPaYzOTh[i].t:SetAllPoints(lWMnWcPaYzOTh[i])
        lWMnWcPaYzOTh[i]:Show()
    end

    for i = 1, 3 do
        wsoyAbKPmQnyL[i] = CreateFrame("Frame", "", parent);
        wsoyAbKPmQnyL[i]:SetSize(1, 1);
        wsoyAbKPmQnyL[i]:SetPoint("TOPLEFT", 1263 + i, 0)
        wsoyAbKPmQnyL[i].t = wsoyAbKPmQnyL[i]:CreateTexture()
        wsoyAbKPmQnyL[i].t:SetColorTexture(0, 0, 0, 1)
        wsoyAbKPmQnyL[i].t:SetAllPoints(wsoyAbKPmQnyL[i])
        wsoyAbKPmQnyL[i]:Show()
    end

    for i = 1, 3 do
        nTFfQOmuBvQJc[i] = CreateFrame("Frame", "", parent);
        nTFfQOmuBvQJc[i]:SetSize(1, 1);
        nTFfQOmuBvQJc[i]:SetPoint("TOPLEFT", 1267 + i, 0)
        nTFfQOmuBvQJc[i].t = nTFfQOmuBvQJc[i]:CreateTexture()
        nTFfQOmuBvQJc[i].t:SetColorTexture(0, 0, 0, 1)
        nTFfQOmuBvQJc[i].t:SetAllPoints(nTFfQOmuBvQJc[i])
        nTFfQOmuBvQJc[i]:Show()
    end

    for i = 1, 6 do
        AtFiQJCzjGpYu[i] = CreateFrame("Frame", "", parent);
        AtFiQJCzjGpYu[i]:SetSize(1, 1);
        AtFiQJCzjGpYu[i]:SetPoint("TOPLEFT", 1773 + i, 0)
        AtFiQJCzjGpYu[i].t = AtFiQJCzjGpYu[i]:CreateTexture()
        AtFiQJCzjGpYu[i].t:SetColorTexture(0, 0, 0, 1)
        AtFiQJCzjGpYu[i].t:SetAllPoints(AtFiQJCzjGpYu[i])
        AtFiQJCzjGpYu[i]:Show()
    end

    awTCpacUBlskV = CreateFrame("Frame", "", parent);
    awTCpacUBlskV:SetSize(1, 1);
    awTCpacUBlskV:SetPoint("TOPLEFT", 1250, 0)
    awTCpacUBlskV.t = awTCpacUBlskV:CreateTexture()
    awTCpacUBlskV.t:SetColorTexture(0, 0, 0, 1)
    awTCpacUBlskV.t:SetAllPoints(awTCpacUBlskV)
    awTCpacUBlskV:Show()

    mTSglkkKYmXwh = CreateFrame("Frame", "", parent);
    mTSglkkKYmXwh:SetSize(1, 1);
    mTSglkkKYmXwh:SetPoint("TOPLEFT", 1251, 0)
    mTSglkkKYmXwh.t = mTSglkkKYmXwh:CreateTexture()
    mTSglkkKYmXwh.t:SetColorTexture(0, 0, 0, 1)
    mTSglkkKYmXwh.t:SetAllPoints(mTSglkkKYmXwh)
    mTSglkkKYmXwh:Show()

    zaeJCoSMKbTlO = CreateFrame("Frame", "", parent);
    zaeJCoSMKbTlO:SetSize(1, 1);
    zaeJCoSMKbTlO:SetPoint("TOPLEFT", 1252, 0)
    zaeJCoSMKbTlO.t = zaeJCoSMKbTlO:CreateTexture()
    zaeJCoSMKbTlO.t:SetColorTexture(0, 0, 0, 1)
    zaeJCoSMKbTlO.t:SetAllPoints(zaeJCoSMKbTlO)
    zaeJCoSMKbTlO:Show()

    VEcPrlRTNHZPl = CreateFrame("Frame", "", parent);
    VEcPrlRTNHZPl:SetSize(1, 1);
    VEcPrlRTNHZPl:SetPoint("TOPLEFT", 1253, 0)
    VEcPrlRTNHZPl.t = VEcPrlRTNHZPl:CreateTexture()
    VEcPrlRTNHZPl.t:SetColorTexture(0, 0, 0, 1)
    VEcPrlRTNHZPl.t:SetAllPoints(VEcPrlRTNHZPl)
    VEcPrlRTNHZPl:Show()

    ObDCJwGHaCqri = CreateFrame("Frame", "", parent);
    ObDCJwGHaCqri:SetSize(1, 1);
    ObDCJwGHaCqri:SetPoint("TOPLEFT", 1254, 0)
    ObDCJwGHaCqri.t = ObDCJwGHaCqri:CreateTexture()
    ObDCJwGHaCqri.t:SetColorTexture(0, 0, 0, 1)
    ObDCJwGHaCqri.t:SetAllPoints(ObDCJwGHaCqri)
    ObDCJwGHaCqri:Show()

    ESJbszuXOghIu = CreateFrame("Frame", "", parent);
    ESJbszuXOghIu:SetSize(1, 1);
    ESJbszuXOghIu:SetPoint("TOPLEFT", 1255, 0)
    ESJbszuXOghIu.t = ESJbszuXOghIu:CreateTexture()
    ESJbszuXOghIu.t:SetColorTexture(0, 0, 0, 1)
    ESJbszuXOghIu.t:SetAllPoints(ESJbszuXOghIu)
    ESJbszuXOghIu:Show()

    lfNlSEuQZqIHR = CreateFrame("Frame", "", parent);
    lfNlSEuQZqIHR:SetSize(1, 1);
    lfNlSEuQZqIHR:SetPoint("TOPLEFT", 1256, 0)
    lfNlSEuQZqIHR.t = lfNlSEuQZqIHR:CreateTexture()
    lfNlSEuQZqIHR.t:SetColorTexture(0, 0, 0, 1)
    lfNlSEuQZqIHR.t:SetAllPoints(lfNlSEuQZqIHR)
    lfNlSEuQZqIHR:Show()

    XfGuBmYJhyKlP = CreateFrame("Frame", "", parent);
    XfGuBmYJhyKlP:SetSize(1, 1);
    XfGuBmYJhyKlP:SetPoint("TOPLEFT", 1257, 0)
    XfGuBmYJhyKlP.t = XfGuBmYJhyKlP:CreateTexture()
    XfGuBmYJhyKlP.t:SetColorTexture(0, 0, 0, 1)
    XfGuBmYJhyKlP.t:SetAllPoints(XfGuBmYJhyKlP)
    XfGuBmYJhyKlP:Show()

    aUOzuVuOKauoj = CreateFrame("Frame", "", parent);
    aUOzuVuOKauoj:SetSize(1, 1);
    aUOzuVuOKauoj:SetPoint("TOPLEFT", 1258, 0)
    aUOzuVuOKauoj.t = aUOzuVuOKauoj:CreateTexture()
    aUOzuVuOKauoj.t:SetColorTexture(0, 0, 0, 1)
    aUOzuVuOKauoj.t:SetAllPoints(aUOzuVuOKauoj)
    aUOzuVuOKauoj:Show()

    lwRebAUabPQTe = CreateFrame("Frame", "", parent);
    lwRebAUabPQTe:SetSize(1, 1);
    lwRebAUabPQTe:SetPoint("TOPLEFT", 1259, 0)
    lwRebAUabPQTe.t = lwRebAUabPQTe:CreateTexture()
    lwRebAUabPQTe.t:SetColorTexture(0, 0, 0, 1)
    lwRebAUabPQTe.t:SetAllPoints(lwRebAUabPQTe)
    lwRebAUabPQTe:Show()

    uklEgDACeaCaw = CreateFrame("Frame", "", parent);
    uklEgDACeaCaw:SetSize(1, 1);
    uklEgDACeaCaw:SetPoint("TOPLEFT", 1260, 0)
    uklEgDACeaCaw.t = uklEgDACeaCaw:CreateTexture()
    uklEgDACeaCaw.t:SetColorTexture(0, 0, 0, 1)
    uklEgDACeaCaw.t:SetAllPoints(uklEgDACeaCaw)
    uklEgDACeaCaw:Show()

    nNDNEMGSBbrCW = CreateFrame("Frame", "", parent);
    nNDNEMGSBbrCW:SetSize(1, 1);
    nNDNEMGSBbrCW:SetPoint("TOPLEFT", 1261, 0)
    nNDNEMGSBbrCW.t = nNDNEMGSBbrCW:CreateTexture()
    nNDNEMGSBbrCW.t:SetColorTexture(0, 0, 0, 1)
    nNDNEMGSBbrCW.t:SetAllPoints(nNDNEMGSBbrCW)
    nNDNEMGSBbrCW:Show()

    JRpzExgQbJcFu = CreateFrame("Frame", "", parent);
    JRpzExgQbJcFu:SetSize(1, 1);
    JRpzExgQbJcFu:SetPoint("TOPLEFT", 1262, 0)
    JRpzExgQbJcFu.t = JRpzExgQbJcFu:CreateTexture()
    JRpzExgQbJcFu.t:SetColorTexture(0, 0, 0, 1)
    JRpzExgQbJcFu.t:SetAllPoints(JRpzExgQbJcFu)
    JRpzExgQbJcFu:Show()

    rohGVPEfNGXNK = CreateFrame("Frame", "", parent);
    rohGVPEfNGXNK:SetSize(1, 1);
    rohGVPEfNGXNK:SetPoint("TOPLEFT", 1263, 0)
    rohGVPEfNGXNK.t = rohGVPEfNGXNK:CreateTexture()
    rohGVPEfNGXNK.t:SetColorTexture(0, 0, 0, 1)
    rohGVPEfNGXNK.t:SetAllPoints(rohGVPEfNGXNK)
    rohGVPEfNGXNK:Show()

    ENMsIuBKtjNfW = CreateFrame("Frame", "", parent);
    ENMsIuBKtjNfW:SetSize(1, 1);
    ENMsIuBKtjNfW:SetPoint("TOPLEFT", 1267, 0)
    ENMsIuBKtjNfW.t = ENMsIuBKtjNfW:CreateTexture()
    ENMsIuBKtjNfW.t:SetColorTexture(0, 0, 0, 1)
    ENMsIuBKtjNfW.t:SetAllPoints(ENMsIuBKtjNfW)
    ENMsIuBKtjNfW:Show()

    EugMDaIKURkvG = CreateFrame("Frame", "", parent);
    EugMDaIKURkvG:SetSize(1, 1);
    EugMDaIKURkvG:SetPoint("TOPLEFT", 1020, 0)
    EugMDaIKURkvG.t = EugMDaIKURkvG:CreateTexture()
    EugMDaIKURkvG.t:SetColorTexture(0, 0, 0, 1)
    EugMDaIKURkvG.t:SetAllPoints(EugMDaIKURkvG)
    EugMDaIKURkvG:Show()

    VgHPchcKEFpdk = CreateFrame("Frame", "", parent);
    VgHPchcKEFpdk:SetSize(1, 1);
    VgHPchcKEFpdk:SetPoint("TOPLEFT", 1780, 0)
    VgHPchcKEFpdk.t = VgHPchcKEFpdk:CreateTexture()
    VgHPchcKEFpdk.t:SetColorTexture(0, 0, 0, 1)
    VgHPchcKEFpdk.t:SetAllPoints(VgHPchcKEFpdk)
    VgHPchcKEFpdk:Show()

    ccEVoMhptXpJd = CreateFrame("Frame", "", parent);
    ccEVoMhptXpJd:SetSize(1, 1);
    ccEVoMhptXpJd:SetPoint("TOPLEFT", 1781, 0)
    ccEVoMhptXpJd.t = ccEVoMhptXpJd:CreateTexture()
    ccEVoMhptXpJd.t:SetColorTexture(0, 0, 0, 1)
    ccEVoMhptXpJd.t:SetAllPoints(ccEVoMhptXpJd)
    ccEVoMhptXpJd:Show()

    for i = 1, 5 do
        uQZPeHQbPjQSv[i] = CreateFrame("Frame", "", parent);
        uQZPeHQbPjQSv[i]:SetSize(1, 1);
        uQZPeHQbPjQSv[i]:SetPoint("TOPLEFT", 1781 + i, 0)
        uQZPeHQbPjQSv[i].t = uQZPeHQbPjQSv[i]:CreateTexture()
        uQZPeHQbPjQSv[i].t:SetColorTexture(0, 0, 0, 1)
        uQZPeHQbPjQSv[i].t:SetAllPoints(uQZPeHQbPjQSv[i])
        uQZPeHQbPjQSv[i]:Show()
    end

    for i = 1, 3 do
        yNcvwXoXbRJEA[i] = CreateFrame("Frame", "", parent);
        yNcvwXoXbRJEA[i]:SetSize(1, 1);
        yNcvwXoXbRJEA[i]:SetPoint("TOPLEFT", 1786 + i, 0)
        yNcvwXoXbRJEA[i].t = yNcvwXoXbRJEA[i]:CreateTexture()
        yNcvwXoXbRJEA[i].t:SetColorTexture(0, 0, 0, 1)
        yNcvwXoXbRJEA[i].t:SetAllPoints(yNcvwXoXbRJEA[i])
        yNcvwXoXbRJEA[i]:Show()
    end

    for i = 1, 3 do
        dwMDMPHVUWVlQ[i] = CreateFrame("Frame", "", parent);
        dwMDMPHVUWVlQ[i]:SetSize(1, 1);
        dwMDMPHVUWVlQ[i]:SetPoint("TOPLEFT", 1789 + i, 0)
        dwMDMPHVUWVlQ[i].t = dwMDMPHVUWVlQ[i]:CreateTexture()
        dwMDMPHVUWVlQ[i].t:SetColorTexture(0, 0, 0, 1)
        dwMDMPHVUWVlQ[i].t:SetAllPoints(dwMDMPHVUWVlQ[i])
        dwMDMPHVUWVlQ[i]:Show()
    end

    byqwKSlutSDiB = CreateFrame("Frame", "", parent);
    byqwKSlutSDiB:SetSize(1, 1);
    byqwKSlutSDiB:SetPoint("TOPLEFT", 1793, 0)
    byqwKSlutSDiB.t = byqwKSlutSDiB:CreateTexture()
    byqwKSlutSDiB.t:SetColorTexture(0, 0, 0, 1)
    byqwKSlutSDiB.t:SetAllPoints(byqwKSlutSDiB)
    byqwKSlutSDiB:Show()

    for i = 1, 2 do
        ItAkKoPULoXnK[i] = CreateFrame("Frame", "", parent);
        ItAkKoPULoXnK[i]:SetSize(1, 1);
        ItAkKoPULoXnK[i]:SetPoint("TOPLEFT", 1270 + i, 0)
        ItAkKoPULoXnK[i].t = ItAkKoPULoXnK[i]:CreateTexture()
        ItAkKoPULoXnK[i].t:SetColorTexture(0, 0, 0, 1)
        ItAkKoPULoXnK[i].t:SetAllPoints(ItAkKoPULoXnK[i])
        ItAkKoPULoXnK[i]:Show()
    end

    for i = 1, 2 do
        RkWSzPLeeUPMW[i] = CreateFrame("Frame", "", parent);
        RkWSzPLeeUPMW[i]:SetSize(1, 1);
        RkWSzPLeeUPMW[i]:SetPoint("TOPLEFT", 1272 + i, 0)
        RkWSzPLeeUPMW[i].t = RkWSzPLeeUPMW[i]:CreateTexture()
        RkWSzPLeeUPMW[i].t:SetColorTexture(0, 0, 0, 1)
        RkWSzPLeeUPMW[i].t:SetAllPoints(RkWSzPLeeUPMW[i])
        RkWSzPLeeUPMW[i]:Show()
    end

    for i = 1, 10 do
        ALZerGKfPuXrG[i] = CreateFrame("Frame", "", parent);
        ALZerGKfPuXrG[i]:SetSize(1, 1);
        ALZerGKfPuXrG[i]:SetPoint("TOPLEFT", 1279 + i, 0)
        ALZerGKfPuXrG[i].t = ALZerGKfPuXrG[i]:CreateTexture()
        ALZerGKfPuXrG[i].t:SetColorTexture(0, 0, 0, 1)
        ALZerGKfPuXrG[i].t:SetAllPoints(ALZerGKfPuXrG[i])
        ALZerGKfPuXrG[i]:Show()
    end

    for i = 1, 9 do
        UofRHoPCyWzBW[i] = CreateFrame("Frame", "", parent);
        UofRHoPCyWzBW[i]:SetSize(1, 1);
        UofRHoPCyWzBW[i]:SetPoint("TOPLEFT", 1289 + i, 0)
        UofRHoPCyWzBW[i].t = UofRHoPCyWzBW[i]:CreateTexture()
        UofRHoPCyWzBW[i].t:SetColorTexture(0, 0, 0, 1)
        UofRHoPCyWzBW[i].t:SetAllPoints(UofRHoPCyWzBW[i])
        UofRHoPCyWzBW[i]:Show()
    end

    iDjxEUbzKKzBD = CreateFrame("Frame", "", parent);
    iDjxEUbzKKzBD:SetSize(1, 1);
    iDjxEUbzKKzBD:SetPoint("TOPLEFT", 1799, 0)
    iDjxEUbzKKzBD.t = iDjxEUbzKKzBD:CreateTexture()
    iDjxEUbzKKzBD.t:SetColorTexture(0, 0, 0, 1)
    iDjxEUbzKKzBD.t:SetAllPoints(iDjxEUbzKKzBD)
    iDjxEUbzKKzBD:Show()

    for i = 1, 8 do
        FZmeZlXnoDvhx[i] = CreateFrame("Frame", "", parent);
        FZmeZlXnoDvhx[i]:SetSize(1, 1);
        FZmeZlXnoDvhx[i]:SetPoint("TOPLEFT", 874 + i, 0)
        FZmeZlXnoDvhx[i].t = FZmeZlXnoDvhx[i]:CreateTexture()
        FZmeZlXnoDvhx[i].t:SetColorTexture(0, 0, 0, 1)
        FZmeZlXnoDvhx[i].t:SetAllPoints(FZmeZlXnoDvhx[i])
        FZmeZlXnoDvhx[i]:Show()
    end

    for i = 1, 6 do
        QdeCpzbsvWyMN[i] = CreateFrame("Frame", "", parent);
        QdeCpzbsvWyMN[i]:SetSize(1, 1);
        QdeCpzbsvWyMN[i]:SetPoint("TOPLEFT", 882 + i, 0)
        QdeCpzbsvWyMN[i].t = QdeCpzbsvWyMN[i]:CreateTexture()
        QdeCpzbsvWyMN[i].t:SetColorTexture(0, 0, 0, 1)
        QdeCpzbsvWyMN[i].t:SetAllPoints(QdeCpzbsvWyMN[i])
        QdeCpzbsvWyMN[i]:Show()
    end

end

parent:SetScript("OnEvent", MIUlPEOxALWrx)
parent:SetScript("OnUpdate", kOvFUUlAJNSZX)
