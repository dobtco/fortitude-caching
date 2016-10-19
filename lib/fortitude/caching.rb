module Fortitude
  module Caching
    extend ActiveSupport::Concern

    class NotCacheableError < RuntimeError
    end

    module ClassMethods
      def cacheable(opts = {})
        if extra_assigns == :use
          extra_assigns :ignore
        end

        static_keys = Array(opts.fetch(:key, []))
        options = opts.fetch(:options, {})

        define_method(:cache_contents) do |&block|
          if !cacheable_by_fortitude?
            raise(
              NotCacheableError,
              "Can't digest the widget #{self}, since it's being rendered " \
              "outside of an ActionView context."
            )
          end

          cache calculate_cache_dependencies(assigns, static_keys), options do
            block.call
          end
        end

        define_method(:cacheable_by_fortitude?) do
          respond_to?(:cache) &&
          (
            invoke_helper(:instance_variable_get, :@virtual_path) ||
            options[:skip_digest]
          )
        end

        around_content :cache_contents
      end
    end

    private

    def calculate_cache_dependencies(assigns, static_keys)
      (
        assigns.to_a.sort_by(&:first).flatten +
        static_keys +
        [widget_locale]
      )
    end
  end
end
