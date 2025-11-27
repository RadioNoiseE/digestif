local function popen(cmd)
        local p, err = io.popen(cmd)
        if not p then
                error(string.format("io.popen failed for %q: %s", cmd, tostring(err)))
        end
        return p
end

local pa = popen('find "/usr/local/lib/texmf/generic" -type f -print0')
local pb = popen("tput cols")

local texmf = pa:read("*a")
local total = select(2, texmf:gsub("\0", ""))
local cols = tonumber(pb:read("*l")) or 80
local done = 0

for file in texmf:gmatch("([^%z]+)") do
        done = done + 1
        local base = file:match("([^/]+)$")
        local ratio = (done / total)
        local filled = math.floor(ratio * cols / 4)
        io.write("\r[", string.rep("#", filled), string.rep("-", cols / 4 - filled), "]",
                string.format(" %5.1f%%  (%s)", ratio * 100, base), string.rep(" ", cols / 4 * 3 - #base - 13))
        io.flush()
        os.execute(string.format('digestif -g %s 2> /dev/null', base))
end

pa:close()
pb:close()
