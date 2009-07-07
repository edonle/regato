class SitesController < ApplicationController

  before_filter :login_required, :only => [:show, :edit, :update, :destroy, :list]

  # GET /sites
  # GET /sites.xml
  def index
    
    @categories = Category.find(:all, :order => 'title')
    @sites = Site.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @sites }
	  format.iphone # index.iphone.erb
    end
  end
  
  def list
    
    @sites = Site.find(:all, :conditions => {:activation_code => nil})

    respond_to do |format|
      format.html # list.html.erb
      format.xml  { render :xml => @sites }
	  format.iphone # list.iphone.erb
    end
  end

  # GET /sites/1
  # GET /sites/1.xml
  def show
    @site = Site.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site }
	  format.iphone
    end
  end

  # GET /sites/new
  # GET /sites/new.xml
  def new
    @site = Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site }
	  format.iphone
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Site.find(params[:id])
  end

  # POST /sites
  # POST /sites.xml
  def create
    @site = Site.new(params[:site])

    respond_to do |format|
      if @site.save
        flash[:notice] = 'Obrigado pela sua sugest&#227;o!'
        format.html { redirect_to(sites_url) }
        format.xml  { render :xml => @site, :status => :created, :location => @site }
		format.iphone { redirect_to(sites_url) }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
		format.iphone { render :action => "new" }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.xml
  def update
    @site = Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:site])
        flash[:notice] = 'Site was successfully updated.'
        format.html { redirect_to(@site) }
        format.xml  { head :ok }
		format.iphone { redirect_to(@site) }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
		format.iphone { render :action => "edit" }
      end
    end
  end

  # DELETE /sites/1
  # DELETE /sites/1.xml
  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    respond_to do |format|
      format.html { redirect_to(sites_url) }
      format.xml  { head :ok }
	  format.iphone { redirect_to(sites_url) }
    end
  end
  
  def activate
    @site = params[:activation_code].blank? ? false : Site.find_by_activation_code(params[:activation_code])
    # Se o site n�o estiver ativo, fa�a-o.
    if !@site.active?
      @site.activate
      flash[:notice] = "O site #{@site.url} foi ativado com sucesso!"
    else
      flash[:notice] = "O site #{@site.url} j� est� ativado!"
    end
    redirect_to :controller => 'sites', :action => 'index'
  end
  
  def about

    respond_to do |format|
      format.html # about.html.erb
	  format.iphone # about.iphone.erb
    end
  end
end