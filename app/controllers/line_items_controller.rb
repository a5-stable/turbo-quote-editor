class LineItemsController < ApplicationController
  before_action :set_quote, only: [:new, :create, :update, :destroy, :edit]
  before_action :set_line_item_date, only: [:new, :create, :update, :destroy, :edit]
  before_action :set_line_item, only: [:update, :destroy, :edit]

  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = @line_item_date.line_items.build(line_item_params)

    if @line_item.save
      respond_to do |format|
        format.html { redirect_to quote_path(@quote), notice: "Item was successfully created." }
        format.turbo_stream { flash.now[:notice] =  "Item was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to quote_path(@quote), notice: "Item was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to quote_path(@quote), notice: "Item was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] =  "Item was successfully destroyed." }
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = LineItemDate.find(params[:line_item_date_id])
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:name, :description, :quantity, :price, :unit_price, :line_item_date_id)
  end
end
