module ApplicationHelper

  def get_apprentice_pathways
    @apprentice_pathways ||= ApprenticePathway.where(:display => true)
  end
end
