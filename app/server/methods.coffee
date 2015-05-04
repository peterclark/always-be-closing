Meteor.methods

  generate_name: ->
    adjective_list = ['fearless', 'immovable', 'admirable', 'funny', 'galactic', 'darth', 'pickled', 'artisan', 'collaborative', 'empowered', 'dramatic', 'revolutionary', 'efficient', 'maximized', 'timely', 'realtime', 'functional', 'synergized', 'ultra', 'urban', 'austere', 'aqua', 'amber', 'recycled', 'savvy', 'nascent', 'witty', 'disheveled', 'peripheral', 'shaky', 'critical', 'cool', 'modular', 'noble', 'handsome']
    
    noun_list = ['batman', 'hero', 'villian', 'vengeance', 'protector', 'monster', 'shadow', 'dynamite', 'gasoline', 'shackle', 'injustice', 'stranger', 'ribeye', 'sirloin', 'cow', 'salami', 'capicola', 'turducken', 'bacon', 'meatloaf', 'turkey', 'pork', 'filet', 'seabass', 'proscuitto', 'frankfurter', 'brisket', 'burgundy', 'fandango', 'mustachio', 'success', 'empire', 'fox', 'waiter', 'lando', 'duel', 'holiday', 'waiter', 'oyster', 'cigar', 'colonel', 'gunslinger', 'hendrix', 'trooper', 'vader', 'solo', 'skywalker', 'robot', 'deathstar', 'fighter', 'phaser', 'sand', 'lightsaber', 'droid', 'clone', 'darkside', 'jedi', 'bantha', 'tantan', 'blaster', 'wookie', 'sith', 'padawan', 'rebel', 'yoda', 'selfie', 'truck', 'wolf', 'moon', 'thundercat', 'portland', 'typewriter', 'biodiesel', 'nirvana', 'lava', 'lamp', 'moustache', 'beard', 'neckbeard']
    
    adjective = adjective_list[Math.floor(Math.random()*adjective_list.length)]
    
    noun = noun_list[Math.floor(Math.random()*noun_list.length)]
    
    [adjective, noun].join(' ')