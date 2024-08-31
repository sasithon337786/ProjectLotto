import 'package:flutter/material.dart';
import 'package:flutter_application_lotto/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  int _currentIndex = 3; // Set the initial active index as needed

void _onItemTapped(int index) {
  setState(() {
    _currentIndex = index;
  });
  
  if (index == 0) {
    // Navigate to the home page
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
  // Add navigation logic for other indices if needed
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121C35),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.69,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Custom Header
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 16),
                child: Row(
                  children: [
                    IconButton(
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    Text(
                      'จำนวนเงินคงเหลือ',
                      style: GoogleFonts.kanit(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Balance Container
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.80,
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: const Color(0xFFA4B5C4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icons/money-bag.png',
                        width: 36,
                        height: 36,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '10,000.-',
                        style: GoogleFonts.kanit(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Transaction History
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'ประวัติการทำรายการ',
                      style: GoogleFonts.kanit(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF071739),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFA68868),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(10),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'ฝากเงิน',
                            style: GoogleFonts.kanit(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Image.asset(
                            'assets/icons/paying-off.png',
                            width: 26,
                            height: 26,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              _buildTransactionCard(
                'สมาชิกใหม่',
                '+10,000.-',
                '11 ส.ค. 24 | 18.00 น.',
                const Color(0XFF009245),
                const Color(0XFF009245),
                Colors.white,
              ),
              _buildTransactionCard(
                'ซื้อหวยไปแล้ว',
                '-300.-',
                '11 ส.ค. 24 | 18.20 น.',
                const Color(0XFFC1272D),
                const Color(0XFFC1272D),
                Colors.white,
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: const Color(0xFF121C35),
        unselectedItemColor: const Color(0xFF7A7F88),
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.kanit(),
        unselectedLabelStyle: GoogleFonts.kanit(),
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? SvgPicture.asset(
                    'assets/svg/home-04-solid-standard.svg',
                    color: const Color(0xFF121C35),
                    width: 24.0,
                    height: 24.0,
                  )
                : const HugeIcon(
                    icon: HugeIcons
                        .strokeRoundedHome04, 
                    color: Color(0xFF7A7F88),
                    size: 24.0,
                  ),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? SvgPicture.asset(
                    'assets/svg/notebook-solid-standard.svg', 
                    color: const Color(0xFF121C35),
                    width: 24.0,
                    height: 24.0,
                  )
                : SvgPicture.asset(
                    'assets/svg/notebook-stroke-standard.svg', 
                    color: const Color(0xFF7A7F88),
                    width: 24.0,
                    height: 24.0,
                  ),
            label: 'คำสั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? SvgPicture.asset(
                    'assets/svg/notebook-stroke-standard-solid.svg', 
                    color: const Color(0xFF121C35),
                    width: 24.0,
                    height: 24.0,
                  )
                : SvgPicture.asset(
                    'assets/svg/Buy 3.svg', 
                    color: const Color(0xFF7A7F88),
                    width: 24.0,
                    height: 24.0,
                  ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? SvgPicture.asset(
                    'assets/svg/wallet-01-solid-standard.svg', 
                    color: const Color(0xFF121C35),
                    width: 24.0,
                    height: 24.0,
                  )
                : SvgPicture.asset(
                    'assets/svg/wallet-01-stroke-standard.svg', 
                    color: const Color(0xFF7A7F88),
                    width: 24.0,
                    height: 24.0,
                  ),
            label: 'จำนวนเงิน',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? SvgPicture.asset(
                    'assets/svg/user-solid-standard.svg', 
                    color: const Color(0xFF121C35),
                    width: 24.0,
                    height: 24.0,
                  )
                : SvgPicture.asset(
                    'assets/svg/user-stroke-standard.svg', 
                    color: const Color(0xFF7A7F88),
                    width: 24.0,
                    height: 24.0,
                  ),
            label: 'Profile',
          ),
        ],
        onTap: _onItemTapped,
      ),
    
    );
  }
}



                                                          // ElevatedButton(
                                                          //   onPressed: () {},
                                                          //   style:
                                                          //       ElevatedButton
                                                          //           .styleFrom(
                                                          //     backgroundColor:
                                                          //         Colors.white,
                                                          //     shape:
                                                          //         RoundedRectangleBorder(
                                                          //       borderRadius:
                                                          //           BorderRadius
                                                          //               .circular(
                                                          //                   8),
                                                          //       side: const BorderSide(
                                                          //           color: Color(
                                                          //               0xFFC4C4C4)),
                                                          //     ),
                                                          //     elevation: 0,
                                                          //     padding: const EdgeInsets
                                                          //         .symmetric(
                                                          //         horizontal: 8,
                                                          //         vertical:
                                                          //             4), // Adjusted padding
                                                          //   ),
                                                          //   child: Row(
                                                          //     mainAxisSize:
                                                          //         MainAxisSize
                                                          //             .min,
                                                          //     children: [
                                                          //       SvgPicture
                                                          //           .asset(
                                                          //         'assets/svg/basket.svg',
                                                          //         color: const Color(
                                                          //             0xFF000000),
                                                          //         width:
                                                          //             16, // Adjusted width
                                                          //         height:
                                                          //             16, // Adjusted height
                                                          //       ),
                                                          //       const SizedBox(
                                                          //           width: 4),
                                                          //       Text(
                                                          //         'เลือก',
                                                          //         style:
                                                          //             GoogleFonts
                                                          //                 .kanit(
                                                          //           color: const Color(
                                                          //               0xFF000000),
                                                          //           fontSize:
                                                          //               12, // Adjusted font size
                                                          //         ),
                                                          //       ),
                                                          //     ],
                                                          //   ),
                                                          // ),
                                                       

Widget _buildTransactionCard(String title, String amount, String dateTime,
    Color color, Color borderColor, Color bgColor) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
    child: Container(
      decoration: BoxDecoration(
        color: borderColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 1, top: 1, bottom: 1),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.kanit(
                        color: color,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      dateTime,
                      style: GoogleFonts.kanit(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Text(
                  amount,
                  style: GoogleFonts.kanit(
                    color: color,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  
}

