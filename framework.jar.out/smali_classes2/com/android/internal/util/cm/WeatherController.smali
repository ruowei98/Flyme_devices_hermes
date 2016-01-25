.class public interface abstract Lcom/android/internal/util/cm/WeatherController;
.super Ljava/lang/Object;
.source "WeatherController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/util/cm/WeatherController$WeatherInfo;,
        Lcom/android/internal/util/cm/WeatherController$Callback;
    }
.end annotation


# virtual methods
.method public abstract addCallback(Lcom/android/internal/util/cm/WeatherController$Callback;)V
.end method

.method public abstract getWeatherInfo()Lcom/android/internal/util/cm/WeatherController$WeatherInfo;
.end method

.method public abstract removeCallback(Lcom/android/internal/util/cm/WeatherController$Callback;)V
.end method

.method public abstract updateWeather()V
.end method
