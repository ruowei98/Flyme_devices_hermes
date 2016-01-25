.class public Lcom/android/internal/telephony/uicc/UiccController;
.super Landroid/os/Handler;
.source "UiccController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/uicc/UiccController$2;
    }
.end annotation


# static fields
.field private static final ACTION_RESET_MODEM:Ljava/lang/String; = "android.intent.action.sim.ACTION_RESET_MODEM"

.field public static final APP_FAM_3GPP:I = 0x1

.field public static final APP_FAM_3GPP2:I = 0x2

.field public static final APP_FAM_IMS:I = 0x3

.field public static final APP_FAM_UNKNOWN:I = -0x1

.field private static final COMMON_SLOT_PROPERTY:Ljava/lang/String; = "ro.mtk_sim_hot_swap_common_slot"

.field private static final DBG:Z = true

.field protected static final EVENT_APPLICATION_SESSION_CHANGED:I = 0xca

.field protected static final EVENT_COMMON_SLOT_NO_CHANGED:I = 0x74

.field protected static final EVENT_GET_ICC_APPLICATION_STATUS:I = 0xc9

.field private static final EVENT_GET_ICC_STATUS_DONE:I = 0x2

.field protected static final EVENT_GET_ICC_STATUS_DONE_FOR_SIM_MISSING:I = 0x6a

.field protected static final EVENT_GET_ICC_STATUS_DONE_FOR_SIM_RECOVERY:I = 0x6b

.field protected static final EVENT_HOTSWAP_GET_ICC_STATUS_DONE:I = 0x6f

.field private static final EVENT_ICC_STATUS_CHANGED:I = 0x1

.field protected static final EVENT_INVALID_SIM_DETECTED:I = 0x72

.field protected static final EVENT_QUERY_ICCID_DONE_FOR_HOT_SWAP:I = 0x6c

.field protected static final EVENT_QUERY_SIM_MISSING:I = 0x71

.field protected static final EVENT_QUERY_SIM_MISSING_STATUS:I = 0x68

.field protected static final EVENT_QUERY_SIM_STATUS_FOR_PLUG_IN:I = 0x70

.field protected static final EVENT_RADIO_AVAILABLE:I = 0x64

.field private static final EVENT_RADIO_UNAVAILABLE:I = 0x3

.field private static final EVENT_REFRESH:I = 0x4

.field private static final EVENT_REFRESH_OEM:I = 0x5

.field protected static final EVENT_REPOLL_SML_STATE:I = 0x73

.field protected static final EVENT_SIM_MISSING:I = 0x67

.field protected static final EVENT_SIM_PLUG_IN:I = 0x6e

.field protected static final EVENT_SIM_PLUG_OUT:I = 0x6d

.field protected static final EVENT_SIM_RECOVERY:I = 0x69

.field protected static final EVENT_TURN_ON_ISIM_APPLICATION_DONE:I = 0xc8

.field protected static final EVENT_VIRTUAL_SIM_OFF:I = 0x66

.field protected static final EVENT_VIRTUAL_SIM_ON:I = 0x65

.field private static final LOG_TAG:Ljava/lang/String; = "UiccController"

.field private static final MAX_PROACTIVE_COMMANDS_TO_LOG:I = 0x14

.field private static final PROPERTY_3G_SWITCH:Ljava/lang/String; = "gsm.3gswitch"

.field private static final SML_FEATURE_NEED_BROADCAST_INTENT:I = 0x1

.field private static final SML_FEATURE_NO_NEED_BROADCAST_INTENT:I

.field private static mInstance:Lcom/android/internal/telephony/uicc/UiccController;

.field private static final mLock:Ljava/lang/Object;


# instance fields
.field private mApplicationChangedRegistrants:Landroid/os/RegistrantList;

.field private mBtSlotId:I

