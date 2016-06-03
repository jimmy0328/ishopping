class Admin::ProductsController < Admin::AdminController

  before_action :set_product, only: [:edit, :show, :destroy, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def update
    if Product.update(product_params)
      redirect_to admin_products_path, :flash=>{ :notice => '修改成功'}
    else
      render :new, :flash=>{ :notice => '修改失敗'}
    end
  end

  def create
    if Product.create!(product_params)
      redirect_to admin_products_path, :flash=>{ :notice => '新增成功'}
    else
      render :new, :flash=>{ :notice => '新增失敗'}
    end
  end

  def edit; end

  def show; end

  def destroy
    @product.destroy
    redirect_to admin_products_path, :flash=>{ :notice => '刪除成功'}
  end


  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :cost, :price, :cover_image, :tag, :display)
  end

end
