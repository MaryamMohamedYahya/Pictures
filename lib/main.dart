import "package:flutter/material.dart";
void main() {
  runApp(const PictureApp());
}

//stateless
class PictureApp extends StatelessWidget {
  const PictureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '🖼️ PictureApp',
      theme: ThemeData(
        useMaterial3:true,

      ),
      home: const PictureHome()
    );
  }
}

class PictureHome extends StatefulWidget {
  const PictureHome({super.key});

  @override
  State<PictureHome> createState() => _PictureHomeState();
}

class _PictureHomeState extends State<PictureHome> {

  String currentImage = 'assets/pictures/what.png';
  String currentMessage = 'What picture do you want?';
  Color backgroundColor = Colors.pink.shade50;

  void changePicture({
    required String image,
    required String message,
    required Color bgColor,

  })
  {
    setState( () {
      currentImage = image;
      currentMessage = message;
      backgroundColor = bgColor;
    });
  }
  /* -----------------------------
     UI (WHAT USER SEES)
  ----------------------------- */


@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color.fromARGB(255, 255, 227, 90),
    appBar: _buildAppBar(),
    body: _buildBody(),

  );
}

  /* -----------------------------
     UI PARTS (SMALL METHODS)
  ----------------------------- */


AppBar _buildAppBar(){
  return AppBar(
    title: const Text(
      'Picture App 🖼️',
      style: TextStyle(fontWeight: FontWeight.w600),
      ),
    
    centerTitle: true,
    backgroundColor: const Color.fromARGB(255, 234, 195, 38),

  );
}

Widget _buildBody(){
  return SafeArea(
    child: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        _buildPictureImage(),
        const  SizedBox(height: 24),
        _buildPictureMessage(),
        const  SizedBox(height: 24),
        _buildButtons(),
        ],
      ),
    ),
  );
}

Widget _buildPictureImage(){
  return SizedBox(
    height:220,
    width: 220,
    child: Image.asset(
      currentImage,
      fit: BoxFit.contain,
    )
    );
}

Widget _buildPictureMessage(){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Text(
      currentMessage,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget _buildButtons() {
    return Wrap(
      spacing: 14,
      runSpacing: 14,
      alignment: WrapAlignment.center,
      children: [
        MoodButton(
          text: "Planets",
          color: Colors.redAccent,
          onTap: () => changePicture(
            image: "assets/pictures/planets.png",
            message: "Planets of the Solar System.",
            bgColor: Colors.red.shade50,
          ),
        ),
        MoodButton(
          text: "Flowers",
          color: Colors.pinkAccent,
          onTap: () => changePicture(
            image: "assets/pictures/flowers.png",
            message: "Flowers of different colors.",
            bgColor: Colors.pink.shade100,
          ),
        ),
        MoodButton(
          text: "Volcano",
          color: Colors.blueGrey,
          onTap: () => changePicture(
            image: "assets/pictures/volcano.png",
            message: "Active volcano erupts.",
            bgColor: Colors.blueGrey.shade50,
          ),
        ),
        MoodButton(
          text: "Boats",
          color: Colors.deepPurple,
          onTap: () => changePicture(
            image: "assets/pictures/boats.png",
            message: "Boats in the sea.",
            bgColor: Colors.purple.shade50,
          ),
        ),
      ],
    );
  }
}
class MoodButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onTap;

  const MoodButton({
    super.key,
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 5,
        padding: const EdgeInsets.symmetric(
          horizontal: 22,
          vertical: 14,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}