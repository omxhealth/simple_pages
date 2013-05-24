module SimplePages
  class PagesController < ::ApplicationController
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
      render 'pages/show'
    end

    def render_page_template
      begin
        render page_template_path
      rescue ActionView::MissingTemplate
        render 'pages/not_found', :status => 404
      end
    end

    def page_template_path
      [controller_name, page_action].compact * "/"
    end

    def page_locale
      return I18n.locale = params[:locale] if params[:locale]
      return I18n.locale if I18n.locale != I18n.default_locale
    end

    def page_permalink(string)
      page = unescaped = URI.unescape(string || "show")

      if page_locale
        I18n.backend.load_translations unless I18n.backend.initialized?
        pages = I18n.backend.send(:translations)[I18n.locale][:pages]
        page = pages.try(:key, unescaped).presence || unescaped
      end

      page.to_s.parameterize.underscore
    end
  end
end
