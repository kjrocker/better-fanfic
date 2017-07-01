console_user = User.find_or_create_by(email: 'console@example.com')

gilgamesh = Story.find_or_create_by(
  title: 'The Epic of Gilgamesh',
  summary: "The first and greatest story ever told"
)

gilgamesh.update(user: console_user)

Chapter.find_or_create_by(
  title: 'Prologue - Gilgamesh King in Uruk',
  number: 1,
  story: gilgamesh,
  user: console_user,
  raw_text: <<~DOC
    I WILL proclaim to the world the deeds of Gilgamesh. This was the man to whom all things were known; this was the king who knew the countries of the world. He was wise, he saw mysteries and knew secret things, he brought us a tale of the days before the flood. He went on a long journey, was weary, worn-out with labour, returning he rested, he engraved on a stone the whole story.

    When the gods created Gilgamesh they gave him a perfect body. Shamash the glorious sun endowed him with beauty, Adad the god of the storm endowed him with courage, the great gods made his beauty perfect, surpassing all others, terrifying like a great wild bull. Two thirds they made him god and one third man.

    In Uruk he built walls, a great rampart, and the temple of blessed Eanna for the god of the firmament Anu, and for Ishtar the goddess of love. Look at it still today: the outer wall where the cornice runs, it shines with the brilliance of copper; and the inner wall, it has no equal. Touch the threshold, it is ancient. Approach Eanna the dwelling of Ishtar, our lady of love and war, the like of which no latter-day king, no man alive can equal. Climb upon the wall of Uruk; walk along it, I say; regard the foundation terrace and examine the. masonry: is it not burnt brick and good? The seven sages laid the foundations.
  DOC
)

Chapter.find_or_create_by(
  title: 'The Coming of Enkidu',
  number: 2,
  story: gilgamesh,
  user: console_user,
  raw_text: <<~DOC
    GILGAMESH went abroad in the world, but he met with none who could withstand his arms till be came to Uruk. But the men of Uruk muttered in their houses, ‘Gilgamesh sounds the tocsin for his amusement, his arrogance has no bounds by day or night. No son is left with his father, for Gilgamesh takes them all, even the children; yet the king should be a shepherd to his people. His lust leaves no virgin to her lover, neither the warrior's daughter nor the wife of the noble; yet this is the shepherd of the city, wise, comely, and resolute.'

    The gods heard their lament, the gods of heaven cried to the Lord of Uruk, to Anu the god of Uruk: ‘A goddess made him, strong as a savage bull, none can withstand his arms. No son is left with his father, for Gilgamesh takes them all; and is this the king, the shepherd of his people? His lust leaves no virgin to her lover, neither the warrior's daughter nor the wife of the noble. When Anu had heard their lamentation the gods cried to Aruru, the goddess of creation, ‘You made him, O Aruru; now create his equal; let it be as like him as his own reflection, his second self; stormy heart for stormy heart. Let them contend together and leave Uruk in quiet.'

    So the goddess conceived an image in her mind, and it was of the stuff of Anu of the firmament. She dipped her hands in water and pinched off clay, she let it fall in the wilderness, and noble Enkidu was created. There was virtue in him of the god of war, of Ninurta himself. His body was rough, he had long hair like a woman's; it waved like the hair of Nisaba, the goddess of corn. His body was covered with matted hair like Samugan's, the god of cattle. He was innocent of mankind; he knew nothing of the cultivated land.

    Enkidu ate grass in the hills with the gazelle and lurked with wild beasts at the water-holes; he had joy of the water with the herds of wild game.

    But there was a trapper who met him one day face to face at the drinking-hole, for the wild game had entered his territory. On three days he met him face to face, and the trapper was frozen with fear. He went back to his house with the game that he had caught, and he was dumb, benumbed with terror.

    His face was altered like that of one who has made a long journey. With awe in his heart he spoke to his father: ‘Father, there is a man, unlike any other, who comes down from the hills. He is the strongest in the world, he is likean immortal from heaven. He ranges over the hills with wild beasts and eats grass; the ranges through your land andcomes down to the wells. I am afraid and dare not go near him. He fills in the pits which I dig and tears up-my trapsset for the game; he helps the beasts to escape and now they slip through my fingers.'

    His father opened his mouth and said to the trapper, ‘My son, in Uruk lives Gilgamesh; no one has ever prevailed against him, he is strong as a star from heaven. Go to Uruk, find Gilgamesh, extol the strength of this wild man. Ask him to give you a harlot, a wanton from the temple of love; return with her, and let her woman's power overpower this man. When next he comes down to drink at the wells she will be there, stripped naked; and when he sees her beckoning he will embrace her, and then the wild beasts will reject him.'
  DOC
)
