prefix = "https://jira.simtechnik.de/browse/"
number_prefix = /^[0-9]/
sg_prefix = /^SG-[0-9]/
jira_room_name = "jira"

module.exports = (robot) ->
  robot.respond /story (.*)$/i, (msg) ->
    story_number = msg.match[1]
    if story_number.match number_prefix
      msg.send "#{prefix}SG-#{story_number}"
    else if story_number.match sg_prefix
      msg.send "#{prefix}#{story_number}"
    else
      msg.send "Please enter correct story number - either SG-<Number> or just the number"
      msg.send "You added #{story_number}"
