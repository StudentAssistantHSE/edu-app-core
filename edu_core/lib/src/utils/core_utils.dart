abstract class CoreUtils {
  const CoreUtils._();

  static bool compareFirstLetters(String? first, String? second) {
    if (first == null && second == null) {
      return true;
    }
    if (first == null && second != null) {
      return false;
    }
    if (first != null && second == null) {
      return false;
    }
    if (first!.isEmpty && second!.isEmpty) {
      return true;
    }
    if (first.isEmpty && second!.isNotEmpty) {
      return false;
    }
    if (first.isNotEmpty && second!.isEmpty) {
      return false;
    }
    return first[0] == second![0];
  }
}