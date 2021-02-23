
puts 'cleaning'
UserChallenge.destroy_all
Challenge.destroy_all
Clan.destroy_all
User.destroy_all

puts 'adding challenges...'

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

lessive = Challenge.new(name: "Fabrique ta lessive maison",
                   price: 5,
                   category: "Ménager",
                   description: "Fabriquer sa lessive maison écologique : au savon de Marseille et au bicarbonate de soude",
                   duration: 3,
                   difficulty: 2,
                   necessary_items: ["50g de savon de Marseille", "1 cuillère à soupe de bicarbonate de soude", "1 Litre d’eau", "10 gouttes d’huile essentielle"],
                   how_to: ["Faire chauffer le litre d’eau et ajouter les copeaux de savon de Marseille.",
                   "Mélanger doucement jusqu’à la totale dissolution des copeaux (ou du savon râpé) dans l’eau.",
                   "Laissez tiédir et ajoutez la cuillère à soupe de bicarbonate de soude.",
                   "Laissez refroidir une quinzaine de minutes avant de verser le tout dans un bidon de lessive ou un contenant en verre."],
                   tips: "le savon de Marseille blanc est généralement à base d’huile de palme.
                   Le savon de Marseille vert est à base d’huile d’olive. Préférez un savon de Marseille composé au minimum de
                   72% d’huile végétale, sans colorant, sans parfum, sans glycérine (car risque de figer la lessive) et sans conservateur")
lessive.save!

puts 'challenge lessive created'


appareils = Challenge.new(name: "Éteindre complètement les appareils électriques",
                   price: 0,
                   category: "Techno",
                   description: "Utilisez le bouton de mise sous tension de vos appareils électriques pour les éteindre complètement ou débranchez-les
                   lorsque cela n’est pas possible. Les appareils simplement mis en veille consomment 10% d’électricité en plus !",
                   duration: 5,
                   difficulty: 2,
                   tips: "Tu peux brancher vos appareils sur des multiprises fonctionnant avec un bouton marche / arrêt. En un seul geste, tu éteinds ainsi tous vos appareils.")
appareils.save!

puts 'challenge appareils created'

viande = Challenge.new(name: "Manger moins de viande",
                   price: 0,
                   category: "Alimentation",
                   description: "L’élevage des bovins, ovins et autres animaux rejette du méthane dans l’air ce qui a une conséquence directe sur l’effet de serre.
                   En outre, l’élevage du bétail consomme de l’eau et de l’énergie et rejette de l’azote dans les rivières. Manger moins de viande est donc un excellent geste écologique à adopter au quotidien pour protéger la planète",
                   duration: 0,
                   difficulty: 1)
viande.save!

puts 'challenge viande created'

eau = Challenge.new(name: "Boire l’eau du robinet",
                   price: 0,
                   category: "Alimentation",
                   description: "Sauf indication contraire de votre commune, il est tout à fait possible de boire l’eau du robinet en France.
                   Elle est potable et naturellement riche en sels minéraux.",
                   duration: 5,
                   difficulty: 2,
                   tips: "Si le goût te dérange, tu peux utiliser un filtre qui se fixe sur le robinet ou une carafe filtrante.")
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

pub = Challenge.new(name: "Coller un “stop-pub” sur sa boîte aux lettres",
                   price: 1,
                   category: "Divers",
                   description: "Coller une étiquette « stop-pub » permet d’éviter l’accumulation de prospectus dans sa boîte aux lettres qui finiront aussitôt à la poubelle. Une bonne façon de prévenir et réduire les déchets.",
                   duration: 5,
                   difficulty: 2,
                   necessary_items: ["papier", "scotch", "stylo"])
pub.save!

puts 'challenge pub created'

puts 'challenge pipi created'

plantes = Challenge.new(name: "Recueillir l’eau de pluie pour arroser ses plantes",
                   price: 0,
                   category: "Divers",
                   description: "Pour protéger notre environnement, tu peux également installer un système de récupération des
                   pluies dans votre jardin ou sur votre balcon. Tu pourras ensuite l’utiliser pour arroser vos plantes.",
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

communication = Challenge.new(name: "Informer son entourage et ses enfants",
                   price: 0,
                   category: "Divers",
                   description: "Pour donner un vrai sens à vos gestes écologiques, il reste bien-sûr important de les partager avec votre entourage.",
                   duration: 5,
                   difficulty: 1)
communication.save!

puts 'challenge communication created'



sac_a_vrac = Challenge.new(name: "Acheter des sacs en tissus",
                   price: 3.75,
                   category: "Courses",
                   description: "Fabriquez-les ou achetez-les de préférence en soie (ils sont aussi légers qu'un sac plastique et séchent vite) et avec un lien intégré (cela facilite leur femerture)",
                   duration: 5,
                   difficulty: 1,
                   tips: "" )
sac_a_vrac.save!

sac_a_pain = Challenge.new(name: "Fabriquer un grand sac à pain",
                   price: 0,
                   category: "Courses",
                   description: "Fabriquer une poche pour transporter le pain acheté sans emballage à la boulangerie",
                   duration: 10,
                   difficulty: 1,
                   necessary_items: ["Une taie d’oreiller", "Un vieux drap"])
sac_a_pain.save!

cabas = Challenge.new(name: "Acheter un cabas",
                   category: "Courses",
                   description: "“Vous voulez un sac ?”, “Non merci, j’ai mon propre sac” : ce genre d’échanges avec nos commerçants se multiplient ! Très pratique pour éviter de jeter du plastique et un gain de place à la maison.",
                   difficulty: 2,
                   duration: 0,
                   price: 10,
                   necessary_items: [])
cabas.save!

bouteille = Challenge.new(name: "Utiliser des bouteilles en verre",
                   category: "Courses",
                   description: "Préférer les bouteilles en verre de jus de fruit ou de lait, d’une capacité de 1 litre (les liquides en vrac se vendant généralement au litre).",
                   difficulty: 1,
                   duration: 0,
                   price: 0,
                   necessary_items: [])
bouteille.save!

bocaux = Challenge.new(name: "Stocker dans des bocaux en verre",
                   category: "Courses",
                   description: "Choisissez des bocaux de conserve à réutiliser. Leurs capacités dépendront des besoins de votre famille (1/2 litre, 1 litre...)",
                   difficulty: 1,
                   duration: 0,
                   price: 5,
                   how_to: "" ,
                   tips: "" ,
                   necessary_items: [])
bocaux.save!

puts '5 more challenges created'

schampoing = Challenge.new(name: "Acheter du schampoing solide",
                   category: "Cosmétique",
                   description: "Les pains de shampoing et d’après-shampoing sont très pratiques pour voyager et nécessitent peu d’emballage (parfois même aucun !).",
                   difficulty: 2,
                   duration: 0,
                   price: 5,
                   how_to: "" ,
                   tips: "" ,
                   necessary_items: [])
schampoing.save!

déodorant = Challenge.new(name: "Utiliser la Pierre d’alun comme déodorant",
                   category: "Cosmétique",
                   description: "Le déodorant cristal est facile à utiliser. Il suffit de le mouiller, de l’appliquer et de le sécher après utilisation.",
                   difficulty: 1,
                   duration: 0,
                   price: 5,
                   how_to: "" ,
                   tips: "" ,
                   necessary_items: [])
déodorant.save!

savon = Challenge.new(name: "Acheter un savon en pain",
                   category: "Cosmétique",
                   description: "Le savon solide est la meilleure solution en matière de déchets si tu peux l’acheter en vrac (sans emballage) ou dans du papier recyclable (déchire un petit morceau et vérifie qu’il ne soit pas plastifié)",
                   difficulty: 1,
                   duration: 0,
                   price: 3.5,
                   how_to: "",
                   tips: "Tu peux t'en servir pour tous tes besoins en savon : pour te laver les mains, le visage et le corps, mais aussi pour te raser et te laver les cheveux. Quand elle est trop petite pour s’en servir, coller-la, mouillée, à un nouveau pain.",
                   necessary_items: [])
savon.save!

epilation = Challenge.new(name: "Faire une épilation au sucre",
                   category: "Cosmétique",
                   description: "Cette technique remonte à l’Antiquité égyptienne, elle remplace parfaitement la cire… L’application est délicate, mais tes efforts seront récompensés.",
                   difficulty: 3,
                   duration: 30,
                   price: 0,
                   how_to: ["1. Mélange 110 grammes de sucre (j’utilise du brut de canne), 1 cuillerée à soupe d’eau et 1 cuillerée à soupe de jus de citron dans une petite poêle.",
                    "2. Fait bouillir jusqu’à ce que la température atteigne les 124 °C",
                    "3. Verse immédiatement dans une assiette mouillé et laisse refroidir.",
                    "4. Une fois la cire refroidie mais pas encore complètement durcie, fait une boule.",
                    "5. Malaxe-la et étire-la : sa couleur va passer d’ambre à ivoire. Elle doit rester collante."] ,
                   tips: "",
                   necessary_items: ["Sucre", "Eau", "Jus de citron"]
                   )
epilation.save!

sol = Challenge.new(name: "Laver le sol avec du vinaigre blanc ou savon noir",
                   category: "Ménager",
                   description: "Le vinaigre blanc et le savon de Marseille peuvent généralement être achetés en vrac dans les magasins spécialisés.",
                   difficulty: 1,
                   duration: 10,
                   price: 5,
                   how_to: ["2 cuillères à soupe de savon noir dans un demi-seau d’eau chaude",
                    "Ou un demi-verre à moutarde de vinaigre blanc (environ 10-15 cl) dans un demi-seau d’eau froide."] ,
                   tips: "L’odeur du vinaigre blanc disparait rapidement et c’est un bon substitut à la Javel pour désinfecter. Mais si elle te rebute, aucun problème, tu peux faire infuser des écorces d’oranges ou de citron bio dans le vinaigre (dans un bocal en verre hermétique)" ,
                   necessary_items: ["Vinaigre blanc", "Savon noir"])
sol.save!

puts 'again, 5 more challenges created'

surface = Challenge.new(name: "Decrasser les surfaces avec le bicarbonate de soude",
                   category: "Ménager",
                   description: "Le bicarbonate de soude peut s’avérer efficace sur les surfaces encrassées. La poudre aura un effet abrasif sans pour autant rayer.",
                   difficulty: 1,
                   duration: 2,
                   price: 4,
                   how_to: "",
                   tips: "Tu peux t'en servir également avec du vinaigre blanc et de l’eau bouillante en cas de canalisation bouchée." ,
                   necessary_items: "",
                   )
surface.save!

multisurface = Challenge.new(name: "Faire maison son nettoyant multisurface",
                   category: "Ménager",
                   description: "Pas besoin d’avoir de multiples produits, un seul suffit pour nettoyer cuisine, meubles et sanitaires. On peut trouver ce genre de produit à tout faire en magasin bio, mais on peut aussi le fabriquer simplement soi-même.",
                   difficulty: 2,
                   duration: 10,
                   price: 10,
                   how_to: "" ,
                   tips: "A l'aide d’un pulvérisateur vide et propre, mettre une cuillère et demie à soupe de savon noir liquide, 25 cl de vinaigre blanc et 50 cl d’eau chaude (pas bouillante). Agite énergiquement le pulvérisateur et voilà, c’est prêt ! " ,
                   necessary_items: ["Pulvérisateur", "Vinaigre blanc", "Savon noir"]
                   )
multisurface.save!


email = Challenge.new(name: "Vider sa boite e-mail",
                   category: "Techno",
                   description: "Ta boîte mail a plus de 21 800 non lus, parfois même plus... Le numérique ça pollue (beaucoup), environ 10g de CO2 par mail en moyenne, alors vide ta boîte mail étape par étape.",
                   difficulty: 3,
                   duration: 90,
                   price: 0,
                   how_to: ["- supprimer les mails les plus lourds et les plus anciens
                    - se désabonner des newsletters non lues et des spams
                    - supprimer les spams et vider sa corbeille "],
                   tips: "" ,
                   necessary_items: "",
                   )
email.save!

luminosite = Challenge.new(name: "Diminuer la luminosité de son écran",
                   category: "Techno",
                   description: "Une variation de la luminosité de son moniteur de 100 % à 70 % peut économiser jusqu’à 20 % de l’énergie qu’il utilise. De plus, la diminution de la luminosité réduit la fatigue oculaire.",
                   difficulty: 1,
                   duration: 0,
                   price: 0,
                   how_to: "",
                   tips: "Tu peux également activer le mode sombre sur ses appareils (ordinateurs, tablettes, smartphones…) pour préserver tes yeux et soulager ta batterie sur les modèles équipés d’écrans à technologie OLED" ,
                   necessary_items: "",
                   )
luminosite.save!

pistage = Challenge.new(name: "Activer la protection contre le pistage en mode strict",
                   category: "Techno",
                   description: "Les services qui pistent les données engloutissent des montagnes d’informations. Sur presque tous les sites web visités, les données sur les internautes sont transmises à des dizaines, voire des centaines d’entreprises",
                   difficulty: 2,
                   duration: 5,
                   price: 0,
                   how_to: "",
                   tips: "" ,
                   necessary_items: "",
                   )
pistage.save!

puts 'again and again, 5 more challenges created'

streaming = Challenge.new(name: "Télécharger au lieu de visionner",
                   category: "Techno",
                   description: "Opte pour le téléchargement plutôt que le visionnage en ligne, car les données ne seront transmises par le serveur qu’une seule fois ",
                   difficulty: 2,
                   duration: 10,
                   price: 0,
                   how_to: "",
                   tips: "" ,
                   necessary_items: "",
                   )
streaming.save!

reseau = Challenge.new(name: "Bloquer la lecture automatique de vidéos",
                   category: "Techno",
                   description: "La lecture de vidéos consomme beaucoup d'énergie. Cette fonctionnalité est proposée par plusieurs navigateurs, dont Firefox et Chrome.",
                   difficulty: 2,
                   duration: 5,
                   price: 0,
                   how_to: "",
                   tips: "" ,
                   necessary_items: "",
                   )
reseau.save!

végé = Challenge.new(name: "Une semaine 100% végétarienne",
                   category: "Alimentation",
                   description: "Avec des émissions par jour de 2,89 kilos équivalent CO2 (KgeqCO2), les végans ont le régime alimentaire le moins polluant. ",
                   difficulty: 2,
                   duration: 5,
                   price: 0,
                   how_to: "",
                   tips: " Suivis par les végétariens (3,81 Kg CO2/jour), les personnes mangeant entre 50 et 90 grammes (5,63 Kg CO2/jour) (7,19 Kg CO2/jour)." ,
                   necessary_items: "",
                   )
reseau.save!

puts 'last but not least, 3 more challenges created'




puts 'adding users...'

myriam = User.new(username: 'Mimi' , first_name: 'Myriam', email: 'myriam@gmail.com', password: 'Coucou460', score: 400)
myriam.save!
puts 'Myriam created'

coline = User.new(username: 'Coco', first_name: 'Coline', email: 'coline@gmail.com', password: 'Coucou460', score: 350)
coline.save!
puts 'Coline created'

simon = User.new(username:  'Sisi', first_name: 'Simon', email: 'simon@gmail.com', password: 'Coucou460', score: 350)
simon.save!
puts 'Simon created'

audrey = User.new(username: 'Auau', first_name: 'Audrey', email: 'audrey@gmail.com', password: 'Coucou460', score: 175)
audrey.save!
puts 'Audrey created'

charlie = User.new(username: 'Chacha', first_name: 'charlie', email: 'charlie@gmail.com', password: 'Coucou460', score: 50)
charlie.save!

pascal = User.new(username: 'Pascalou', first_name: 'pascal', email: 'pascal@gmail.com', password: 'Coucou460', score: 500)
pascal.save!

olivia = User.new(username: 'Oliv', first_name: 'olivia', email: 'olivia@gmail.com', password: 'Coucou460', score: 150)
olivia.save!

anna = User.new(username: 'Anna', first_name: 'anna', email: 'anna@gmail.com', password: 'Coucou460', score: 300)
anna.save!

sebastien = User.new(username: 'Seb', first_name: 'sebastien', email: 'sebastien@gmail.com', password: 'Coucou460', score: 600)
sebastien.save!

antoine = User.new(username: 'Antoine', first_name: 'antoine', email: 'antoine@gmail.com', password: 'Coucou460', score: 150)
antoine.save!

lomig = User.new(username: 'Lomig', first_name: 'lomig', email: 'lomig@gmail.com', password: 'Coucou460', score: 1600)
lomig.save!

cecile = User.new(username: 'cece', first_name: 'cecile', email: 'cecile@gmail.com', password: 'Coucou460', score: 400)
cecile.save!

# alex = User.new(username: 'alexis', first_name: 'alexis', email: 'alex@gmail.com', password: 'Coucou460', score: 200)
# alex.save!


puts 'adding userchallenges'

UserChallenge.create!(user_id: myriam.id, challenge_id: pneus.id, status: 'accepted')
UserChallenge.create!(user_id: myriam.id, challenge_id: viande.id, status: 'validated')
UserChallenge.create!(user_id: myriam.id, challenge_id: lessive.id, status: 'validated')
UserChallenge.create!(user_id: myriam.id, challenge_id: plantes.id, status: 'validated')

puts '3 challenges en cours pour myriam et 2 validés'

Challenge.all.sample(7).each do |challenge|
  UserChallenge.create!(user_id: coline.id, challenge_id: challenge.id, status: 'validated')
end

puts '7 challenges validés pour coline'

Challenge.all.sample(10).each do |challenge|
  UserChallenge.create!(user_id: lomig.id, challenge_id: challenge.id, status: 'validated')
end

puts '10 challenges validés pour lomig'

Challenge.all.each do |challenge|
  UserChallenge.create!(user_id: audrey.id, challenge_id: challenge.id, status: 'validated')
end

puts '12 challenges validés pour simon'

Challenge.all.each do |challenge|
  UserChallenge.create!(user_id: simon.id, challenge_id: challenge.id, status: 'validated')
end

puts '10 challenges validés pour simon'

Challenge.all.each do |challenge|
  UserChallenge.create!(user_id: anna.id, challenge_id: challenge.id, status: 'validated')
end

puts '15 challenges validés pour anna'



puts 'creating clans'

teammontreuil = Clan.create!(name: 'team montreuil')
myriam.update(clan: teammontreuil)
coline.update(clan: teammontreuil)
audrey.update(clan: teammontreuil)
simon.update(clan: teammontreuil)
lomig.update(clan: teammontreuil)
# alex.update(clan: teammontreuil)
antoine.update(clan: teammontreuil)
pascal.update(clan: teammontreuil)
charlie.update(clan: teammontreuil)
anna.update(clan: teammontreuil)
olivia.update(clan: teammontreuil)
sebastien.update(clan: teammontreuil)



puts 'tout le monde dans la team montreuil'

puts "that's it!"


