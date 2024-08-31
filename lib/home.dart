import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_lotto/cart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<String> _lotteryNumbers = [];
  List<String> _displayedNumbers = [];

  final List<TextEditingController> _controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );

  @override
  void initState() {
    super.initState();
    _loadLotteryNumbers();
  }

  Future<void> _loadLotteryNumbers() async {
    try {
      final String response =
          await rootBundle.loadString('assets/json/lottery_numbers.json');
      final List<dynamic> data = json.decode(response);

      final List<String> numbers = List<String>.from(data);

      setState(() {
        _lotteryNumbers = numbers;
        _displayedNumbers = _getRandomNumbers(numbers, 10);
      });
    } catch (e) {
      print('Error loading lottery numbers: $e');
    }
  }

  List<String> _getRandomNumbers(List<String> numbers, int count) {
    final random = Random();
    final shuffled = List<String>.from(numbers)..shuffle(random);
    return shuffled.take(count).toList();
  }

  void _clearFields() {
    setState(() {
      for (var controller in _controllers) {
        controller.clear();
      }
    });
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ShoppingCartPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isSmallScreen = screenSize.width < 360;

    return Scaffold(
      backgroundColor: const Color(0xFF121C35),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF121C35),
                ),
                child: Column(
                  children: [
                    _buildSearchSection(context),
                    Expanded(
                      child:
                          _buildRecommendationSection(context, isSmallScreen),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/logo.png', height: 70),
          _buildWalletButton(),
        ],
      ),
    );
  }

  Widget _buildWalletButton() {
    return GestureDetector(
      onTap: () {
        // Implement wallet page navigation here
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            const SizedBox(width: 5),
            Image.asset(
              'assets/icons/refresh.png',
              color: const Color(0xFF9C7D6B),
              width: 16,
              height: 16,
            ),
            const SizedBox(width: 5),
            Text(
              '10,000',
              style: GoogleFonts.jetBrainsMono(
                fontSize: 12,
                color: const Color(0xFF808285),
              ),
            ),
            const SizedBox(width: 5),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: const Color(0xFF4B6382),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/paying-off.png',
                  width: 22,
                  height: 22,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ค้นหาเลขเด็ดของคุณเลย !',
                  style: GoogleFonts.kanit(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4B6382),
                  ),
                ),
                GestureDetector(
                  onTap: _clearFields,
                  child: Text(
                    'ล้างตัวเลข',
                    style: GoogleFonts.kanit(
                      fontSize: 14,
                      color: const Color(0xFFE3C39D),
                      decoration: TextDecoration.underline,
                      decorationColor: const Color(0xFFE3C39D),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: List.generate(
                6,
                (index) => Expanded(
                  child: Container(
                    height: 45,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFC4C4C4)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      controller: _controllers[index],
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      maxLength: 1,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                        contentPadding: EdgeInsets.symmetric(vertical: 14),
                      ),
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4C6583),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'ทั้งหมด',
                      style: GoogleFonts.kanit(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD1B48C),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      'ค้นหา',
                      style: GoogleFonts.kanit(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecommendationSection(BuildContext context, bool isSmallScreen) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'แนะนำเลขเด็ดสำหรับคุณ !',
                  style: GoogleFonts.kanit(
                    fontSize: isSmallScreen ? 16 : 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFA68868),
                  ),
                ),
                Text(
                  'ตรวจผลรางวัล',
                  style: GoogleFonts.kanit(
                    fontSize: isSmallScreen ? 12 : 14,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4C6583),
                    decoration: TextDecoration.underline,
                    decorationColor: const Color(0xFF4C6583),
                    decorationThickness: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _displayedNumbers.length,
                itemBuilder: (context, index) {
                  return _buildLotteryItem(
                      context, _displayedNumbers[index], isSmallScreen);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLotteryItem(
      BuildContext context, String lotterySet, bool isSmallScreen) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF4D4F76)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: const Color(0xFF071739),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Text(
                  'หวยรัฐบาลกะลาแลนด์',
                  style: GoogleFonts.kanit(
                    fontSize: isSmallScreen ? 12 : 14,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '100 ',
                        style: GoogleFonts.poppins(
                          fontSize: isSmallScreen ? 14 : 16,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'บาท',
                        style: GoogleFonts.kanit(
                          fontSize: isSmallScreen ? 14 : 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    6,
                    (i) => Container(
                      width: isSmallScreen ? 30 : 35,
                      height: isSmallScreen ? 30 : 35,
                      margin: const EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFC4C4C4)),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: Text(
                          lotterySet[i].toString(),
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFC4C4C4),
                            fontSize: isSmallScreen ? 12 : 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: const BorderSide(color: Color(0xFFC4C4C4)),
                    ),
                    elevation: 0,
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 8 : 12,
                      vertical: isSmallScreen ? 2 : 4,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/basket.svg',
                        color: const Color(0xFF000000),
                        width: isSmallScreen ? 14 : 16,
                        height: isSmallScreen ? 14 : 16,
                      ),
                      SizedBox(width: isSmallScreen ? 2 : 4),
                      Text(
                        'เลือก',
                        style: GoogleFonts.kanit(
                          color: const Color(0xFF000000),
                          fontSize: isSmallScreen ? 10 : 12,
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
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
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
                  icon: HugeIcons.strokeRoundedHome04,
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
    );
  }
}
