class LineItemsController < ApplicationController
  before_action :set_quote, only: [:new, :create, :update, :destroy, :edit]
  before_action :set_line_item_date, only: [:new, :create, :update, :destroy, :edit]

  def new
    @line_item = LineItem.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end

  def set_line_item_date
    @line_item_date = LineItemDate.find(params[:line_item_date_id])
  end
end
