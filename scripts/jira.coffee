# Description:
#   A small command adding the link for a jira story into the jira channel
#   It is necessaty to set HUBOT_JIRA_PREFIX and the Jira channel as environment
#   variables
#
# Dependencies:
#   none
#
# Configuration:
#   None
#
# Commands:
#   hubot story <number of story> - Adds the link for a new story into the jira channel
#
# Author:
#   Sven Kroell

jira_url = process.env.HUBOT_JIRA_PREFIX
jira_room_name = process.env.HUBOT_JIRA_CHANNEL
story_prefix = process.env.HUBOT_STORY_PREFI
number_regex = /^\d+$/

module.exports = (robot) ->
    robot.respond /story (.*)$/i, (msg) ->
      if jira_url and story_prefix and jira_room_name
        story_number = msg.match[1]
        if story_number.match number_regex
            robot.messageRoom jira_room_name, "#{jira_url}#{story_prefix}-#{story_number}"
            robot.messageRoom jira_room_name, "@channel New story"
        else
          msg.send "Please enter correct story number"
      else
        msg.send "Please add HUBOT_JIRA_CHANNEL, HUBOT_JIRA_PREFIX and HUBOT_STORY_PREFIX"
