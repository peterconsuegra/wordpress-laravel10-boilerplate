{{-- resources/views/admin/posts.blade.php --}}
@extends('layout')

@section('header')
    {{-- Optional page-specific header --}}
@endsection

@section('content')
    <div class="container-fluid">
        <div class="card shadow-sm border-0">
            <div class="card-header bg-white">
                <h5 class="mb-0">
                    WordPress Posts
                    <span class="badge text-bg-light">{{ count($posts) }}</span>
                </h5>
            </div>

            <div class="card-body p-0">
                @if(count($posts))
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th scope="col" class="text-nowrap">ID</th>
                                    <th scope="col">Title</th>
                                    <th scope="col" class="text-nowrap">Published</th>
                                    <th scope="col">Excerpt</th>
                                    <th scope="col">Link</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach($posts as $post)
                                    <tr>
                                        <td>{{ $post['id'] }}</td>
                                        <td>{{ $post['title'] }}</td>
                                        <td>{{ \Carbon\Carbon::parse($post['date'])->format('Y-m-d H:i') }}</td>
                                        <td>{{ \Illuminate\Support\Str::limit(strip_tags($post['excerpt']), 80) }}</td>
                                        <td>
                                            <a href="{{ $post['link'] }}" target="_blank" rel="noopener">
                                                View
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                @else
                    <div class="alert alert-info m-3">
                        <i class="bi bi-info-circle me-2"></i>No posts found.
                    </div>
                @endif
            </div>
        </div>
    </div>
@endsection
