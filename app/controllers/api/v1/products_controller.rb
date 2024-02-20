class Api::V1::ProductsController < ApplicationController
  def index
    products=Product.all
    render json: products,status:200
  end

  def show
    product=Product.find(params[:id])
    if product
      render json:product,status:200
    else 
      render json:{error: "Not Found"}
    end
  end

  def create
    product=Product.new( product_params)
    if product.save
      render json:product,status: 200

    else 
      render json:{error:"Product not create"}
    end
  end
  def destroy
    product=Product.find(params[:id])
    product.destroy
    render json:{message:"Product delete succesfully"}
  end

  private
  def product_params
    params.require(:product).permit([:name,:brand,:price])
  end
end
