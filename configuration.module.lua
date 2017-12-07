local config = {}

config.MAX_SERVER_COUNT = 2
config.SERVER_MAX_PLAYER_COUNT = 50
config.SERVER_RESERVED_SPOTS = 0

config.SERVER_SELECT_DISABLE_COREGUIS = true

config.UPTIME_TEXT_FORMAT = "Uptime %02d:%02d:%02d"
config.PLAYER_COUNT_TEXT_FORMAT = "Players: %s / %s"
config.SERVER_FRAME_EXPAND_MULTIPLIER = 3

config.EMPTY_SERVER_DATA = {
	playerCount = 0,
	startTime = 0,
	averagePing = 0,

	serverId = game.JobId,
}

config.CURRENT_SERVER_COLOR = Color3.fromRGB(50, 84, 57)

return config
