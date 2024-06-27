abstract class post_repostory{
  //اللي هيعرف هنا ال method only
  Future<List<Category>> getallposta();
  Future<Category>getpostbyid(int id);

}