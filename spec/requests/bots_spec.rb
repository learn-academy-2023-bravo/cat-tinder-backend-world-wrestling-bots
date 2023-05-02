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
    it "should creates a new bot" do
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

    it "doesn't create a bot without a name" do
      bot_params = {
        bot: {
          age: 3,
          weight: 500,
          enjoys: 'getting recharged on a wireless charger.',
          image: 'botpic.jpeg'
        }
      }

      post '/bots', params: bot_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['name']).to include "can't be blank"
    end

    it "doesn't create a bot without an age" do
      bot_params = {
        bot: {
          name: 'rickRolls',
          weight: 125,
          enjoys: 'using tee bags as party favors.',
          image: 'botpic.jpeg'
        }
      }

      post '/bots', params: bot_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['age']).to include "can't be blank"
    end

    it "doesn't create a bot without an image" do
      bot_params = {
        bot: {
          name: '#chainz',
          age: 1,
          weight: 500,
          enjoys: 'producing sparks!'
        }
      }

      post '/bots', params: bot_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['image']).to include "can't be blank"
    end

    it "doesn't create a bot without an enjoys" do
      bot_params = {
        bot: {
          name: '0100101',
          age: 2,
          weight: 250,
          image: 'botpic.jpg'
        }
      }

      post '/bots', params: bot_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['enjoys']).to include "can't be blank"
    end

    it "doesn't create a bot if enjoys is smaller than 10" do
      bot_params = {
        bot: {
          name: 'BotyMcBotFace',
          age: 2,
          weight: 235,
          enjoys: 'resetting',
          image: 'botypic.jpg'
        }
      }

      post '/bots', params: bot_params

      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['enjoys']).to include "is too short (minimum is 10 characters)"
    end
  end

  describe "PUT /update" do
    it "should update an existing bot" do
      bot = Bot.create(
          name: 'X-Claus',
          age: 1,
          weight: 100,
          enjoys: 'Making coal.',
          image: 'xmas.jpeg'
      )

      update_params = {
        bot: {
          name: 'ClausBot',
          age: 2,
          weight: 105,
          enjoys: 'Playing tricks on humans.',
          image: '2023xmas.jpeg'
        }
      }

      patch "/bots/#{bot.id}", params: update_params

      expect(response).to have_http_status(200)

      bot = Bot.first

      expect(bot.name).to eq 'ClausBot'

    end

    it "should fail to update without proper params" do
      bot = Bot.create(
          name: 'MacPlee',
          age: 150,
          weight: 75,
          enjoys: 'beatting on Droids.',
          image: 'MacTosh.jpeg'
        )

      update_params = {
        bot: {
          name: nil,
          age: nil,
          weight: nil,
          enjoys: nil,
          image: nil
        }
      }

      patch "/bots/#{bot.id}", params: update_params
      
      expect(response).to have_http_status(422)
      
      json = JSON.parse(response.body)
      # puts response.body
      expect(json['name']).to include "can't be blank"
      expect(json['age']).to include "can't be blank"
      expect(json['weight']).to include "can't be blank"
      expect(json['enjoys']).to include "can't be blank"
      expect(json['image']).to include "can't be blank"
    end  
  end

  describe "DELETE /destroy" do
    it "should delete an existing bot" do
      bot = Bot.create(
        bot: {
          name: '01001111 01100001 01101111 01110011 01110110 01101111 01100101 01101110 01101100 01101100',
          age: 2,
          weight: 250,
          enjoys: '01000011 01100010 01101111 01110100 01101100 01100111 01101111 01110011 01100101 01101000 01100101 01110001 01110010 01100101 01110011 01110100 01100011 01110100 01100110 01101001 01101110',
          image: 'botpic.jpg'
        }
      )

      delete "/bots/#{bot.id}"

      expect(response).to have_http_status(200)
      # expect(response.body).to be_nil

    end
  end
end