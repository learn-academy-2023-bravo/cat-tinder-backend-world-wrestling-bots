class BotsController < ApplicationController

    def index
        bots = Bot.all
        render json: bots
    end

    def create
        # Create a new bot
        bot = Bot.create(bot_params)
        render json: bot
    end

    private
    def bot_params
        params.require(:bot).permit(:name, :age, :weight, :enjoys, :image)
    end

    def update
    end

    def destroy
    end

end
