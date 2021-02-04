
puts 'cleaning'
UserChallenge.destroy_all
Challenge.destroy_all
User.destroy_all

puts 'adding challenges...'

lessive = Challenge.new(name: "Fabrique ta lessive maison",
                   price: 5,
                   category: "Ménager",
                   description: "Fabriquer sa lessive maison écologique : au savon de Marseille et au bicarbonate de soude",
                   duration: 3,
                   difficulty: 2,
                   necessary_items: ["50g de savon de Marseille", "1 cuillère à soupe de bicarbonate de soude", "1 Litre d’eau", "10 gouttes d’huile essentielle"],
                   how_to: ["Faire chauffer le litre d’eau et ajouter les copeaux de savon de Marseille.
                   Mélangez doucement jusqu’à la totale dissolution des copeaux (ou du savon râpé) dans l’eau.
                   Laissez tiédir et ajoutez la cuillère à soupe de bicarbonate de soude.
                   Laissez refroidir une quinzaine de minutes avant de verser le tout dans un bidon de lessive ou un contenant en verre."],
                   tips: "le savon de Marseille blanc est généralement à base d’huile de palme.
                   Le savon de Marseille vert est à base d’huile d’olive. Préférez un savon de Marseille composé au minimum de
                   72% d’huile végétale, sans colorant, sans parfum, sans glycérine (car risque de figer la lessive) et sans conservateur")
lessive.save!

puts 'challenge lessive created'

pub = Challenge.new(name: "Coller un “stop-pub” sur sa boîte aux lettres",
                   price: 1,
                   category: "Divers",
                   description: "Coller une étiquette « stop-pub » permet d’éviter l’accumulation de prospectus dans sa boîte aux lettres qui finiront aussitôt à la poubelle. Une bonne façon de prévenir et réduire les déchets.",
                   duration: 5,
                   difficulty: 1,
                   necessary_items: ["papier", "scotch", "stylo"])
pub.save!

puts 'challenge pub created'

appareils = Challenge.new(name: "Éteindre complètement les appareils électriques",
                   price: 0,
                   category: "Techno",
                   description: "Utilisez le bouton de mise sous tension de vos appareils électriques pour les éteindre complètement ou débranchez-les
                   lorsque cela n’est pas possible. Les appareils simplement mis en veille consomment 10% d’électricité en plus !",
                   duration: 5,
                   difficulty: 1,
                   tips: "vous pouvez brancher vos appareils sur des multiprises fonctionnant avec un bouton marche / arrêt. En un seul geste, vous éteignez ainsi tous vos appareils.")
appareils.save!

puts 'challenge appareils created'

eau = Challenge.new(name: "Boire l’eau du robinet",
                   price: 0,
                   category: "Alimentation",
                   description: "Sauf indication contraire de votre commune, il est tout à fait possible de boire l’eau du robinet en France.
                   Elle est potable et naturellement riche en sels minéraux.",
                   duration: 5,
                   difficulty: 1,
                   tips: "Si le goût vous dérange, vous pouvez utiliser un filtre qui se fixe sur le robinet ou une carafe filtrante.")
eau.save!

puts 'challenge eau created'

pipi = Challenge.new(name: "Faire pipi sous la douche",
                   price: 0,
                   category: "Divers",
                   description: "Pour économiser une chasse d’eau, il est conseillé d’uriner sous la douche. Cela peut paraître peu ragoûtant aux premiers abords,
                   mais cela permet d’éviter la consommation inutile d’une grande quantité d’eau chaque jour.
                   En outre, vos urines sont stériles, il n’y a donc aucun souci à faire pipi sous la douche.",
                   duration: 1,
                   difficulty: 1)
pipi.save!

puts 'challenge pipi created'

plantes = Challenge.new(name: "Recueillir l’eau de pluie pour arroser ses plantes",
                   price: 0,
                   category: "Divers",
                   description: "Pour protéger notre environnement, vous pouvez également installer un système de récupération des
                   pluies dans votre jardin ou sur votre balcon. Vous pourrez ensuite l’utiliser pour arroser vos plantes.",
                   duration: 1,
                   difficulty: 1)
plantes.save!

puts 'challenge plantes created'

pneus = Challenge.new(name: "Vérifier l’état de ses pneus de voiture",
                   price: 0,
                   category: "Divers",
                   description: "Des pneus mal gonflés s’usent plus vite et entraînent une surconsommation de carburant.
                   Pour protéger la planète, il est donc important de vérifier régulièrement leur état.",
                   duration: 15,
                   difficulty: 1)
pneus.save!

puts 'challenge pneus created'

medicaments = Challenge.new(name: "Rapporter ses médicaments périmés chez le pharmacien",
                   price: 0,
                   category: "Divers",
                   description: "Du côté de votre armoire à pharmacie, il est aussi possible de faire un geste pour l’environnement.
                   Les médicaments périmés ou non utilisés doivent être ramenés en pharmacie afin d’être valorisés énergétiquement.",
                   duration: 15,
                   difficulty: 1)
medicaments.save!

puts 'challenge medicaments created'

viande = Challenge.new(name: "Manger moins de viande",
                   price: 0,
                   category: "Alimentation",
                   description: "L’élevage des bovins, ovins et autres animaux rejette du méthane dans l’air ce qui a une conséquence directe sur l’effet de serre.
                   En outre, l’élevage du bétail consomme de l’eau et de l’énergie et rejette de l’azote dans les rivières. Manger moins de viande est donc un excellent geste écologique à adopter au quotidien pour protéger la planète",
                   duration: 0,
                   difficulty: 1)
viande.save!

puts 'challenge viande created'

communication = Challenge.new(name: "Informer son entourage et ses enfants",
                   price: 0,
                   category: "Divers",
                   description: "Pour donner un vrai sens à vos gestes écologiques, il reste bien-sûr important de les partager avec votre entourage.",
                   duration: 5,
                   difficulty: 1)
communication.save!

puts 'challenge communication created'

tawashi = Challenge.new(name: "Fabriquer un tawashi avec une planche et des clous/vis",
                   price: 5,
                   category: "Ménager",
                   description: "Le Tawashi est une éponge japonaise qui est très facile à fabriquer soi-même à l’aide de vieux vêtements.",
                   duration: 30,
                   difficulty: 2,
                   necessary_items: ["2 chaussettes orphelines", "28 clous ou vis", "une planche de 20cm de longueur et de largeur", "une paire de ciseaux"],
                   how_to: ["Dessinez un carré de 16cm x 16cm","Faites ensuite un marquage toutes les 2 cm.", "Mettez un clou ou une vis à chaque marquage (sans les coins).", "Découpez 14 lanières de chaussettes de 3cm dans la largeur.", "Accrochez 7 lanières dans un sens", "Puis 7 autres dans l’autre sens en croisant la première rangée de lanières,
                    la nouvelle lanière passe d’abord au dessus, puis en dessous, puis au dessus… la lanière suivante fait exactement la même chose mais en commençant à l’opposé de la précédente (d’abord en dessous, puis au dessus, puis en dessous…).", "Une fois que le grillage est fait, il faut prendre la lanière d’un coin et faire passer la lanière
                    suivante dans la boucle afin de la faire ressortir.", "Puis prendre la lanière suivante et la faire passer dans la boucle de la lanière précédente et la faire ressortir…", "Poursuivre en faisant tout le tour afin de faire son tawashi.", "À la fin, faire un noeud avec la dernière lanière pour éviter que le tawashi ne se défasse."])
tawashi.save!

puts 'challenge tawashi created'

puts 'adding users...'

myriam = User.new(username: 'Mimi' , first_name: 'Myriam', email: 'myriam@gmail.com', password: 'Coucou460')
myriam.save!
puts 'Myriam created'

coline = User.new(username: 'Coco', first_name: 'Coline', email: 'coline@gmail.com', password: 'Coucou460')
coline.save!
puts 'Coline created'

simon = User.new(username:  'Sisi', first_name: 'Simon', email: 'simon@gmail.com', password: 'Coucou460')
simon.save!
puts 'Simon created'

audrey = User.new(username: 'Auau', first_name: 'Audrey', email: 'audrey@gmail.com', password: 'Coucou460')
audrey.save!
puts 'Audrey created'

puts 'adding userchallenges'

UserChallenge.create!(user_id: myriam.id, challenge_id: tawashi.id, status: 'accepted')
UserChallenge.create!(user_id: myriam.id, challenge_id: lessive.id, status: 'accepted')
UserChallenge.create!(user_id: myriam.id, challenge_id: viande.id, status: 'accepted')
UserChallenge.create!(user_id: myriam.id, challenge_id: plantes.id, status: 'validated')

puts '3 challenges en cours pour myriam et 2 validés'

UserChallenge.create!(user_id: coline.id, challenge_id: viande.id, status: 'accepted')
UserChallenge.create!(user_id: coline.id, challenge_id: pipi.id, status: 'accepted')

puts '2 challenges en cours pour coline'

puts "that's it!"


