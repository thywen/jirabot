url = "http://www.mvg-live.de/MvgLive/MvgLive.jsp#haltestelle=Unterföhring&gehweg=0&zeilen=7&ubahn=false&bus=true&tram=false&sbahn=true"


module.exports = (robot) ->
  robot.hear /trains/i, (res) ->
    robot.http(url)
    .get() (err, res, body) ->
      res.send body
