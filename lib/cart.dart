import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  bool _showBuyMoreButton = false;
  int itemCount = 0;

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
          'ตรวจสอบรายการคำสั่งซื้อ',
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
            color: appBarColor,
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
                : NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent) {
                        setState(() {
                          _showBuyMoreButton = true;
                        });
                      } else if (scrollInfo.metrics.pixels <
                          scrollInfo.metrics.maxScrollExtent - 50) {
                        setState(() {
                          _showBuyMoreButton = false;
                        });
                      }
                      return true;
                    },
                    child: ListView.builder(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF071739),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text(
                                          'หวยรัฐบาลกะลาแลนด์',
                                          style: GoogleFonts.kanit(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
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
                                              border: Border.all(
                                                  color: Colors.grey),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '100 บาท',
                                          style: GoogleFonts.kanit(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 15.0),
                                          child: OutlinedButton(
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                            style: OutlinedButton.styleFrom(
                                              side: const BorderSide(
                                                color: Colors.grey,
                                                width: 2.0,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16.0,
                                                      vertical: 8.0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  Icons.cancel,
                                                  color: Color.fromARGB(
                                                      255, 171, 8, 8),
                                                ),
                                                Text(
                                                  'ยกเลิก',
                                                  style: GoogleFonts.kanit(
                                                    fontSize: 20,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
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
          ),
          if (_showBuyMoreButton)
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 200), // ขนาดปุ่ม
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4B6382),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 3.0),
                      textStyle: GoogleFonts.kanit(fontSize: 16.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/shopping-bag-add.png',
                          width: 26,
                          height: 26,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'เลือกซื้อเพิ่มเติม',
                          style: GoogleFonts.kanit(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ยอดชำระทั้งหมด',
                      style: GoogleFonts.kanit(
                        fontSize: 16.0,
                        color: Color(0xFFA68868),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '300 บาท',
                      style: GoogleFonts.kanit(
                        fontSize: 16.0,
                        color: Color(0xFFA68868),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF8EA5BA),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18.0, vertical: 10.0),
                    textStyle: GoogleFonts.kanit(fontSize: 18.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/card.png',
                        width: 26,
                        height: 26,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'ชำระเงิน',
                        style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
