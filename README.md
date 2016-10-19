fortitude-caching
====

Integrates [Rails fragment caching](http://guides.rubyonrails.org/caching_with_rails.html#fragment-caching) with [Fortitude](https://github.com/ageweke/fortitude).

## Usage

1. `include Fortitude::Caching` in your base widget class.
2. Call `cacheable` for widgets that you want cached.

By using `fortitude-caching`, this:

```rb
class Views::Pages::Show < Views::Base
  needs :page

  cacheable

  def content
    ...
  end
end
```

Is the equivalent of this:

```rb
class Views::Pages::Show < Views::Base
  needs :page

  def content
    cache(page) do
      ...
    end
  end
end
```
