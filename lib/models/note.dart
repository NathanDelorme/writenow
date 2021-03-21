class Note {
  String _name;
  String _content;
  DateTime _date;

  Note(String parName, [String parContent = "La note a été ajouté !"]) {
    _name = parName;
    _content = parContent;
    _date = DateTime.now();
  }

  String getName() => _name;
  setName(String parNewName) => _name = parNewName;

  String getContent() => _content;
  setContent(String parNewContent) => _content = parNewContent;

  DateTime getDate() => _date;
  setDate(DateTime parNewDate) => _date = parNewDate;

}