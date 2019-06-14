module ApplicationHelper
  def course_statuses_options
    Course.statuses.keys.map{|w| [w.humanize, w]}
  end

  def options_booleans
    [["Opened", true], ["Closed", false]]
  end
end
