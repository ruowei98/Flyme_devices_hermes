.class final Lcom/android/internal/util/cm/WeatherControllerImpl$Receiver;
.super Landroid/content/BroadcastReceiver;
.source "WeatherControllerImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/util/cm/WeatherControllerImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Receiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/android/internal/util/cm/WeatherControllerImpl;


# direct methods
.method private constructor <init>(Lcom/android/internal/util/cm/WeatherControllerImpl;)V
    .locals 0

    .prologue
    .line 146
    iput-object p1, p0, Lcom/android/internal/util/cm/WeatherControllerImpl$Receiver;->this$0:Lcom/android/internal/util/cm/WeatherControllerImpl;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/internal/util/cm/WeatherControllerImpl;Lcom/android/internal/util/cm/WeatherControllerImpl$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/android/internal/util/cm/WeatherControllerImpl;
    .param p2, "x1"    # Lcom/android/internal/util/cm/WeatherControllerImpl$1;

    .prologue
    .line 146
    invoke-direct {p0, p1}, Lcom/android/internal/util/cm/WeatherControllerImpl$Receiver;-><init>(Lcom/android/internal/util/cm/WeatherControllerImpl;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 149
    # getter for: Lcom/android/internal/util/cm/WeatherControllerImpl;->DEBUG:Z
    invoke-static {}, Lcom/android/internal/util/cm/WeatherControllerImpl;->access$100()Z

    move-result v0

    if-eqz v0, :cond_0

    # getter for: Lcom/android/internal/util/cm/WeatherControllerImpl;->TAG:Ljava/lang/String;
    invoke-static {}, Lcom/android/internal/util/cm/WeatherControllerImpl;->access$200()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onReceive "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 150
    :cond_0
    const-string v0, "update_cancelled"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 151
    const-string v0, "update_cancelled"

    const/4 v1, 0x0

    invoke-virtual {p2, v0, v1}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 158
    :goto_0
    return-void

    .line 156
    :cond_1
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl$Receiver;->this$0:Lcom/android/internal/util/cm/WeatherControllerImpl;

    # invokes: Lcom/android/internal/util/cm/WeatherControllerImpl;->queryWeather()V
    invoke-static {v0}, Lcom/android/internal/util/cm/WeatherControllerImpl;->access$300(Lcom/android/internal/util/cm/WeatherControllerImpl;)V

    .line 157
    iget-object v0, p0, Lcom/android/internal/util/cm/WeatherControllerImpl$Receiver;->this$0:Lcom/android/internal/util/cm/WeatherControllerImpl;

    # invokes: Lcom/android/internal/util/cm/WeatherControllerImpl;->fireCallback()V
    invoke-static {v0}, Lcom/android/internal/util/cm/WeatherControllerImpl;->access$400(Lcom/android/internal/util/cm/WeatherControllerImpl;)V

    goto :goto_0
.end method
