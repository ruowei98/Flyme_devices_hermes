.class public Lcom/android/internal/util/cm/WeatherControllerImpl;
.super Ljava/lang/Object;
.source "WeatherControllerImpl.java"

# interfaces
.implements Lcom/android/internal/util/cm/WeatherController;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/util/cm/WeatherControllerImpl$1;,
        Lcom/android/internal/util/cm/WeatherControllerImpl$Receiver;
    }
.end annotation


# static fields
.field public static final ACTION_FORCE_WEATHER_UPDATE:Ljava/lang/String; = "com.cyanogenmod.lockclock.action.FORCE_WEATHER_UPDATE"

.field public static final ACTION_UPDATE_FINISHED:Ljava/lang/String; = "com.cyanogenmod.lockclock.action.WEATHER_UPDATE_FINISHED"

.field public static final COMPONENT_WEATHER_FORECAST:Landroid/content/ComponentName;

.field public static final CURRENT_WEATHER_URI:Landroid/net/Uri;

.field private static final DEBUG:Z

.field public static final EXTRA_UPDATE_CANCELLED:Ljava/lang/String; = "update_cancelled"

.field public static final LOCK_CLOCK_PACKAGE_NAME:Ljava/lang/String; = "com.cyanogenmod.lockclock"

.field private static final TAG:Ljava/lang/String;

.field private static final WEATHER_ICON_COLORED:I = 0x1

.field private static final WEATHER_ICON_MONOCHROME:I

.field public static final WEATHER_PROJECTION:[Ljava/lang/String;


# instance fields
.field private mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

.field private final mCallbacks:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/util/cm/WeatherController$Callback;",
            ">;"
        }
    .end annotation
.end field

.field private final mContext:Landroid/content/Context;

