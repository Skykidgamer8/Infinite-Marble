for _, file in ipairs(GDPatch.get_pack().files) do
    if file:match("%.gdc$") or file:match("%.gd$") then
        local lower_file = file:lower()
        
        if lower_file:find("player") or lower_file:find("movement") or lower_file:find("state") or lower_file:find("marble") then
            
            GDPatch.patch_script_as_text(file, function(_, src)
                local modified, count = src:gsub("do_marble%s*=%s*false", "do_marble = true")
                if count > 0 then
                    print("[InfiniteMarble] Safely patched: " .. file .. " (" .. count .. " times)")
                    return modified
                end
                return src
            end)
            
        end
    end
end
