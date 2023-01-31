class Listcontent {
  String image;
  String title;
  String discription;
  Listcontent(
      {required this.title, required this.image, required this.discription});
}

List<Listcontent> poster = [
  Listcontent(
      title: "Welcome",
      image: 'assets/photos/undraw_welcome_cats_thqn.svg',
      discription: "discription"),
  Listcontent(
      title: "Task manger",
      image: 'assets/photos/undraw_tasks_re_v2v4.svg',
      discription: "discription"),
  Listcontent(
      title: 'Pick up Color',
      image: 'assets/photos/undraw_color_palette_re_dwy7.svg',
      discription: "discription"),
];
