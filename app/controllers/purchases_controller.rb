class PurchasesController < ApplicationController
  before_action :set_purchase, only: %i[ show update destroy ]

  # GET /purchases
  def index
    @purchases = Purchase.all

    render json: @purchases
  end

  # GET /purchases/1
  def show
    render json: @purchase
  end

  # POST /purchases
  def create
    render json: purchase.errors, status: 422 and return unless params[:purchases]
    all_created = true
    purchases = []
    params[:purchases].each do |purchase_params|
    purchase = Purchase.create(type_p: purchase_params[:type_p], date: purchase_params[:date], value: purchase_params[:value], document: purchase_params[:document], card:purchase_params[:card], time: purchase_params[:time], store_name: purchase_params[:store_name], store_owner: purchase_params[:store_owner])
    all_created &&= purchase.valid?
  end

  if all_created
    render json: purchases, status: 201
  else
    render json: purchases.map(&:errors), status: 422
  end 
  end

  # PATCH/PUT /purchases/1
  def update
    if @purchase.update(purchase_params)
      render json: @purchase
    else
      render json: @purchase.errors, status: :unprocessable_entity
    end
  end

  # DELETE /purchases/1
  def destroy
    @purchase.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_params
      params.require(:purchase).permit(:type_p, :date, :value, :document, :card, :time, :store_name, :store_owner)
    end
end
