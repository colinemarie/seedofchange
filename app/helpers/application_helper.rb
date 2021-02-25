module ApplicationHelper
  def label_category(category)
    case category
      when "Alimentation"
        "label label-alimentation"
      when "Divers"
        "label label-divers"
      when "Cosmétique"
        "label label-cosmetique"
      when "Ménager"
        "label label-menager"
      when "Techno"
        "label label-techno"
      when "Courses"
        "label label-courses"
    end
  end

  def keep_navbar?
    (controller_name == "clans" && action_name == "show") ||
      (controller_name == "activities" && action_name == "index")
  end
end
