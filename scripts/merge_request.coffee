# Description:
#   A small command adding the link for a merge reqyest into the mergerequest channel
#
# Dependencies:
#   none
#
# Configuration:
#   None
#
# Commands:
#   hubot merge <project> #<number of request> - Adds the link for a mergerequest into the mergerequest channel
#
# Author:
#   Sven Kroell

prefix = "http://git.maibornwolff.de/pro7sat1/"
merge_request_prefix = /merge_requests
jira_room_name = "mergerequests"

publish_request = (url, robot) ->
  robot.messageRoom jira_room_name, url
  robot.messageRoom jira_room_name, "@channel New Merge request"


module.exports = (robot) ->
  robot.respond /merge (.*) #(.*) $/i, (msg) ->
    if prefix
      project = msg.match[1]
      number = msg.match[2]
      publish_request("#{prefix}#{project}#{merge_request_prefix}/#{number}")
