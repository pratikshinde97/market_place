
class CategoryProducts{
  final String categoryName;
  final String productName;
  final String productImageName;
  final String productDescription;
  final String mrp;
  final String ourPrice;
  final String unitQuantity;
  final String productStatus;
  final String productId;


  CategoryProducts({this.productId,this.categoryName,this.mrp,this.ourPrice,this.productDescription,this.productImageName,this.productName,this.unitQuantity,this.productStatus});

   List<CategoryProducts> getCategoryProducts()  {
   List<CategoryProducts> categoryProducts = [
    CategoryProducts(productId:'001', categoryName: 'cat-1',productName: 'Basmati Rice',productStatus:'Available',productDescription: 'best rice in world',mrp: '55', ourPrice: '86',unitQuantity: '1 kg',
       productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),
     CategoryProducts(productId:'002', categoryName: 'cat-2',productName: 'Tur Dal',productStatus:'Presently Not Available',productDescription: 'Direct come from fresh farm abgjjkff vhjk',mrp: '95', ourPrice: '86',unitQuantity: '1 kg',
       productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),
    CategoryProducts(productId:'003', categoryName: 'cat-1',productName: 'tomato',productStatus:'Presently Not Available',productDescription: 'fresh farm product',mrp: '85', ourPrice: '76',unitQuantity: '1 kg',
      productImageName: 'http://pngall.com/eggplant-png',),
    CategoryProducts(productId:'004', categoryName: 'cat-2',productName: 'Kanda Lasun Masala',productStatus:'Available',productDescription: 'best of its class',mrp: '55', ourPrice: '46',unitQuantity: '200 gm',
      productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),
     CategoryProducts(productId:'005', categoryName: 'cat-3',productName: 'Pam tel',productStatus:'Available',productDescription: 'best of its class',mrp: '55', ourPrice: '46',unitQuantity: '200 gm',
       productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),
     CategoryProducts(productId:'006', categoryName: 'cat-4',productName: 'Peanut',productStatus:'Available',productDescription: 'best of its class',mrp: '55', ourPrice: '46',unitQuantity: '200 gm',
       productImageName: 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',),

   ];
  return categoryProducts;
}

}