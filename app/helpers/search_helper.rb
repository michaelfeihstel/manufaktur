module SearchHelper
  
  def search_active?
    if action_name == "search"
      true
    end
  end

end