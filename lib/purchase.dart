import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PurchaseSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF071739),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Color(0xFF4B6382),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 35),
                    Image.asset('assets/images/logo.png', height: 100),
                    SizedBox(height: 35),
                    Text(
                      'ซื้อสลากเตอร์รี่สำเร็จ',
                      style: GoogleFonts.kanit(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(
                      color: Colors.white,
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                    ),
                    SizedBox(height: 30),
                    buildDetailSection(),
                  ],
                ),
              ),
              const SizedBox(height: 70),
              ElevatedButton(
                onPressed: () {
                  // Handle button press
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFA68868),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/home.png',
                      width: 26,
                      height: 26,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'ไปยังหน้าสำหรับซื้อ',
                      style: GoogleFonts.kanit(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailSection() {
    return Column(
      children: [
        buildDetailRowWithSpacing('จำนวน', '3 ใบ'),
        buildDetailRowWithSpacing('ชื่อผู้ซื้อ', 'พลวัต ดิสบุรณ์ กินามฮะอะ'),
        buildDetailRowWithSpacing('ช่องทางการชำระเงิน', 'Wallet'),
        buildDetailRowWithSpacing('วันที่ทำรายการ', '01/03/24, 11:00:45'),
        detailRow('ราคารวมทั้งหมด', '300 บาท', isTotalPrice: true),
      ],
    );
  }

  Widget buildDetailRowWithSpacing(String title, String detail) {
    return Column(
      children: [
        detailRow(title, detail),
        SizedBox(height: 20),
      ],
    );
  }

  Widget detailRow(String title, String detail, {bool isTotalPrice = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.kanit(
            fontSize: isTotalPrice ? 20 : 18,
            fontWeight: isTotalPrice ? FontWeight.bold : FontWeight.normal,
            color: const Color.fromARGB(125, 207, 206, 206),
          ),
        ),
        Text(
          detail,
          style: GoogleFonts.kanit(
            fontSize: isTotalPrice ? 20 : 16,
            fontWeight: isTotalPrice ? FontWeight.bold : FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
