puts "Привет, я твой дневник. Можешь поведать что у тебя на душе =)"
puts "Я сохраню все что ты напишешь до строчки \"end\" в файл"
puts

current_path = File.dirname(__FILE__)

line = nil
all_lines = []

while line != "end" do
    line = STDIN.gets.encode("UTF-8").chomp
    all_lines << line
end

time = Time.now

file_name = time.strftime("%Y-%m-%d") #2024-02-18
time_string = time.strftime("%H:%M") # 14:03

separator = "--------------------------------"

file = File.new(current_path + "/" + file_name + ".txt", "a:UTF-8")

file.print("\n\r" + time_string + "\n\r")

all_lines.pop

for item in all_lines do
    file.puts(item)
end

file.puts(separator)

file.close

puts "..."
puts "Ваша запись сохранена в файл #{file_name}.txt"
puts "Запись сделана #{time_string}"
puts