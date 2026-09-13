class Cardmodel {
  final String name;
  final int id;
  final String imagePath;
  final String description;

  Cardmodel({
    required this.id,
    required this.imagePath,
    required this.name,
    required this.description,
  });

  static List<Cardmodel> cards = [
    Cardmodel(
      id: 1,
      name: 'Sport',
      imagePath: 'assets/images/Sport.png',
      description: 'Enjoy exciting sports events and activities.',
    ),
    Cardmodel(
      id: 2,
      name: 'Birthday',
      imagePath: 'assets/images/birthday.png',
      description: 'Celebrate special birthdays with friends and family.',
    ),
    Cardmodel(
      id: 3,
      name: 'Meeting',
      imagePath: 'assets/images/meeting.png',
      description: 'Connect, discuss, and share ideas with others.',
    ),
    Cardmodel(
      id: 4,
      name: 'Gaming',
      imagePath: 'assets/images/gaming.png',
      description: 'Join fun gaming events and challenge other players.',
    ),
    Cardmodel(
      id: 5,
      name: 'Eating',
      imagePath: 'assets/images/eating.png',
      description: 'Discover food experiences and enjoy great meals.',
    ),
    Cardmodel(
      id: 6,
      name: 'Holiday',
      imagePath: 'assets/images/holiday.png',
      description: 'Enjoy memorable trips, celebrations, and holidays.',
    ),
    Cardmodel(
      id: 7,
      name: 'Exhibition',
      imagePath: 'assets/images/exhibition.png',
      description: 'Discover art, creativity, and inspiring exhibitions.',
    ),
    Cardmodel(
      id: 8,
      name: 'Workshop',
      imagePath: 'assets/images/workshop.png',
      description: 'Learn practical skills through interactive workshops.',
    ),
    Cardmodel(
      id: 9,
      name: 'Book Club',
      imagePath: 'assets/images/book_club.png',
      description: 'Read, discuss, and share your favorite books.',
    ),
  ];
}
