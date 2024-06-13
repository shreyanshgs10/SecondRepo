#Write a program that prints from 1 to 100.

for i in (1..100)
    puts i
end



#Using a hash table, print the frequency of occurrence of each character inside an array.

a=['a','a','b'];

h=Hash.new(0);

for i in a
    h[i]+=1;
end

puts h


#Join 2 arrays without using inbuilt functions.

array1=[1,2,3];
array2=[4,5,6];

k=array1.length

for i in array2
    array1[k]=i;
    k+=1;
end

puts array1;



#Join 2 arrays using inbuilt functions.

array1=[1,2,3];
array2=[4,5,6];

array1.concat(array2);

puts array1;



#Use the map function to double all the elements in the array.

array1=[1,2,3];

puts array1.map{|n| n*2}



#Use the map function to double all the elements in the array. However, handle
#edge cases (like array can have a character) as well.

array1=[1,'a',2,3];

puts array1.map{|n| n*2}








