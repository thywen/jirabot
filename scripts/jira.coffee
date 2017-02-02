prefix = process.env.HUBOT_JIRA_PREFIX
number_prefix = /^\d+$/
sg_prefix = /^[sS][gG]-\d+$/
jira_room_name = "jira"

module.exports = (robot) ->
  robot.respond /story (.*)$/i, (msg) ->
    msg.send "the variable is #{prefix}"
    if prefix
      story_number = msg.match[1]
      if story_number.match number_prefix
        msg.messageRoom jira_room_name " #{prefix}SG-#{story_number}"
        msg.messageRoom jira_room_name "@channel New story"
      else if story_number.match sg_prefix
        msg.messageRoom jira_room_name " #{prefix}SG-#{story_number}"
        msg.messageRoom jira_room_name "@channel New story"
      else
        msg.send "Please enter correct story number - either SG-<Number> or just the number"
    else
      msg.send "Please set the HUBOT_JIRA_PREFIX variable"
