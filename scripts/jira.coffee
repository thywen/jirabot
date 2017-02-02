prefix = "https://jira.simtechnik.de/browse/"
number_prefix = /^[0-9]$/
sg_prefix = /^SG-[0-9]$/
jira_room_name = "jira"
@suffix = ""

module.exports = (robot) ->
  robot.respond /story (.*)$/i, (msg) ->
    story_number = msg.match[1]
    if story_number.match number_prefix
      msg.send "Hi"
    else
      msg.send "Please enter correct story number - either SG-<Number> or just the number"
