class MembershipsController < ApplicationController
  before_action :set_membership, only: [:show, :edit, :update, :destroy]

  # GET /memberships
  # GET /memberships.json
  def index
    @memberships = Membership.all
  end

  # GET /memberships/1
  # GET /memberships/1.json
  def show
    @beer_clubs = BeerClub.all
    @user = current_user
  end

  # GET /memberships/new
  def new
    @beer_clubs = BeerClub.all
    @membership = Membership.new
    @user = current_user
    
  end

  # GET /memberships/1/edit
  def edit
  end

  # POST /memberships
  # POST /memberships.json
  def create
    @beer_clubs = BeerClub.all
    @user = current_user
    @membership = Membership.new(membership_params)
    @membership.user_id = current_user.id
    @membership.confirm = false

    respond_to do |format|
      if @membership.save
        format.html { redirect_to @membership.beer_club, notice: "#{@membership.user.username}, welcome to the club!" }
        format.json { render :show, status: :created, location: @membership }
      else
        @beer_clubs = BeerClub.all
        format.html { render :new }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memberships/1
  # PATCH/PUT /memberships/1.json
  def update
    respond_to do |format|
      if @membership.update(membership_params)
        format.html { redirect_to @membership, notice: 'Membership was successfully updated.' }
        format.json { render :show, status: :ok, location: @membership }
      else
        format.html { render :edit }
        format.json { render json: @membership.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memberships/1
  # DELETE /memberships/1.json
  def destroy
    @beer_clubs = BeerClub.all
    @membership.destroy
    respond_to do |format|
      club = @beer_clubs.find_by id:@membership.beer_club_id
      format.html { redirect_to user_path(current_user), notice: 'Membership in ended.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_membership
      @membership = Membership.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def membership_params
      params.require(:membership).permit(:beer_club_id, :user_id, :confirm)
    end
end
