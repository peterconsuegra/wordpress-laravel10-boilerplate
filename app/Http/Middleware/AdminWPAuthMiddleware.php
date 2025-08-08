<?php
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use Log;
use App\Models\PeteSync;

class AdminWPAuthMiddleware
{
    public function handle(Request $request, Closure $next)
    {
        
        $wp_user = PeteSync::getTheWPUserFromMiddleware($request);
        $roles = PeteSync::get_roles($wp_user);

        if (empty($wp_user['logged_in']) || !in_array('administrator', $roles, true)) {
           return redirect(env('WP_URL_LOGIN'));
        }

        $request->attributes->set('wp_user', $wp_user);
        $request->attributes->set('wp_roles', $roles);

        return $next($request);

    }
}
