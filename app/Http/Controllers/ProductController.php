<?php

namespace App\Http\Controllers;

use App\Models\Gallery;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;


class ProductController extends Controller
{
    public function index(){
		
        $products=Product::with(['category','galleries'])->get();
        return response()->json($products,200);
    }

    public function edit($id){
      
        $product=Product::where('id','=',$id)->with(['category','galleries'])->first();
        return response()->json($product,200);
    }

    public function create(Request $request){

        if($request->method()=='POST'){
		
				$data=$request->all();
				
				$validator=Validator::make($data,Product::$createRules,Product::$errorMsg);
			   

				if($validator->fails()){
					return response()->json(['error'=>true,'messages'=>$validator->errors()->all()]);
				}

				$data['main_image']=Product::uploadImg($request,'main_image');
				
				$product=Product::create($data);

			   Gallery::insertData($request->file('galleries'),$product->attributesToArray()['id']);


				DB::commit();
			   return response()->json('Məhsul əlavə olundu',201);

        }
    }


    public function update(Request $request,$id){
        if($request->method()=='POST'){
           
				$data=$request->all();
				
				$validator=Validator::make($data,Product::$updateRules,Product::$errorMsg);
				$product=Product::find($id);
				
				if($validator->fails()){
					return response()->json(['error'=>true,'messages'=>$validator->errors()->all()]);
				}

				$data['main_image']=Product::uploadImg($request,'main_image',$product->main_image) ? Product::uploadImg($request,'main_image',$product->main_image) : $product->main_image;

				$product->update($data);


				Gallery::insertData($request->file('galleries'),$product->attributesToArray()['id']);
				
				
				return response()->json('Məhsul redaktə olundu',201);
			
        }
    }

    public function delete($id){
        $product=Product::find($id);

        Storage::delete($product->main_image);
        $gallery=Gallery::where('product_id','=',$id)->get();

        foreach ($gallery as $image){
            Storage::delete($image->image);
        }
        Gallery::where('product_id','=',$id)->delete();
        $product->delete();
        return response()->json('Məhsul silindi',200);
    }
	
	
	public function category(){
		return response()->json(Category::select('id','title')->get(),200);
	}
	



}
