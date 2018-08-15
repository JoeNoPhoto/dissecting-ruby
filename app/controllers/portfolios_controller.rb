# Defining the Portfolio Controller
class PortfoliosController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_portfolio_item, only: [:edit, :update, :show, :destory]
  layout 'portfolio'
  access all: [:show, :index, :rubyrails],
         user: { except: [:destroy, :new, :create, :update, :edit, :sort] },
         site_admin: :all
  # GET /portfolios
  def index
    @portfolio_items = Portfolio.by_position
    # @portfolio_jumbotron = true
  end

  def sort
    params[:order].each do |key, value|
      Portfolio.find(value[:id]).update(position: value[:position])
    end

    render body: nil
  end

  def rubyrails
    @rubyrails_portfolio_items = Portfolio.rubyrails
  end

  # GET /portfolios/new
  def new
    @portfolio_item = Portfolio.new
  end

  # POST /portfolios
  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio item has been added.' }
      else
        format.html { render :new }
      end
    end
  end

  # GET /blogs/1/edit
  def edit
    @portfolio_item = Portfolio.find(params[:id])
  end

  # PATCH/PUT /blogs/1
  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: 'Portfolio record(s) successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # GET /portfolios/1
  def show
  end

  # DELETE /blogs/1
  def destroy
    # Destroy/delete the record
    @portfolio_item.destroy
    # Redirect
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Portfolio record was destroyed.' }
    end
  end

  def set_portfolio_item
    @portfolio_item = Portfolio.find(params[:id])
  end
end
