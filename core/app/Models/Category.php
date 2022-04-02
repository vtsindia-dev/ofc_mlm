<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $guarded = ['id'];
    protected $table ="categories";

    public function Product()
    {
        return $this->hasMany(Product::class);
    }
}
