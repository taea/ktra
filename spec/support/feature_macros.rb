module FeatureMacros
  extend ActiveSupport::Concern

  def reload
    visit page.current_path if page.current_path
  end

  def wait_for_ajax
    Timeout.timeout(10) do
      loop do
        active = page.evaluate_script('jQuery.active')
        break if active == 0
      end
    end
  end
end
