module SimplePages
  def self.included(base)
    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def show
      if page_action.present? && respond_to?(page_action)
        executes_page_action
      else
        render_page_template
      end
    end

    protected
    def page_action
      @page_action ||= page_permalink params[:id]
    end

    def executes_page_action
      send page_action if page_action != "show"
      render page_template_path
    rescue ActionView::MissingTemplate
      render 'show'
    end

    def render_page_template
      render page_template_path
    rescue ActionView::MissingTemplate
      render 'not_found', :status => 404
    end

    def page_template_path
      [controller_name, page_locale, page_action].compact * "/"
    end

    def page_locale
      return I18n.locale = params[:locale] if params[:locale]
      return I18n.locale if I18n.locale != I18n.default_locale
    end

    def page_permalink(string)
      URI.unescape(string || "show").parameterize.underscore
    end
  end
end
