@extends('dashboard.layouts.main')

@section('container')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <h1 class="mb-5">{{ $post->title }}</h1>

            <a href="/dashboard/posts" class="btn btn-success mb-3">Back</a>
            <a href="/dashboard/posts/{{ $post->slug }}/edit" class="btn btn-warning mb-3">Edit</a>
            <form action="/dashboard/posts/{{ $post->slug }}" method="post" class="d-inline">
                  @method('delete')
                  @csrf
                  <button class="btn btn-danger border-0 mb-3" onclick="return confirm('Are you sure?')">
                    delete
                  </button>
                </form>
            @if ($post->image)
            <div style="max-height: 350px; overflow:hidden;">
                <img class= "img-fluid" src="{{  asset('storage/' . $post->image) }}" alt="" >

            </div>
            @else
            <img class= "img-fluid" src="https://source.unsplash.com/1200x490/?{{ $post->category->nama }}" alt="{{ $post->category->nama }}" >
            @endif

            <article class="my-3 fs-5">
            {!! $post->body !!}   
            </article>

            <a href="/blog">back</a>
        </div>
    </div>
</div>
@endsection