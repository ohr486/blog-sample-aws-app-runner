class InfoController < ActionController::Base
  def cpu
    o, e, s = Open3.capture3("cat /proc/cpuinfo")
    Rails.logger.info o
    render plain: o
  end

  def mem
    o, e, s = Open3.capture3("cat /proc/meminfo")
    Rails.logger.info o
    render plain: o
  end
end
