import 'package:news_app/models/catagory_model.dart';

List<CatagoryModel> getCatagories() {
  List<CatagoryModel> catagory = List<CatagoryModel>.empty(growable: true);
  CatagoryModel catagoryModel;

  //1
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Business";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1488190211105-8b0e65b80b4e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80";
  catagory.add(catagoryModel);

  //2
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Entertainment";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  catagory.add(catagoryModel);

  //3
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "General";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  catagory.add(catagoryModel);

  //4
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Health";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  catagory.add(catagoryModel);

  //5
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Science";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  catagory.add(catagoryModel);

  //6
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Sports";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  catagory.add(catagoryModel);

  //7
  catagoryModel = new CatagoryModel();
  catagoryModel.catagoryName = "Technology";
  catagoryModel.imageUrl =
      "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  catagory.add(catagoryModel);

  return catagory;
}
