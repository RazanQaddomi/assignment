Map<String, Map<String, String>> library = {};
void addBook({
  required String title,
  String author = "Unknown",
  String year = "Unknown",
  String genre = "Unknown",
}) {
  library[title] = {
    'author': author,
    'year': year,
    'genre': genre,
  };
  print('Book "$title" added successfully.');
  print('******************************'); 
}

String getBookInfo({
  required String title,
}) {
  if (library.containsKey(title)) {
    var book = library[title]!;
    return 'Title: $title, Author: ${book['author']}, Year: ${book['year']}, Genre: ${book['genre']}';
  } else {
    return 'Book "$title" not found.';
  }
}

void listAllBooks() {
  print('All Books:');
  library.forEach((title, book) {
    print('Title: $title, Author: ${book['author']}, Year: ${book['year']}, Genre: ${book['genre']}');
  });
  print('******************************'); 
}



void listBooksByGenre({required String genre}) {
  print('All Books in $genre Genre:');
  var genreBooks = library.entries
      .where((entry) => entry.value['genre'] == genre)
      .toList();

  if (genreBooks.isEmpty) {
    print("No books found for genre: $genre.");
  } else {
    genreBooks.forEach((entry) {
      print('Title: ${entry.key}, Author: ${entry.value['author']}, Year: ${entry.value['year']}, Genre: ${entry.value['genre']}');
    });
  }
  print('******************************'); 
}

List<String> listBooksByGenreAndReturn({required String genre}) {
  var genreBooks = library.entries
      .where((entry) => entry.value['genre'] == genre)
      .map((entry) => entry.key)
      .toList();

  return genreBooks.isEmpty ? ["No books found for this genre."] : genreBooks;
}

String removeBook({
  required String title,
}) {
  if (library.containsKey(title)) {
    library.remove(title);
    return 'Book "$title" removed successfully.';
  } else {
    return "Book not found.";
  }
}

void main() {
addBook(
    title: "Yawm al-Kura al-Ardiyah",
    author: "Dr. Awda Allah Mani' al-Qaysi",
    year: "2023",
    genre: "Short Stories"
  );
  
  addBook(
    title: "Maslakiyat",
    author: "Ibrahim Omar al-Sukran",
    year: "2021",
    genre: "Islamic Thought"
  );

  addBook(
    title: "Who Moved My Cheese?",
    author: "Spencer Johnson",
    year: "1998",
    genre: "Personal Development"
  );
  
  addBook(
    title: "Stories from History",
    author: "Ali al-Tantawi",
    year: "1990",
    genre: "History"
  );
  
  addBook(
    title: "Chapters in the Principles of Interpretation",
    author: "Dr. Musa'ad bin Sulayman al-Tayyar",
    year: "2018",
    genre: "Islamic Interpretation"
  );

  print(getBookInfo(title: "Razan Story"));
  print('******************************');
  listAllBooks();

  listBooksByGenre(genre: "Short Stories");

  print('Book in History Genre:');
  print(listBooksByGenreAndReturn(genre: "History"));
  print('******************************');

  print('Removing book:');
  print(removeBook(title: "Maslakiyat"));
  print('******************************');

  print('All Books After Removal:');
  listAllBooks();
}
