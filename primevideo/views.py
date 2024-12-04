from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required, user_passes_test
from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, SetPasswordForm, PasswordChangeForm
from django.contrib.auth.models import User
from django.db import IntegrityError
from django.db.models import Q
from .models import Movie, Series, UserContentStatus, Genre
from .forms import MovieForm, SeriesForm, UserProfileForm, UserUpdateForm
from django.contrib import messages
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import io
import base64

# _____Funciones Home y Registro_____

# Función de Home pagina inicio
def home(request):
    genres = Genre.objects.all()
    return render(request, 'home.html', {'genres': genres})

# Función de Registro pagina registro formulario
def signup(request):
    if request.method == 'GET':
        return render(request, 'auth/signup.html', {'form': UserCreationForm()})
    else:
        if request.POST['password1'] == request.POST['password2']:
            try:
                user = User.objects.create_user(
                    request.POST['username'],
                    password=request.POST['password1']
                )
                user.save()
                login(request, user)
                return redirect('movie_list')
            except IntegrityError:
                return render(request, 'auth/signup.html', {
                    'form': UserCreationForm(),
                    'error': 'Username already exists'
                })
        else:
            return render(request, 'auth/signup.html', {
                'form': UserCreationForm(),
                'error': 'Passwords did not match'
            })

# Función de Logearse pagina inicio sesion
def signin(request):
    if request.method == 'GET':
        return render(request, 'auth/signin.html', {'form': AuthenticationForm()})
    else:
        user = authenticate(request, username=request.POST['username'], password=request.POST['password'])
        if user is None:
            return render(request, 'auth/signin.html', {
                'form': AuthenticationForm(),
                'error': 'Username and password did not match'
            })
        else:
            login(request, user)
            return redirect('movie_list')

# Función de cerrar sesión
@login_required
def signout(request):
    logout(request)
    return redirect('home')

# _____Funciones Admin_____

@login_required
@user_passes_test(lambda u: u.is_staff) # usar solo por admin
def manage_users(request):
    users = User.objects.all()
    return render(request, 'manage_admin/manage_users.html', {'users': users})

