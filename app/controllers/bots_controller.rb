class BotsController < ApplicationController

    def index
        bots = Bot.all
        render json: bots
    end

    def create
        # Create a new bot
        bot = Bot.create(bot_params)
        if bot.valid?
            render json: bot
        else
            render json: bot.errors, status: 422
        end
    end

    def update
        bot = Bot.find(params[:id])
        bot.update(bot_params)
        if bot.valid?
            render json: bot
        else
            render json: bot.errors, status: 422
        end
    end
    
    def destroy
        bot = Bot.find(params[:id])
        if bot.destroy
            render json: bot
        else
            render json: bot.errors
        end
    end
    
    private
    def bot_params
        params.require(:bot).permit(:name, :age, :weight, :enjoys, :image)
    end 
end