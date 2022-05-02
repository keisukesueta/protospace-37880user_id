class PrototypesController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  #before_action :move_to_index, except: [:index, :show]

  def index
    @prototypes = Prototype.includes(:user).order("created_at DESC")
  end

  def new
    @prototype = Prototype.new
    #@prototype = Prototype.find(params[:prototypes_id])
  end

  def create
     @prototype = Prototype.new(prototype_params)
     #Prototype = Room.find(params[:room_id])
     #@message = @room.messages.new(message_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    #@prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments
    #@comments = Comment.find_by(id:params[:id], prototype_id: params[:prototype_id])
  end


  def update
       prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
       redirect_to prototype_path(@prototype)
    else
       render :edit
    end
  end

  def edit
      @prototype = Prototype.find(params[:id])
  end


  def destroy
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end


  #def destroy
       #prototype = Prototype.find(params[:id])
   #if  prototype.destroy
       #redirect_to root_path
   #end
  #end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)

  end
  
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end


  def contributor_confirmation
    redirect_to root_path unless current_user == @prototype.user
  end
  #end

  def user_params
    params.require(:@user).permit(:name, :email, :profile, :position, :occupation)
  end

  #def move_to_index
    #if user_signed_in?
    #unless 
      #redirect_to action: :index
    #end
  #end
end
 
