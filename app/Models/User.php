<?php

namespace App\Models;

;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

use Tymon\JWTAuth\Contracts\JWTSubject;

/**
 * Class User
 * @package App\Models
 * @mixin Builder
 */
class User extends Authenticatable implements JWTSubject
{
    use HasFactory;


    protected $fillable=['username','email','password'];


    public static $registerRules=[
        'username'=>['required','unique:users','max:50'],
        'email'=>['required','unique:users','email','max:50'],
        'password'=>['required'],
    ];

    public static $loginRules=[
        'email'=>['required','email'],
        'password'=>['required'],
    ];


    public static $errorMsg=[
        'username.required'=>'İstifadəçi adı daxil edilməlidir',
        'username.max'=>'İstifadəçi adı 50 simvoldan çox olmamalıdır',
        'username.unique'=>'İstifadəçi adı istifadə olunur',
        'email.required'=>'Elektron poçt daxil edilməlidir',
        'email.max'=>'Elektron poçt 50 simvoldan çox olmamalıdır',
        'email.unique'=>'Elektron poçt istifadə olunur',
        'email.email'=>'Elektron poçt düzgün daxil edilməmişdir',
        'password.required'=>'Parol daxil edilməlidir',
    ];


    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    public function getJWTCustomClaims()
    {
        return [];
    }
}