# Función de crear usuario
@login_required
@user_passes_test(lambda u: u.is_staff) # usar solo por admin
def create_user(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('manage_users')
    else:
        form = UserCreationForm()
    return render(request, 'manage_user/create_user.html', {'form': form})

# Función de actualizar usuario
@login_required
@user_passes_test(lambda u: u.is_staff)  # Solo los administradores pueden acceder
def update_user(request, user_id):
    user = get_object_or_404(User, id=user_id)
    if request.method == 'POST':
        form = UserUpdateForm(request.POST, instance=user)
        if form.is_valid():
            form.save()
            messages.success(request, 'User updated successfully!')
            return redirect('manage_users')  # Cambia 'manage_users' por la URL adecuada
        else:
            messages.error(request, 'Error updating user. Please correct the errors below.')
    else:
        form = UserUpdateForm(instance=user)
    return render(request, 'manage_admin/update_user.html', {'form': form, 'user': user})

# Función de eliminar usuario
@login_required
@user_passes_test(lambda u: u.is_staff) # usar solo por admin
def delete_user(request, user_id):
    user = get_object_or_404(User, pk=user_id)
    if request.method == 'POST':
        user.delete()
        return redirect('manage_users')
    return render(request, 'manage_admin/delete_user.html', {'user': user})

# Función de cambiar contraseña de administrador
@login_required
@user_passes_test(lambda u: u.is_staff) # usar solo por admin
def change_password_admin(request, user_id):
    user = get_object_or_404(User, pk=user_id)
    if request.method == 'POST':
        form = SetPasswordForm(user, request.POST)
        if form.is_valid():
            form.save()
            return redirect('manage_users')
    else:
        form = SetPasswordForm(user)
    return render(request, 'manage_admin/change_password_admin.html', {'form': form, 'user': user})

# __Usuarios o clientes__

# Función de cambiar contraseña de usuario
@login_required
def change_password_user(request):
    if request.method == 'POST':
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            form.save()
            return redirect('settings')
    else:
        form = PasswordChangeForm(request.user)
    return render(request, 'manage_user/change_password_user.html', {'form': form})

# Función de actualizar perfil, usar cliente
@login_required
def update_profile(request):
    if request.method == 'POST':
        form = UserUpdateForm(request.POST, instance=request.user)
        if form.is_valid():
            form.save()
            messages.success(request, 'Profile updated successfully!')
            return redirect('profile')  # Cambia 'profile' por la URL adecuada
        else:
            messages.error(request, 'Error updating profile. Please correct the errors below.')
    else:
        form = UserUpdateForm(instance=request.user)
    return render(request, 'manage_user/update_profile.html', {'form': form})

# _____Funciones Genre_____

# Función de agregar géneros al contexto
@login_required
def add_genres_to_context(request):
    genres = Genre.objects.all()
    return {'genres': genres}

# Función de detalle de género
@login_required
def genre_detail(request, genre_id):
    genre = get_object_or_404(Genre, id=genre_id)
    movies = Movie.objects.filter(genres=genre)
    series = Series.objects.filter(genres=genre)
    genres = Genre.objects.all()
    watched_movies = UserContentStatus.objects.filter(user=request.user, watched=True, movie__isnull=False).values_list('movie_id', flat=True)
    favorite_movies = UserContentStatus.objects.filter(user=request.user, favorite=True, movie__isnull=False).values_list('movie_id', flat=True)
    watched_series = UserContentStatus.objects.filter(user=request.user, watched=True, series__isnull=False).values_list('series_id', flat=True)
    favorite_series = UserContentStatus.objects.filter(user=request.user, favorite=True, series__isnull=False).values_list('series_id', flat=True)
    return render(request, 'genres/genre_detail.html', {
        'genre': genre,
        'movies': movies,
        'series': series,
        'genres': genres,
        'watched_movies': watched_movies,
        'favorite_movies': favorite_movies,
        'watched_series': watched_series,
        'favorite_series': favorite_series,
    })
 
# _____Función crear contenido_____
def create_content(request, form_class, template_name, success_url, content_type):
    if request.method == 'POST':
        form = form_class(request.POST, request.FILES)
        if form.is_valid():
            try:
                content = form.save(commit=False)
                content.save()
                # TODO: Save images.
                messages.success(request, f'{content_type} created successfully!')
                return redirect(success_url)
            except Exception as e:
                messages.error(request, f'Error creating {content_type}: {e}')
        else:
            messages.error(request, f'Error creating {content_type}. Please correct the errors below.')
    else:
        form = form_class()
    return render(request, template_name, {'form': form, 'content_type': content_type})
# _____Funciones Movie_____

# Función de lista de movies
@login_required
def movie_list(request):
    movies = Movie.objects.all()
    watched_movies = UserContentStatus.objects.filter(user=request.user, watched=True, movie__isnull=False).values_list('movie_id', flat=True)
    favorite_movies = UserContentStatus.objects.filter(user=request.user, favorite=True, movie__isnull=False).values_list('movie_id', flat=True)
    genres = Genre.objects.all()
    return render(request, 'movies/movie_list.html', {
        'movies': movies,
        'watched_movies': watched_movies,
        'favorite_movies': favorite_movies,
        'genres': genres
    })

# Función de crear movie
@login_required
def create_movie(request):
    return create_content(
        request,
        form_class=MovieForm,
        template_name='manage_admin/create_content.html',
        success_url='movie_list',
        content_type='Movie'
    )

# Función de detalle de movie
@login_required
def movie_detail(request, movie_id):
    movie = get_object_or_404(Movie, pk=movie_id)
    user_status, created = UserContentStatus.objects.get_or_create(user=request.user, movie=movie)
    genres = Genre.objects.all()  # Obtener todos los géneros
    return render(request, 'movies/movie_detail.html', {
        'movie': movie,
        'watched': user_status.watched,
        'favorite': user_status.favorite,
        'genres': genres, 
    })

# Función de eliminar movie
@login_required
def delete_movie(request, movie_id):
    movie = get_object_or_404(Movie, pk=movie_id)
    if request.method == 'POST':
        movie.delete()
        messages.success(request, 'Movie deleted successfully!')
        return redirect('movie_list')
    return render(request, 'movies/delete_movie.html', {'movie': movie})

# Función de marcar movie como vista
@login_required
def mark_as_watched_movie(request, movie_id):
    movie = get_object_or_404(Movie, pk=movie_id)
    user_status, created = UserContentStatus.objects.get_or_create(user=request.user, movie=movie)
    if user_status.watched:
        user_status.watched = False
    else:
        user_status.watched = True
    user_status.save()
    messages.success(request, 'Movie marked as watched!')
    return redirect('movie_detail', movie_id=movie.id)

# Función de marcar movie como favorita
@login_required
def mark_as_favorite_movie(request, movie_id):
    movie = get_object_or_404(Movie, pk=movie_id)
    user_status, created = UserContentStatus.objects.get_or_create(user=request.user, movie=movie)
    if user_status.favorite:
        user_status.favorite = False
    else:
        user_status.favorite = True
    user_status.save()
    messages.success(request, 'Movie marked as favorite!')
    return redirect('movie_detail', movie_id=movie.id)

# _____Funciones Series_____

# Función de lista de series
@login_required
def series_list(request):
    series = Series.objects.all()
    watched_series = UserContentStatus.objects.filter(user=request.user, watched=True, series__isnull=False).values_list('series_id', flat=True)
    favorite_series = UserContentStatus.objects.filter(user=request.user, favorite=True, series__isnull=False).values_list('series_id', flat=True)
    genres = Genre.objects.all()
    return render(request, 'series/series_list.html', {
        'series': series,
        'watched_series': watched_series,
        'favorite_series': favorite_series,
        'genres': genres
    })

# Función de crear series
@login_required
def create_series(request):
    return create_content(
        request,
        form_class=SeriesForm,
        template_name='manage_admin/create_content.html',
        success_url='series_list',
        content_type='Tv Shows'
    )

# Función de detalle de series
@login_required
def series_detail(request, series_id):
    series = get_object_or_404(Series, pk=series_id)
    user_status, created = UserContentStatus.objects.get_or_create(user=request.user, series=series)
    genres = Genre.objects.all()  # Obtener todos los géneros
    return render(request, 'series/series_detail.html', {
        'series': series,
        'watched': user_status.watched,
        'favorite': user_status.favorite,
        'genres': genres,  
    })

# Función de eliminar series
@login_required
def delete_series(request, series_id):
    series = get_object_or_404(Series, pk=series_id)
    if request.method == 'POST':
        series.delete()
        messages.success(request, 'Series deleted successfully!')
        return redirect('series_list')
    return render(request, 'series/delete_series.html', {'series': series})

# Función de marcar series como vista
@login_required
def mark_as_watched_series(request, series_id):
    series = get_object_or_404(Series, pk=series_id)
    user_status, created = UserContentStatus.objects.get_or_create(user=request.user, series=series)
    if user_status.watched:
        user_status.watched = False
    else:
        user_status.watched = True
    user_status.save()
    messages.success(request, 'Series marked as watched!')
    return redirect('series_detail', series_id=series.id)

# Función de marcar series como favorita
@login_required
def mark_as_favorite_series(request, series_id):
    series = get_object_or_404(Series, pk=series_id)
    user_status, created = UserContentStatus.objects.get_or_create(user=request.user, series=series)
    if user_status.favorite:
        user_status.favorite = False
    else:
        user_status.favorite = True
    user_status.save()
    messages.success(request, 'Series marked as favorite!')
    return redirect('series_detail', series_id=series.id)

# _____Funciones Favoritos y Vistos_____
# Función de favoritos
@login_required
def favorites(request):
    favorite_movies = UserContentStatus.objects.filter(user=request.user, favorite=True, movie__isnull=False).select_related('movie')
    favorite_series = UserContentStatus.objects.filter(user=request.user, favorite=True, series__isnull=False).select_related('series')
    watched_movies = UserContentStatus.objects.filter(user=request.user, watched=True, movie__isnull=False).values_list('movie_id', flat=True)
    watched_series = UserContentStatus.objects.filter(user=request.user, watched=True, series__isnull=False).values_list('series_id', flat=True)
    genres = Genre.objects.all()
    return render(request, 'choice/favorites.html', {
        'favorite_movies': [status.movie for status in favorite_movies],
        'favorite_series': [status.series for status in favorite_series],
        'watched_movies': watched_movies,
        'watched_series': watched_series,
        'genres': genres
    })

# Función de visto
@login_required  
def watched(request):
    watched_movies = UserContentStatus.objects.filter(user=request.user, watched=True, movie__isnull=False).select_related('movie')
    watched_series = UserContentStatus.objects.filter(user=request.user, watched=True, series__isnull=False).select_related('series')
    favorite_movies = UserContentStatus.objects.filter(user=request.user, favorite=True, movie__isnull=False).values_list('movie_id', flat=True)
    favorite_series = UserContentStatus.objects.filter(user=request.user, favorite=True, series__isnull=False).values_list('series_id', flat=True)
    genres = Genre.objects.all()
    return render(request, 'choice/watched.html', {
        'watched_movies': [status.movie for status in watched_movies],
        'watched_series': [status.series for status in watched_series],
        'favorite_movies': favorite_movies,
        'favorite_series': favorite_series,
        'genres': genres
    })

# _____Funciones Buscador_____
# Función de buscador por 
@login_required
def search(request):
    watched_movies = UserContentStatus.objects.filter(user=request.user, watched=True, movie__isnull=False).select_related('movie')
    watched_series = UserContentStatus.objects.filter(user=request.user, watched=True, series__isnull=False).select_related('series')
    favorite_movies = UserContentStatus.objects.filter(user=request.user, favorite=True, movie__isnull=False).values_list('movie_id', flat=True)
    favorite_series = UserContentStatus.objects.filter(user=request.user, favorite=True, series__isnull=False).values_list('series_id', flat=True)
    query = request.GET.get('q')
    genres = Genre.objects.all()
    if query:
        movies = Movie.objects.filter(Q(title__icontains=query) | Q(genres__name__icontains=query)).distinct()
        series = Series.objects.filter(Q(title__icontains=query) | Q(genres__name__icontains=query)).distinct()
    else:
        movies = Movie.objects.all()
        series = Series.objects.all()
    return render(request, 'search_results.html', {
        'movies': movies,
        'series': series,
        'genres': genres,
        'watched_movies': [status.movie for status in watched_movies],
        'watched_series': [status.series for status in watched_series],
        'favorite_movies': favorite_movies,
        'favorite_series': favorite_series,
        'query': query
    })
    
# _____Funciones Settings_____

# Función de vista de ajustes 
def settings_view(request):
    genres = Genre.objects.all()
    return render(request, 'settings.html', {'genres': genres})

#_____Funciones Graficos Usuario & Administrador_____

# Función de grafico de contenido visto ....
def content_graph(user):
    watched_movies = UserContentStatus.objects.filter(user=user, watched=True, movie__isnull=False).select_related('movie')
    watched_series = UserContentStatus.objects.filter(user=user, watched=True, series__isnull=False).select_related('series')

    movie_durations = [status.movie.duration for status in watched_movies]
    series_durations = [status.series.seasons * status.series.episodes * status.series.duration for status in watched_series]

    total_durations = movie_durations + series_durations

    plt.figure(figsize=(10, 6))
    plt.hist(total_durations, bins=20, color='blue', edgecolor='black')
    plt.title('Duración de Contenido Visto')
    plt.xlabel('Duración (minutos)')
    plt.ylabel('Cantidad de Contenidos')

    buffer = io.BytesIO()
    plt.savefig(buffer, format='png')
    buffer.seek(0)
    image_png = buffer.getvalue()
    buffer.close()

    graphic = base64.b64encode(image_png)
    graphic = graphic.decode('utf-8')
    return graphic    
# Para cada usuario
@login_required
def user_content_graph(request):
    graphic = content_graph(request.user)
    genres = Genre.objects.all()
    return render(request, 'graphics/user_content_graph.html', {'graphic': graphic, 'genres': genres})

# Para los administradores
@login_required
@user_passes_test(lambda u: u.is_staff)
def admin_content_graph(request):
    users = User.objects.all()
    user_graphics = []

    for user in users:
        graphic = content_graph(user)
        user_graphics.append({'username': user.username, 'graphic': graphic})
        
    genres = Genre.objects.all()
    return render(request, 'graphics/admin_content_graph.html', {'user_graphics': user_graphics, 'genres': genres})
