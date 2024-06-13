#Read files:

File.open("file.txt","r") do |f|
    #puts f.read();
    #puts f.read().include?"Hey";
    puts f.readline();
    puts f.readline();
    puts f.readline();
    puts f.readline();
    puts f.readchar();
    puts f.readlines();
    puts f.readlines()[2];

    for l in for.lines()
        puts l;
    end
end


file = File.open("file.txt","r")
  puts file.read
end


#Write File:

File.open("file.txt","a") do |f|
    f.write("yoooooooo")
end

File.open("file.txt","w") do |f|
    f.write("yoooooooo")
end

File.open("file.txt","r+") do |f|
    file.readline()
    f.write("yoooooooo")
end
