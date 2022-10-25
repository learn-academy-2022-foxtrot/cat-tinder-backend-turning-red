cats = [
    {
    name: 'Mei',
    age: 13 ,
    favorite_song: 'No Body Like U', 
    pineapple_on_pizza: 'yes',
    enjoys: 'hanging with friends, drawing, and cute boys!',
    image: ' ',
    },
    {
    name: 'Ming',
    age: 38 ,
    favorite_song: 'My Heart Will Go On',
    pineapple_on_pizza: 'no',
    enjoys: 'reading books, spending time with her family, and avoiding the color red',
    image: ' ',
    },
    {
    name: 'Miriam', 
    age: 12,
    favorite_song: "U Know What's Up",
    pineapple_on_pizza: 'no',
    enjoys: "Cute people, hanging with friends, and being myself!",
    image: ' ',
    },
    {
    name: 'Abby',
    age: 13,
    favorite_song: '1 True Love',
    pineapple_on_pizza: 'yes',
    enjoys: 'Listening to music, helping my friends, and going to concerts',
    image: ' ',
    },
    {
    name: 'Priya',
    age: 13,
    favorite_song: "U Know What's Up",
    pineapple_on_pizza: 'no',
    enjoys: 'Black nail polish, 4*Town, and good hygeine' ,
    image: ' ',
    },
    {
    name: 'Robaire',
    age: 14,
    favorite_song: 'Bye Bye Bye',
    pineapple_on_pizza: 'no',
    enjoys: 'Long walks on the beach, romantic sunsets, and vanilla ice cream' ,
    image: ' ',
    },
    {
    name: 'Jesse',
    age: 15,
    favorite_song: 'Bye Bye Bye',
    pineapple_on_pizza: 'no',
    enjoys: 'Holding hands, strolls in the park, and a good coffee date' ,
    image: ' ',
    },
    {
    name: 'Aaron T.',
    age: 14,
    favorite_song: 'Backstreets Back',
    pineapple_on_pizza: 'no',
    enjoys: 'Good jokes, leading the pack, and ferris wheels' ,
    image: ' ',
    },
    {
    name: 'Aaron Z.',
    age: 14,
    favorite_song: 'Get Down',
    pineapple_on_pizza: 'no',
    enjoys: 'Biking, dance-offs, and hanging with the boys' ,
    image: ' ',
    }
]

cats.each do |each_cat|
    Cat.create each_cat
    puts 'creating cat #{each_cat}'
end




# {
#     name: ,
#     age: ,
#     favorite_song:,
#     pineapple_on_pizza: ,
#     enjoys: ,
#     image: ,
#     },