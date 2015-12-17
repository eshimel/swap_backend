#
class ResourcesController < OpenReadController
  before_action :set_resource, only: [:update, :destroy]
  # GET /resources

  def index
    # if current_user
    #   @resources = current_user.resources
    # else
    #   @resources = Resource.all
    # end
    @resources = Resource.all
    render json: @resources
  end

  # GET /resources/1
  def show
    def show

    render json: current_user.resource
    end
  end

  # POST /resources
  def create
    @resource = current_user.trades.new(resource_params)
    # makes this, this user's resource.

    if @resource.save
      render json: @resource, status: :created, location: @resource
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # PATCH /resources/1
  def update
    if @resource.update(resource_params)
      head :no_content
    else
      render json: @resource.errors, status: :unprocessable_entity
    end
  end

  # DELETE /resources/1
  def destroy
    @resource.destroy

    head :no_content
  end

  def set_resource
    @resource = current_user.resources.find(params[:id])
  end

  def resource_params
    params.require(:resource).permit(:type, :description)
  end

  private :set_resource, :resource_params
end

