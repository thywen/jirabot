# Description:
#   A small command adding the link for a jira story into the jira channel
#
# Dependencies:
#   none
#
# Configuration:
#   None
#
# Commands:
#   hubot story <number of story> - Adds the link for a new story into the jira
#
# Author:
#   Sven Kroell

prefix = process.env.HUBOT_JIRA_PREFIX
jira_room_name = "jira"
number_prefix = /^\d+$/
sg_prefix = /^[sS][gG]-\d+$/


publish_story = (url) ->
  robot.messageRoom jira_room_name, url
  robot.messageRoom jira_room_name, "@channel New story"


module.exports = (robot) ->
  robot.respond /story (.*)$/i, (msg) ->
    if prefix
      story_number = msg.match[1]
      if story_number.match number_prefix
        publish_story("#{prefix}SG-#{story_number}")
      else if story_number.match sg_prefix
        publish_story("#{prefix}#{story_number}")
      else
        msg.send "Please enter correct story number - either SG-<Number> or just the number"
    else
      msg.send "Please set the HUBOT_JIRA_PREFIX variable"
