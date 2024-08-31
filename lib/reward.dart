import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RewardPage extends StatefulWidget {
  @override
  _RewardPageState createState() => _RewardPageState();
}

class _RewardPageState extends State<RewardPage> {
  int itemCount = 5;

  // This boolean will simulate whether a ticket is a winning one
  List<bool> isWinningTicket = [true, false, false, true, false];

  @override
  Widget build(BuildContext context) {
    const Color appBarColor = Color(0xFF071739);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        title: Text(
          'คำสั่งซื้อลอตเตอรี่',
          style: GoogleFonts.kanit(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'ลอตเตอรี่ $itemCount ใบ',
                    style: GoogleFonts.kanit(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFA68868),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: itemCount == 0
                ? Center(
                    child: Container(
                      padding: const EdgeInsets.all(18.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: Color(0xFF071739),
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/icons/triangle-warning.png',
                            width: 26,
                            height: 26,
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            'คุณยังไม่มีคำสั่งซื้อ',
                            style: GoogleFonts.kanit(
                              fontSize: 16.0,
                              color: Color(0xFF071739),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 4.0),
                        child: Card(
                          elevation: 1.0,
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding: EdgeInsets.all(16.0),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 3),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF071739),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            'assets/icons/bullet.png',
                                            width: 18,
                                            height: 18,
                                          ),
                                      
                                          Text(
                                            'หวยรัฐบาลกะลาแลนด์',
                                            style: GoogleFonts.kanit(
                                              fontSize: 12,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Wrap(
                                      spacing: 6.0,
                                      runSpacing: 8.0,
                                      children: List.generate(6, (i) {
                                        return Container(
                                          width: 30,
                                          height: 30,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border:
                                                Border.all(color: Colors.grey),
                                          ),
                                          child: Text(
                                            '${i + 1}',
                                            style: GoogleFonts.kanit(
                                                color: Colors.grey),
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                ),
                                trailing: FittedBox(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        isWinningTicket[index]
                                            ? 'คุณถูกรางวัลที่...'
                                            : 'คุณไม่ถูกรางวัล',
                                        style: GoogleFonts.kanit(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 15.0),
                                        child: isWinningTicket[index]
                                            ? OutlinedButton(
                                                onPressed: () {
                                                  print('Claim prize');
                                                },
                                                style: OutlinedButton.styleFrom(
                                                  side: const BorderSide(
                                                      color: Colors.grey,
                                                      width: 1.0),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 18.0,
                                                      vertical: 10.0),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                                child: Text(
                                                  'ขึ้นเงินรางวัล',
                                                  style: GoogleFonts.kanit(
                                                    color: Color(0xFFA68868),
                                                    fontSize: 19,
                                                  ),
                                                ),
                                              )
                                            : Image.asset(
                                                'assets/icons/sad.png',
                                                width: 33,
                                                height: 33,
                                              ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'คำสั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'ตะกร้า',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 2,
        selectedItemColor: appBarColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {},
      ),
    );
  }
}
