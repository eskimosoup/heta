class SEO

  def self.objects_for_seo(controller_name)
    case controller_name
      when 'apprentices'
        Apprentice.where(display: true)
      when 'apprentice_pathways'
        ApprenticePathway.all
      when 'articles'
        Article.where("display = ? and date <= ?", true, Date.today).order('date desc')
      when 'companies'
        Company.where(display: true)
      when 'course_instances'
        CourseInstance.where("end_date >= ? and display = ?", Date.today, true)
      when 'course'
        Course.where(display: true)
      when 'pages'
        Page.where(display: true)
      when 'team_members'
          TeamMember.where(display: true)
      else
        []
    end
  end

  def self.objects_for_sitemap(controller_name)
    case controller_name
      when 'apprentices'
        Apprentice.where(display: true)
      when 'apprentice_pathways'
        ApprenticePathway.all
      when 'articles'
        Article.where("display = ? and date <= ?", true, Date.today).order('date desc')
      when 'companies'
        Company.where(display: true)
      when 'course_instances'
        CourseInstance.where("end_date >= ? and display = ?", Date.today, true)
      when 'course'
        Course.where(display: true)
      when 'pages'
        Page.where(display: true)
      when 'team_members'
          TeamMember.where(display: true).order(:position)
    else
      []
    end
  end

  def self.rebuild!
    nominal_urls_added = []

    # The method for retrieving the routes and their details keeps changing
    # between rails versions so this is likely to keep needing updating.
    routes = Rails.application.routes.routes.select{|x| [//, /^GET$/].include?(x.verb)}.map do |route|
      { :alias => route.name,
        :path => route.path.spec.to_s.gsub("(.:format)", ""),
        :controller => route.defaults[:controller],
        :action => route.defaults[:action] }
    end

    # Reject routes without a controller such as 301s
    routes = routes.reject{|route| route[:controller].nil?}

    # Reject admin routes
    routes = routes.reject{|route| route[:controller].include?("admin")}

    # Reject apprentice modals
    routes = routes.reject{|route| route[:path].include?("apprentice_modal")}

    routes.each do |route|
      if route[:path].include? ":id"
        uses_friendly_id = nil
        has_name_method = nil

        objects_for_sitemap = SEO.objects_for_sitemap(route[:controller])

        SEO.objects_for_seo(route[:controller]).each do |object|
          if uses_friendly_id.nil?
            begin
              object.friendly_id
            rescue NoMethodError
              uses_friendly_id = false
            else
              uses_friendly_id = true
            end
          end

          if has_name_method.nil?
            begin
              object.name
            rescue NoMethodError
              has_name_method = false
            else
              has_name_method = true
            end
          end

          if uses_friendly_id
            seo_entry = SeoEntry.find_or_create_by_nominal_url(route[:path].gsub(':id', object.friendly_id))
            nominal_urls_added << route[:path].gsub(':id', object.friendly_id)

            if seo_entry.title.blank?
              if has_name_method
                seo_entry.title = object.name
              else
                seo_entry.title = object.friendly_id.gsub('-', ' ').capitalize
              end
            end
          else
            seo_entry = SeoEntry.find_or_create_by_nominal_url(route[:path].gsub(':id', object.id.to_s))
            nominal_urls_added << route[:path].gsub(':id', object.id.to_s)

            if seo_entry.title.blank?
              if has_name_method
                seo_entry.title = object.name
              else
                seo_entry.title = "#{object.class.name} - #{object.id}"
              end
            end
          end
          seo_entry.in_sitemap = objects_for_sitemap.include? object
          seo_entry.save
        end
      else
        seo_entry = SeoEntry.find_or_create_by_nominal_url(route[:path])
        nominal_urls_added << route[:path]
        seo_entry.title = route[:alias].gsub('_', ' ').capitalize if seo_entry.title.blank?
        seo_entry.save
      end
    end

    SeoEntry.where("nominal_url NOT IN (?)", nominal_urls_added).each{|x| x.destroy}
  end

end
