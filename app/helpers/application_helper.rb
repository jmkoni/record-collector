module ApplicationHelper
  def active_path(*paths)
    paths = [paths].flatten
    paths.inject(false) { |cond, path| cond || current_page?(send(path)) } ? 'active' : nil
  end

  def records_active
    active_path('records_path') || ('active' if controller.controller_name == 'records')
  end

  def artists_active
    'active' if controller.controller_name == 'artists'
  end
end