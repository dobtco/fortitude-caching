class ProjectsController < ApplicationController
  around_action :set_locale
  before_action :set_project

  def show_cached
  end

  def show_cached_with_needs
  end

  def show_uncached
  end

  def cannot_cache
    render widget: Views::Projects::ShowCached.new
  end

  private

  def set_project
    @project = params[:id]
  end

  def set_locale
    if params[:locale]
      I18n.with_locale(params[:locale]) { yield }
    else
      yield
    end
  end
end
