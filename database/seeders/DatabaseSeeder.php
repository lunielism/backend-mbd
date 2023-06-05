<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Category;
use App\Models\Post;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        User::factory(3)->create();

        Category::create([
            'nama' => 'Machine Learning',
            'slug' => 'Machine-learning'
        ]);

        Category::create([
            'nama' => 'Programming',
            'slug' => 'programing'
        ]);

        Category::create([
            'nama' => 'Personal',
            'slug' => 'personal'
        ]);

        Post::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
        User::create([
            'name' => 'person 1',
            'username' => 'person11',
            'email' => 'a@example.com',
            'password' => bcrypt('12345')
        ]);

        // User::create([
        //     'name' => 'Kanza',
        //     'email' => 'kanza@example.com',
        //     'password' => bcrypt('12345')
        // ]);


        // Post::create([
        //     'title' => 'Judul pertama',
        //     'slug' => 'judul-pertama',
        //     'excerpt' => 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia',
        //     'body' => '<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia, id ab sapiente inventore blanditiis vel est voluptas numquam, voluptates natus aliquid nam officiis minus iure amet soluta laboriosam ipsum.</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia, id ab sapiente inventore blanditiis vel est voluptas numquam, voluptates natus aliquid nam officiis minus iure amet soluta laboriosam ipsum.</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia, id ab sapiente inventore blanditiis vel est voluptas numquam, voluptates natus aliquid nam officiis minus iure amet soluta laboriosam ipsum.</p>',
        //     'category_id' => 1,
        //     'user_id' => 1
        // ]);
        // Post::create([
        //     'title' => 'Judul kedua',
        //     'slug' => 'judul-kedua',
        //     'excerpt' => 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia',
        //     'body' => '<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia, id ab sapiente inventore blanditiis vel est voluptas numquam, voluptates natus aliquid nam officiis minus iure amet soluta laboriosam ipsum.</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia, id ab sapiente inventore blanditiis vel est voluptas numquam, voluptates natus aliquid nam officiis minus iure amet soluta laboriosam ipsum.</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia, id ab sapiente inventore blanditiis vel est voluptas numquam, voluptates natus aliquid nam officiis minus iure amet soluta laboriosam ipsum.</p>',
        //     'category_id' => 1,
        //     'user_id' => 1
        // ]);
        // Post::create([
        //     'title' => 'Judul ketiga',
        //     'slug' => 'judul-ketiga',
        //     'excerpt' => 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia',
        //     'body' => '<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia, id ab sapiente inventore blanditiis vel est voluptas numquam, voluptates natus aliquid nam officiis minus iure amet soluta laboriosam ipsum.</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia, id ab sapiente inventore blanditiis vel est voluptas numquam, voluptates natus aliquid nam officiis minus iure amet soluta laboriosam ipsum.</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia, id ab sapiente inventore blanditiis vel est voluptas numquam, voluptates natus aliquid nam officiis minus iure amet soluta laboriosam ipsum.</p>',
        //     'category_id' => 2,
        //     'user_id' => 1
        // ]);
        // Post::create([
        //     'title' => 'Judul keempat',
        //     'slug' => 'judul-keempat',
        //     'excerpt' => 'Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia',
        //     'body' => '<p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia, id ab sapiente inventore blanditiis vel est voluptas numquam, voluptates natus aliquid nam officiis minus iure amet soluta laboriosam ipsum.</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia, id ab sapiente inventore blanditiis vel est voluptas numquam, voluptates natus aliquid nam officiis minus iure amet soluta laboriosam ipsum.</p><p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Quibusdam officia, id ab sapiente inventore blanditiis vel est voluptas numquam, voluptates natus aliquid nam officiis minus iure amet soluta laboriosam ipsum.</p>',
        //     'category_id' => 3,
        //     'user_id' => 2
        // ]);

    }
}