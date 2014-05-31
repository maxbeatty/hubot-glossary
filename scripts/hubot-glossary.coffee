# Description:
#   Define and retrieve terms like a glossary
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#  None
#
# Notes:
#  See README.md
#
# Author:
#   maxbeatty
#
# Examples:
#  See README.md
#
# Tags:
#  glossary
#
# Urls:
#  https://github.com/maxbeatty/hubot-glossary

module.exports = (robot) ->
  robot.brain.data.glossary = {}

  robot.respond /glossary find (.*)/i, (msg) ->
    term = msg.match[1].trim()
    def = robot.brain.data.glossary[term]
    if def
      msg.send "#{term} is #{def}"
    else
      msg.send "There is no definition for #{term}. Add one?"

  robot.respond /glossary add "(.+)" as (.+)/i, (msg) ->
    term = msg.match[1].trim()
    def = msg.match[2]
    robot.brain.data.glossary[term] = def
    msg.send "Added \"#{term}\" as #{def}"
