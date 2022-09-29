local status, headlines= pcall(require, "headlines")
if (not status) then return end

headlines.setup()
