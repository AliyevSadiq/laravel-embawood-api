<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * Class Gallery
 * @package App\Models
 * @mixin Builder
 */
class Gallery extends Model
{
    use HasFactory;

    protected $fillable=['image','product_id'];

 
	
	
	
    public static function insertData($images,$product_id){
        $gallery_items=[];
        if($images){
            foreach ($images as $img){
                $folder="product/gallery/".date("Y-m-d");
                $gallery_items[]=[
                    'product_id'=>$product_id,
                    'image'=>$img->store("images/{$folder}"),
                    'created_at'=>NOW()
                ];
            }
        }
        self::insert($gallery_items);
    }


}
