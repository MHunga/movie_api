import 'package:movie_api/model/genre.dart';

class Utils {
  dateFormat(String releaseDate) {
    // releaseDate api trả về có dạng yyyy-MM-dd nên ta format về dạng
    // dd-MMMM-yyyy
    List<String> date = releaseDate.split("-");
    return date[2] + "-T" + date[1] + "-" + date[0];
  }

  genres(List<int> genreIds) {
    String gs = "";
    // lọc ra thể loại của movie theo Id
    listGenres.forEach((element) {
      if (genreIds.contains(element.id)) {
        gs += element.name + ", ";
      }
    });

    // trả về chuỗi bỏ ký tự cuối cùng
    return gs.substring(0, gs.length - 1);
  }
}
