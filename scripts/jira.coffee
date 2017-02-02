module.exports = (robot) ->
  robot.respond /hello general (.*)$/i, (msg) ->
    robot.messageRoom 'jira', msg.match[1]
    robot.messageRoom 'jira', 'messageRoom from #slacktest'
