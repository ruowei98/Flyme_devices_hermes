.class public Lcom/mediatek/internal/telephony/dataconnection/FdManager;
.super Landroid/os/Handler;
.source "FdManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;,
        Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;
    }
.end annotation


# static fields
.field private static final BASE:I = 0x0

.field protected static final DBG:Z = true

.field private static final EVENT_FD_MODE_SET:I = 0x0

.field protected static final LOG_TAG:Ljava/lang/String; = "FdManager"

.field protected static final PROPERTY_3G_SWITCH:Ljava/lang/String; = "gsm.3gswitch"

.field protected static final PROPERTY_FD_ON_CHARGE:Ljava/lang/String; = "fd.on.charge"

.field protected static final PROPERTY_FD_SCREEN_OFF_ONLY:Ljava/lang/String; = "fd.screen.off.only"

.field protected static final PROPERTY_MTK_FD_SUPPORT:Ljava/lang/String; = "ro.mtk_fd_support"

.field protected static final PROPERTY_RIL_FD_MODE:Ljava/lang/String; = "ril.fd.mode"

.field private static final STR_PROPERTY_FD_SCREEN_OFF_R8_TIMER:Ljava/lang/String; = "persist.radio.fd.off.r8.counter"

.field private static final STR_PROPERTY_FD_SCREEN_OFF_TIMER:Ljava/lang/String; = "persist.radio.fd.off.counter"

.field private static final STR_PROPERTY_FD_SCREEN_ON_R8_TIMER:Ljava/lang/String; = "persist.radio.fd.r8.counter"

.field private static final STR_PROPERTY_FD_SCREEN_ON_TIMER:Ljava/lang/String; = "persist.radio.fd.counter"

.field private static numberOfSupportedTypes:I

.field private static final sFdManagers:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Lcom/mediatek/internal/telephony/dataconnection/FdManager;",
            ">;"
        }
    .end annotation
.end field

.field private static timerValue:[Ljava/lang/String;


# instance fields
.field private mChargingMode:Z

.field private mEnableFdOnCharging:I

.field protected mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mIsScreenOn:Z

.field private mIsTetheredMode:Z

.field private mPhone:Lcom/android/internal/telephony/PhoneBase;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 103
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    sput-object v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->sFdManagers:Landroid/util/SparseArray;

    .line 111
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "50"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "150"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "50"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "150"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Lcom/android/internal/telephony/PhoneBase;)V
    .locals 5
    .param p1, "p"    # Lcom/android/internal/telephony/PhoneBase;

    .prologue
    const/4 v1, 0x0

    .line 252
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 106
    iput-boolean v1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z

    .line 107
    iput-boolean v1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsTetheredMode:Z

    .line 108
    iput v1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mEnableFdOnCharging:I

    .line 109
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsScreenOn:Z

    .line 114
    new-instance v1, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;

    invoke-direct {v1, p0}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;-><init>(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)V

    iput-object v1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 253
    iput-object p1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    .line 254
    const-string v1, "FastDormancyManager init"

    invoke-virtual {p0, v1}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 256
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 257
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 258
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 259
    const-string v1, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 260
    const-string v1, "android.net.conn.TETHER_STATE_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 261
    iget-object v1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 263
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->initFdTimer()V

    .line 265
    return-void
.end method

