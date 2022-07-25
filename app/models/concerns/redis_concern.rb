module RedisConcern
    extend ActiveSupport::Concern

    included do
        def increment_views(link)
            REDIS.incr(link)
        end

        def get_link(short)
            REDIS.get(short)
        end
        
        def set_link(short, view)
            REDIS.set(short, view + 1)
        end
    end
end