prefix = "https://jira.simtechnik.de/browse/"
number_prefix = ^[0-9]$
sg_prefix = ^SG-[0-9]$
jira_room_name = "jira"

module.exports = (robot) ->
  robot.respond /story (.*)$/i, (msg) ->
    story_number = msg.match[1]
    if (story_number.match number_prefix) {
      suffix = "SG-" + story_number
    } else if (story_number.match sg_prefix) {
      suffix = story_number
    } else {
      robot.message "Please enter correct story number - either SG-<Number> or just the number"
    }

    send_story: ->
      robot.messageRoom jira_room_name, prefix + suffix
    robot.messageRoom 'jira',
    robot.messageRoom 'jira', 'New Story!'
