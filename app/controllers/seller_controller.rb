class SellerController < ApplicationController
  before_action :authenticate_user!
  def show_seller
    @user = User.all
  end
  def make_seller
    render json: {message: Seller.makeseller(params[:user_id])}
  end
end