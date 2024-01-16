class LineItemDatesController < ApplicationController
  before_action :set_quote, only: [:new, :create, :update, :destroy, :edit]
  before_action :set_line_item_date, only: [:update, :destroy, :edit]

  def new
    @line_item_date = @quote.line_item_dates.build
  end

  def create
    @line_item_date = @quote.line_item_dates.build(line_item_date_params)
    if @line_item_date.save
      respond_to do |format|
        format.html { redirect_to @quote }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully created." }
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @line_item_date.update(line_item_date_params)
      respond_to do |format|
        format.html { redirect_to @quote }
        format.turbo_stream { flash.now[:notice] = "Quote was successfully updated." }
      end
    else
      render :edit
    end
  end

  def destroy
    @line_item_date.destroy
    respond_to do |format|
      format.html { redirect_to @quote }
      format.turbo_stream { flash.now[:notice] = "Quote was successfully destroyed." }
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = LineItemDate.find(params[:id])
  end
  
  def line_item_date_params
    params.require(:line_item_date).permit(:date)
  end
end
