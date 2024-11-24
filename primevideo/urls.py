from django.urls import path
from . import views

urlpatterns = [
    # URLS HOME + AUTH
    path('', views.home, name='home'), # HOME
    path('signup/', views.signup, name='signup'), # REGISTRO
    path('signin/', views.signin, name='signin'), # LOGIN
    path('signout/', views.signout, name='signout'), # LOG OUT
    # ADMIN URLS 
    path('manage_users/', views.manage_users, name='manage_users'), # MANAGE USERS
    path('users/create/', views.create_user, name='create_user'), # CREATE USER
    path('users/<int:user_id>/update/', views.update_user, name='update_user'), # UPDATE USER
    path('users/<int:user_id>/delete/', views.delete_user, name='delete_user'), # DELETE USER
    path('users/<int:user_id>/change_password_admin/', views.change_password_admin, name='change_password_admin'), # CHANGE PASSWORD
    # USER URLS
    path('change_password_user/', views.change_password_user, name='change_password_user'), # CHANGE PASSWORD
    path('update_profile/', views.update_profile, name='update_profile'), # UPDATE PROFILE
    # URLS GENRE 
    path('genre/<int:genre_id>/', views.genre_detail, name='genre_detail'),  # GENRE DETAIL
    # URLS MOVIES 
    path('movies/', views.movie_list, name='movie_list'), # MOVIE LIST
    path('movies/create/', views.create_movie, name='create_movie'), # CREATE MOVIE
    path('movies/<int:movie_id>/', views.movie_detail, name='movie_detail'), # DELETE MOVIE
    path('movies/<int:movie_id>/update/', views.update_movie, name='update_movie'), # UPDATE MOVIE
    path('movies/<int:movie_id>/delete/', views.delete_movie, name='delete_movie'), # DELETE MOVIE
    path('movies/<int:movie_id>/watched/', views.mark_as_watched_movie, name='mark_as_watched_movie'), # MOVIE WATCHED
    path('movies/<int:movie_id>/favorite/', views.mark_as_favorite_movie, name='mark_as_favorite_movie'), # MOVIE FAVORITE
    # URLS SERIES
    path('series/', views.series_list, name='series_list'), # SERIES LIST
    path('series/create/', views.create_series, name='create_series'), # CREATE SERIES
    path('series/<int:series_id>/', views.series_detail, name='series_detail'), # SERIES DETAIL
    path('series/<int:series_id>/update/', views.update_series, name='update_series'), # UPDATE SERIES
    path('series/<int:series_id>/delete/', views.delete_series, name='delete_series'), # DELETE SERIES
    path('series/<int:series_id>/watched/', views.mark_as_watched_series, name='mark_as_watched_series'), # SERIES WATCHED
    path('series/<int:series_id>/favorite/', views.mark_as_favorite_series, name='mark_as_favorite_series'), # SERIES FAVORITE
    # URLS FAVORITES + WATCHED
    path('favorites/', views.favorites, name='favorites'), # FAVORITES
    path('watched/', views.watched, name='watched'), # WATCHED
    # URLS SEARCH
    path('search/', views.search, name='search'),  # BROWSER SEARCH
    # URLS SETTINGS
    path('settings/', views.settings_view, name='settings'),
    # URLS GRAPHICS
    path('user_content_graph/', views.user_content_graph, name='user_content_graph'),  # USER GRAPHICS
    path('admin_content_graph/', views.admin_content_graph, name='admin_content_graph'),  # ADMIN GRAPHICS
]