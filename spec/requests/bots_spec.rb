require 'rails_helper'

RSpec.describe "Bots", type: :request do
  describe "GET /index" do
    it "it gets a list of bots" do
      Bot.create(
        name: 'KillaMikeX',
        age: 3,
        weight: 157,
        enjoys: 'feasting on the hydrolic fluid of my enemies.',
        image: 'killamikex.jpeg'
      )

      # Make a request
      get '/bots'

      bot = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(bot.length).to eq 1
    end  
  end

  describe "POST /create" do
    it "creates a bot"do
      # The Params we are going to send in this request
      bot_params = {
        bot: {
          name: 'KillaMikeX',
          age: 3,
          weight: 157,
          enjoys: 'feasting on the hydrolic fluid of my enemies.',
          image: 'killamikex.jpeg'
        }
      }

      # Send request to the server
      post '/bots', params: bot_params

      # Assure that we got a success back
      expect(response).to have_http_status(200)

      # Look up the bot we created in the db
      bot = Bot.first

      # Assure that the created bot has the correct attributes
      expect(bot.name).to ep 'KillaMikeX'

    end
  end
end
