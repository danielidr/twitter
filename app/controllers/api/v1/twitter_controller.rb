module Api
    module V1
        class TwitterController < V1Controller
            
            def news
                tweets_new = Tweet.last(50)
                a = []
                tweets_new.each do |tweet|
                    h = {}
                    h['id'] = tweet.id
                    h['content'] = tweet.content
                    h['user_id'] = tweet.user_id
                    h['like_count'] = tweet.likes.count
                    h['retweets_count'] = tweet.retweet_count(tweet.id)
                    tweet.is_rt ? h['rewtitted_from'] = tweet.origin_id : h['rewtitted_from'] = 'N/A'
                    a.push(h)
                end
                render json: a
            end
            
        end
    end
end