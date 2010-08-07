module SimplePages
  def show
    respond_to?(action) ? executes_action : renders_template
  end

  protected
  def action
    @action ||= permalink(page_id)
  end

  def executes_action
    send(action)
    render template_path
  rescue ActionView::MissingTemplate
    render 'show'
  end

  def renders_template
    render template_path
  rescue ActionView::MissingTemplate
    render 'not_found', :status => 404
  end
  
  def template_path
    [controller_name, page_locale, action].compact.join("/")
  end
  
  def page_locale
    return I18n.locale = params[:locale] if params[:locale]
    return I18n.locale if I18n.locale != I18n.default_locale
  end

  def page_id
    @page_id ||= params[:id]
  end
  
  def permalink(string)
    str = ActiveSupport::Multibyte::Chars.new(string)
    str = str.normalize(:kd).gsub(/[^\x00-\x7F]/,'').to_s
    str = URI.unescape(str)
    str.gsub!(/[^-\w\d]+/sim, "-")
    str.gsub!(/-+/sm, "-")
    str.gsub!(/^-?(.*?)-?$/, '\1')
    str.downcase!
    str.underscore
  end
end