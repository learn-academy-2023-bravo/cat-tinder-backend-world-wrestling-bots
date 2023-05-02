bots = [
    {
      name: 'Felix Patapalo',
      age: 2,
      weight: 10,
      enjoys: 'Long naps on the couch, and a warm fire.',
      image: 'https://cdn.pixabay.com/photo/2022/11/06/20/35/cat-7575009_1280.jpg'
    },
    {
      name: 'Mr Mister Master Blaster',
      age: 12,
      weight: 9,
      enjoys: 'Eleminating any food in sight',
      image: 'https://www.floatingcat.com/wp-content/uploads/2009/05/0065356940463_500x500.jpg'
    },
    {
      name: 'I Am the AI (IAtAI)',
      age: 5,
      weight: 12,
      enjoys: 'Hacking "smarter" AIs',
      image: 'https://cdn.pixabay.com/photo/2022/11/29/05/14/robots-7623729_1280.jpg'
    },
    {
      name: 'I Like Big Guns AICNL',
      age: 40,
      weight: 17,
      enjoys: 'Big guns... and it can not lie.',
      image: 'https://cdn.pixabay.com/photo/2022/04/11/06/13/robot-7124871_1280.jpg'
    },

  ]
  
  bots.each do |each_bot|
    Bot.create each_bot
    puts "creating bot #{each_bot}"
  end
