module.exports = (robot) ->
  robot.respond /hello general$/i, (msg) ->
    robot.messageRoom 'jira', 'messageRoom from #slacktest'
