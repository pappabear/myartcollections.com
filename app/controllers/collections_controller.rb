class CollectionsController < ApplicationController


  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]


  def index
    @collections = Collection.where('user_id=?', current_user)
  end


  def show
    @pieces = Collection.where('collection_id=?', @collection.id)
  end


  def new
    @collection = Collection.new
  end


  def edit
  end


  def create
    @collection = Collection.new(collection_params)
    @collection.user_id=current_user.id

    if @collection.save
      flash[:success] = "You've started a new collection."
      redirect_to collections_path
    else
      flash[:error] = "Ooops. Something went wrong on the server..."
      puts '-----------------------------------------------------'
      puts @collection.errors.count.to_s + ' ERROR(S) CAUGHT HERE, in Collection.create()'
      if @collection.errors.any?
        @collection.errors.full_messages.each do |msg|
          puts '-' + msg
        end
      end
      puts '-----------------------------------------------------'

      render :new

    end
  end


  def update
    if @collection.update(collection_params)
      flash[:success] = "Collection definition was successfully updated."
      redirect_to @collection
    else
      flash[:error] = "Ooops. Something went wrong on the server..."
      puts '-----------------------------------------------------'
      puts @collection.errors.count.to_s + ' ERROR(S) CAUGHT HERE, in Collection.update()'
      if @collection.errors.any?
        @collection.errors.full_messages.each do |msg|
          puts '-' + msg
        end
      end
      puts '-----------------------------------------------------'
      render :edit
    end
  end


  def destroy
    @collection.destroy
    respond_to do |format|
      format.html {
        flash[:success] = "Collection was successfully deleted."
        redirect_to collections_path
      }
      format.json { head :no_content }
    end
  end


  private


  # Use callbacks to share common setup or constraints between actions.
  def set_collection
    @collection = Collection.find(params[:id])
  end


  # Never trust parameters from the scary internet, only allow the white list through.
  def collection_params
    params.require(:collection).permit(:id, :user_id, :name, :description)
  end


  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "You have to be a registered user to do that. It's easy to <a href='/signup' style='color:black;'>join</a>!"
      redirect_to login_url
    end
  end


end
