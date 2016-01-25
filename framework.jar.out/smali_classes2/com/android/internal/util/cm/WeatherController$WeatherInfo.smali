.class public Lcom/android/internal/util/cm/WeatherController$WeatherInfo;
.super Ljava/lang/Object;
.source "WeatherController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/util/cm/WeatherController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WeatherInfo"
.end annotation


# instance fields
.field public city:Ljava/lang/String;

.field public condition:Ljava/lang/String;

.field public conditionCode:I

.field public conditionDrawable:Landroid/graphics/drawable/Drawable;

.field public humidity:Ljava/lang/String;

.field public temp:Ljava/lang/String;

.field public wind:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object v1, p0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->city:Ljava/lang/String;

    .line 32
    iput-object v1, p0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->wind:Ljava/lang/String;

    .line 33
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->conditionCode:I

    .line 34
    iput-object v1, p0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->conditionDrawable:Landroid/graphics/drawable/Drawable;

    .line 35
    iput-object v1, p0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->temp:Ljava/lang/String;

    .line 36
    iput-object v1, p0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->humidity:Ljava/lang/String;

    .line 37
    iput-object v1, p0, Lcom/android/internal/util/cm/WeatherController$WeatherInfo;->condition:Ljava/lang/String;

    return-void
.end method
