<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Routing\Route;


class ProductMiddleware
{


    private $route;

    public function __construct(Route $route)
    {
        $this->route=$route;
    }



    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {

            if (!isset($this->route->parameters['id'])) {
                return response()->json(['error' => true, 'message' => 'Məhsulun id-si daxil edilməyib']);
            }
            $id = $this->route->parameters['id'];
            $blog = \App\Models\Product::find($id);
            if (is_null($blog)) {
                return response()->json(['error' => true, 'message' => 'Məhsul tapılmayıb']);
            }



        return $next($request);
    }
}
