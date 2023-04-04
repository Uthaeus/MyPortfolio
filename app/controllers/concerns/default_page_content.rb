module DefaultPageContent
    extend ActiveSupport::Concern 

    included do 
        before_action :set_page_defaults
    end
    
    def set_page_defaults
        @page_title = "My Portfolio | Portfolio Website"
        @seo_keywords = "search engine keywords"
    end
end