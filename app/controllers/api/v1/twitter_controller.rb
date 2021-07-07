module Api
    module V1
        class TwitterController < V1Controller
            
            def news
                tweets_new = Tweet.last(50)
                render json: json_structure(tweets_new)
            end
            
            def by_date
                tweets_date = Tweet.where("DATE(created_at AT TIME ZONE 'GMT-4') BETWEEN ? AND ?",params[:date1], "#{params[:date2]} 23:59:59")
                
                render json: json_structure(tweets_date)
            end
            
            private

            def json_structure(tweets)
                array = []
                tweets.each do |tweet|
                    h = {}
                    h['id'] = tweet.id
                    h['content'] = tweet.content
                    h['user_id'] = tweet.user_id
                    h['like_count'] = tweet.likes.count
                    h['retweets_count'] = tweet.retweet_count(tweet.id)
                    tweet.is_rt ? h['rewtitted_from'] = tweet.origin_id : h['rewtitted_from'] = 'N/A'
                    array.push(h)
                end
                array
            end
            
        end
    end
end