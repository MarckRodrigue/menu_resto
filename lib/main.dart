import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MenuSection());
}

class MenuSection extends StatelessWidget {
  const MenuSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Menu(),
    );
  }
}

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  var titleList = [
    "Ragoût de pommes \n de Terre",
    "Met de Pistache",
    "Ikok à Vapeur",
    "Mbongo Tchobi",
    "Ndole Plantain",
    "Pommes Pilées",
    "Gateau Anniversaire",
  ];

  var descList = [
    "Plat riche, nourrissant, délicieux et plein de vitamines. Recette facile pour le plaisir de vos papilles.",
    "Il s'agit d'un délicieux gâteau salé de la gastronomie camerounaise qui se prépare généralement lors des grandes occasions comme Noël ou lors de mariages.",
    "Recette à base de feuille d'okok de la cuisine Bassa Cameroun. Simple facile et savoureuse.",
    "Le Mbongo Tchobi est un ragoût noir épicé typiquement consommé par le peuple Bassa du Cameroun. Son goût délicieux l'a fait gagner en popularité dans d'autres parties du pays. L'ingrédient clé est l'épice mbongo intensément aromatique, dont le ragoût tire son nom.",
    "Le ndolé est un plat camerounais composé de compote de noix, de ndoleh (feuilles amères indigènes d'Afrique de l'Ouest) et de poisson ou de bœuf.",
    "Le pilé de pommes est plat typique de l'Ouest, mélange de haricots et de pommes de terres pilées et cuisinées à l'huile rouge (de palme).",
    "Nous vous Offrons de multiples formes de gateaux pour la célébrations  de vos differents evenements"
  ];

  var imagesList = [
    "images/ragout.png",
    "images/pistache1.png",
    "images/Ikok_mixé_et_son_manioc_vapeur.jpg",
    "images/mbongo.png",
    "images/ndole.jpg",
    "images/pommes pilées.jpg",
    "images/recette-gateau-anniversaire-chocolat.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0,
          title: Text(
            'Les Delices Africaines'.toUpperCase(),
            style: GoogleFonts.raleway(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.amber,
        body: ListView.builder(
          itemCount: imagesList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                showDialogFunc(context, imagesList[index], titleList[index],
                    descList[index]);
                /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );*/
              },
              child: Card(
                  child: Row(
                children: <Widget>[
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset(
                      imagesList[index],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          titleList[index].toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        /* SizedBox(
                            width: width,
                            child: Text(
                              descList[index],
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[500]),
                            ))*/
                      ],
                    ),
                  )
                ],
              )),
            );
          },
        ));
  }
}

showDialogFunc(context, images, title, desc) {
  return showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: Material(
            type: MaterialType.transparency,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70),
                color: Colors.amber,
              ),
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 680,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      images,
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    title.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    desc,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        primary: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        'Commander'.toUpperCase(),
                        style: GoogleFonts.raleway(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      onPressed: () {
                        /*Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => 
                  ),
                );*/
                      }),
                ],
              ),
            ),
          ),
        );
      });
}
