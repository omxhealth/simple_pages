module SimplePages
  def show
    respond_to?(action) ? executes_action : renders_template
  end

  protected
  def action
    page.underscore
  end

  def executes_action
    send(action)
    render action
  rescue ActionView::MissingTemplate
    render 'show'
  end

  def renders_template
    render action
  rescue ActionView::MissingTemplate
    render 'not_found', :status => 404
  end

  def page
    @page ||= params[:id]
  end
end