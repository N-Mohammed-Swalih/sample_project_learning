import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ExpandedandColumn(),
  ));
}

class ExpandedandColumn extends StatelessWidget {
  const ExpandedandColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Porsche 911",
        style: GoogleFonts.lobster(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Colors.grey[700],
        elevation: .5,
      ),
      body: Column(children: [
        Center(
          child: Image.network(
              "https://images.unsplash.com/photo-1619382303579-5184c60e413f?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjF8fHBvcnNjaGUlMjA5MTF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            "PORSCHE 911",
            style: GoogleFonts.bigelowRules(
                fontSize: 36, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: Text(
              """The Porsche 911 (pronounced Nine Eleven or in German: Neunelf) is a two-door 2+2 high performance rear-engined sports car introduced in September 1964 by Porsche AG of Stuttgart, Germany. It has a rear-mounted flat-six engine and originally a torsion bar suspension. The car has been continuously enhanced through the years but the basic concept has remained unchanged.[1] The engines were air-cooled until the introduction of the 996 series in 1998.[2][3]
        
        The 911 has been raced extensively by private and factory teams, in a variety of classes. It is among the most successful competition cars. In the mid-1970s, the naturally aspirated 911 Carrera RSR won world championship races including Targa Florio and the 24 Hours of Daytona. The 911-derived 935 turbo also won the 24 Hours of Le Mans in 1979. Porsche won the World Championship for Makes in 1976, 1977, 1978, and 1979 with 911-derived models.
        
        In a 1999 poll to determine the Car of the Century, the 911 was fifth.[4] It is one of two in the top five that had remained continuously in production (the original Beetle remained in production until 2003).[5] The one millionth example was manufactured in May 2017 and is in the company's permanent collection.[6]
        
        911 nomenclature
        Although Porsche has used internal code numbers for each series of the 911, all models have been marketed and sold as 911s. The model series and associated internal codes are as follows:
        
        911 (1964–1989)
        930 (1975–1989) the turbocharged version
        964 (1989–1994)
        993 (1995–1998) the last air-cooled 911
        996 (1999–2004) all-new body and water-cooled engines
        997 (2005–2012)
        991 (2012–2019) all-new body
        992 (2019–)
        A series letter is used by Porsche to indicate the revision for production cars, usually on an annual basis.[citation needed]
        
        911s have also been categorized into families based on body styles or engine enhancements:
        
        911 Carrera: including the Carrera, Carrera S, Carrera 4, Carrera 4S, Carrera GTS, Carrera 4 GTS, Carrera T. All are available as cabriolets except the Carrera T.
        911 Targa: including the Targa 4, Targa 4S, Targa 4 GTS.
        911 Turbo: including the Turbo, Turbo S. All are available as cabriolets.
        GT3/GT3 RS: a track-focused version of the 911 Carrera with a naturally aspirated engine and rear wheel drive. No cabriolet variant has ever been produced to date. A grand touring version featuring comfort-oriented options is called the GT3 Touring, and is available for the 991 and 992 generations.
        GT2/GT2 RS: the highest performance derivative, a track-focused version based on the Turbo with rear wheel drive. No cabriolet version has ever been produced to date. Now available as an RS (Renn Sport) model only.""",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }
}
