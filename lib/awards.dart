import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrizeClaimPage extends StatelessWidget {

  final TextStyle titleStyle = GoogleFonts.kanit(
    fontSize: 16,
    color: const Color(0xFF071739),
  );

  final TextStyle subtitleStyle = GoogleFonts.kanit(
    fontSize: 17,
    color: const Color(0xFF071739),
  );

  final TextStyle headerStyle = GoogleFonts.kanit(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: const Color(0xFFB48A60),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ขึ้นเงินรางวัล',
          style: GoogleFonts.kanit(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF071739),
        leading: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 16),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 65,
                          height: 65,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'หวยรัฐบาลกะลาแลนด์',
                          style: headerStyle,
                        ),
                      ],
                    ),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ผู้รับเงิน',
                          style: titleStyle,
                        ),
                        Text(
                          'พลวิชญ์ ดีสมบูรณ์ กินมายอะ',
                          style: titleStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'รหัสสมาชิก',
                          style: titleStyle,
                        ),
                        Text(
                          'HT12345678',
                          style: titleStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'เลขสลากลอตเตอรี่',
                          style: headerStyle,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < 6; i++)
                              Container(
                                width: 45,
                                height: 45,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 1,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 2,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    '1',
                                    style: GoogleFonts.kanit(
                                        fontSize: 20.0, color: Colors.grey),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 16),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'ประเภทการรางวัล',
                            style: headerStyle,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'รางวัลที่ ........',
                            style: subtitleStyle,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'จำนวนเงิน X,XXX บาท',
                            style: subtitleStyle,
                          ),
                        ],
                      ),
                    ),
                    const Divider(color: Colors.grey),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'เงินรางวัล',
                          style: titleStyle,
                        ),
                        Text(
                          '4000 บาท',
                          style: titleStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ค่าภาษี',
                          style: titleStyle,
                        ),
                        Text(
                          '30 บาท',
                          style: titleStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'ยอดเงินที่ได้รับ',
                          style: titleStyle,
                        ),
                        Text(
                          '3970 บาท',
                          style: titleStyle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4B6382),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    textStyle: GoogleFonts.kanit(fontSize: 18.0),
                  ),
                  child: Text(
                    'ยืนยันขึ้นเงินรางวัล',
                    style: GoogleFonts.kanit(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
