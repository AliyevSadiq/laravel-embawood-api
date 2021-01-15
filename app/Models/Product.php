<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

/**
 * Class Product
 * @package App\Models
 * @mixin Builder
 */
class Product extends Model
{
    use HasFactory;


    public function category(){
        return $this->belongsTo(Category::class);
    }



    protected $fillable=['title','description','category_id','main_image','galleries.*'];


    public static $createRules=[
        'title'=>['required','unique:products','max:50'],
        'category_id'=>['required','exists:categories,id'],
        'main_image'=>['required','image'],
        'description'=>['required'],
        'galleries.*'=>['image']
    ];
    public static $updateRules=[
        'title'=>['required','max:50'],
        'category_id'=>['required','exists:categories,id'],
        'main_image'=>['image'],
        'description'=>['required'],
        'galleries.*'=>['image']
    ];


    public static $errorMsg=[
        'title.required'=>'Məhsulun adı boş olmamalıdır!!!',
		'title.max'=>'Məhsulun adı 50 simvoldan çox olmamalıdır!!!',
        'title.unique'=>'Məhsulun adı artıq istifadə edilib!!!',
        'category_id.required'=>'Kateqoriya daxil edilməlidir!!!',
        'category_id.exists'=>'Kateqoriya mövcud deyil!!!',
        'main_image.required'=>'Məhsulun şəkli daxil edilməlidir!!!',
        'main_image.image'=>'Məhsulun şəkli düzgün daxil edilməyib!!!',
        'description.required'=>'Məhsul haqqında ətraflı məlumat boş olmamalıdır!!!',
        'galleries.*.image'=>'Məhsulun qalereya şəkilləri düzgün daxil edilməyib!!!'
    ];

    public function setTitleAttribute($value){
        $this->attributes['title']=Str::ucfirst($value);
    }

    public function setDescriptionAttribute($value){
        $this->attributes['description']=Str::ucfirst($value);
    }


    public function galleries(){
        return  $this->hasMany(Gallery::class);
    }

    public static function uploadImg($request,$name,$image=null){
        if($request->hasFile($name)){
            if($image){
                Storage::delete($image);
            }
            $folder="product/".date("Y-m-d");
            return $request->file($name)->store("images/{$folder}");
        }
        return null;
    }


}
