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
    end
  end
end

