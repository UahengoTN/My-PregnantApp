import 'package:flutter/material.dart';

class DetailedPregnancyTipsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: Image.asset(
                'assets/Image1.png', // Make sure to add this image to your assets
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.pink[300],
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '10 things every pregnant woman must know',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildTipItem('1. Exercise regularly',
                      'Sitting down a lot is not healthy for you or your baby. It puts you at higher risk of too much weight gain, gestational diabetes, pre-eclampsia and varicose veins and you are more likely to have shortness of breath and lower back pain.'),
                  _buildTipItem('2. Eat balanced diet',
                      'Some foods carry a small risk of infections, such as toxoplasmosis or listeriosis. Others can give you food poisoning, such as salmonella. Others have too much vitamin A or mercury, which can harm your developing baby.'),
                  _buildTipItem('3. Take folic acid, vitamin D, others',
                      'Folic acid reduces your baby\'s risk of neural tube defects to almost zero. At least 400 micrograms a day. You should take it from before conception to 12th week of pregnancy.'),
                  _buildTipItem('4. Monitor your baby\'s movements',
                      'Your baby\'s movements are a sign that they are well. They settle into a regular pattern at around week 24. Start monitoring the pattern at this point and if you notice a reduction in movement, seek help immediately.'),
                  SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        // Add link functionality here
                      },
                      child: Text(
                        'Click the link to more tips https://www.nhs.uk/pregnancy/keeping-well/10-things-you-must-know/',
                        style: TextStyle(color: Colors.blue),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward), label: 'Next'),
        ],
        selectedItemColor: Colors.pink[300],
      ),
    );
  }

  Widget _buildTipItem(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 4),
          Text(content),
        ],
      ),
    );
  }
}
