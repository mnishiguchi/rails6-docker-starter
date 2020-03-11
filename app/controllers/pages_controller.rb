class PagesController < ApplicationController
  PAGE_HITS_CACHE_KEY =  "page hits"

  def index
    redis = Redis.new(host: "redis", port: 6379)
    redis.incr PAGE_HITS_CACHE_KEY

    @page_hits = redis.get PAGE_HITS_CACHE_KEY
  end
end
