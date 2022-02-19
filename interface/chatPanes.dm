var/client_chat_split_priority = TRUE
var/client_chat_split_department = TRUE
var/client_chat_split_common = TRUE

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
