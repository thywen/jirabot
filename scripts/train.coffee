url = "http://www.mvg-live.de/MvgLive/MvgLive.jsp#haltestelle=Unterföhring&gehweg=0&zeilen=7&ubahn=false&bus=true&tram=false&sbahn=true"
html = ""

module.exports = (robot) ->
  robot.respond /trains/i, (msg) ->
    msg.http(url)
            # and makes an http get call
            .get() (error, response, body) ->
                # passes back the complete reponse
                msg.send body
