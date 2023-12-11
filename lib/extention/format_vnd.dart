//format price vnd
import 'package:intl/intl.dart';

String formatCurrency(double price) {
  final currencyFormat = NumberFormat.currency(
    symbol: '', // Đặt ký hiệu tiền tệ thành chuỗi rỗng nếu bạn muốn hiển thị mã tiền VND
    locale: 'vi_VN', // Chọn ngôn ngữ để hiển thị số
  );
  return currencyFormat.format(price);
}