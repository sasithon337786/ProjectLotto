import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminPage extends StatefulWidget {
  final String name;

  const AdminPage({Key? key, required this.name}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<String> _lotteryNumbers = List.generate(5, (_) => 'xxxxxx');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121C35),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.75,
              color: Colors.white,
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Text(
                  'ADMIN: ${widget.name}',
                  style: GoogleFonts.kanit(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 0.92,
                  height: 130,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF7E7),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: _buildInfoCard('ลอตเตอรี่ที่ขายแล้ว', '1000+'),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: _buildInfoCard('ลอตเตอรี่ทั้งหมด', '10000+'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      _buildSectionHeader('ออกรางวัล'),
                      const SizedBox(height: 20),
                      ..._buildLotteryCards(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: _buildActionButton(
                                'สุ่มออกรางวัล',
                                Icons.card_giftcard,
                                const Color(0xFF4B6382),
                                () => _onRandomizePressed(context),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildActionButton(
                                'รีเซ็ตระบบ',
                                Icons.refresh,
                                const Color(0xFFA4B5C4),
                                () => _showResetDialog(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: _buildLogoutButton(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showResetDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.refresh,
              color: Colors.blue,
              size: 30,
            ),
            const SizedBox(width: 10),
            Text(
              'รีเซ็ตระบบ',
              style: GoogleFonts.kanit(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        content: Row(
          children: [
            Icon(
              Icons.warning,
              color: Colors.red,
              size: 30,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                'คุณแน่ใจหรือว่าต้องการรีเซ็ตระบบทั้งหมด?',
                style: GoogleFonts.kanit(fontSize: 16),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
              _performReset(); // Call the reset method
            },
            child: Text('ตกลง',
                style: GoogleFonts.kanit(fontSize: 16, color: Colors.green)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: Text('ยกเลิก',
                style: GoogleFonts.kanit(fontSize: 16, color: Colors.red)),
          ),
        ],
      );
    },
  );
}


  void _performReset() {
    setState(() {
      _lotteryNumbers =
          List.generate(5, (_) => 'xxxxxx'); // Reset to default values
    });
    print('System reset performed'); // For logging or debugging
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFA4B5C4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: GoogleFonts.kanit(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.dmSans(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFBB866B),
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icons/confetti.png',
            color: Colors.white,
            width: 24,
            height: 24,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: GoogleFonts.kanit(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildLotteryCards() {
    final List<String> prizes = [
      'รางวัลที่ 1',
      'รางวัลที่ 2',
      'รางวัลที่ 3',
      'รางวัลที่ 4',
      'รางวัลที่ 5'
    ];
    final List<String> amounts = [
      '6,000,000 บาท',
      '200,000 บาท',
      '80,000 บาท',
      '40,000 บาท',
      '20,000 บาท'
    ];

    return List.generate(5, (index) {
      return _buildLotteryCard(
          _lotteryNumbers[index], prizes[index], amounts[index]);
    });
  }

  Widget _buildLotteryCard(String numbers, String prize, String amount) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Color(0xFF4D4F76)),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: numbers.split('').map((digit) {
                          return Container(
                            width: 37,
                            height: 37,
                            margin: const EdgeInsets.symmetric(horizontal: 1),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.blue.shade100),
                            ),
                            child: Center(
                              child: Text(
                                digit,
                                style: GoogleFonts.kanit(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        prize,
                        style: GoogleFonts.kanit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF4B6382),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        amount,
                        style: GoogleFonts.kanit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF4B6382),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xFF071739),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 5),
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    'หวยรัฐบาลกะลาแลนด์',
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
      String text, IconData icon, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: Colors.white),
      label: Text(
        text,
        style: GoogleFonts.kanit(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        // Perform the logout action here
        // For example: Navigator.pushReplacementNamed(context, '/login');
      },
      icon: const Icon(Icons.logout, color: Colors.white),
      label: Text(
        'ออกจากระบบ',
        style: GoogleFonts.kanit(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFA68868),
        padding: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  void _onRandomizePressed(BuildContext context) {
    _showRandomizeDialog(context);
  }

  void _showRandomizeDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'กำลังสุ่มรางวัล...',
                    style: GoogleFonts.kanit(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Rolling ball effect
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 8,
                      backgroundColor: Colors.blue.shade100,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pop(context);
      final newNumbers = _generateRandomNumbers();
      setState(() {
        _lotteryNumbers = newNumbers; // Update lottery numbers
      });
      _logPossibleNumbers(newNumbers); // Log possible numbers
    });
  }

  List<String> _generateRandomNumbers() {
    final random = Random();
    return List.generate(5, (_) {
      return List.generate(6, (_) => random.nextInt(10).toString()).join();
    });
  }

  void _logPossibleNumbers(List<String> numbers) {
    // ANSI escape codes for colors
    const String reset = '\x1B[0m';
    const String yellow = '\x1B[33m'; // Yellow text
    const String bold = '\x1B[1m'; // Bold text

    print('${bold}${yellow}Possible Lottery Numbers:${reset}');
    numbers.forEach((number) {
      print('${yellow}${number} ครั้ง${reset}');
    });
  }
}
