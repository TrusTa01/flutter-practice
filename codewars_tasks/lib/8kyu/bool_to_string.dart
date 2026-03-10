String bool_to_word(bool boolean) => boolean ? "Yes" : "No";

void main() {
  print(bool_to_word(true));
  print(bool_to_word(false));
}