.method static synthetic access$002(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/dataconnection/FdManager;
    .param p1, "x1"    # Z

    .prologue
    .line 70
    iput-boolean p1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsScreenOn:Z

    return p1
.end method

.method static synthetic access$100(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Lcom/android/internal/telephony/PhoneBase;
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    .prologue
    .line 70
    iget-object v0, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    return-object v0
.end method

.method static synthetic access$200(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/dataconnection/FdManager;
    .param p1, "x1"    # Z

    .prologue
    .line 70
    invoke-direct {p0, p1}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->updateFdMdEnableStatus(Z)V

    return-void
.end method

.method static synthetic access$300(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->checkNeedTurnOn()Z

    move-result v0

    return v0
.end method

.method static synthetic access$400(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    .prologue
    .line 70
    iget-boolean v0, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z

    return v0
.end method

.method static synthetic access$402(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/dataconnection/FdManager;
    .param p1, "x1"    # Z

    .prologue
    .line 70
    iput-boolean p1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z

    return p1
.end method

.method static synthetic access$500(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)I
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    .prologue
    .line 70
    iget v0, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mEnableFdOnCharging:I

    return v0
.end method

.method static synthetic access$502(Lcom/mediatek/internal/telephony/dataconnection/FdManager;I)I
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/dataconnection/FdManager;
    .param p1, "x1"    # I

    .prologue
    .line 70
    iput p1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mEnableFdOnCharging:I

    return p1
.end method

.method static synthetic access$600(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    .prologue
    .line 70
    iget-boolean v0, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsTetheredMode:Z

    return v0
.end method

.method static synthetic access$602(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/dataconnection/FdManager;
    .param p1, "x1"    # Z

    .prologue
    .line 70
    iput-boolean p1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsTetheredMode:Z

    return p1
.end method

.method private checkNeedTurnOn()Z
    .locals 1

    .prologue
    .line 404
    invoke-static {}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->isFdScreenOffOnly()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsScreenOn:Z

    if-nez v0, :cond_2

    :cond_0
    iget-boolean v0, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z

    if-eqz v0, :cond_1

    iget v0, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mEnableFdOnCharging:I

    if-eqz v0, :cond_2

    :cond_1
    iget-boolean v0, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsTetheredMode:Z

    if-nez v0, :cond_2

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getFdTimerValue()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 350
    sget-object v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    return-object v0
.end method

.method public static getInstance(Lcom/android/internal/telephony/PhoneBase;)Lcom/mediatek/internal/telephony/dataconnection/FdManager;
    .locals 4
    .param p0, "phone"    # Lcom/android/internal/telephony/PhoneBase;

    .prologue
    const/4 v0, 0x0

    .line 229
    invoke-static {}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->isFdSupport()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 230
    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v1

    if-gez v1, :cond_1

    .line 231
    const-string v1, "FdManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "phoneId "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " is invalid!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 249
    :cond_0
    :goto_0
    return-object v0

    .line 234
    :cond_1
    sget-object v1, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->sFdManagers:Landroid/util/SparseArray;

    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    .line 235
    .local v0, "fdMgr":Lcom/mediatek/internal/telephony/dataconnection/FdManager;
    if-nez v0, :cond_0

    .line 237
    if-eqz p0, :cond_2

    .line 238
    const-string v1, "FdManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "FDManager for phoneId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " doesn\'t exist, create it"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 240
    new-instance v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    .end local v0    # "fdMgr":Lcom/mediatek/internal/telephony/dataconnection/FdManager;
    invoke-direct {v0, p0}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;-><init>(Lcom/android/internal/telephony/PhoneBase;)V

    .line 241
    .restart local v0    # "fdMgr":Lcom/mediatek/internal/telephony/dataconnection/FdManager;
    sget-object v1, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->sFdManagers:Landroid/util/SparseArray;

    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v2

    invoke-virtual {v1, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 243
    :cond_2
    const-string v1, "FdManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "FDManager for phoneId:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " can\'t get phone to init!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private initFdTimer()V
    .locals 12

    .prologue
    const/4 v11, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    const-wide/high16 v6, 0x4024000000000000L    # 10.0

    .line 276
    const/4 v1, 0x4

    new-array v0, v1, [Ljava/lang/String;

    .line 277
    .local v0, "timerStr":[Ljava/lang/String;
    const-string v1, "persist.radio.fd.off.counter"

    const-string v2, "5"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v8

    .line 278
    sget-object v1, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    sget-object v2, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ScreenOffLegacyFd:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v2}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v2

    aget-object v3, v0, v8

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    mul-double/2addr v4, v6

    double-to-int v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 280
    const-string v1, "persist.radio.fd.counter"

    const-string v2, "15"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v9

    .line 281
    sget-object v1, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    sget-object v2, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ScreenOnLegacyFd:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v2}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v2

    aget-object v3, v0, v9

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    mul-double/2addr v4, v6

    double-to-int v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 283
    const-string v1, "persist.radio.fd.off.r8.counter"

    const-string v2, "5"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v10

    .line 284
    sget-object v1, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    sget-object v2, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ScreenOffR8Fd:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v2}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v2

    aget-object v3, v0, v10

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    mul-double/2addr v4, v6

    double-to-int v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 286
    const-string v1, "persist.radio.fd.r8.counter"

    const-string v2, "15"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v11

    .line 287
    sget-object v1, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    sget-object v2, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ScreenOnR8Fd:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v2}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v2

    aget-object v3, v0, v11

    invoke-static {v3}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v4

    mul-double/2addr v4, v6

    double-to-int v3, v4

    invoke-static {v3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    .line 289
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Default FD timers="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    aget-object v2, v2, v8

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    aget-object v2, v2, v9

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    aget-object v2, v2, v10

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    aget-object v2, v2, v11

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 292
    return-void
.end method

.method public static isFdScreenOffOnly()Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 410
    const-string v2, "fd.screen.off.only"

    invoke-static {v2, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    if-ne v2, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method public static isFdSupport()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 414
    const-string v1, "ro.mtk_fd_support"

    invoke-static {v1, v0}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private updateFdMdEnableStatus(Z)V
    .locals 7
    .param p1, "enabled"    # Z

    .prologue
    const/4 v6, 0x1

    const/4 v4, 0x0

    const/4 v5, -0x1

    .line 370
    const-string v2, "ril.fd.mode"

    const-string v3, "0"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 371
    .local v0, "fdMdEnableMode":I
    const-string v2, "gsm.3gswitch"

    invoke-static {v2, v6}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v2

    add-int/lit8 v1, v2, -0x1

    .line 372
    .local v1, "fdSimId":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateFdMdEnableStatus(): enabled="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ",fdMdEnableMode="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", 3gSimID="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 374
    if-ne v0, v6, :cond_0

    iget-object v2, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v2

    if-ne v2, v1, :cond_0

    .line 375
    if-eqz p1, :cond_1

    .line 376
    iget-object v2, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v2, v2, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    sget-object v3, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->ENABLE_MD_FD:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;

    invoke-virtual {v3}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->ordinal()I

    move-result v3

    invoke-virtual {p0, v4}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->obtainMessage(I)Landroid/os/Message;

    move-result-object v4

    invoke-interface {v2, v3, v5, v5, v4}, Lcom/android/internal/telephony/CommandsInterface;->setFDMode(IIILandroid/os/Message;)V

    .line 383
    :cond_0
    :goto_0
    return-void

    .line 379
    :cond_1
    iget-object v2, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v2, v2, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    sget-object v3, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->DISABLE_MD_FD:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;

    invoke-virtual {v3}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->ordinal()I

    move-result v3

    invoke-virtual {p0, v4}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->obtainMessage(I)Landroid/os/Message;

    move-result-object v4

    invoke-interface {v2, v3, v5, v5, v4}, Lcom/android/internal/telephony/CommandsInterface;->setFDMode(IIILandroid/os/Message;)V

    goto :goto_0
.end method


# virtual methods
.method public disableFdWhenTethering()V
    .locals 3

    .prologue
    .line 387
    invoke-static {}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->isFdSupport()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 388
    iget-object v1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 389
    .local v0, "connMgr":Landroid/net/ConnectivityManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getTetheredIfaces()[Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 390
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getTetheredIfaces()[Ljava/lang/String;

    move-result-object v1

    array-length v1, v1

    if-lez v1, :cond_2

    const/4 v1, 0x1

    :goto_0
    iput-boolean v1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsTetheredMode:Z

    .line 393
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "mIsTetheredMode = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsTetheredMode:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "mChargingMode="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 394
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->checkNeedTurnOn()Z

    move-result v1

    invoke-direct {p0, v1}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->updateFdMdEnableStatus(Z)V

    .line 396
    .end local v0    # "connMgr":Landroid/net/ConnectivityManager;
    :cond_1
    return-void

    .line 390
    .restart local v0    # "connMgr":Landroid/net/ConnectivityManager;
    :cond_2
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public dispose()V
    .locals 2

    .prologue
    .line 268
    const-string v0, "FD.dispose"

    invoke-virtual {p0, v0}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 269
    invoke-static {}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->isFdSupport()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 270
    iget-object v0, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 271
    sget-object v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->sFdManagers:Landroid/util/SparseArray;

    iget-object v1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/util/SparseArray;->remove(I)V

    .line 273
    :cond_0
    return-void
.end method

.method public getNumberOfSupportedTypes()I
    .locals 1

    .prologue
    .line 295
    sget-object v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->SupportedTimerTypes:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v0}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v0

    return v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 356
    iget v1, p1, Landroid/os/Message;->what:I

    packed-switch v1, :pswitch_data_0

    .line 364
    const-string v1, "FdManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unidentified event msg="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 367
    :cond_0
    :goto_0
    return-void

    .line 358
    :pswitch_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 359
    .local v0, "ar":Landroid/os/AsyncResult;
    iget-object v1, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 360
    const-string v1, "SET_FD_MODE ERROR"

    invoke-virtual {p0, v1}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 356
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method protected logd(Ljava/lang/String;)V
    .locals 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 418
    const-string v0, "FdManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[GDCT][phoneId"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    return-void
.end method

.method public setFdTimerValue([Ljava/lang/String;Landroid/os/Message;)I
    .locals 11
    .param p1, "newTimerValue"    # [Ljava/lang/String;
    .param p2, "onComplete"    # Landroid/os/Message;

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 304
    const-string v3, "ril.fd.mode"

    const-string v4, "0"

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 305
    .local v0, "fdMdEnableMode":I
    const-string v3, "gsm.3gswitch"

    invoke-static {v3, v8}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v3

    add-int/lit8 v1, v3, -0x1

    .line 306
    .local v1, "fdSimId":I
    invoke-static {}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->isFdSupport()Z

    move-result v3

    if-eqz v3, :cond_1

    if-ne v0, v8, :cond_1

    iget-object v3, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v3}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v3

    if-ne v3, v1, :cond_1

    .line 308
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_0

    .line 309
    sget-object v3, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    aget-object v4, p1, v2

    aput-object v4, v3, v2

    .line 308
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 311
    :cond_0
    iget-object v3, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v3, v3, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    sget-object v4, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->SET_FD_INACTIVITY_TIMER:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;

    invoke-virtual {v4}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->ordinal()I

    move-result v4

    sget-object v5, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ScreenOffLegacyFd:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v5}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v5

    sget-object v6, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    sget-object v7, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ScreenOffLegacyFd:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v7}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v7

    aget-object v6, v6, v7

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v3, v4, v5, v6, v9}, Lcom/android/internal/telephony/CommandsInterface;->setFDMode(IIILandroid/os/Message;)V

    .line 314
    iget-object v3, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v3, v3, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    sget-object v4, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->SET_FD_INACTIVITY_TIMER:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;

    invoke-virtual {v4}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->ordinal()I

    move-result v4

    sget-object v5, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ScreenOnLegacyFd:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v5}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v5

    sget-object v6, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    sget-object v7, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ScreenOnLegacyFd:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v7}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v7

    aget-object v6, v6, v7

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v3, v4, v5, v6, v9}, Lcom/android/internal/telephony/CommandsInterface;->setFDMode(IIILandroid/os/Message;)V

    .line 317
    iget-object v3, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v3, v3, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    sget-object v4, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->SET_FD_INACTIVITY_TIMER:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;

    invoke-virtual {v4}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->ordinal()I

    move-result v4

    sget-object v5, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ScreenOffR8Fd:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v5}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v5

    sget-object v6, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    sget-object v7, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ScreenOffR8Fd:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v7}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v7

    aget-object v6, v6, v7

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v3, v4, v5, v6, v9}, Lcom/android/internal/telephony/CommandsInterface;->setFDMode(IIILandroid/os/Message;)V

    .line 320
    iget-object v3, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v3, v3, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    sget-object v4, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->SET_FD_INACTIVITY_TIMER:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;

    invoke-virtual {v4}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->ordinal()I

    move-result v4

    sget-object v5, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ScreenOnR8Fd:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v5}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v5

    sget-object v6, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    sget-object v7, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ScreenOnR8Fd:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;

    invoke-virtual {v7}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdTimerType;->ordinal()I

    move-result v7

    aget-object v6, v6, v7

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v3, v4, v5, v6, p2}, Lcom/android/internal/telephony/CommandsInterface;->setFDMode(IIILandroid/os/Message;)V

    .line 323
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Set Default FD timers="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    aget-object v4, v4, v10

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    aget-object v4, v4, v8

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    const/4 v5, 0x2

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ","

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->timerValue:[Ljava/lang/String;

    const/4 v5, 0x3

    aget-object v4, v4, v5

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 326
    .end local v2    # "i":I
    :cond_1
    return v10
.end method

.method public setFdTimerValue([Ljava/lang/String;Landroid/os/Message;Lcom/android/internal/telephony/PhoneBase;)I
    .locals 2
    .param p1, "newTimerValue"    # [Ljava/lang/String;
    .param p2, "onComplete"    # Landroid/os/Message;
    .param p3, "phone"    # Lcom/android/internal/telephony/PhoneBase;

    .prologue
    .line 336
    invoke-static {p3}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->getInstance(Lcom/android/internal/telephony/PhoneBase;)Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    move-result-object v0

    .line 337
    .local v0, "fdMgr":Lcom/mediatek/internal/telephony/dataconnection/FdManager;
    if-eqz v0, :cond_0

    .line 338
    invoke-virtual {v0, p1, p2}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->setFdTimerValue([Ljava/lang/String;Landroid/os/Message;)I

    .line 342
    :goto_0
    const/4 v1, 0x0

    return v1

    .line 340
    :cond_0
    const-string v1, "setFDTimerValue fail!"

    invoke-virtual {p0, v1}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    goto :goto_0
.end method
