prefix = "https://jira.simtechnik.de/browse/"
number_prefix = /^\d+$/
sg_prefix = /^[sS][gG]-\d+$/
jira_room_name = "jira"

module.exports = (robot) ->
  robot.respond /story (.*)$/i, (msg) ->
    story_number = msg.match[1]
    if story_number.match number_prefix
      msg.send "#{prefix}SG-#{story_number}"
    else if story_number.match sg_prefix
      msg.send "#{prefix}#{story_number.toUpperCase()}"
    else
      msg.send "Please enter correct story number - either SG-<Number> or just the number"
