class ProductsController < ApplicationController

  def index
    @products = Product.all
    @user = User.where(product_id: @product.id)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:success] =　'商品を登録しました'
      redirect_to product_index_path
    else
      flash.now[:danger] = '商品登録に失敗しました'
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    @product.user_id == current_user.id
  end

  def update
    @product = Product.find(params[:id])
    if @product.save
      flash[:success] =　'商品を編集しました'
      redirect_to product_index_path
    else
      flash.now[:danger] = '商品を編集できませんでした'
      render :edit
    end
  end

  def destroy
    if @product.user_id == current_user.id
      @product.destroy
    end
    flash[:success] = "削除しました"
    redirect_to product_index_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :describe, :price, :id).merge(:user_id: current_user.id)
  end
end
