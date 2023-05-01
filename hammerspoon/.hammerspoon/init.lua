local function interp(s, t)
  return string.gsub(s, "%$(%w+)", t)
end

function hs.eventtap.textSubmit(text, application)
  hs.eventtap.keyStrokes(text, application)
  hs.eventtap.keyStroke({}, "return", 200000, application)
end

-- hammerspoon://vim?path=${projectPath}${filePath}&position=${line},${column}
hs.urlevent.bind("vim", function(_, params)
  local path = params["path"]
  local position = params["position"]

  if path == nil or position == nil then
    return hs.alert.show("Invalid URL")
  end

  local alacritty = hs.application.get('org.alacritty')

  if alacritty == nil then
    return hs.alert.show("Alacritty is not running")
  end

  local allTmuxSessions, isTmuxRunning = hs.execute("tmux ls", true)

  if not isTmuxRunning then
    return hs.alert.show("Tmux is not running")
  end

  if not string.find(allTmuxSessions, "(attached)") then
    return hs.alert.show("Tmux is not active")
  end

  local HOME = os.getenv("HOME")
  local SESSION_NAME = 'LocatorJS'
  local REMOTE_SOCKET = "/tmp/locatorjs.pipe"

  local projectPath = path:match("^" .. HOME .. "/Workspace/[%w-_]+/[%w-_]+")

  alacritty:activate()

  hs.execute(interp(
    "tmux new-session -d -s $sessionName -c $home; tmux switch-client -t $sessionName",
    { home = HOME, sessionName = SESSION_NAME }
  ), true)

  local isNvimRunning = hs.fs.displayName(REMOTE_SOCKET)

  if isNvimRunning then
    hs.execute(interp(
      "nvim --server $remoteSocket --remote-send ':cd $projectPath | e $path | call cursor($position)<CR>'",
      { remoteSocket = REMOTE_SOCKET, projectPath = projectPath, path = path, position = position }
    ), true)
  else
    hs.eventtap.textSubmit(interp(
      "nvim --listen $remoteSocket '+cd $projectPath | call cursor($position)' $path",
      { remoteSocket = REMOTE_SOCKET, projectPath = projectPath, path = path, position = position }
    ), alacritty)
  end
end)

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
