chai = require 'chai'
should = chai.should()
expect = chai.expect

fat = require '../lib/fat_tests'

describe 'vreme.coffee', ->
  this.timeout 16000
  bot = require("../scripts/vreme")(new fat.BotTest())
  # generic test

  it 'test .potres', (done)->
    bot.test ".potres", (msg)->
      console.log msg
      expect(msg).to.be.a('string')
      expect(msg.length).to.be.at.least 20
      done()
