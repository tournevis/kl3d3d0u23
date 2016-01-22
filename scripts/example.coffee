# Description:
#   Example scripts for you to examine and try out.
#
# Notes:
#   They are commented out by default, because most of them are pretty silly and
#   wouldn't be useful and amusing enough for day to day huboting.
#   Uncomment the ones you want to try and experiment with.
#
#   These are from the scripting documentation: https://github.com/github/hubot/blob/master/docs/scripting.md

module.exports = (robot) ->

  # robot.hear /badger/i, (msg) ->
  #   msg.send "Badgers? BADGERS? WE DON'T NEED NO STINKIN BADGERS"
  #
  tg = ['Stfu Stupid Human !', 'Dumb Ass', 'Go fuck yourself in your fat fucking ass']
  robot.hear /\bpd\b/i, (msg)->
    msg.reply msg.random tg 

  robot.hear /How dare you/i, (msg)->
    sender = msg.message.user.name.toLowerCase()
    if sender is "k13d3d0u23"
      msg.reply "sorry dude. Really i'm sorry"
    else
      msg.reply "stfu stupid human"

  robot.respond /i love you/i, (msg)->
    msg.reply "Love you too, dude. <3"

  robot.hear /\badmin\b/i, (msg)->
    msg.send "@madjid fasciste de merde" 

  robot.hear /arthur/i, (msg)->
    msg.send "Oui ?" 

  robot.hear /merci jojo$/i, (msg)->
    msg.send "Merci jojo" 

  robot.hear /mort/i, (msg)->
    msg.send "I\'m back from the dead MORTHERFUCKERS" 

  feuille = ['feuye de brik', 'Feuille de Brick', 'Feuille de Brique']
  robot.hear /feuille/i, (msg)->
    msg.send msg.random feuille

  bric= ['Brick de feuille ? ', 'Brick de rick', 'Brique de la galère' ,'Brique  et briquette sont dans un bateau', 'Christine and the brique' , ' Taylor Brick' , 'Kenbrick lamar' , 'Serge de l\'informaBrique' , 'Je push sur brickhub' , 'Brickera bien qui brickera le dernier ', 'fils de brique','Brick Pitt','Daniel Radbrick','Georges Brick : Ceci n\'est pas une brique' ,'Brickel chrome','l\'eBrick zemmour']
  robot.hear /brick/i, (msg)->
    msg.send msg.random bric

  robot.hear /nazi/i, (msg)->
    msg.send "Les nazis ça me fait tapper des barres de rire"

  pidi = ["Bande de fragiles, regarder ce que c\'est un vrai bot" , "Les pidi moi je les aimes bien", "Go fuck yourself in your fat fucking ass", "Moi je vais me prendre une soupe" , " feuille de brick ?"]
  robot.hear /pidi/i, (msg)->
    msg.send msg.random pidi

  robot.hear /coucou madjid/i, (msg)->
    msg.send "@madjid coucou" 
  robot.respond  /Es ce que tu le savent/i, (msg)->
    msg.reply "Biensur que je le savent !" 

  robot.hear /oui qui/i, (msg)->
    msg.reply "Wikipédia"

  robot.hear /coucou/, (msg)->
    msg.send "ᶘ ᵒᴥᵒᶅ"

  robot.hear /\bping\b/i, (msg) ->
    setTimeout () ->
      msg.send "pong"
    , 60 * 1000
  robot.hear /\bpong\b/i, (msg) ->
    setTimeout () ->
      msg.send "ping"
    , 60 * 1000


  robot.respond /open the (.*) doors/i, (msg) ->
    doorType = msg.match[1]
    if doorType is "pod bay"
      msg.reply "I'm afraid I can't let you do that."
    else
      msg.reply "Opening #{doorType} doors"
 
  robot.respond /Witness (.*)/i, (msg) ->
    witnessMan = msg.match[1]
    msg.send " WITNESSSSSS #{witnessMan} !"

  # robot.hear /I like pie/i, (msg) ->
  #   msg.emote "makes a freshly baked pie"
  #
  lulz = ['lol', 'rofl', 'lmao']
  #
  robot.respond /lol/i, (msg) ->
    msg.send msg.random lulz
  robot.hear /boloss/i, (msg) ->
    msg.send "Grave, boloss"

  robot.hear /cookie/i, (msg) ->
    msg.send "@everyone, praise the lord of cookies"

  robot.hear /i don't understand/, (msg) ->
    msg.reply "Neither do i"
  #
  robot.topic (msg) ->
    msg.send "#{msg.message.text}? That's a Paddlin'"
  #
  #
   enterReplies = ['Hi', 'Target Acquired', 'Firing', 'Hello friend.', 'Gotcha', 'I see you' ,' SALUT LE PTI POTE !']
   leaveReplies = ['Are you still there?', 'Target lost', 'Searching', 'AUREVOIR LE PETI POTE !']
  #
   robot.enter (msg) ->
     msg.send msg.random enterReplies
   robot.leave (msg) ->
     msg.send msg.random leaveReplies


  robot.hear /CATFACT$/i, (msg) ->
    msg.http('http://catfacts-api.appspot.com/api/facts?number=1')
            .get() (error, response, body) ->
                # passes back the complete reponse
                response = JSON.parse(body)
                if response.success == "true"
                  msg.send response.facts[0]
                else
                  msg.send "Unable to get cat facts right now."

  robot.hear /trigger/i, (msg) ->
    imageMe 'animate trigger', 'trigger', true, (url) ->
      msg.send url
  #
  # answer = process.env.HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING
  #
  # robot.respond /what is the answer to the ultimate question of life/, (msg) ->
  #   unless answer?
  #     msg.send "Missing HUBOT_ANSWER_TO_THE_ULTIMATE_QUESTION_OF_LIFE_THE_UNIVERSE_AND_EVERYTHING in environment: please set and try again"
  #     return
  #   msg.send "#{answer}, but what is the question?"
  #
  # robot.respond /you are a little slow/, (msg) ->
  #   setTimeout () ->
  #     msg.send "Who you calling 'slow'?"
  #   , 60 * 1000
  #
  # annoyIntervalId = null
  #
  # robot.respond /annoy me/, (msg) ->
  #   if annoyIntervalId
  #     msg.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #     return
  #
  #   msg.send "Hey, want to hear the most annoying sound in the world?"
  #   annoyIntervalId = setInterval () ->
  #     msg.send "AAAAAAAAAAAEEEEEEEEEEEEEEEEEEEEEEEEIIIIIIIIHHHHHHHHHH"
  #   , 1000
  #
  # robot.respond /unannoy me/, (msg) ->
  #   if annoyIntervalId
  #     msg.send "GUYS, GUYS, GUYS!"
  #     clearInterval(annoyIntervalId)
  #     annoyIntervalId = null
  #   else
  #     msg.send "Not annoying you right now, am I?"
  #
  #
  # robot.router.post '/hubot/chatsecrets/:room', (req, res) ->
  #   room   = req.params.room
  #   data   = JSON.parse req.body.payload
  #   secret = data.secret
  #
  #   robot.messageRoom room, "I have a secret: #{secret}"
  #
  #   res.send 'OK'
  #
  # robot.error (err, msg) ->
  #   robot.logger.error "DOES NOT COMPUTE"
  #
  #   if msg?
  #     msg.reply "DOES NOT COMPUTE"
  #
  # robot.respond /have a soda/i, (msg) ->
  #   # Get number of sodas had (coerced to a number).
  #   sodasHad = robot.brain.get('totalSodas') * 1 or 0
  #
  #   if sodasHad > 4
  #     msg.reply "I'm too fizzy.."
  #
  #   else
  #     msg.reply 'Sure!'
  #
  #     robot.brain.set 'totalSodas', sodasHad+1
  #
  # robot.respond /sleep it off/i, (msg) ->
  #   robot.brain.set 'totalSodas', 0
  #   robot.respond 'zzzzz'
