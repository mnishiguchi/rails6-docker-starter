# frozen_string_literal: true

class PagesController < ApplicationController
  PAGE_HITS_CACHE_KEY = 'page hits'

  def index
    redis = Redis.new
    redis.incr PAGE_HITS_CACHE_KEY
    @page_hits = redis.get PAGE_HITS_CACHE_KEY
  end
end
