class Views::Projects::ShowUncached < Views::Base
  def content
    @@count ||= 0
    text "#{@@count += 1}"
  end
end
