class Views::Projects::ShowCachedWithNeeds < Views::Base
  needs :project

  cacheable

  def content
    @@count ||= 0
    text "#{@@count += 1}"
  end
end
