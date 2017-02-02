prefix = "https://jira.simtechnik.de/browse/"
number_prefix = ^[0-9]$
sg_prefix = ^SG-[0-9]$
jira_room_name = "jira"

module.exports = (robot) ->
  robot.respond /story (.*)$/i, (msg) ->
    story_number = msg.match[1]
    robot.messageRoom jira_room_name, "#{prefix}#{story_number}"
