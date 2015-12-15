#
class TradesController < OpenReadController
  before_action :set_trade, only: [:update, :destroy]
  # GET /trades
   def index
    if current_user
      @trades = current_user.trades
    else
      @trades = Trade.all
    end
    render json: @trades
   end

  # GET /trades/1
  def show
    def show

    render json: current_user.trade
    end
  end

  # POST /trades
  def create
    @trade = current_user.trades.new(trade_params) #makes this, this user's trade.

    if @trade.save
      render json: @trade, status: :created, location: @trade
    else
      render json: @trade.errors, status: :unprocessable_entity
    end
  end

  # PATCH /trades/1
  def update
    if @trade.update(trade_params)
      head :no_content
    else
      render json: @trade.errors, status: :unprocessable_entity
    end
  end

  # DELETE /trades/1
  def destroy
    @trade.destroy

    head :no_content
  end

  def set_trade
    @trade = current_user.trades.find(params[:id])
  end

  def trade_params
    params.require(:trade).permit(:giver_id, :receiver_id, :resource_id)
  end

  private :set_trade, :trade_params
end
