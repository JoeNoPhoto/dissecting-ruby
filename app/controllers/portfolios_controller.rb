# Defining the Portfolio Controller
class PortfoliosController < ApplicationController
  # GET /portfolios
  def index
    @portfolio_items = Portfolio.all
  end

  def javascript
    @javascript_portfolio_items = Portfolio.javascript
  end

  def rubyrails
    @ruby_on_rails_portfolio_items = Portfolio.rubyrails
  end

  # GET /portfolios/new
  def new
    @portfolio_item = Portfolio.new
  end

  # GET /blogs/1/edit
  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  # POST /portfolios
  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body))
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item has been added.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blogs/1
  def update
    @portfolio_item = Portfolio.find(params[:id])
    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :body))
        format.html { redirect_to portfolios_path, notice: 'Portfolio record(s) successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # GET /portfolios/1
  def show
    @portfolio_item = Portfolio.find(params[:id])
  end

  # DELETE /blogs/1
  def destroy
    # Perform the lookup
    @portfolio_item = Portfolio.find(params[:id])
    # Destroy/delete the record
    @portfolio_item.destroy
    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio record was destroyed.' }
    end
  end
end
