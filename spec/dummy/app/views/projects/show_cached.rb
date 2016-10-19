class Views::Projects::ShowCached < Views::Base
  cacheable

  def content
    @@count ||= 0
    text "#{@@count += 1}"

    if params[:locale]
      text params[:locale]
    end
  end
end
