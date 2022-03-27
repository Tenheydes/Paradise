var/client_chat_split_priority = TRUE
var/client_chat_split_department = TRUE
var/client_chat_split_common = TRUE

/client/verb/setChatChannelRouting()
	set name = "Set Chat Channel Routing"
	set category = "Preferences"
	var/datum/ui_module/chat_routing/routing = new()
	routing.ui_interact(usr)

/client/verb/toggleSplitPriority()
	set name = "toggleSplitPriority"
	set category = "Preferences"
	client_chat_split_priority = !client_chat_split_priority;

	if(client_chat_split_priority)
		winset(src, "pane-split-top-child", "top=pane-priority-comms")
	else
		winset(src, "pane-split-top-child", "top=;")

/client/verb/toggleSplitDepartment()
	set name = "toggleSplitDepartment"
	set category = "Preferences"
	client_chat_split_department = !client_chat_split_department;

	if(client_chat_split_department)
		winset(src, "pane-split-top-child", "bottom=pane-department-comms")
	else
		winset(src, "pane-split-top-child", "bottom=;")

/client/verb/toggleSplitCommon()
	set name = "toggleSplitCommon"
	set category = "Preferences"
	client_chat_split_common = !client_chat_split_common;

	if(client_chat_split_common)
		winset(src, "pane-split-bot-child", "top=pane-common-comms")
	else
		winset(src, "pane-split-bot-child", "top=;")



/datum/ui_module/chat_routing
	name = "Chat Routing"

/datum/ui_module/chat_routing/ui_interact(mob/user, ui_key = "main", datum/tgui/ui = null, force_open = FALSE, datum/tgui/master_ui = null, datum/ui_state/state = GLOB.always_state)
	ui = SStgui.try_update_ui(user, src, ui_key, ui, force_open)
	if(!ui)
		ui = new(user, src, ui_key, "ChatRouting", name, 400, clamp(80 + 50 * length(user.client.prefs.volume_mixer), 300, 600), master_ui, state)
		ui.set_autoupdate(FALSE)
		ui.open()

/datum/ui_module/chat_routing/ui_data(mob/user)
	var/list/data = list()

	var/list/channels = list()
	for(var/channel in user.client.prefs.routing)
		channels += list(list(
			"name" = channel,
			"routing" = user.client.prefs.routing[channel]
		))
	data["channels"] = channels

	return data

/datum/ui_module/chat_routing/ui_act(action, list/params)
	if(..())
		return

	. = TRUE
	switch(action)
		if("channel")
			var/channel = params["channel"]
			var/routing = text2num(params["routing"])
			if(isnull(channel) || isnull(routing))
				return FALSE
			usr.client.prefs.routing[channel] = routing
			updateWindowVis()
		else
			return FALSE

/datum/ui_module/chat_routing/proc/updateWindowVis()
	var/channel_in_use[3]
	for(var/channel in usr.client.prefs.routing)
		var/routing = usr.client.prefs.routing[channel]
		if(routing != 0)
			channel_in_use[routing] = TRUE

	winset(usr, "pane-split-child", channel_in_use[PANE_A] || channel_in_use[PANE_B] ? "top=pane-split-top" : "top=;")
	winset(usr, "pane-split-top-child", channel_in_use[PANE_A] ? "top=pane-priority-comms" : "top=;")
	winset(usr, "pane-split-top-child", channel_in_use[PANE_B] ? "bottom=pane-department-comms" : "bottom=;")
	winset(usr, "pane-split-bot-child", channel_in_use[PANE_C] ? "top=pane-common-comms" : "top=;")




