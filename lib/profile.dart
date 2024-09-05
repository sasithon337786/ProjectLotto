import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(200), // ความสูงของ AppBar
        child: Stack(
          children: [
            // AppBar โค้ง
            ClipPath(
              clipper: AppBarClipper(),
              child: Container(
                height: 200,
                color: Color(0xFF17223B),
              ),
            ),
            // AppBar content
            Positioned(
              top: 40,
              left: 16,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            Positioned(
              top: 50,
              left: 80,
              child: Text(
                'Profile',
                style: GoogleFonts.kanit(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
      child: Column(
          children: [
            // รูปโปรไฟล์พร้อมกรอบ
            Container(
              margin: EdgeInsets.all(20), // เพิ่มระยะห่างจากขอบด้านนอก
              padding: EdgeInsets.all(4), // เพิ่มพื้นที่ระหว่างกรอบและรูปโปรไฟล์
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Color(0xFF071739), // สีกรอบ
                  width: 2, // ความหนาของกรอบ
                ),
                borderRadius: BorderRadius.circular(60), // ทำให้กรอบเป็นวงกลม
              ),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: AssetImage(
                    'assets/images/cat.jpg',
                  ),
                ),
              ),
            ),
            // SizedBox(
            //     height:
            //         20), // เพิ่มพื้นที่ว่างด้านบนให้รูปโปรไฟล์ไม่ชนกับข้อความ

            // ข้อมูลโปรไฟล์ในกรอบสีดำ
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color.fromARGB(255, 121, 119, 119), // สีกรอบ
                  width: 1, // ความหนาของกรอบ
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'พลจัตวา ดีสมบูรณ์ กินมาเยอะ',
                    style: GoogleFonts.kanit(
                      fontSize: 17,
                      color: Color(0xFF071739),
                    ),
                  ),
                  SizedBox(height: 8),
                  // ข้อความใน Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'รหัสสมาชิก:',
                        style: GoogleFonts.kanit(
                          fontSize: 16,
                          color: Color(0xFFA68868),
                        ),
                      ),
                      SizedBox(width: 8), // ระยะห่างระหว่างข้อความ
                      Text(
                        'HT12345678',
                        style: GoogleFonts.kanit(
                          fontSize: 16,
                          color: Color(0xFF071739),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 25), // ปรับระยะห่างที่ต้องการ
                Text(
                  'ข้อมูลส่วนตัว',
                  style: GoogleFonts.kanit(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF071739),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            // กล่องข้อมูลส่วนตัว
            Container(
              margin: EdgeInsets.symmetric(horizontal: 18),
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.grey[300]!,
                ),
              ),
              child: Column(
                children: [
                  _buildInfoRow('ชื่อ', 'ดีสมบูรณ์'),
                  Divider(color: Colors.grey[300]), // เส้นกั้น
                  _buildInfoRow('นามสกุล', 'กินมาเยอะ'),
                  Divider(color: Colors.grey[300]), // เส้นกั้น
                  _buildInfoRow('ชื่อเล่น', '-'),
                  Divider(color: Colors.grey[300]), // เส้นกั้น
                  _buildInfoRow('เพศ', '-'),
                  Divider(color: Colors.grey[300]), // เส้นกั้น
                  _buildInfoRow('วัน/เดือน/ปีเกิด', '--/--/----'),
                ],
              ),
            ),

            SizedBox(height: 20),
            // ปุ่ม Edit profile
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
                  'Edit Profile',
                  style: GoogleFonts.kanit(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
                height:
                    20), // เพิ่มพื้นที่ว่างให้ปุ่มไม่ชนกับ BottomNavigationBar
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'คำสั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'จำนวนเงิน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 4,
        selectedItemColor: Color(0xFF17223B),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.kanit(
              fontSize: 15,
              color: Color.fromARGB(255, 133, 134, 136),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.kanit(
              fontSize: 15,
              color: Color(0xFF071739),
            ),
          ),
        ],
      ),
    );
  }
}

class AppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2,
        size.height - 70, // เพิ่มความสูงของโค้งขึ้น
        size.width,
        size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
