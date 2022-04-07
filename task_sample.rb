def post(point:, comment:)
    post = "ポイント：#{point}　コメント：#{comment}"
    File.open("data.txt", "a") do |file|
        file.puts(post)
    end
end

def validate(point:)
    while true
        if point <= 0 || point > 5
          puts "1から5で入力してください"
          point = gets.to_i
        else
            return point
            break
        end
    end
end

def post_point_and_comment
    puts "1から5で評価を入力してください"
    point = validate(point: gets.to_i)
    puts "コメントを入力してください"
    comment = gets
    post(point: point, comment: comment)
end

def show_history
    puts "これまでの結果"
    File.open("data.txt", "r") do |file|
        file.each_line do |line|
          puts line
        end
    end
end

while true
    puts "実施したい処理を選択してください"
    puts "1:評価ポイントとコメントを入力する"
    puts "2:今までの結果を確認する"
    puts "3:やめる"
    num = gets.to_i
  
    case num
    when 1
      post_point_and_comment
    when 2
      show_history
    when 3
      puts "終了します"
      break
    else
      puts "1から3で入力してください"
    end
  end