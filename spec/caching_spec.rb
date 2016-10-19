require 'spec_helper'

describe Fortitude::Caching, type: :request do
  def get_and_return_response(path)
    get path
    response.body
  end

  it 'caches without needs' do
    expect(get_and_return_response('/projects/1/show_cached')).
      to eq(get_and_return_response('/projects/1/show_cached'))
  end

  it 'has different caches for different locales' do
    res1 = get_and_return_response('/projects/1/show_cached')
    res2 = get_and_return_response('/projects/1/show_cached?locale=fr')
    res3 = get_and_return_response('/projects/1/show_cached?locale=fr')

    expect(res1).to_not eq res2
    expect(res2).to eq res3
  end

  it 'caches with needs' do
    res1 = get_and_return_response('/projects/1/show_cached_with_needs')
    res2 = get_and_return_response('/projects/2/show_cached_with_needs')
    res3 = get_and_return_response('/projects/2/show_cached_with_needs')

    expect(res1).to_not eq res2
    expect(res2).to eq res3
  end

  it 'does not cache if cacheable is not called' do
    expect(get_and_return_response('/projects/1/show_uncached')).
      to_not eq(get_and_return_response('/projects/1/show_uncached'))
  end

  it 'throws an error if a view cannot be cached' do
    expect { get '/projects/1/cannot_cache' }.
      to raise_error(Fortitude::Caching::NotCacheableError)
  end
end