.field private final mReceiver:Lcom/android/internal/util/cm/WeatherControllerImpl$Receiver;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x3

    .line 36
    const-class v0, Lcom/android/internal/util/cm/WeatherController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->TAG:Ljava/lang/String;

    .line 37
    sget-object v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->TAG:Ljava/lang/String;

    invoke-static {v0, v3}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    move-result v0

    sput-boolean v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->DEBUG:Z

    .line 39
    new-instance v0, Landroid/content/ComponentName;

    const-string v1, "com.cyanogenmod.lockclock"

    const-string v2, "com.cyanogenmod.lockclock.weather.ForecastActivity"

    invoke-direct {v0, v1, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    sput-object v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->COMPONENT_WEATHER_FORECAST:Landroid/content/ComponentName;

    .line 46
    const-string v0, "content://com.cyanogenmod.lockclock.weather.provider/weather/current"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->CURRENT_WEATHER_URI:Landroid/net/Uri;

    .line 48
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "city"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "wind"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "condition_code"

    aput-object v2, v0, v1

    const-string v1, "temperature"

    aput-object v1, v0, v3

    const/4 v1, 0x4

    const-string v2, "humidity"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "condition"

    aput-object v2, v0, v1

    sput-object v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->WEATHER_PROJECTION:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 62
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCallbacks:Ljava/util/ArrayList;

    .line 63
    new-instance v1, Lcom/android/internal/util/cm/WeatherControllerImpl$Receiver;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/android/internal/util/cm/WeatherControllerImpl$Receiver;-><init>(Lcom/android/internal/util/cm/WeatherControllerImpl;Lcom/android/internal/util/cm/WeatherControllerImpl$1;)V

    iput-object v1, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mReceiver:Lcom/android/internal/util/cm/WeatherControllerImpl$Receiver;

    .line 66
    new-instance v1, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    invoke-direct {v1}, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;-><init>()V

    iput-object v1, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    .line 69
    iput-object p1, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mContext:Landroid/content/Context;

    .line 70
    iget-object v1, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mContext:Landroid/content/Context;

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 71
    invoke-direct {p0}, Lcom/android/internal/util/cm/WeatherControllerImpl;->queryWeather()V

    .line 72
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 73
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "com.cyanogenmod.lockclock.action.WEATHER_UPDATE_FINISHED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 74
    iget-object v1, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mReceiver:Lcom/android/internal/util/cm/WeatherControllerImpl$Receiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 75
    return-void
.end method

.method static synthetic access$100()Z
    .locals 1

    .prologue
    .line 34
    sget-boolean v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->DEBUG:Z

    return v0
.end method

.method static synthetic access$200()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    sget-object v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/android/internal/util/cm/WeatherControllerImpl;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/util/cm/WeatherControllerImpl;

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/android/internal/util/cm/WeatherControllerImpl;->queryWeather()V

    return-void
.end method

.method static synthetic access$400(Lcom/android/internal/util/cm/WeatherControllerImpl;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/util/cm/WeatherControllerImpl;

    .prologue
    .line 34
    invoke-direct {p0}, Lcom/android/internal/util/cm/WeatherControllerImpl;->fireCallback()V

    return-void
.end method

.method private fireCallback()V
    .locals 3

    .prologue
    .line 141
    iget-object v2, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/util/cm/WeatherController$Callback;

    .line 142
    .local v0, "callback":Lcom/android/internal/util/cm/WeatherController$Callback;
    iget-object v2, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    invoke-interface {v0, v2}, Lcom/android/internal/util/cm/WeatherController$Callback;->onWeatherChanged(Lcom/android/internal/util/cm/WeatherController$WeatherInfo;)V

    goto :goto_0

    .line 144
    .end local v0    # "callback":Lcom/android/internal/util/cm/WeatherController$Callback;
    :cond_0
    return-void
.end method

.method private getIcon(I)Landroid/graphics/drawable/Drawable;
    .locals 7
    .param p1, "conditionCode"    # I

    .prologue
    const/4 v6, 0x0

    .line 91
    iget-object v4, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "lock_screen_weather_condition_icon"

    invoke-static {v4, v5, v6}, Landroid/provider/Settings$System;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v2

    .line 95
    .local v2, "iconNameValue":I
    if-nez v2, :cond_0

    .line 96
    const-string v1, "weather_"

    .line 104
    .local v1, "iconName":Ljava/lang/String;
    :goto_0
    :try_start_0
    iget-object v4, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mContext:Landroid/content/Context;

    const-string v5, "com.cyanogenmod.lockclock"

    const/4 v6, 0x0

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->createPackageContext(Ljava/lang/String;I)Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    .line 106
    .local v3, "resources":Landroid/content/res/Resources;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "drawable"

    const-string v6, "com.cyanogenmod.lockclock"

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 109
    .end local v3    # "resources":Landroid/content/res/Resources;
    :goto_1
    return-object v4

    .line 97
    .end local v1    # "iconName":Ljava/lang/String;
    :cond_0
    const/4 v4, 0x1

    if-ne v2, v4, :cond_1

    .line 98
    const-string v1, "weather_color_"

    .restart local v1    # "iconName":Ljava/lang/String;
    goto :goto_0

    .line 100
    .end local v1    # "iconName":Ljava/lang/String;
    :cond_1
    const-string v1, "weather_vclouds_"

    .restart local v1    # "iconName":Ljava/lang/String;
    goto :goto_0

    .line 108
    :catch_0
    move-exception v0

    .line 109
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private queryWeather()V
    .locals 7

    .prologue
    const/4 v3, 0x0

    .line 119
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/android/internal/util/cm/WeatherControllerImpl;->CURRENT_WEATHER_URI:Landroid/net/Uri;

    sget-object v2, Lcom/android/internal/util/cm/WeatherControllerImpl;->WEATHER_PROJECTION:[Ljava/lang/String;

    move-object v4, v3

    move-object v5, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 121
    .local v6, "c":Landroid/database/Cursor;
    if-nez v6, :cond_1

    .line 122
    sget-boolean v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->DEBUG:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->TAG:Ljava/lang/String;

    const-string v1, "cursor was null for temperature, forcing weather update"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mContext:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string v2, "com.cyanogenmod.lockclock.action.FORCE_WEATHER_UPDATE"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 138
    :goto_0
    return-void

    .line 126
    :cond_1
    :try_start_0
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 127
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    const/4 v1, 0x0

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->city:Ljava/lang/String;

    .line 128
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    const/4 v1, 0x1

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->wind:Ljava/lang/String;

    .line 129
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    const/4 v1, 0x2

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    iput v1, v0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->conditionCode:I

    .line 130
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    iget-object v1, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    iget v1, v1, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->conditionCode:I

    invoke-direct {p0, v1}, Lcom/android/internal/util/cm/WeatherControllerImpl;->getIcon(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->conditionDrawable:Landroid/graphics/drawable/Drawable;

    .line 131
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    const/4 v1, 0x3

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->temp:Ljava/lang/String;

    .line 132
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    const/4 v1, 0x4

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->humidity:Ljava/lang/String;

    .line 133
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    const/4 v1, 0x5

    invoke-interface {v6, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->condition:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 135
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    throw v0
.end method


# virtual methods
.method public addCallback(Lcom/android/internal/util/cm/WeatherController$Callback;)V
    .locals 3
    .param p1, "callback"    # Lcom/android/internal/util/cm/WeatherController$Callback;

    .prologue
    .line 78
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 82
    :cond_0
    :goto_0
    return-void

    .line 79
    :cond_1
    sget-boolean v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->DEBUG:Z

    if-eqz v0, :cond_2

    sget-object v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addCallback "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    :cond_2
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 81
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    invoke-interface {p1, v0}, Lcom/android/internal/util/cm/WeatherController$Callback;->onWeatherChanged(Lcom/android/internal/util/cm/WeatherController$WeatherInfo;)V

    goto :goto_0
.end method

.method public getWeatherInfo()Lcom/android/internal/util/cm/WeatherController$WeatherInfo;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCachedInfo:Lcom/android/internal/util/cm/WeatherController$WeatherInfo;

    return-object v0
.end method

.method public removeCallback(Lcom/android/internal/util/cm/WeatherController$Callback;)V
    .locals 3
    .param p1, "callback"    # Lcom/android/internal/util/cm/WeatherController$Callback;

    .prologue
    .line 85
    if-nez p1, :cond_0

    .line 88
    :goto_0
    return-void

    .line 86
    :cond_0
    sget-boolean v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->DEBUG:Z

    if-eqz v0, :cond_1

    sget-object v0, Lcom/android/internal/util/cm/WeatherControllerImpl;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "removeCallback "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 87
    :cond_1
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl;->mCallbacks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public updateWeather()V
    .locals 0

    .prologue
    .line 163
    invoke-direct {p0}, Lcom/android/internal/util/cm/WeatherControllerImpl;->queryWeather()V

    .line 164
    invoke-direct {p0}, Lcom/android/internal/util/cm/WeatherControllerImpl;->fireCallback()V

    .line 165
    return-void
.end method
