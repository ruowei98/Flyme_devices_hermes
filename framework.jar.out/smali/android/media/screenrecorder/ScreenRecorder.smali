.class public Landroid/media/screenrecorder/ScreenRecorder;
.super Ljava/lang/Object;
.source "ScreenRecorder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;
    }
.end annotation


# static fields
.field public static final STATE_IDLE:I = 0x1

.field public static final STATE_RECORDING:I = 0x2

.field public static final STATE_UNINITIALIZED:I = 0x0

.field private static final TAG:Ljava/lang/String; = "ScreenRecorder"

.field private static sCallbacks:Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;

.field private static sScreenRecorder:Landroid/media/screenrecorder/ScreenRecorder;

.field private static sState:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-string/jumbo v0, "screenrecorder"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 34
    const/4 v0, 0x0

    sput-object v0, Landroid/media/screenrecorder/ScreenRecorder;->sScreenRecorder:Landroid/media/screenrecorder/ScreenRecorder;

    .line 42
    const/4 v0, 0x0

    sput v0, Landroid/media/screenrecorder/ScreenRecorder;->sState:I

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    return-void
.end method

.method public static getInstance()Landroid/media/screenrecorder/ScreenRecorder;
    .locals 1

    .prologue
    .line 52
    sget-object v0, Landroid/media/screenrecorder/ScreenRecorder;->sScreenRecorder:Landroid/media/screenrecorder/ScreenRecorder;

    if-nez v0, :cond_0

    .line 53
    new-instance v0, Landroid/media/screenrecorder/ScreenRecorder;

    invoke-direct {v0}, Landroid/media/screenrecorder/ScreenRecorder;-><init>()V

    sput-object v0, Landroid/media/screenrecorder/ScreenRecorder;->sScreenRecorder:Landroid/media/screenrecorder/ScreenRecorder;

    .line 55
    :cond_0
    sget-object v0, Landroid/media/screenrecorder/ScreenRecorder;->sScreenRecorder:Landroid/media/screenrecorder/ScreenRecorder;

    return-object v0
.end method

.method private static native native_init(IIIIIZ)V
.end method

.method private static native native_start(Ljava/lang/String;)Z
.end method

.method private static native native_stop()V
.end method

.method private onError(ILjava/lang/String;)V
    .locals 1
    .param p1, "error"    # I
    .param p2, "message"    # Ljava/lang/String;

    .prologue
    .line 140
    sget-object v0, Landroid/media/screenrecorder/ScreenRecorder;->sCallbacks:Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;

    if-eqz v0, :cond_0

    sget-object v0, Landroid/media/screenrecorder/ScreenRecorder;->sCallbacks:Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;

    invoke-interface {v0, p2}, Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;->onRecordingError(Ljava/lang/String;)V

    .line 141
    :cond_0
    return-void
.end method

.method private onRecordingFinished()V
    .locals 1

    .prologue
    .line 136
    sget-object v0, Landroid/media/screenrecorder/ScreenRecorder;->sCallbacks:Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;

    if-eqz v0, :cond_0

    sget-object v0, Landroid/media/screenrecorder/ScreenRecorder;->sCallbacks:Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;

    invoke-interface {v0}, Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;->onRecordingFinished()V

    .line 137
    :cond_0
    return-void
.end method

.method private onRecordingStarted()V
    .locals 1

    .prologue
    .line 132
    sget-object v0, Landroid/media/screenrecorder/ScreenRecorder;->sCallbacks:Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;

    if-eqz v0, :cond_0

    sget-object v0, Landroid/media/screenrecorder/ScreenRecorder;->sCallbacks:Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;

    invoke-interface {v0}, Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;->onRecordingStarted()V

    .line 133
    :cond_0
    return-void
.end method


# virtual methods
.method public getState()I
    .locals 1

    .prologue
    .line 119
    sget v0, Landroid/media/screenrecorder/ScreenRecorder;->sState:I

    return v0
.end method

.method public init(IIIIIZ)V
    .locals 3
    .param p1, "rotation"    # I
    .param p2, "width"    # I
    .param p3, "height"    # I
    .param p4, "bitRate"    # I
    .param p5, "timeLimitSec"    # I
    .param p6, "recordAudio"    # Z

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 72
    sget v0, Landroid/media/screenrecorder/ScreenRecorder;->sState:I

    if-ne v0, v2, :cond_0

    .line 73
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ScreenRecorder is currently recording."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_0
    if-eqz p1, :cond_1

    if-eq p1, v1, :cond_1

    if-eq p1, v2, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    .line 77
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid rotation: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_1
    if-gtz p2, :cond_2

    .line 80
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid width: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 82
    :cond_2
    if-gtz p3, :cond_3

    .line 83
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid height: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 85
    :cond_3
    invoke-static/range {p1 .. p6}, Landroid/media/screenrecorder/ScreenRecorder;->native_init(IIIIIZ)V

    .line 86
    sput v1, Landroid/media/screenrecorder/ScreenRecorder;->sState:I

    .line 87
    return-void
.end method

.method public setScreenRecorderCallbacks(Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;)V
    .locals 0
    .param p1, "callbacks"    # Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;

    .prologue
    .line 127
    sput-object p1, Landroid/media/screenrecorder/ScreenRecorder;->sCallbacks:Landroid/media/screenrecorder/ScreenRecorder$ScreenRecorderCallbacks;

    .line 128
    return-void
.end method

.method public start(Ljava/lang/String;)Z
    .locals 3
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 95
    sget v1, Landroid/media/screenrecorder/ScreenRecorder;->sState:I

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 96
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "ScreenRecorder is not idle."

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 98
    :cond_0
    invoke-static {p1}, Landroid/media/screenrecorder/ScreenRecorder;->native_start(Ljava/lang/String;)Z

    move-result v0

    .line 99
    .local v0, "result":Z
    if-eqz v0, :cond_1

    const/4 v1, 0x2

    sput v1, Landroid/media/screenrecorder/ScreenRecorder;->sState:I

    .line 100
    :cond_1
    return v0
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 107
    sget v0, Landroid/media/screenrecorder/ScreenRecorder;->sState:I

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 108
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "ScreenRecorder is not recording."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 110
    :cond_0
    invoke-static {}, Landroid/media/screenrecorder/ScreenRecorder;->native_stop()V

    .line 111
    const/4 v0, 0x1

    sput v0, Landroid/media/screenrecorder/ScreenRecorder;->sState:I

    .line 112
    return-void
.end method
