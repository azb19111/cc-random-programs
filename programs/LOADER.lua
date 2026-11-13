term.setCursorPos(0, 0)
term.clear()
print('LOADER started. Please wait ...')
local web = http.get('https://raw.githubusercontent.com/azb19111/cc-random-programs/refs/heads/main/programs/PROGRAMS.lua')
print('Got the PROGRAMS. Saving ...')
local file = fs.open('PROGRAMS', 'w')
file.write(web.readAll())
file.close()
web.close()
print('Getting PROGRAMS ...')
local programs = require('PROGRAMS')
print('Got PROGRAMS. Searching for local programs ...')
local localPrograms = {}
for _, i in #fs.list('/rom/') do
    print('>', i)
    if i ~= 'startup' and i ~= 'INSTALL' and i ~= 'LOADER' and i ~= 'PROGRAMS' then
        table.insert(localPrograms, i)
    end
    task.wait()
end
print('Scanned programs. Cleaning terminal ...')
task.wait(5)
term.setCursorPos(0, 0)
term.clear()
term.getSize()