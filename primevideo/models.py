from django.db import models
from django.contrib.auth.models import User

class Genre(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class BaseContent(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField(blank=True)
    created = models.DateTimeField(auto_now_add=True)
    image = models.ImageField(upload_to='imagecontent/', blank=True, null=True)
    director = models.CharField(max_length=100, default='Unknown Director')
    genres = models.ManyToManyField(Genre, related_name='%(class)s_contents')

    class Meta:
        abstract = True

class Movie(BaseContent):
    duration = models.IntegerField(help_text="Duration in minutes")

    def __str__(self):
        return f"Movie: {self.title}"

class Series(BaseContent):
    seasons = models.IntegerField()
    episodes = models.IntegerField()
    duration = models.IntegerField(default=0)

    class Meta:
        verbose_name_plural = "TV Shows"

    def __str__(self):
        return f"Series: {self.title}"

class UserContentStatus(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    movie = models.ForeignKey(Movie, on_delete=models.CASCADE, null=True, blank=True)
    series = models.ForeignKey(Series, on_delete=models.CASCADE, null=True, blank=True)
    watched = models.BooleanField(default=False)
    favorite = models.BooleanField(default=False)

    def __str__(self):
        if self.movie:
            return f"{self.user.username} - {self.movie.title}"
        elif self.series:
            return f"{self.user.username} - {self.series.title}"
        return f"{self.user.username} - Unknown Content"