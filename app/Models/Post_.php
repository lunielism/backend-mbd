<?php

namespace App\Models;

class Post
{
    private static $blog_posts = [
        [
            "title" => "Dani",
            "slug" => "pertama",
            "author" => "anjay",
            "body" => "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quos praesentium exercitationem impedit. Nobis atque accusamus nam exercitationem, laboriosam quas? Similique culpa repellendus fugit odit a, quis debitis quasi. Nisi ipsum similique praesentium repudiandae optio tempore dicta, soluta quis hic deleniti obcaecati iste. Nostrum veniam, id ducimus deserunt impedit quia vero illum non ullam. Earum architecto dolor consequatur fugiat non, tempora labore at accusamus quibusdam fuga atque autem sint sunt et quia ex quod similique illo reprehenderit praesentium officia vero mollitia totam repellat. Rem error temporibus sint quaerat tempora sapiente id accusamus, ipsam neque eius, praesentium quibusdam necessitatibus, distinctio voluptatibus illo."
        ],
        [
            "title" => "Ahmad",
            "slug" => "kedua",
            "author" => "cape",
            "body" => "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quos praesentium exercitationem impedit. Nobis atque accusamus nam exercitationem, laboriosam quas? Similique culpa repellendus fugit odit a, quis debitis quasi. Nisi ipsum similique praesentium repudiandae optio tempore dicta, soluta quis hic deleniti obcaecati iste. Nostrum veniam, id ducimus deserunt impedit quia vero illum non ullam. Earum architecto dolor consequatur fugiat non, tempora labore at accusamus quibusdam fuga atque autem sint sunt et quia ex quod similique illo reprehenderit praesentium officia vero mollitia totam repellat. Rem error temporibus sint quaerat tempora sapiente id accusamus, ipsam neque eius, praesentium quibusdam necessitatibus, distinctio voluptatibus illo."
        ]
    ];

    public static function all()
    {
        return collect(self::$blog_posts);
    }

    public static function find($slug)
    {
        $posts = static::all();

        return $posts->firstWhere('slug', $slug);
    }

}