.field private mCardLogs:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mCis:[Lcom/android/internal/telephony/CommandsInterface;

.field private mClearMsisdn:Z

.field private mContext:Landroid/content/Context;

.field protected mIccChangedRegistrants:Landroid/os/RegistrantList;

.field private mImsSessionId:[I

.field private final mIntentReceiver:Landroid/content/BroadcastReceiver;

.field private mIsHotSwap:Z

.field private mOEMHookSimRefresh:Z

.field private mRecoveryRegistrants:Landroid/os/RegistrantList;

.field private mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 141
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)V
    .locals 7
    .param p1, "c"    # Landroid/content/Context;
    .param p2, "ci"    # [Lcom/android/internal/telephony/CommandsInterface;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 173
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 139
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->getPhoneCount()I

    move-result v3

    new-array v3, v3, [Lcom/android/internal/telephony/uicc/UiccCard;

    iput-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    .line 146
    new-instance v3, Landroid/os/RegistrantList;

    invoke-direct {v3}, Landroid/os/RegistrantList;-><init>()V

    iput-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    .line 148
    iput-boolean v5, p0, Lcom/android/internal/telephony/uicc/UiccController;->mOEMHookSimRefresh:Z

    .line 151
    iput-boolean v5, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIsHotSwap:Z

    .line 152
    iput-boolean v5, p0, Lcom/android/internal/telephony/uicc/UiccController;->mClearMsisdn:Z

    .line 154
    new-instance v3, Landroid/os/RegistrantList;

    invoke-direct {v3}, Landroid/os/RegistrantList;-><init>()V

    iput-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mRecoveryRegistrants:Landroid/os/RegistrantList;

    .line 156
    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telephony/TelephonyManager;->getPhoneCount()I

    move-result v3

    new-array v3, v3, [I

    iput-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mImsSessionId:[I

    .line 157
    new-instance v3, Landroid/os/RegistrantList;

    invoke-direct {v3}, Landroid/os/RegistrantList;-><init>()V

    iput-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mApplicationChangedRegistrants:Landroid/os/RegistrantList;

    .line 161
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    iput-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCardLogs:Ljava/util/LinkedList;

    .line 691
    new-instance v3, Lcom/android/internal/telephony/uicc/UiccController$1;

    invoke-direct {v3, p0}, Lcom/android/internal/telephony/uicc/UiccController$1;-><init>(Lcom/android/internal/telephony/uicc/UiccController;)V

    iput-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    .line 786
    const/4 v3, -0x1

    iput v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mBtSlotId:I

    .line 174
    const-string v3, "Creating UiccController"

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 175
    iput-object p1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    .line 176
    iput-object p2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    .line 177
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x11200a6

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v3

    iput-boolean v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mOEMHookSimRefresh:Z

    .line 179
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    array-length v3, v3

    if-ge v1, v3, :cond_3

    .line 180
    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v1}, Ljava/lang/Integer;-><init>(I)V

    .line 181
    .local v2, "index":Ljava/lang/Integer;
    const-string v3, "persist.radio.apm_sim_not_pwdn"

    invoke-static {v3, v5}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "gsm.version.ril-impl"

    invoke-static {v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    const-string v4, "mtk"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 186
    :cond_0
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    invoke-interface {v3, p0, v6, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 191
    :goto_1
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    invoke-interface {v3, p0, v6, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForIccStatusChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 193
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    const/4 v4, 0x3

    invoke-interface {v3, p0, v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForNotAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 195
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    const/16 v4, 0x65

    invoke-interface {v3, p0, v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForVirtualSimOn(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 196
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    const/16 v4, 0x66

    invoke-interface {v3, p0, v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForVirtualSimOff(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 197
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    const/16 v4, 0x67

    invoke-interface {v3, p0, v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForSimMissing(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 198
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    const/16 v4, 0x69

    invoke-interface {v3, p0, v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForSimRecovery(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 199
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    const/16 v4, 0x6d

    invoke-interface {v3, p0, v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForSimPlugOut(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 200
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    const/16 v4, 0x6e

    invoke-interface {v3, p0, v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForSimPlugIn(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 201
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    const/16 v4, 0x74

    invoke-interface {v3, p0, v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForCommonSlotNoChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 202
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    const/16 v4, 0xca

    invoke-interface {v3, p0, v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForSessionChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 204
    iget-boolean v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mOEMHookSimRefresh:Z

    if-eqz v3, :cond_2

    .line 205
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    const/4 v4, 0x5

    invoke-interface {v3, p0, v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForSimRefreshEvent(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 179
    :goto_2
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 188
    :cond_1
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    invoke-interface {v3, p0, v6, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForOn(Landroid/os/Handler;ILjava/lang/Object;)V

    goto :goto_1

    .line 207
    :cond_2
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v3, v3, v1

    const/4 v4, 0x4

    invoke-interface {v3, p0, v4, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForIccRefresh(Landroid/os/Handler;ILjava/lang/Object;)V

    goto :goto_2

    .line 211
    .end local v2    # "index":Ljava/lang/Integer;
    :cond_3
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 215
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v3, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 216
    const-string v3, "android.intent.action.sim.ACTION_RESET_MODEM"

    invoke-virtual {v0, v3}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 217
    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    iget-object v4, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v3, v4, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 218
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/telephony/uicc/UiccController;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/telephony/uicc/UiccController;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 93
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/telephony/uicc/UiccController;)[Lcom/android/internal/telephony/CommandsInterface;
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/uicc/UiccController;

    .prologue
    .line 93
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    return-object v0
.end method

.method private getCiIndex(Landroid/os/Message;)Ljava/lang/Integer;
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 497
    new-instance v1, Ljava/lang/Integer;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Ljava/lang/Integer;-><init>(I)V

    .line 504
    .local v1, "index":Ljava/lang/Integer;
    if-eqz p1, :cond_0

    .line 505
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v2, :cond_1

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/Integer;

    if-eqz v2, :cond_1

    .line 506
    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .end local v1    # "index":Ljava/lang/Integer;
    check-cast v1, Ljava/lang/Integer;

    .line 514
    .restart local v1    # "index":Ljava/lang/Integer;
    :cond_0
    :goto_0
    return-object v1

    .line 507
    :cond_1
    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v2, :cond_0

    iget-object v2, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v2, v2, Landroid/os/AsyncResult;

    if-eqz v2, :cond_0

    .line 508
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 509
    .local v0, "ar":Landroid/os/AsyncResult;
    iget-object v2, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    if-eqz v2, :cond_0

    iget-object v2, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    instance-of v2, v2, Ljava/lang/Integer;

    if-eqz v2, :cond_0

    .line 510
    iget-object v1, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    .end local v1    # "index":Ljava/lang/Integer;
    check-cast v1, Ljava/lang/Integer;

    .restart local v1    # "index":Ljava/lang/Integer;
    goto :goto_0
.end method

.method public static getFamilyFromRadioTechnology(I)I
    .locals 1
    .param p0, "radioTechnology"    # I

    .prologue
    .line 281
    invoke-static {p0}, Landroid/telephony/ServiceState;->isGsm(I)Z

    move-result v0

    if-nez v0, :cond_0

    const/16 v0, 0xd

    if-ne p0, v0, :cond_1

    .line 283
    :cond_0
    const/4 v0, 0x1

    .line 288
    :goto_0
    return v0

    .line 284
    :cond_1
    invoke-static {p0}, Landroid/telephony/ServiceState;->isCdma(I)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 285
    const/4 v0, 0x2

    goto :goto_0

    .line 288
    :cond_2
    const/4 v0, -0x1

    goto :goto_0
.end method

.method public static getInstance()Lcom/android/internal/telephony/uicc/UiccController;
    .locals 3

    .prologue
    .line 221
    sget-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 222
    :try_start_0
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:Lcom/android/internal/telephony/uicc/UiccController;

    if-nez v0, :cond_0

    .line 223
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "UiccController.getInstance can\'t be called before make()"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 227
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 226
    :cond_0
    :try_start_1
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:Lcom/android/internal/telephony/uicc/UiccController;

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v0
.end method

.method private handleRefresh(Lcom/android/internal/telephony/uicc/IccRefreshResponse;I)V
    .locals 2
    .param p1, "refreshResponse"    # Lcom/android/internal/telephony/uicc/IccRefreshResponse;
    .param p2, "index"    # I

    .prologue
    .line 518
    if-nez p1, :cond_0

    .line 519
    const-string v0, "handleRefresh received without input"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 529
    :goto_0
    return-void

    .line 524
    :cond_0
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    aget-object v0, v0, p2

    if-eqz v0, :cond_1

    .line 525
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    aget-object v0, v0, p2

    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/uicc/UiccCard;->onRefresh(Lcom/android/internal/telephony/uicc/IccRefreshResponse;)V

    .line 528
    :cond_1
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v0, v0, p2

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->obtainMessage(I)Landroid/os/Message;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/CommandsInterface;->getIccCardStatus(Landroid/os/Message;)V

    goto :goto_0
.end method

.method private isValidCardIndex(I)Z
    .locals 1
    .param p1, "index"    # I

    .prologue
    .line 598
    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    array-length v0, v0

    if-ge p1, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private log(Ljava/lang/String;)V
    .locals 1
    .param p1, "string"    # Ljava/lang/String;

    .prologue
    .line 602
    const-string v0, "UiccController"

    invoke-static {v0, p1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 603
    return-void
.end method

.method public static make(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)Lcom/android/internal/telephony/uicc/UiccController;
    .locals 3
    .param p0, "c"    # Landroid/content/Context;
    .param p1, "ci"    # [Lcom/android/internal/telephony/CommandsInterface;

    .prologue
    .line 164
    sget-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 165
    :try_start_0
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:Lcom/android/internal/telephony/uicc/UiccController;

    if-eqz v0, :cond_0

    .line 166
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v2, "MSimUiccController.make() should only be called once"

    invoke-direct {v0, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 170
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 168
    :cond_0
    :try_start_1
    new-instance v0, Lcom/android/internal/telephony/uicc/UiccController;

    invoke-direct {v0, p0, p1}, Lcom/android/internal/telephony/uicc/UiccController;-><init>(Landroid/content/Context;[Lcom/android/internal/telephony/CommandsInterface;)V

    sput-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:Lcom/android/internal/telephony/uicc/UiccController;

    .line 169
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:Lcom/android/internal/telephony/uicc/UiccController;

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    return-object v0
.end method

.method private declared-synchronized onGetIccApplicationStatusDone(Landroid/os/AsyncResult;Ljava/lang/Integer;)V
    .locals 7
    .param p1, "ar"    # Landroid/os/AsyncResult;
    .param p2, "index"    # Ljava/lang/Integer;

    .prologue
    .line 752
    monitor-enter p0

    :try_start_0
    iget-object v1, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 753
    const-string v1, "UiccController"

    const-string v2, "Error getting ICC status. RIL_REQUEST_GET_ICC_APPLICATION_STATUS should never return an error"

    iget-object v3, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 784
    :goto_0
    monitor-exit p0

    return-void

    .line 758
    :cond_0
    :try_start_1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->isValidCardIndex(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 759
    const-string v1, "UiccController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onGetIccApplicationStatusDone: invalid index : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 752
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 762
    :cond_1
    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onGetIccApplicationStatusDone, index "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 764
    iget-object v0, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/telephony/uicc/IccCardStatus;

    .line 766
    .local v0, "status":Lcom/android/internal/telephony/uicc/IccCardStatus;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v1, v2

    if-nez v1, :cond_2

    .line 768
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    new-instance v3, Lcom/android/internal/telephony/uicc/UiccCard;

    iget-object v4, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aget-object v5, v5, v6

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-direct {v3, v4, v5, v0, v6}, Lcom/android/internal/telephony/uicc/UiccCard;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/uicc/IccCardStatus;I)V

    aput-object v3, v1, v2

    .line 782
    :goto_1
    const-string v1, "Notifying mApplicationChangedRegistrants"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 783
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mApplicationChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1}, Landroid/os/RegistrantList;->notifyRegistrants()V

    goto :goto_0

    .line 779
    :cond_2
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aget-object v3, v3, v4

    invoke-virtual {v1, v2, v3, v0}, Lcom/android/internal/telephony/uicc/UiccCard;->update(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/uicc/IccCardStatus;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method private declared-synchronized onGetIccCardStatusDone(Landroid/os/AsyncResult;Ljava/lang/Integer;)V
    .locals 7
    .param p1, "ar"    # Landroid/os/AsyncResult;
    .param p2, "index"    # Ljava/lang/Integer;

    .prologue
    .line 571
    monitor-enter p0

    :try_start_0
    iget-object v1, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v1, :cond_0

    .line 572
    const-string v1, "UiccController"

    const-string v2, "Error getting ICC status. RIL_REQUEST_GET_ICC_STATUS should never return an error"

    iget-object v3, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-static {v1, v2, v3}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 595
    :goto_0
    monitor-exit p0

    return-void

    .line 577
    :cond_0
    :try_start_1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->isValidCardIndex(I)Z

    move-result v1

    if-nez v1, :cond_1

    .line 578
    const-string v1, "UiccController"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onGetIccCardStatusDone: invalid index : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 571
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 582
    :cond_1
    :try_start_2
    iget-object v0, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v0, Lcom/android/internal/telephony/uicc/IccCardStatus;

    .line 584
    .local v0, "status":Lcom/android/internal/telephony/uicc/IccCardStatus;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v1, v2

    if-nez v1, :cond_2

    .line 586
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    new-instance v3, Lcom/android/internal/telephony/uicc/UiccCard;

    iget-object v4, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    iget-object v5, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    aget-object v5, v5, v6

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v6

    invoke-direct {v3, v4, v5, v0, v6}, Lcom/android/internal/telephony/uicc/UiccCard;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/uicc/IccCardStatus;I)V

    aput-object v3, v1, v2

    .line 592
    :goto_1
    const-string v1, "Notifying IccChangedRegistrants"

    invoke-direct {p0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 593
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    new-instance v2, Landroid/os/AsyncResult;

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct {v2, v3, p2, v4}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v1, v2}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto :goto_0

    .line 589
    :cond_2
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aget-object v3, v3, v4

    invoke-virtual {v1, v2, v3, v0}, Lcom/android/internal/telephony/uicc/UiccCard;->update(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/uicc/IccCardStatus;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1
.end method

.method private declared-synchronized onGetIccCardStatusDone(Landroid/os/AsyncResult;Ljava/lang/Integer;Z)V
    .locals 9
    .param p1, "ar"    # Landroid/os/AsyncResult;
    .param p2, "index"    # Ljava/lang/Integer;
    .param p3, "isUpdate"    # Z

    .prologue
    .line 643
    monitor-enter p0

    :try_start_0
    iget-object v0, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    .line 644
    const-string v0, "UiccController"

    const-string v1, "Error getting ICC status. RIL_REQUEST_GET_ICC_STATUS should never return an error"

    iget-object v2, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-static {v0, v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 689
    :goto_0
    monitor-exit p0

    return-void

    .line 649
    :cond_0
    :try_start_1
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/uicc/UiccController;->isValidCardIndex(I)Z

    move-result v0

    if-nez v0, :cond_1

    .line 650
    const-string v0, "UiccController"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onGetIccCardStatusDone: invalid index : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 643
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 653
    :cond_1
    :try_start_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onGetIccCardStatusDone, index "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "isUpdateSiminfo "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 655
    iget-object v3, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v3, Lcom/android/internal/telephony/uicc/IccCardStatus;

    .line 662
    .local v3, "status":Lcom/android/internal/telephony/uicc/IccCardStatus;
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v0, v0, v1

    if-nez v0, :cond_2

    .line 664
    iget-object v7, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v8

    new-instance v0, Lcom/android/internal/telephony/uicc/UiccCard;

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aget-object v2, v2, v4

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/uicc/UiccCard;-><init>(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/uicc/IccCardStatus;IZ)V

    aput-object v0, v7, v8

    .line 678
    :goto_1
    const-string v0, "Notifying IccChangedRegistrants"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 680
    const-string v0, "ro.mtk_sim_hot_swap_common_slot"

    invoke-static {v0}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 681
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    new-instance v1, Landroid/os/AsyncResult;

    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-direct {v1, v2, p2, v4}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 675
    :cond_2
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    aget-object v0, v0, v1

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    aget-object v2, v2, v4

    invoke-virtual {v0, v1, v2, v3, p3}, Lcom/android/internal/telephony/uicc/UiccCard;->update(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Lcom/android/internal/telephony/uicc/IccCardStatus;Z)V

    goto :goto_1

    .line 683
    :cond_3
    new-instance v6, Landroid/os/Bundle;

    invoke-direct {v6}, Landroid/os/Bundle;-><init>()V

    .line 684
    .local v6, "result":Landroid/os/Bundle;
    const-string v0, "Index"

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v6, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 685
    const-string v0, "ForceUpdate"

    invoke-virtual {v6, v0, p3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 687
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    new-instance v1, Landroid/os/AsyncResult;

    const/4 v2, 0x0

    const/4 v4, 0x0

    invoke-direct {v1, v2, v6, v4}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0
.end method

.method public static parseOemSimRefresh(Ljava/nio/ByteBuffer;)Lcom/android/internal/telephony/uicc/IccRefreshResponse;
    .locals 7
    .param p0, "payload"    # Ljava/nio/ByteBuffer;

    .prologue
    const/16 v6, 0x2c

    const/4 v5, 0x0

    .line 533
    new-instance v3, Lcom/android/internal/telephony/uicc/IccRefreshResponse;

    invoke-direct {v3}, Lcom/android/internal/telephony/uicc/IccRefreshResponse;-><init>()V

    .line 535
    .local v3, "response":Lcom/android/internal/telephony/uicc/IccRefreshResponse;
    const/16 v0, 0x2c

    .line 538
    .local v0, "QHOOK_MAX_AID_SIZE":I
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {p0, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 540
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    iput v4, v3, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->refreshResult:I

    .line 541
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v4

    iput v4, v3, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->efId:I

    .line 542
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v2

    .line 543
    .local v2, "aidLen":I
    new-array v1, v6, [B

    .line 544
    .local v1, "aid":[B
    invoke-virtual {p0, v1, v5, v6}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 548
    if-nez v2, :cond_0

    const/4 v4, 0x0

    :goto_0
    iput-object v4, v3, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->aid:Ljava/lang/String;

    .line 551
    const-string v4, "UiccController"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "refresh SIM card , refresh result:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v3, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->refreshResult:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", ef Id:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget v6, v3, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->efId:I

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", aid:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, v3, Lcom/android/internal/telephony/uicc/IccRefreshResponse;->aid:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 554
    return-object v3

    .line 548
    :cond_0
    new-instance v4, Ljava/lang/String;

    invoke-direct {v4, v1}, Ljava/lang/String;-><init>([B)V

    invoke-virtual {v4, v5, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method

.method private parsePersoType(Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;)Ljava/lang/String;
    .locals 2
    .param p1, "state"    # Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    .prologue
    .line 816
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "parsePersoType, state = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 817
    sget-object v0, Lcom/android/internal/telephony/uicc/UiccController$2;->$SwitchMap$com$android$internal$telephony$uicc$IccCardApplicationStatus$PersoSubState:[I

    invoke-virtual {p1}, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 831
    const-string v0, "UNKNOWN"

    :goto_0
    return-object v0

    .line 819
    :pswitch_0
    const-string v0, "NETWORK"

    goto :goto_0

    .line 821
    :pswitch_1
    const-string v0, "NETWORK_SUBSET"

    goto :goto_0

    .line 823
    :pswitch_2
    const-string v0, "CORPORATE"

    goto :goto_0

    .line 825
    :pswitch_3
    const-string v0, "SERVICE_PROVIDER"

    goto :goto_0

    .line 827
    :pswitch_4
    const-string v0, "SIM"

    goto :goto_0

    .line 817
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method


# virtual methods
.method public addCardLog(Ljava/lang/String;)V
    .locals 4
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 607
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    .line 608
    .local v0, "t":Landroid/text/format/Time;
    invoke-virtual {v0}, Landroid/text/format/Time;->setToNow()V

    .line 609
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCardLogs:Ljava/util/LinkedList;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "%m-%d %H:%M:%S"

    invoke-virtual {v0, v3}, Landroid/text/format/Time;->format(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->addLast(Ljava/lang/Object;)V

    .line 610
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCardLogs:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    const/16 v2, 0x14

    if-le v1, v2, :cond_0

    .line 611
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCardLogs:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->removeFirst()Ljava/lang/Object;

    .line 613
    :cond_0
    return-void
.end method

.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 3
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "pw"    # Ljava/io/PrintWriter;
    .param p3, "args"    # [Ljava/lang/String;

    .prologue
    .line 616
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "UiccController: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 617
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mContext="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 618
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mInstance="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/uicc/UiccController;->mInstance:Lcom/android/internal/telephony/uicc/UiccController;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 619
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mIccChangedRegistrants: size="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v2}, Landroid/os/RegistrantList;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 620
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1}, Landroid/os/RegistrantList;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 621
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  mIccChangedRegistrants["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Registrant;

    invoke-virtual {v1}, Landroid/os/Registrant;->getHandler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 620
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 624
    :cond_0
    invoke-virtual {p2}, Ljava/io/PrintWriter;->println()V

    .line 625
    invoke-virtual {p2}, Ljava/io/PrintWriter;->flush()V

    .line 626
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, " mUiccCards: size="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    array-length v2, v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 627
    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    array-length v1, v1

    if-ge v0, v1, :cond_2

    .line 628
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    aget-object v1, v1, v0

    if-nez v1, :cond_1

    .line 629
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  mUiccCards["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]=null"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 627
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 631
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  mUiccCards["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    aget-object v2, v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 632
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    aget-object v1, v1, v0

    invoke-virtual {v1, p1, p2, p3}, Lcom/android/internal/telephony/uicc/UiccCard;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    goto :goto_2

    .line 635
    :cond_2
    const-string v1, "mCardLogs: "

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 636
    const/4 v0, 0x0

    :goto_3
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCardLogs:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    if-ge v0, v1, :cond_3

    .line 637
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "  "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCardLogs:Ljava/util/LinkedList;

    invoke-virtual {v1, v0}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 636
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 639
    :cond_3
    return-void
.end method

.method public getBtConnectedSimId()I
    .locals 2

    .prologue
    .line 794
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "getBtConnectedSimId, slot "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mBtSlotId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 795
    iget v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mBtSlotId:I

    return v0
.end method

.method public getIccFileHandler(II)Lcom/android/internal/telephony/uicc/IccFileHandler;
    .locals 3
    .param p1, "phoneId"    # I
    .param p2, "family"    # I

    .prologue
    .line 270
    sget-object v2, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 271
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCardApplication(II)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v0

    .line 272
    .local v0, "app":Lcom/android/internal/telephony/uicc/UiccCardApplication;
    if-eqz v0, :cond_0

    .line 273
    invoke-virtual {v0}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getIccFileHandler()Lcom/android/internal/telephony/uicc/IccFileHandler;

    move-result-object v1

    monitor-exit v2

    .line 275
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    monitor-exit v2

    goto :goto_0

    .line 276
    .end local v0    # "app":Lcom/android/internal/telephony/uicc/UiccCardApplication;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getIccRecords(II)Lcom/android/internal/telephony/uicc/IccRecords;
    .locals 3
    .param p1, "phoneId"    # I
    .param p2, "family"    # I

    .prologue
    .line 259
    sget-object v2, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 260
    :try_start_0
    invoke-virtual {p0, p1, p2}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCardApplication(II)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v0

    .line 261
    .local v0, "app":Lcom/android/internal/telephony/uicc/UiccCardApplication;
    if-eqz v0, :cond_0

    .line 262
    invoke-virtual {v0}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getIccRecords()Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v1

    monitor-exit v2

    .line 264
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    monitor-exit v2

    goto :goto_0

    .line 265
    .end local v0    # "app":Lcom/android/internal/telephony/uicc/UiccCardApplication;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getUiccCard()Lcom/android/internal/telephony/uicc/UiccCard;
    .locals 1

    .prologue
    .line 231
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCard(I)Lcom/android/internal/telephony/uicc/UiccCard;

    move-result-object v0

    return-object v0
.end method

.method public getUiccCard(I)Lcom/android/internal/telephony/uicc/UiccCard;
    .locals 2
    .param p1, "phoneId"    # I

    .prologue
    .line 235
    sget-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 236
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/uicc/UiccController;->isValidCardIndex(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 237
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    aget-object v0, v0, p1

    monitor-exit v1

    .line 239
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    monitor-exit v1

    goto :goto_0

    .line 240
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public getUiccCardApplication(I)Lcom/android/internal/telephony/uicc/UiccCardApplication;
    .locals 2
    .param p1, "family"    # I

    .prologue
    .line 253
    invoke-static {}, Lcom/android/internal/telephony/SubscriptionController;->getInstance()Lcom/android/internal/telephony/SubscriptionController;

    move-result-object v0

    invoke-static {}, Lcom/android/internal/telephony/SubscriptionController;->getInstance()Lcom/android/internal/telephony/SubscriptionController;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/internal/telephony/SubscriptionController;->getDefaultSubId()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/SubscriptionController;->getPhoneId(I)I

    move-result v0

    invoke-virtual {p0, v0, p1}, Lcom/android/internal/telephony/uicc/UiccController;->getUiccCardApplication(II)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v0

    return-object v0
.end method

.method public getUiccCardApplication(II)Lcom/android/internal/telephony/uicc/UiccCardApplication;
    .locals 3
    .param p1, "phoneId"    # I
    .param p2, "family"    # I

    .prologue
    .line 559
    sget-object v2, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 560
    :try_start_0
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/uicc/UiccController;->isValidCardIndex(I)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 561
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    aget-object v0, v1, p1

    .line 562
    .local v0, "c":Lcom/android/internal/telephony/uicc/UiccCard;
    if-eqz v0, :cond_0

    .line 563
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    aget-object v1, v1, p1

    invoke-virtual {v1, p2}, Lcom/android/internal/telephony/uicc/UiccCard;->getApplication(I)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v1

    monitor-exit v2

    .line 566
    .end local v0    # "c":Lcom/android/internal/telephony/uicc/UiccCard;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    monitor-exit v2

    goto :goto_0

    .line 567
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public getUiccCards()[Lcom/android/internal/telephony/uicc/UiccCard;
    .locals 2

    .prologue
    .line 246
    sget-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 247
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    invoke-virtual {v0}, [Lcom/android/internal/telephony/uicc/UiccCard;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/android/internal/telephony/uicc/UiccCard;

    monitor-exit v1

    return-object v0

    .line 248
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 23
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 328
    sget-object v19, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v19

    .line 329
    :try_start_0
    invoke-direct/range {p0 .. p1}, Lcom/android/internal/telephony/uicc/UiccController;->getCiIndex(Landroid/os/Message;)Ljava/lang/Integer;

    move-result-object v7

    .line 331
    .local v7, "index":Ljava/lang/Integer;
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v18

    if-ltz v18, :cond_0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    array-length v0, v0

    move/from16 v20, v0

    move/from16 v0, v18

    move/from16 v1, v20

    if-lt v0, v1, :cond_1

    .line 332
    :cond_0
    const-string v18, "UiccController"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Invalid index : "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " received with event "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 333
    monitor-exit v19

    .line 493
    :goto_0
    return-void

    .line 336
    :cond_1
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v18, v0

    sparse-switch v18, :sswitch_data_0

    .line 490
    const-string v18, "UiccController"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, " Unknown Event "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->what:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 492
    :cond_2
    :goto_1
    monitor-exit v19

    goto :goto_0

    .end local v7    # "index":Ljava/lang/Integer;
    :catchall_0
    move-exception v18

    monitor-exit v19
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v18

    .line 338
    .restart local v7    # "index":Ljava/lang/Integer;
    :sswitch_0
    :try_start_1
    const-string v18, "Received EVENT_ICC_STATUS_CHANGED, calling getIccCardStatus"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 339
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    aget-object v18, v18, v20

    const/16 v20, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1, v7}, Lcom/android/internal/telephony/uicc/UiccController;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/CommandsInterface;->getIccCardStatus(Landroid/os/Message;)V

    goto :goto_1

    .line 342
    :sswitch_1
    const-string v18, "Received EVENT_GET_ICC_STATUS_DONE"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 343
    move-object/from16 v0, p1

    iget-object v4, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/AsyncResult;

    .line 344
    .local v4, "ar":Landroid/os/AsyncResult;
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v7}, Lcom/android/internal/telephony/uicc/UiccController;->onGetIccCardStatusDone(Landroid/os/AsyncResult;Ljava/lang/Integer;)V

    goto :goto_1

    .line 347
    .end local v4    # "ar":Landroid/os/AsyncResult;
    :sswitch_2
    const-string v18, "Received EVENT_REPOLL_SML_STATE"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 348
    move-object/from16 v0, p1

    iget-object v4, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/AsyncResult;

    .line 349
    .restart local v4    # "ar":Landroid/os/AsyncResult;
    move-object/from16 v0, p1

    iget v0, v0, Landroid/os/Message;->arg1:I

    move/from16 v18, v0

    const/16 v20, 0x1

    move/from16 v0, v18

    move/from16 v1, v20

    if-ne v0, v1, :cond_3

    const/4 v12, 0x1

    .line 352
    .local v12, "needIntent":Z
    :goto_2
    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v4, v7, v1}, Lcom/android/internal/telephony/uicc/UiccController;->onGetIccCardStatusDone(Landroid/os/AsyncResult;Ljava/lang/Integer;Z)V

    .line 355
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    aget-object v18, v18, v20

    if-eqz v18, :cond_2

    const/16 v18, 0x1

    move/from16 v0, v18

    if-ne v12, v0, :cond_2

    .line 356
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    aget-object v18, v18, v20

    const/16 v20, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/uicc/UiccCard;->getApplication(I)Lcom/android/internal/telephony/uicc/UiccCardApplication;

    move-result-object v3

    .line 357
    .local v3, "app":Lcom/android/internal/telephony/uicc/UiccCardApplication;
    if-nez v3, :cond_4

    .line 358
    const-string v18, "UiccCardApplication = null"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 349
    .end local v3    # "app":Lcom/android/internal/telephony/uicc/UiccCardApplication;
    .end local v12    # "needIntent":Z
    :cond_3
    const/4 v12, 0x0

    goto :goto_2

    .line 361
    .restart local v3    # "app":Lcom/android/internal/telephony/uicc/UiccCardApplication;
    .restart local v12    # "needIntent":Z
    :cond_4
    invoke-virtual {v3}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getState()Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    move-result-object v18

    sget-object v20, Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;->APPSTATE_SUBSCRIPTION_PERSO:Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$AppState;

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    if-ne v0, v1, :cond_2

    .line 362
    new-instance v11, Landroid/content/Intent;

    invoke-direct {v11}, Landroid/content/Intent;-><init>()V

    .line 363
    .local v11, "lockIntent":Landroid/content/Intent;
    if-nez v11, :cond_5

    .line 364
    const-string v18, "New intent failed"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 365
    monitor-exit v19

    goto/16 :goto_0

    .line 367
    :cond_5
    const-string v18, "Broadcast ACTION_UNLOCK_SIM_LOCK"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 368
    const-string v18, "mediatek.intent.action.ACTION_UNLOCK_SIM_LOCK"

    move-object/from16 v0, v18

    invoke-virtual {v11, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 369
    const-string v18, "ss"

    const-string v20, "LOCKED"

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 371
    const-string v18, "reason"

    invoke-virtual {v3}, Lcom/android/internal/telephony/uicc/UiccCardApplication;->getPersoSubState()Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;

    move-result-object v20

    move-object/from16 v0, p0

    move-object/from16 v1, v20

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->parsePersoType(Lcom/android/internal/telephony/uicc/IccCardApplicationStatus$PersoSubState;)Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v11, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 373
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v18

    move/from16 v0, v18

    invoke-static {v11, v0}, Landroid/telephony/SubscriptionManager;->putPhoneIdAndSubIdExtra(Landroid/content/Intent;I)V

    .line 374
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 379
    .end local v3    # "app":Lcom/android/internal/telephony/uicc/UiccCardApplication;
    .end local v4    # "ar":Landroid/os/AsyncResult;
    .end local v11    # "lockIntent":Landroid/content/Intent;
    .end local v12    # "needIntent":Z
    :sswitch_3
    const-string v18, "EVENT_RADIO_UNAVAILABLE, dispose card"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 380
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    aget-object v18, v18, v20

    if-eqz v18, :cond_6

    .line 381
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    aget-object v18, v18, v20

    invoke-virtual/range {v18 .. v18}, Lcom/android/internal/telephony/uicc/UiccCard;->dispose()V

    .line 383
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mUiccCards:[Lcom/android/internal/telephony/uicc/UiccCard;

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    const/16 v21, 0x0

    aput-object v21, v18, v20

    .line 384
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v18, v0

    new-instance v20, Landroid/os/AsyncResult;

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v7, v2}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_1

    .line 387
    :sswitch_4
    const-string v18, "Received EVENT_TURN_ON_ISIM_APPLICATION_DONE"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 388
    move-object/from16 v0, p1

    iget-object v4, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/AsyncResult;

    .line 389
    .restart local v4    # "ar":Landroid/os/AsyncResult;
    iget-object v0, v4, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v18, v0

    if-eqz v18, :cond_7

    .line 390
    const-string v18, "UiccController"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "[SIM "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "] Error turn on ISIM. "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    iget-object v0, v4, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v21, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 391
    monitor-exit v19

    goto/16 :goto_0

    .line 395
    :cond_7
    iget-object v0, v4, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v18, v0

    check-cast v18, [I

    move-object/from16 v0, v18

    check-cast v0, [I

    move-object v10, v0

    .line 396
    .local v10, "ints":[I
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Application ID = "

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v20, 0x0

    aget v20, v10, v20

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v20, "Session ID = "

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v20, 0x1

    aget v20, v10, v20

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 398
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mImsSessionId:[I

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    const/16 v21, 0x1

    aget v21, v10, v21

    aput v21, v18, v20

    .line 399
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    aget-object v18, v18, v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mImsSessionId:[I

    move-object/from16 v20, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v21

    aget v20, v20, v21

    const/16 v21, 0xc9

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-virtual {v0, v1, v7}, Lcom/android/internal/telephony/uicc/UiccController;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v21

    move-object/from16 v0, v18

    move/from16 v1, v20

    move-object/from16 v2, v21

    invoke-interface {v0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->getIccApplicationStatus(ILandroid/os/Message;)V

    goto/16 :goto_1

    .line 404
    .end local v4    # "ar":Landroid/os/AsyncResult;
    .end local v10    # "ints":[I
    :sswitch_5
    const-string v18, "Received EVENT_GET_ICC_APPLICATION_STATUS"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 405
    move-object/from16 v0, p1

    iget-object v4, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/AsyncResult;

    .line 406
    .restart local v4    # "ar":Landroid/os/AsyncResult;
    move-object/from16 v0, p0

    invoke-direct {v0, v4, v7}, Lcom/android/internal/telephony/uicc/UiccController;->onGetIccApplicationStatusDone(Landroid/os/AsyncResult;Ljava/lang/Integer;)V

    goto/16 :goto_1

    .line 410
    .end local v4    # "ar":Landroid/os/AsyncResult;
    :sswitch_6
    const-string v18, "Received EVENT_APPLICATION_SESSION_CHANGED"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 411
    move-object/from16 v0, p1

    iget-object v4, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/AsyncResult;

    .line 414
    .restart local v4    # "ar":Landroid/os/AsyncResult;
    iget-object v0, v4, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v18, v0

    check-cast v18, [I

    move-object/from16 v0, v18

    check-cast v0, [I

    move-object v14, v0

    .line 416
    .local v14, "result":[I
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Application = "

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v20, 0x0

    aget v20, v14, v20

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v20, ", Session = "

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const/16 v20, 0x1

    aget v20, v14, v20

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 417
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mImsSessionId:[I

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    const/16 v21, 0x1

    aget v21, v14, v21

    aput v21, v18, v20

    goto/16 :goto_1

    .line 420
    .end local v4    # "ar":Landroid/os/AsyncResult;
    .end local v14    # "result":[I
    :sswitch_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    aget-object v18, v18, v20

    const/16 v20, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1, v7}, Lcom/android/internal/telephony/uicc/UiccController;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/CommandsInterface;->getIccCardStatus(Landroid/os/Message;)V

    .line 422
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    move-object/from16 v18, v0

    const-string v20, "AutoAnswer"

    const/16 v21, 0x1

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v16

    .line 423
    .local v16, "shOn":Landroid/content/SharedPreferences;
    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v6

    .line 424
    .local v6, "editorOn":Landroid/content/SharedPreferences$Editor;
    const-string v18, "flag"

    const/16 v20, 0x1

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-interface {v6, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 425
    invoke-interface {v6}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_1

    .line 428
    .end local v6    # "editorOn":Landroid/content/SharedPreferences$Editor;
    .end local v16    # "shOn":Landroid/content/SharedPreferences;
    :sswitch_8
    const-string v18, "handleMessage (EVENT_VIRTUAL_SIM_OFF)"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 429
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    aget-object v18, v18, v20

    const/16 v20, 0x2

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1, v7}, Lcom/android/internal/telephony/uicc/UiccController;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/CommandsInterface;->getIccCardStatus(Landroid/os/Message;)V

    .line 432
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    move-object/from16 v18, v0

    const-string v20, "AutoAnswer"

    const/16 v21, 0x1

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    move/from16 v2, v21

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v15

    .line 433
    .local v15, "shOff":Landroid/content/SharedPreferences;
    invoke-interface {v15}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    .line 434
    .local v5, "editorOff":Landroid/content/SharedPreferences$Editor;
    const-string v18, "flag"

    const/16 v20, 0x0

    move-object/from16 v0, v18

    move/from16 v1, v20

    invoke-interface {v5, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 435
    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto/16 :goto_1

    .line 438
    .end local v5    # "editorOff":Landroid/content/SharedPreferences$Editor;
    .end local v15    # "shOff":Landroid/content/SharedPreferences;
    :sswitch_9
    const-string v18, "handleMessage (EVENT_SIM_RECOVERY)"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 439
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    aget-object v18, v18, v20

    const/16 v20, 0x6b

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1, v7}, Lcom/android/internal/telephony/uicc/UiccController;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/CommandsInterface;->getIccCardStatus(Landroid/os/Message;)V

    .line 440
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mRecoveryRegistrants:Landroid/os/RegistrantList;

    move-object/from16 v18, v0

    new-instance v20, Landroid/os/AsyncResult;

    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v1, v7, v2}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    .line 444
    new-instance v8, Landroid/content/Intent;

    invoke-direct {v8}, Landroid/content/Intent;-><init>()V

    .line 445
    .local v8, "intent":Landroid/content/Intent;
    const-string v18, "com.android.phone.ACTION_SIM_RECOVERY_DONE"

    move-object/from16 v0, v18

    invoke-virtual {v8, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 446
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v8}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 449
    .end local v8    # "intent":Landroid/content/Intent;
    :sswitch_a
    const-string v18, "handleMessage (EVENT_SIM_MISSING)"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 451
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    move-object/from16 v18, v0

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    aget-object v18, v18, v20

    const/16 v20, 0x6a

    move-object/from16 v0, p0

    move/from16 v1, v20

    invoke-virtual {v0, v1, v7}, Lcom/android/internal/telephony/uicc/UiccController;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v20

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Lcom/android/internal/telephony/CommandsInterface;->getIccCardStatus(Landroid/os/Message;)V

    goto/16 :goto_1

    .line 454
    :sswitch_b
    const-string v18, "Received EVENT_GET_ICC_STATUS_DONE_FOR_SIM_MISSING"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 455
    move-object/from16 v0, p1

    iget-object v4, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/AsyncResult;

    .line 456
    .restart local v4    # "ar":Landroid/os/AsyncResult;
    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v4, v7, v1}, Lcom/android/internal/telephony/uicc/UiccController;->onGetIccCardStatusDone(Landroid/os/AsyncResult;Ljava/lang/Integer;Z)V

    .line 458
    .end local v4    # "ar":Landroid/os/AsyncResult;
    :sswitch_c
    const-string v18, "Received EVENT_GET_ICC_STATUS_DONE_FOR_SIM_RECOVERY"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 459
    move-object/from16 v0, p1

    iget-object v4, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/AsyncResult;

    .line 460
    .restart local v4    # "ar":Landroid/os/AsyncResult;
    const/16 v18, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v18

    invoke-direct {v0, v4, v7, v1}, Lcom/android/internal/telephony/uicc/UiccController;->onGetIccCardStatusDone(Landroid/os/AsyncResult;Ljava/lang/Integer;Z)V

    goto/16 :goto_1

    .line 463
    .end local v4    # "ar":Landroid/os/AsyncResult;
    :sswitch_d
    const-string v18, "handleMessage (EVENT_COMMON_SLOT_NO_CHANGED)"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 464
    new-instance v9, Landroid/content/Intent;

    const-string v18, "com.mediatek.phone.ACTION_COMMON_SLOT_NO_CHANGED"

    move-object/from16 v0, v18

    invoke-direct {v9, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 465
    .local v9, "intentNoChanged":Landroid/content/Intent;
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v17

    .line 466
    .local v17, "slotId":I
    move/from16 v0, v17

    invoke-static {v9, v0}, Landroid/telephony/SubscriptionManager;->putPhoneIdAndSubIdExtra(Landroid/content/Intent;I)V

    .line 467
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Broadcasting intent ACTION_COMMON_SLOT_NO_CHANGED for mSlotId : "

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 468
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/uicc/UiccController;->mContext:Landroid/content/Context;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-virtual {v0, v9}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto/16 :goto_1

    .line 471
    .end local v9    # "intentNoChanged":Landroid/content/Intent;
    .end local v17    # "slotId":I
    :sswitch_e
    move-object/from16 v0, p1

    iget-object v4, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/AsyncResult;

    .line 472
    .restart local v4    # "ar":Landroid/os/AsyncResult;
    const-string v18, "Sim REFRESH received"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 473
    iget-object v0, v4, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v18, v0

    if-nez v18, :cond_8

    .line 474
    iget-object v0, v4, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v18, v0

    check-cast v18, Lcom/android/internal/telephony/uicc/IccRefreshResponse;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/android/internal/telephony/uicc/UiccController;->handleRefresh(Lcom/android/internal/telephony/uicc/IccRefreshResponse;I)V

    goto/16 :goto_1

    .line 476
    :cond_8
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Exception on refresh "

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget-object v0, v4, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v20, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 480
    .end local v4    # "ar":Landroid/os/AsyncResult;
    :sswitch_f
    move-object/from16 v0, p1

    iget-object v4, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/AsyncResult;

    .line 481
    .restart local v4    # "ar":Landroid/os/AsyncResult;
    const-string v18, "Sim REFRESH OEM received"

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 482
    iget-object v0, v4, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v18, v0

    if-nez v18, :cond_9

    .line 483
    iget-object v0, v4, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v18, v0

    check-cast v18, [B

    check-cast v18, [B

    invoke-static/range {v18 .. v18}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v13

    .line 484
    .local v13, "payload":Ljava/nio/ByteBuffer;
    invoke-static {v13}, Lcom/android/internal/telephony/uicc/UiccController;->parseOemSimRefresh(Ljava/nio/ByteBuffer;)Lcom/android/internal/telephony/uicc/IccRefreshResponse;

    move-result-object v18

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v20

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    move/from16 v2, v20

    invoke-direct {v0, v1, v2}, Lcom/android/internal/telephony/uicc/UiccController;->handleRefresh(Lcom/android/internal/telephony/uicc/IccRefreshResponse;I)V

    goto/16 :goto_1

    .line 486
    .end local v13    # "payload":Ljava/nio/ByteBuffer;
    :cond_9
    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "Exception on refresh "

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    iget-object v0, v4, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v20, v0

    move-object/from16 v0, v18

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_1

    .line 336
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x3 -> :sswitch_3
        0x4 -> :sswitch_e
        0x5 -> :sswitch_f
        0x65 -> :sswitch_7
        0x66 -> :sswitch_8
        0x67 -> :sswitch_a
        0x69 -> :sswitch_9
        0x6a -> :sswitch_b
        0x6b -> :sswitch_c
        0x73 -> :sswitch_2
        0x74 -> :sswitch_d
        0xc8 -> :sswitch_4
        0xc9 -> :sswitch_5
        0xca -> :sswitch_6
    .end sparse-switch
.end method

.method public registerForApplicationChanged(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 3
    .param p1, "h"    # Landroid/os/Handler;
    .param p2, "what"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .prologue
    .line 845
    sget-object v2, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 846
    :try_start_0
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 847
    .local v0, "r":Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mApplicationChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 850
    invoke-virtual {v0}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 851
    monitor-exit v2

    .line 852
    return-void

    .line 851
    .end local v0    # "r":Landroid/os/Registrant;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public registerForIccChanged(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 3
    .param p1, "h"    # Landroid/os/Handler;
    .param p2, "what"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .prologue
    .line 294
    sget-object v2, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 295
    :try_start_0
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 296
    .local v0, "r":Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 299
    invoke-virtual {v0}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 300
    monitor-exit v2

    .line 301
    return-void

    .line 300
    .end local v0    # "r":Landroid/os/Registrant;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public registerForIccRecovery(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 3
    .param p1, "h"    # Landroid/os/Handler;
    .param p2, "what"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .prologue
    .line 311
    sget-object v2, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v2

    .line 312
    :try_start_0
    new-instance v0, Landroid/os/Registrant;

    invoke-direct {v0, p1, p2, p3}, Landroid/os/Registrant;-><init>(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 313
    .local v0, "r":Landroid/os/Registrant;
    iget-object v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mRecoveryRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v1, v0}, Landroid/os/RegistrantList;->add(Landroid/os/Registrant;)V

    .line 316
    invoke-virtual {v0}, Landroid/os/Registrant;->notifyRegistrant()V

    .line 317
    monitor-exit v2

    .line 318
    return-void

    .line 317
    .end local v0    # "r":Landroid/os/Registrant;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public repollIccStateForModemSmlChangeFeatrue(IZ)V
    .locals 5
    .param p1, "slotId"    # I
    .param p2, "needIntent"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 836
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "repollIccStateForModemSmlChangeFeatrue, needIntent = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 837
    if-ne p2, v0, :cond_0

    .line 840
    .local v0, "arg1":I
    :goto_0
    iget-object v2, p0, Lcom/android/internal/telephony/uicc/UiccController;->mCis:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v2, v2, p1

    const/16 v3, 0x73

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p0, v3, v0, v1, v4}, Lcom/android/internal/telephony/uicc/UiccController;->obtainMessage(IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    invoke-interface {v2, v1}, Lcom/android/internal/telephony/CommandsInterface;->getIccCardStatus(Landroid/os/Message;)V

    .line 841
    return-void

    .end local v0    # "arg1":I
    :cond_0
    move v0, v1

    .line 837
    goto :goto_0
.end method

.method public setBtConnectedSimId(I)V
    .locals 2
    .param p1, "simId"    # I

    .prologue
    .line 804
    iput p1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mBtSlotId:I

    .line 805
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setBtConnectedSimId, slot "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/android/internal/telephony/uicc/UiccController;->mBtSlotId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/uicc/UiccController;->log(Ljava/lang/String;)V

    .line 806
    return-void
.end method

.method public unregisterForApplicationChanged(Landroid/os/Handler;)V
    .locals 2
    .param p1, "h"    # Landroid/os/Handler;

    .prologue
    .line 855
    sget-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 856
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mApplicationChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 857
    monitor-exit v1

    .line 858
    return-void

    .line 857
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public unregisterForIccChanged(Landroid/os/Handler;)V
    .locals 2
    .param p1, "h"    # Landroid/os/Handler;

    .prologue
    .line 304
    sget-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 305
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mIccChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 306
    monitor-exit v1

    .line 307
    return-void

    .line 306
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public unregisterForIccRecovery(Landroid/os/Handler;)V
    .locals 2
    .param p1, "h"    # Landroid/os/Handler;

    .prologue
    .line 321
    sget-object v1, Lcom/android/internal/telephony/uicc/UiccController;->mLock:Ljava/lang/Object;

    monitor-enter v1

    .line 322
    :try_start_0
    iget-object v0, p0, Lcom/android/internal/telephony/uicc/UiccController;->mRecoveryRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 323
    monitor-exit v1

    .line 324
    return-void

    .line 323
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
