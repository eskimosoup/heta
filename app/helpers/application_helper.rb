module ApplicationHelper

  def get_apprentice_pathways
    @apprentice_pathways ||= ApprenticePathway.where(:display => true)
  end

  def scan_for_links(text)
    result = ""
    for word in text.split(" ")
      if word.include?("http://") || word.include?("https://")
        result << link_to(word, word, :target => "_blank").to_s + " "
      elsif word.start_with?("#")
        result << link_to(word, "https://twitter.com/#{word}", :target => "_blank").to_s + " "
      elsif word.start_with?("@")
        result << link_to(word, "https://twitter.com/#{word[1..-1]}", :target => "_blank").to_s + " "
      else
        result << "#{word} "
      end
    end
    result
  end
end
