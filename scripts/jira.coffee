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

prefix = process.env.HUBOT_JIRA_PREFIX
jira_room_name = process.env.HUBOT_JIRA_CHANNEL
number_prefix = /^\d+$/
sg_prefix = /^[sS][gG]-\d+$/


publish_story = (url, robot) ->
  robot.messageRoom jira_room_name, url
  robot.messageRoom jira_room_name, "@channel New story"

prepare_story_link = (robot, msg) ->
  if story_number.match number_prefix
    publish_story("#{prefix}SG-#{story_number}", robot)
  else if story_number.match sg_prefix
    publish_story("#{prefix}#{story_number}", robot)
  else
    msg.send "Please enter correct story number - either SG-<Number> or just the number"

module.exports = (robot) ->
  robot.respond /story (.*)$/i, (msg) ->
    if prefix
      story_number = msg.match[1]
      if jira_room_name
        prepare_story_link(robot, msg)
      else
        msg.send "Please set the HUBOT_JIRA_CHANNEL environment variable"
    else
      msg.send "Please set the HUBOT_JIRA_PREFIX environment variable"
