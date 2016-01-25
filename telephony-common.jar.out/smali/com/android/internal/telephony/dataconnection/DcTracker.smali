.class public final Lcom/android/internal/telephony/dataconnection/DcTracker;
.super Lcom/android/internal/telephony/dataconnection/DcTrackerBase;
.source "DcTracker.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/dataconnection/DcTracker$2;,
        Lcom/android/internal/telephony/dataconnection/DcTracker$ProvisionNotificationBroadcastReceiver;,
        Lcom/android/internal/telephony/dataconnection/DcTracker$ApnChangeObserver;
    }
.end annotation


# static fields
.field static final APN_ID:Ljava/lang/String; = "apn_id"

.field private static final EVENT_3GPP_RECORDS_LOADED:I = 0x64

.field private static final MMS_DATA_PROFILE:I

.field private static final POLL_PDP_MILLIS:I = 0x1388

.field static final PREFERAPN_NO_UPDATE_URI_USING_SUBID:Landroid/net/Uri;

.field private static final PROPERTY_CDMA_IPPROTOCOL:Ljava/lang/String;

.field private static final PROPERTY_CDMA_ROAMING_IPPROTOCOL:Ljava/lang/String;

.field private static final PROVISIONING_SPINNER_TIMEOUT_MILLIS:I = 0x1d4c0

.field private static final PUPPET_MASTER_RADIO_STRESS_TEST:Ljava/lang/String; = "gsm.defaultpdpcontext.active"


# instance fields
.field protected final LOG_TAG:Ljava/lang/String;

.field private mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

.field private mApnObserver:Lcom/android/internal/telephony/dataconnection/DcTracker$ApnChangeObserver;

.field private mAttached:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mCanSetPreferApn:Z

.field private mCdmaSsm:Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;

.field private mDeregistrationAlarmState:Z

.field private mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/os/Message;",
            ">;"
        }
    .end annotation
.end field

.field protected mDisconnectPendingCount:I

.field protected mFdMgr:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

.field private mImsDeregistrationDelayIntent:Landroid/app/PendingIntent;

.field public mImsRegistrationState:Z

.field private mOmhApt:Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;

.field protected mOosIsDisconnect:Z

.field private final mProvisionActionName:Ljava/lang/String;

.field private mProvisionBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private mProvisioningSpinner:Landroid/app/ProgressDialog;

.field private mReregisterOnReconnectFailure:Z

.field mSimRecordsLoadedHandler:Landroid/os/Handler;

.field private mWaitCleanUpApnContext:Lcom/android/internal/telephony/dataconnection/ApnContext;

.field private mWwanIwlanCoexistFlag:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 151
    const-string v0, "content://telephony/carriers/preferapn_no_update/subId/"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->PREFERAPN_NO_UPDATE_URI_USING_SUBID:Landroid/net/Uri;

    .line 158
    const-string v0, "persist.telephony.cdma.protocol"

    const-string v1, "IP"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->PROPERTY_CDMA_IPPROTOCOL:Ljava/lang/String;

    .line 164
    const-string v0, "persist.telephony.cdma.rproto"

    const-string v1, "IP"

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->PROPERTY_CDMA_ROAMING_IPPROTOCOL:Ljava/lang/String;

    .line 219
    const-string v0, "ro.telephony.mms_data_profile"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    sput v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->MMS_DATA_PROFILE:I

    return-void
.end method

.method public constructor <init>(Lcom/android/internal/telephony/PhoneBase;)V
    .locals 9
    .param p1, "p"    # Lcom/android/internal/telephony/PhoneBase;

    .prologue
    const/4 v6, 0x2

    const/4 v8, 0x1

    const/4 v7, 0x0

    const/4 v5, 0x0

    .line 224
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;-><init>(Lcom/android/internal/telephony/PhoneBase;)V

    .line 117
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    iput-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;

    .line 119
    new-instance v4, Landroid/os/RegistrantList;

    invoke-direct {v4}, Landroid/os/RegistrantList;-><init>()V

    iput-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    .line 121
    iput v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    .line 139
    iput-boolean v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mReregisterOnReconnectFailure:Z

    .line 170
    const-string v4, "persist.telephony.oosisdc"

    invoke-static {v4, v8}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v4

    iput-boolean v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOosIsDisconnect:Z

    .line 173
    iput-boolean v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCanSetPreferApn:Z

    .line 175
    new-instance v4, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v4, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAttached:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 186
    iput-boolean v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mImsRegistrationState:Z

    .line 187
    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mWaitCleanUpApnContext:Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 188
    iput-boolean v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDeregistrationAlarmState:Z

    .line 189
    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mImsDeregistrationDelayIntent:Landroid/app/PendingIntent;

    .line 195
    iput-boolean v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mWwanIwlanCoexistFlag:Z

    .line 199
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcTracker$1;

    invoke-direct {v4, p0}, Lcom/android/internal/telephony/dataconnection/DcTracker$1;-><init>(Lcom/android/internal/telephony/dataconnection/DcTracker;)V

    iput-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mSimRecordsLoadedHandler:Landroid/os/Handler;

    .line 225
    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getPhoneType()I

    move-result v4

    if-ne v4, v8, :cond_1

    .line 226
    const-string v4, "GsmDCT"

    iput-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->LOG_TAG:Ljava/lang/String;

    .line 233
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".constructor"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 235
    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getPhoneType()I

    move-result v4

    if-ne v4, v6, :cond_0

    .line 236
    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, #android:bool@config_fetch_apn_from_omh_card#t

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    .line 238
    .local v1, "fetchApnFromOmhCard":Z
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->LOG_TAG:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " fetchApnFromOmhCard: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 239
    if-eqz v1, :cond_0

    .line 240
    new-instance v5, Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;

    move-object v4, p1

    check-cast v4, Lcom/android/internal/telephony/cdma/CDMAPhone;

    invoke-direct {v5, v4}, Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;-><init>(Lcom/android/internal/telephony/cdma/CDMAPhone;)V

    iput-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOmhApt:Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;

    .line 241
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOmhApt:Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;

    const v5, 0x4202b

    invoke-virtual {v4, p0, v5, v7}, Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;->registerForModemProfileReady(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 246
    .end local v1    # "fetchApnFromOmhCard":Z
    :cond_0
    iput-object p0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDataConnectionTracker:Landroid/os/Handler;

    .line 247
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->registerForAllEvents()V

    .line 248
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->update()V

    .line 249
    new-instance v4, Lcom/android/internal/telephony/dataconnection/DcTracker$ApnChangeObserver;

    invoke-direct {v4, p0}, Lcom/android/internal/telephony/dataconnection/DcTracker$ApnChangeObserver;-><init>(Lcom/android/internal/telephony/dataconnection/DcTracker;)V

    iput-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnObserver:Lcom/android/internal/telephony/dataconnection/DcTracker$ApnChangeObserver;

    .line 250
    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Landroid/provider/Telephony$Carriers;->CONTENT_URI:Landroid/net/Uri;

    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnObserver:Lcom/android/internal/telephony/dataconnection/DcTracker$ApnChangeObserver;

    invoke-virtual {v4, v5, v8, v6}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 253
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->initApnContexts()V

    .line 255
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 257
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2}, Landroid/content/IntentFilter;-><init>()V

    .line 258
    .local v2, "filter":Landroid/content/IntentFilter;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "com.android.internal.telephony.data-reconnect."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 259
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "com.android.internal.telephony.data-restart-trysetup."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 260
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v4

    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIntentReceiver:Landroid/content/BroadcastReceiver;

    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v4, v5, v2, v7, v6}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    goto :goto_1

    .line 227
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    .end local v2    # "filter":Landroid/content/IntentFilter;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getPhoneType()I

    move-result v4

    if-ne v4, v6, :cond_2

    .line 228
    const-string v4, "CdmaDCT"

    iput-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->LOG_TAG:Ljava/lang/String;

    goto/16 :goto_0

    .line 230
    :cond_2
    const-string v4, "DCT"

    iput-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->LOG_TAG:Ljava/lang/String;

    .line 231
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "unexpected phone type ["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getPhoneType()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 264
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_3
    invoke-static {p1}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->getInstance(Lcom/android/internal/telephony/PhoneBase;)Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    move-result-object v4

    iput-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mFdMgr:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    .line 267
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->initEmergencyApnSetting()V

    .line 268
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addEmergencyApnSetting()V

    .line 270
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "com.android.internal.telephony.PROVISION"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisionActionName:Ljava/lang/String;

    .line 271
    return-void
.end method

.method static synthetic access$000(Lcom/android/internal/telephony/dataconnection/DcTracker;)V
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DcTracker;

    .prologue
    .line 110
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onSimRecordsLoaded()V

    return-void
.end method

.method static synthetic access$100(Lcom/android/internal/telephony/dataconnection/DcTracker;)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DcTracker;

    .prologue
    .line 110
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningSpinner:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$102(Lcom/android/internal/telephony/dataconnection/DcTracker;Landroid/app/ProgressDialog;)Landroid/app/ProgressDialog;
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DcTracker;
    .param p1, "x1"    # Landroid/app/ProgressDialog;

    .prologue
    .line 110
    iput-object p1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningSpinner:Landroid/app/ProgressDialog;

    return-object p1
.end method

.method static synthetic access$200(Lcom/android/internal/telephony/dataconnection/DcTracker;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/telephony/dataconnection/DcTracker;
    .param p1, "x1"    # Z

    .prologue
    .line 110
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setRadio(Z)V

    return-void
.end method

.method private addApnContext(Ljava/lang/String;Landroid/net/NetworkConfig;)Lcom/android/internal/telephony/dataconnection/ApnContext;
    .locals 6
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "networkConfig"    # Landroid/net/NetworkConfig;

    .prologue
    .line 564
    new-instance v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->LOG_TAG:Ljava/lang/String;

    move-object v2, p1

    move-object v4, p2

    move-object v5, p0

    invoke-direct/range {v0 .. v5}, Lcom/android/internal/telephony/dataconnection/ApnContext;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Landroid/net/NetworkConfig;Lcom/android/internal/telephony/dataconnection/DcTrackerBase;)V

    .line 566
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 567
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPrioritySortedApnContexts:Ljava/util/PriorityQueue;

    invoke-virtual {v1, v0}, Ljava/util/PriorityQueue;->add(Ljava/lang/Object;)Z

    .line 568
    return-object v0
.end method

.method private addDummyApnSettings(Ljava/lang/String;)V
    .locals 41
    .param p1, "operator"    # Ljava/lang/String;

    .prologue
    .line 2763
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "createAllApnList: Creating dummy apn for cdma operator:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2764
    const/4 v2, 0x7

    new-array v14, v2, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "default"

    aput-object v3, v14, v2

    const/4 v2, 0x1

    const-string v3, "mms"

    aput-object v3, v14, v2

    const/4 v2, 0x2

    const-string v3, "supl"

    aput-object v3, v14, v2

    const/4 v2, 0x3

    const-string v3, "hipri"

    aput-object v3, v14, v2

    const/4 v2, 0x4

    const-string v3, "fota"

    aput-object v3, v14, v2

    const/4 v2, 0x5

    const-string v3, "ims"

    aput-object v3, v14, v2

    const/4 v2, 0x6

    const-string v3, "cbs"

    aput-object v3, v14, v2

    .line 2772
    .local v14, "defaultApnTypes":[Ljava/lang/String;
    const/4 v2, 0x1

    new-array v0, v2, [Ljava/lang/String;

    move-object/from16 v28, v0

    const/4 v2, 0x0

    const-string v3, "dun"

    aput-object v3, v28, v2

    .line 2775
    .local v28, "dunApnTypes":[Ljava/lang/String;
    new-instance v1, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x3

    sget-object v15, Lcom/android/internal/telephony/dataconnection/DcTracker;->PROPERTY_CDMA_IPPROTOCOL:Ljava/lang/String;

    sget-object v16, Lcom/android/internal/telephony/dataconnection/DcTracker;->PROPERTY_CDMA_ROAMING_IPPROTOCOL:Ljava/lang/String;

    const/16 v17, 0x1

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const-string v25, ""

    const-string v26, ""

    move-object/from16 v3, p1

    invoke-direct/range {v1 .. v26}, Lcom/android/internal/telephony/dataconnection/ApnSetting;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIIZIIIILjava/lang/String;Ljava/lang/String;)V

    .line 2780
    .local v1, "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2781
    new-instance v1, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .end local v1    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    const/16 v16, 0x3

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x3

    sget-object v29, Lcom/android/internal/telephony/dataconnection/DcTracker;->PROPERTY_CDMA_IPPROTOCOL:Ljava/lang/String;

    sget-object v30, Lcom/android/internal/telephony/dataconnection/DcTracker;->PROPERTY_CDMA_ROAMING_IPPROTOCOL:Ljava/lang/String;

    const/16 v31, 0x1

    const/16 v32, 0x0

    const/16 v33, 0x0

    const/16 v34, 0x0

    const/16 v35, 0x0

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x0

    const-string v39, ""

    const-string v40, ""

    move-object v15, v1

    move-object/from16 v17, p1

    invoke-direct/range {v15 .. v40}, Lcom/android/internal/telephony/dataconnection/ApnSetting;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIIZIIIILjava/lang/String;Ljava/lang/String;)V

    .line 2786
    .restart local v1    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2787
    return-void
.end method

.method private addEmergencyApnSetting()V
    .locals 5

    .prologue
    .line 3479
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mEmergencyApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    if-nez v3, :cond_0

    .line 3495
    :goto_0
    return-void

    .line 3482
    :cond_0
    const/4 v1, 0x0

    .line 3483
    .local v1, "hasEmergencyApn":Z
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 3484
    .local v0, "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    iget-object v3, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->types:[Ljava/lang/String;

    const-string v4, "emergency"

    invoke-static {v3, v4}, Lcom/android/internal/util/ArrayUtils;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 3485
    const/4 v1, 0x1

    .line 3490
    .end local v0    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :cond_2
    if-nez v1, :cond_3

    .line 3491
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mEmergencyApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 3493
    :cond_3
    const-string v3, "addEmergencyApnSetting - E-APN setting is already present"

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private apnListToString(Ljava/util/ArrayList;)Ljava/lang/String;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/dataconnection/ApnSetting;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 2913
    .local p1, "apns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    if-nez p1, :cond_0

    .line 2914
    const-string v3, "apnListToString: apns = null."

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2915
    const-string v3, ""

    .line 2924
    :goto_0
    return-object v3

    .line 2918
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 2919
    .local v1, "result":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    .local v2, "size":I
    :goto_1
    if-ge v0, v2, :cond_1

    .line 2920
    const/16 v3, 0x5b

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    invoke-virtual {v3}, Lcom/android/internal/telephony/dataconnection/ApnSetting;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x5d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 2919
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 2924
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method private apnTypeSameAny(Lcom/android/internal/telephony/dataconnection/ApnSetting;Lcom/android/internal/telephony/dataconnection/ApnSetting;)Z
    .locals 4
    .param p1, "first"    # Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .param p2, "second"    # Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .prologue
    .line 2686
    const/4 v0, 0x0

    .local v0, "index1":I
    :goto_0
    iget-object v2, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->types:[Ljava/lang/String;

    array-length v2, v2

    if-ge v0, v2, :cond_3

    .line 2687
    const/4 v1, 0x0

    .local v1, "index2":I
    :goto_1
    iget-object v2, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->types:[Ljava/lang/String;

    array-length v2, v2

    if-ge v1, v2, :cond_2

    .line 2688
    iget-object v2, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->types:[Ljava/lang/String;

    aget-object v2, v2, v0

    const-string v3, "*"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->types:[Ljava/lang/String;

    aget-object v2, v2, v1

    const-string v3, "*"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->types:[Ljava/lang/String;

    aget-object v2, v2, v0

    iget-object v3, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->types:[Ljava/lang/String;

    aget-object v3, v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2692
    :cond_0
    const/4 v2, 0x1

    .line 2698
    .end local v1    # "index2":I
    :goto_2
    return v2

    .line 2687
    .restart local v1    # "index2":I
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 2686
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 2698
    .end local v1    # "index2":I
    :cond_3
    const/4 v2, 0x0

    goto :goto_2
.end method

.method private apnsSimilar(Lcom/android/internal/telephony/dataconnection/ApnSetting;Lcom/android/internal/telephony/dataconnection/ApnSetting;)Z
    .locals 2
    .param p1, "first"    # Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .param p2, "second"    # Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .prologue
    .line 2703
    const-string v0, "dun"

    invoke-virtual {p1, v0}, Lcom/android/internal/telephony/dataconnection/ApnSetting;->canHandleType(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "dun"

    invoke-virtual {p2, v0}, Lcom/android/internal/telephony/dataconnection/ApnSetting;->canHandleType(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->apn:Ljava/lang/String;

    iget-object v1, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->apn:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, p1, p2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->apnTypeSameAny(Lcom/android/internal/telephony/dataconnection/ApnSetting;Lcom/android/internal/telephony/dataconnection/ApnSetting;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->proxy:Ljava/lang/String;

    iget-object v1, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->proxy:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->xorEquals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->port:Ljava/lang/String;

    iget-object v1, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->port:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->xorEquals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->carrierEnabled:Z

    iget-boolean v1, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->carrierEnabled:Z

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->bearer:I

    iget v1, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->bearer:I

    if-ne v0, v1, :cond_0

    iget v0, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->profileId:I

    iget v1, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->profileId:I

    if-ne v0, v1, :cond_0

    iget-object v0, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mvnoType:Ljava/lang/String;

    iget-object v1, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mvnoType:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mvnoMatchData:Ljava/lang/String;

    iget-object v1, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mvnoMatchData:Ljava/lang/String;

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsc:Ljava/lang/String;

    iget-object v1, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsc:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->xorEquals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsProxy:Ljava/lang/String;

    iget-object v1, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsProxy:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->xorEquals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsPort:Ljava/lang/String;

    iget-object v1, p2, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsPort:Ljava/lang/String;

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->xorEquals(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private applyNewState(Lcom/android/internal/telephony/dataconnection/ApnContext;ZZ)V
    .locals 5
    .param p1, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;
    .param p2, "enabled"    # Z
    .param p3, "met"    # Z

    .prologue
    .line 1800
    const/4 v0, 0x0

    .line 1801
    .local v0, "cleanup":Z
    const/4 v2, 0x0

    .line 1803
    .local v2, "trySetup":Z
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "applyNewState("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ", "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isEnabled()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "), "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDependencyMet()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "))"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1807
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isReady()Z

    move-result v3

    if-eqz v3, :cond_8

    .line 1808
    const/4 v0, 0x1

    .line 1809
    if-eqz p2, :cond_3

    if-eqz p3, :cond_3

    .line 1810
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v1

    .line 1811
    .local v1, "state":Lcom/android/internal/telephony/DctConstants$State;
    sget-object v3, Lcom/android/internal/telephony/dataconnection/DcTracker$2;->$SwitchMap$com$android$internal$telephony$DctConstants$State:[I

    invoke-virtual {v1}, Lcom/android/internal/telephony/DctConstants$State;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    .line 1863
    .end local v1    # "state":Lcom/android/internal/telephony/DctConstants$State;
    :cond_0
    :goto_0
    invoke-virtual {p1, p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setEnabled(Z)V

    .line 1864
    invoke-virtual {p1, p3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setDependencyMet(Z)V

    .line 1865
    if-eqz v0, :cond_1

    const/4 v3, 0x1

    invoke-virtual {p0, v3, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpConnection(ZLcom/android/internal/telephony/dataconnection/ApnContext;)V

    .line 1866
    :cond_1
    if-eqz v2, :cond_2

    invoke-direct {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->trySetupData(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z

    .line 1867
    :cond_2
    :goto_1
    return-void

    .line 1817
    .restart local v1    # "state":Lcom/android/internal/telephony/DctConstants$State;
    :pswitch_0
    const-string v3, "applyNewState: \'ready\' so return"

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 1825
    :pswitch_1
    const/4 v2, 0x1

    .line 1826
    const-string v3, "dataEnabled"

    invoke-virtual {p1, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReason(Ljava/lang/String;)V

    goto :goto_0

    .line 1830
    .end local v1    # "state":Lcom/android/internal/telephony/DctConstants$State;
    :cond_3
    if-eqz p3, :cond_7

    .line 1831
    const-string v3, "dataDisabled"

    invoke-virtual {p1, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReason(Ljava/lang/String;)V

    .line 1841
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "dun"

    if-ne v3, v4, :cond_4

    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->teardownForDun()Z

    move-result v3

    if-nez v3, :cond_5

    :cond_4
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "mms"

    if-ne v3, v4, :cond_6

    .line 1843
    :cond_5
    const/4 v0, 0x1

    goto :goto_0

    .line 1845
    :cond_6
    const/4 v0, 0x0

    goto :goto_0

    .line 1848
    :cond_7
    const-string v3, "dependencyUnmet"

    invoke-virtual {p1, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReason(Ljava/lang/String;)V

    goto :goto_0

    .line 1851
    :cond_8
    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    .line 1852
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_a

    .line 1853
    const-string v3, "dependencyMet"

    invoke-virtual {p1, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReason(Ljava/lang/String;)V

    .line 1857
    :goto_2
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/DctConstants$State;->FAILED:Lcom/android/internal/telephony/DctConstants$State;

    if-ne v3, v4, :cond_9

    .line 1858
    sget-object v3, Lcom/android/internal/telephony/DctConstants$State;->IDLE:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {p1, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 1860
    :cond_9
    const/4 v2, 0x1

    goto :goto_0

    .line 1855
    :cond_a
    const-string v3, "dataEnabled"

    invoke-virtual {p1, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReason(Ljava/lang/String;)V

    goto :goto_2

    .line 1811
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private buildWaitingApns(Ljava/lang/String;I)Ljava/util/ArrayList;
    .locals 11
    .param p1, "requestedApnType"    # Ljava/lang/String;
    .param p2, "radioTech"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/dataconnection/ApnSetting;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v10, 0x0

    const/4 v9, -0x1

    .line 2826
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "buildWaitingApns: E requestedApnType="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2827
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 2829
    .local v1, "apnList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    const-string v7, "dun"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 2830
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->fetchDunApn()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v2

    .line 2831
    .local v2, "dun":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    if-eqz v2, :cond_0

    .line 2832
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2833
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "buildWaitingApns: X added APN_TYPE_DUN apnList="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2909
    .end local v2    # "dun":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :goto_0
    return-object v1

    .line 2838
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v5

    .line 2844
    .local v5, "operator":Ljava/lang/String;
    const/4 v6, 0x1

    .line 2846
    .local v6, "usePreferred":Z
    :try_start_0
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v7}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, #android:bool@config_dontPreferApn#t

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getBoolean(I)Z
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    if-nez v7, :cond_3

    const/4 v6, 0x1

    .line 2852
    :goto_1
    if-eqz v6, :cond_1

    .line 2853
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getPreferredApn()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v7

    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 2856
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "buildWaitingApns: usePreferred="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " canSetPreferApn="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-boolean v8, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCanSetPreferApn:Z

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " mPreferredApn="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " operator="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " radioTech="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2862
    if-eqz v6, :cond_5

    iget-boolean v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCanSetPreferApn:Z

    if-eqz v7, :cond_5

    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    if-eqz v7, :cond_5

    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    invoke-virtual {v7, p1}, Lcom/android/internal/telephony/dataconnection/ApnSetting;->canHandleType(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 2865
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "buildWaitingApns: Preferred APN:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    iget-object v8, v8, Lcom/android/internal/telephony/dataconnection/ApnSetting;->numeric:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ":"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2868
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    iget-object v7, v7, Lcom/android/internal/telephony/dataconnection/ApnSetting;->numeric:Ljava/lang/String;

    if-eqz v7, :cond_7

    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    iget-object v7, v7, Lcom/android/internal/telephony/dataconnection/ApnSetting;->numeric:Ljava/lang/String;

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    .line 2869
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    iget v7, v7, Lcom/android/internal/telephony/dataconnection/ApnSetting;->bearer:I

    if-eqz v7, :cond_2

    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    iget v7, v7, Lcom/android/internal/telephony/dataconnection/ApnSetting;->bearer:I

    if-ne v7, p2, :cond_4

    .line 2870
    :cond_2
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2871
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "buildWaitingApns: X added preferred apnList="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2846
    :cond_3
    const/4 v6, 0x0

    goto/16 :goto_1

    .line 2848
    :catch_0
    move-exception v3

    .line 2849
    .local v3, "e":Landroid/content/res/Resources$NotFoundException;
    const-string v7, "buildWaitingApns: usePreferred NotFoundException set to true"

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2850
    const/4 v6, 0x1

    goto/16 :goto_1

    .line 2874
    .end local v3    # "e":Landroid/content/res/Resources$NotFoundException;
    :cond_4
    const-string v7, "buildWaitingApns: no preferred APN"

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2875
    invoke-direct {p0, v9}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setPreferredApn(I)V

    .line 2876
    iput-object v10, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 2884
    :cond_5
    :goto_2
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_a

    .line 2885
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "buildWaitingApns: mAllApnSettings="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2886
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 2887
    .local v0, "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "buildWaitingApns: apn="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2888
    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/dataconnection/ApnSetting;->canHandleType(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 2889
    iget v7, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->bearer:I

    if-eqz v7, :cond_6

    iget v7, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->bearer:I

    if-ne v7, p2, :cond_8

    .line 2890
    :cond_6
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "buildWaitingApns: adding apn="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnSetting;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2891
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 2879
    .end local v0    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_7
    const-string v7, "buildWaitingApns: no preferred APN"

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2880
    invoke-direct {p0, v9}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setPreferredApn(I)V

    .line 2881
    iput-object v10, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    goto :goto_2

    .line 2894
    .restart local v0    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .restart local v4    # "i$":Ljava/util/Iterator;
    :cond_8
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "buildWaitingApns: bearer:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->bearer:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " != "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "radioTech:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 2900
    :cond_9
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "buildWaitingApns: couldn\'t handle requesedApnType="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 2906
    .end local v0    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_a
    const-string v7, "mAllApnSettings is null!"

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    .line 2908
    :cond_b
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "buildWaitingApns: X apnList="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private cancelReconnectAlarm(Lcom/android/internal/telephony/dataconnection/ApnContext;)V
    .locals 4
    .param p1, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;

    .prologue
    .line 1236
    if-nez p1, :cond_1

    .line 1246
    :cond_0
    :goto_0
    return-void

    .line 1238
    :cond_1
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReconnectIntent()Landroid/app/PendingIntent;

    move-result-object v1

    .line 1240
    .local v1, "intent":Landroid/app/PendingIntent;
    if-eqz v1, :cond_0

    .line 1241
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "alarm"

    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 1243
    .local v0, "am":Landroid/app/AlarmManager;
    invoke-virtual {v0, v1}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 1244
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReconnectIntent(Landroid/app/PendingIntent;)V

    goto :goto_0
.end method

.method private checkForCompatibleConnectedApnContext(Lcom/android/internal/telephony/dataconnection/ApnContext;)Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    .locals 10
    .param p1, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;

    .prologue
    .line 1870
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v1

    .line 1871
    .local v1, "apnType":Ljava/lang/String;
    const/4 v4, 0x0

    .line 1873
    .local v4, "dunSetting":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    const-string v8, "dun"

    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1874
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->fetchDunApn()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v4

    .line 1877
    :cond_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "checkForCompatibleConnectedApnContext: apnContext="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1880
    const/4 v7, 0x0

    .line 1881
    .local v7, "potentialDcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    const/4 v6, 0x0

    .line 1882
    .local v6, "potentialApnCtx":Lcom/android/internal/telephony/dataconnection/ApnContext;
    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v8}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 1883
    .local v2, "curApnCtx":Lcom/android/internal/telephony/dataconnection/ApnContext;
    invoke-virtual {v2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDcAc()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v3

    .line 1884
    .local v3, "curDcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "curDcac: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1885
    if-eqz v3, :cond_1

    .line 1886
    invoke-virtual {v2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnSetting()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v0

    .line 1887
    .local v0, "apnSetting":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "apnSetting: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1888
    if-eqz v4, :cond_2

    .line 1889
    invoke-virtual {v4, v0}, Lcom/android/internal/telephony/dataconnection/ApnSetting;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1890
    sget-object v8, Lcom/android/internal/telephony/dataconnection/DcTracker$2;->$SwitchMap$com$android$internal$telephony$DctConstants$State:[I

    invoke-virtual {v2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/internal/telephony/DctConstants$State;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_0

    goto :goto_0

    .line 1893
    :pswitch_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "checkForCompatibleConnectedApnContext: found dun conn="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " curApnCtx="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1954
    .end local v0    # "apnSetting":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .end local v2    # "curApnCtx":Lcom/android/internal/telephony/dataconnection/ApnContext;
    .end local v3    # "curDcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    :goto_1
    return-object v3

    .line 1900
    .restart local v0    # "apnSetting":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .restart local v2    # "curApnCtx":Lcom/android/internal/telephony/dataconnection/ApnContext;
    .restart local v3    # "curDcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    :pswitch_1
    move-object v7, v3

    .line 1901
    move-object v6, v2

    .line 1902
    goto :goto_0

    .line 1905
    :pswitch_2
    if-nez v7, :cond_1

    .line 1906
    move-object v7, v3

    .line 1907
    move-object v6, v2

    goto/16 :goto_0

    .line 1914
    :cond_2
    if-eqz v0, :cond_1

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/ApnSetting;->canHandleType(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1915
    sget-object v8, Lcom/android/internal/telephony/dataconnection/DcTracker$2;->$SwitchMap$com$android$internal$telephony$DctConstants$State:[I

    invoke-virtual {v2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v9

    invoke-virtual {v9}, Lcom/android/internal/telephony/DctConstants$State;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_1

    goto/16 :goto_0

    .line 1918
    :pswitch_3
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "checkForCompatibleConnectedApnContext: found canHandle conn="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " curApnCtx="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 1925
    :pswitch_4
    move-object v7, v3

    .line 1926
    move-object v6, v2

    .line 1927
    goto/16 :goto_0

    .line 1930
    :pswitch_5
    if-nez v7, :cond_1

    .line 1931
    move-object v7, v3

    .line 1932
    move-object v6, v2

    goto/16 :goto_0

    .line 1945
    .end local v0    # "apnSetting":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .end local v2    # "curApnCtx":Lcom/android/internal/telephony/dataconnection/ApnContext;
    .end local v3    # "curDcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    :cond_3
    if-eqz v7, :cond_4

    .line 1947
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "checkForCompatibleConnectedApnContext: found potential conn="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " curApnCtx="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    move-object v3, v7

    .line 1950
    goto :goto_1

    .line 1953
    :cond_4
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "checkForCompatibleConnectedApnContext: NO conn apnContext="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1954
    const/4 v3, 0x0

    goto/16 :goto_1

    .line 1890
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_1
    .end packed-switch

    .line 1915
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_5
        :pswitch_4
        :pswitch_4
    .end packed-switch
.end method

.method private create3gppApnsList()Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/dataconnection/ApnSetting;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 2620
    const/4 v6, 0x0

    .line 2621
    .local v6, "apnsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mSimRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/internal/telephony/uicc/IccRecords;

    .line 2622
    .local v9, "r":Lcom/android/internal/telephony/uicc/IccRecords;
    if-eqz v9, :cond_2

    invoke-virtual {v9}, Lcom/android/internal/telephony/uicc/IccRecords;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v8

    .line 2623
    .local v8, "operator":Ljava/lang/String;
    :goto_0
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 2624
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "numeric = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2627
    .local v3, "selection":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " and carrier_enabled = 1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2628
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "create3gppApnList: selection="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2630
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Telephony$Carriers;->CONTENT_URI:Landroid/net/Uri;

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 2633
    .local v7, "cursor":Landroid/database/Cursor;
    if-eqz v7, :cond_1

    .line 2634
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 2635
    invoke-direct {p0, v7, v9}, Lcom/android/internal/telephony/dataconnection/DcTracker;->createApnList(Landroid/database/Cursor;Lcom/android/internal/telephony/uicc/IccRecords;)Ljava/util/ArrayList;

    move-result-object v6

    .line 2637
    :cond_0
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 2640
    .end local v3    # "selection":Ljava/lang/String;
    .end local v7    # "cursor":Landroid/database/Cursor;
    :cond_1
    return-object v6

    .line 2622
    .end local v8    # "operator":Ljava/lang/String;
    :cond_2
    const-string v8, ""

    goto :goto_0
.end method

.method private createAllApnList()V
    .locals 10

    .prologue
    const/4 v2, 0x0

    .line 2559
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2560
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v8

    .line 2561
    .local v8, "operator":Ljava/lang/String;
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v9

    .line 2563
    .local v9, "radioTech":I
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOmhApt:Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;

    if-eqz v0, :cond_0

    invoke-static {v9}, Landroid/telephony/ServiceState;->isCdma(I)Z

    move-result v0

    if-eqz v0, :cond_0

    const/16 v0, 0xd

    if-eq v0, v9, :cond_0

    .line 2565
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 2566
    .local v7, "mOmhApnsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOmhApt:Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;->getOmhApnProfilesList()Ljava/util/ArrayList;

    move-result-object v7

    .line 2567
    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2568
    const-string v0, "createAllApnList: Copy Omh profiles"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2569
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2573
    .end local v7    # "mOmhApnsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    :cond_0
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2574
    if-eqz v8, :cond_2

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 2575
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "numeric = \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2578
    .local v3, "selection":Ljava/lang/String;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " and carrier_enabled = 1"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 2579
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "createAllApnList: selection="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2581
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Telephony$Carriers;->CONTENT_URI:Landroid/net/Uri;

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 2584
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_2

    .line 2585
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_1

    .line 2586
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/uicc/IccRecords;

    invoke-direct {p0, v6, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->createApnList(Landroid/database/Cursor;Lcom/android/internal/telephony/uicc/IccRecords;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2588
    :cond_1
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2593
    .end local v3    # "selection":Ljava/lang/String;
    .end local v6    # "cursor":Landroid/database/Cursor;
    :cond_2
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->dedupeApnSettings()V

    .line 2595
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isDummyProfileNeeded()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2596
    invoke-direct {p0, v8}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addDummyApnSettings(Ljava/lang/String;)V

    .line 2599
    :cond_3
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addEmergencyApnSetting()V

    .line 2601
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 2602
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "createAllApnList: No APN found for carrier: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2603
    iput-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 2614
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "createAllApnList: X mAllApnSettings="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2616
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setDataProfilesAsNeeded()V

    .line 2617
    return-void

    .line 2607
    :cond_4
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getPreferredApn()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 2608
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->numeric:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    .line 2609
    iput-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 2610
    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setPreferredApn(I)V

    .line 2612
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "createAllApnList: mPreferredApn="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private createApnList(Landroid/database/Cursor;Lcom/android/internal/telephony/uicc/IccRecords;)Ljava/util/ArrayList;
    .locals 6
    .param p1, "cursor"    # Landroid/database/Cursor;
    .param p2, "r"    # Lcom/android/internal/telephony/uicc/IccRecords;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/Cursor;",
            "Lcom/android/internal/telephony/uicc/IccRecords;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/android/internal/telephony/dataconnection/ApnSetting;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1360
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1361
    .local v1, "mnoApns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 1363
    .local v2, "mvnoApns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    invoke-interface {p1}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1365
    :cond_0
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->makeApnSetting(Landroid/database/Cursor;)Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v0

    .line 1366
    .local v0, "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    if-nez v0, :cond_3

    .line 1377
    :cond_1
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v4

    if-nez v4, :cond_0

    .line 1380
    .end local v0    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :cond_2
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_5

    move-object v3, v1

    .line 1381
    .local v3, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "createApnList: X result="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1382
    return-object v3

    .line 1370
    .end local v3    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    .restart local v0    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :cond_3
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnSetting;->hasMvnoParams()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 1371
    if-eqz p2, :cond_1

    iget-object v4, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mvnoType:Ljava/lang/String;

    iget-object v5, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mvnoMatchData:Ljava/lang/String;

    invoke-virtual {p0, p2, v4, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->mvnoMatches(Lcom/android/internal/telephony/uicc/IccRecords;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1372
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1375
    :cond_4
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .end local v0    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :cond_5
    move-object v3, v2

    .line 1380
    goto :goto_1
.end method

.method private createDataConnection()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    .locals 7

    .prologue
    .line 2791
    const-string v4, "createDataConnection E"

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2793
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mUniqueIdGenerator:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v2

    .line 2794
    .local v2, "id":I
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDcTesterFailBringUpAll:Lcom/android/internal/telephony/dataconnection/DcTesterFailBringUpAll;

    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDcc:Lcom/android/internal/telephony/dataconnection/DcController;

    invoke-static {v4, v2, p0, v5, v6}, Lcom/android/internal/telephony/dataconnection/DataConnection;->makeDataConnection(Lcom/android/internal/telephony/PhoneBase;ILcom/android/internal/telephony/dataconnection/DcTrackerBase;Lcom/android/internal/telephony/dataconnection/DcTesterFailBringUpAll;Lcom/android/internal/telephony/dataconnection/DcController;)Lcom/android/internal/telephony/dataconnection/DataConnection;

    move-result-object v0

    .line 2796
    .local v0, "conn":Lcom/android/internal/telephony/dataconnection/DataConnection;
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDataConnections:Ljava/util/HashMap;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2797
    new-instance v1, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->LOG_TAG:Ljava/lang/String;

    invoke-direct {v1, v0, v4}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;-><init>(Lcom/android/internal/telephony/dataconnection/DataConnection;Ljava/lang/String;)V

    .line 2798
    .local v1, "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/DataConnection;->getHandler()Landroid/os/Handler;

    move-result-object v5

    invoke-virtual {v1, v4, p0, v5}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->fullyConnectSync(Landroid/content/Context;Landroid/os/Handler;Landroid/os/Handler;)I

    move-result v3

    .line 2799
    .local v3, "status":I
    if-nez v3, :cond_0

    .line 2800
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDataConnectionAcHashMap:Ljava/util/HashMap;

    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->getDataConnectionIdSync()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2805
    :goto_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "createDataConnection() X id="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " dc="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2806
    return-object v1

    .line 2802
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "createDataConnection: Could not connect to dcac="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " status="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private dataConnectionNotInUse(Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;)Z
    .locals 4
    .param p1, "dcac"    # Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    .prologue
    .line 1386
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dataConnectionNotInUse: check if dcac is inuse dcac="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1387
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 1388
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDcAc()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v2

    if-ne v2, p1, :cond_0

    .line 1389
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "dataConnectionNotInUse: in use by apnContext="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1390
    const/4 v2, 0x0

    .line 1399
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :goto_0
    return v2

    .line 1396
    :cond_1
    const-string v2, "dataConnectionNotInUse: tearDownAll"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1397
    const-string v2, "No connection"

    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->tearDownAll(Ljava/lang/String;Landroid/os/Message;)V

    .line 1398
    const-string v2, "dataConnectionNotInUse: not in use return true"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1399
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private dedupeApnSettings()V
    .locals 7

    .prologue
    .line 2644
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 2648
    .local v4, "resultApns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    const/4 v1, 0x0

    .line 2649
    .local v1, "i":I
    :goto_0
    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    if-ge v1, v6, :cond_2

    .line 2650
    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 2651
    .local v0, "first":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    const/4 v5, 0x0

    .line 2652
    .local v5, "second":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    add-int/lit8 v2, v1, 0x1

    .line 2653
    .local v2, "j":I
    :goto_1
    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v2, v6, :cond_1

    .line 2654
    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "second":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    check-cast v5, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 2655
    .restart local v5    # "second":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    invoke-direct {p0, v0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->apnsSimilar(Lcom/android/internal/telephony/dataconnection/ApnSetting;Lcom/android/internal/telephony/dataconnection/ApnSetting;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2656
    invoke-direct {p0, v0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->mergeApns(Lcom/android/internal/telephony/dataconnection/ApnSetting;Lcom/android/internal/telephony/dataconnection/ApnSetting;)Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v3

    .line 2657
    .local v3, "newApn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v6, v1, v3}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 2658
    move-object v0, v3

    .line 2659
    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v6, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_1

    .line 2661
    .end local v3    # "newApn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 2664
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 2665
    goto :goto_0

    .line 2666
    .end local v0    # "first":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .end local v2    # "j":I
    .end local v5    # "second":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :cond_2
    return-void
.end method

.method private destroyDataConnections()V
    .locals 1

    .prologue
    .line 2810
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDataConnections:Ljava/util/HashMap;

    if-eqz v0, :cond_0

    .line 2811
    const-string v0, "destroyDataConnections: clear mDataConnectionList"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2812
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDataConnections:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 2816
    :goto_0
    return-void

    .line 2814
    :cond_0
    const-string v0, "destroyDataConnections: mDataConnecitonList is empty, ignore"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private findDataConnectionAcByCid(I)Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    .locals 3
    .param p1, "cid"    # I

    .prologue
    .line 1604
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDataConnectionAcHashMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    .line 1605
    .local v0, "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->getCidSync()I

    move-result v2

    if-ne v2, p1, :cond_0

    .line 1609
    .end local v0    # "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    :goto_0
    return-object v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private findFreeDataConnection()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    .locals 4

    .prologue
    .line 1403
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDataConnectionAcHashMap:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    .line 1404
    .local v0, "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->isInactiveSync()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->dataConnectionNotInUse(Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1406
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "findFreeDataConnection: found free DataConnection= dcac="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1413
    .end local v0    # "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    :goto_0
    return-object v0

    .line 1412
    :cond_1
    const-string v2, "findFreeDataConnection: NO free DataConnection"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1413
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private getApnDelay(Ljava/lang/String;)I
    .locals 2
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 2289
    iget-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mFailFast:Z

    if-nez v0, :cond_0

    const-string v0, "nwTypeChanged"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "apnChanged"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2291
    :cond_0
    const-string v0, "persist.radio.apn_ff_delay"

    const/16 v1, 0xbb8

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 2294
    :goto_0
    return v0

    :cond_1
    const-string v0, "persist.radio.apn_delay"

    const/16 v1, 0x4e20

    invoke-static {v0, v1}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v0

    goto :goto_0
.end method

.method private getCellLocationId()I
    .locals 3

    .prologue
    .line 3151
    const/4 v0, -0x1

    .line 3152
    .local v0, "cid":I
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getCellLocation()Landroid/telephony/CellLocation;

    move-result-object v1

    .line 3154
    .local v1, "loc":Landroid/telephony/CellLocation;
    if-eqz v1, :cond_0

    .line 3155
    instance-of v2, v1, Landroid/telephony/gsm/GsmCellLocation;

    if-eqz v2, :cond_1

    .line 3156
    check-cast v1, Landroid/telephony/gsm/GsmCellLocation;

    .end local v1    # "loc":Landroid/telephony/CellLocation;
    invoke-virtual {v1}, Landroid/telephony/gsm/GsmCellLocation;->getCid()I

    move-result v0

    .line 3161
    :cond_0
    :goto_0
    return v0

    .line 3157
    .restart local v1    # "loc":Landroid/telephony/CellLocation;
    :cond_1
    instance-of v2, v1, Landroid/telephony/cdma/CdmaCellLocation;

    if-eqz v2, :cond_0

    .line 3158
    check-cast v1, Landroid/telephony/cdma/CdmaCellLocation;

    .end local v1    # "loc":Landroid/telephony/CellLocation;
    invoke-virtual {v1}, Landroid/telephony/cdma/CdmaCellLocation;->getBaseStationId()I

    move-result v0

    goto :goto_0
.end method

.method private getOperatorNumeric()Ljava/lang/String;
    .locals 4

    .prologue
    .line 2537
    const/4 v1, 0x0

    .line 2539
    .local v1, "result":Ljava/lang/String;
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isNvSubscription()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2540
    const-string v2, "ro.cdma.home.operator.numeric"

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 2543
    :cond_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 2544
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/uicc/IccRecords;

    .line 2545
    .local v0, "r":Lcom/android/internal/telephony/uicc/IccRecords;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/internal/telephony/uicc/IccRecords;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v1

    .line 2546
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getOperatorNumberic - returning from card: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2551
    .end local v0    # "r":Lcom/android/internal/telephony/uicc/IccRecords;
    :goto_1
    return-object v1

    .line 2545
    .restart local v0    # "r":Lcom/android/internal/telephony/uicc/IccRecords;
    :cond_1
    const-string v1, ""

    goto :goto_0

    .line 2548
    .end local v0    # "r":Lcom/android/internal/telephony/uicc/IccRecords;
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "getOperatorNumberic - returning from NV: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private getPreferredApn()Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .locals 13

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    const/4 v3, 0x0

    .line 2949
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 2950
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getPreferredApn: mAllApnSettings is "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    if-nez v0, :cond_1

    const-string v0, "null"

    :goto_0
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2987
    :goto_1
    return-object v3

    .line 2950
    :cond_1
    const-string v0, "empty"

    goto :goto_0

    .line 2954
    :cond_2
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getSubId()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    .line 2955
    .local v10, "subId":Ljava/lang/String;
    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->PREFERAPN_NO_UPDATE_URI_USING_SUBID:Landroid/net/Uri;

    invoke-static {v0, v10}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 2956
    .local v1, "uri":Landroid/net/Uri;
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/String;

    const-string v4, "_id"

    aput-object v4, v2, v11

    const-string v4, "name"

    aput-object v4, v2, v12

    const/4 v4, 0x2

    const-string v5, "apn"

    aput-object v5, v2, v4

    const-string v5, "name ASC"

    move-object v4, v3

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 2960
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_4

    .line 2961
    iput-boolean v12, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCanSetPreferApn:Z

    .line 2965
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getPreferredApn: mRequestedApnType="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mRequestedApnType:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " cursor="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " cursor.count="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    if-eqz v6, :cond_5

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    :goto_3
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2968
    iget-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCanSetPreferApn:Z

    if-eqz v0, :cond_6

    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_6

    .line 2970
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 2971
    const-string v0, "_id"

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v6, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v9

    .line 2972
    .local v9, "pos":I
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :cond_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 2973
    .local v8, "p":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getPreferredApn: apnSetting="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2974
    iget v0, v8, Lcom/android/internal/telephony/dataconnection/ApnSetting;->id:I

    if-ne v0, v9, :cond_3

    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mRequestedApnType:Ljava/lang/String;

    invoke-virtual {v8, v0}, Lcom/android/internal/telephony/dataconnection/ApnSetting;->canHandleType(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 2975
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "getPreferredApn: X found apnSetting"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2976
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    move-object v3, v8

    .line 2977
    goto/16 :goto_1

    .line 2963
    .end local v7    # "i$":Ljava/util/Iterator;
    .end local v8    # "p":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .end local v9    # "pos":I
    :cond_4
    iput-boolean v11, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCanSetPreferApn:Z

    goto/16 :goto_2

    :cond_5
    move v0, v11

    .line 2965
    goto :goto_3

    .line 2982
    :cond_6
    if-eqz v6, :cond_7

    .line 2983
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 2986
    :cond_7
    const-string v0, "getPreferredApn: X not found"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto/16 :goto_1
.end method

.method private getUiccRecords(I)Lcom/android/internal/telephony/uicc/IccRecords;
    .locals 2
    .param p1, "appFamily"    # I

    .prologue
    .line 3165
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v1

    invoke-virtual {v0, v1, p1}, Lcom/android/internal/telephony/uicc/UiccController;->getIccRecords(II)Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v0

    return-object v0
.end method

.method private imsiMatches(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p1, "imsiDB"    # Ljava/lang/String;
    .param p2, "imsiSIM"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 1271
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 1272
    .local v3, "len":I
    const/4 v2, 0x0

    .line 1274
    .local v2, "idxCompare":I
    if-gtz v3, :cond_1

    .line 1285
    :cond_0
    :goto_0
    return v4

    .line 1275
    :cond_1
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v5

    if-gt v3, v5, :cond_0

    .line 1277
    const/4 v1, 0x0

    .local v1, "idx":I
    :goto_1
    if-ge v1, v3, :cond_3

    .line 1278
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1279
    .local v0, "c":C
    const/16 v5, 0x78

    if-eq v0, v5, :cond_2

    const/16 v5, 0x58

    if-eq v0, v5, :cond_2

    invoke-virtual {p2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v5

    if-ne v0, v5, :cond_0

    .line 1277
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 1285
    .end local v0    # "c":C
    :cond_3
    const/4 v4, 0x1

    goto :goto_0
.end method

.method private initEmergencyApnSetting()V
    .locals 7

    .prologue
    const/4 v2, 0x0

    .line 3461
    const-string v3, "type=\"emergency\""

    .line 3462
    .local v3, "selection":Ljava/lang/String;
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/Telephony$Carriers;->CONTENT_URI:Landroid/net/Uri;

    move-object v4, v2

    move-object v5, v2

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 3465
    .local v6, "cursor":Landroid/database/Cursor;
    if-eqz v6, :cond_1

    .line 3466
    invoke-interface {v6}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 3467
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3468
    invoke-direct {p0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->makeApnSetting(Landroid/database/Cursor;)Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mEmergencyApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 3471
    :cond_0
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    .line 3473
    :cond_1
    return-void
.end method

.method private isApnCleanupNeeded()Z
    .locals 9

    .prologue
    .line 1510
    const/4 v1, 0x1

    .line 1511
    .local v1, "cleanUpApn":Z
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 1512
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "cleanUpConnectionsOnUpdatedApns for "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1514
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getWaitingApns()Ljava/util/ArrayList;

    move-result-object v2

    .line 1516
    .local v2, "currentWaitingApns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    if-eqz v2, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isDisconnected()Z

    move-result v7

    if-nez v7, :cond_0

    .line 1517
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v7}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v5

    .line 1518
    .local v5, "radioTech":I
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->buildWaitingApns(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object v6

    .line 1520
    .local v6, "waitingApns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "new waitingApns:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1521
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v8

    if-ne v7, v8, :cond_0

    .line 1522
    const/4 v1, 0x0

    .line 1523
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v3, v7, :cond_0

    .line 1524
    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/android/internal/telephony/dataconnection/ApnSetting;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 1525
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "new waiting apn is different at "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1526
    const/4 v1, 0x1

    .line 1527
    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setWaitingApns(Ljava/util/ArrayList;)V

    goto/16 :goto_0

    .line 1523
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1534
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    .end local v2    # "currentWaitingApns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    .end local v3    # "i":I
    .end local v5    # "radioTech":I
    .end local v6    # "waitingApns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    :cond_2
    return v1
.end method

.method private isDataAllowed(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z
    .locals 3
    .param p1, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;

    .prologue
    const/4 v0, 0x0

    .line 815
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v1

    const-string v2, "default"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v1

    const-string v2, "ia"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v1

    invoke-virtual {v1}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v1

    const/16 v2, 0x12

    if-ne v1, v2, :cond_2

    iget-boolean v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mWwanIwlanCoexistFlag:Z

    if-nez v1, :cond_2

    .line 820
    const-string v1, "Default data call activation not allowed in iwlan."

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 823
    :cond_1
    :goto_0
    return v0

    :cond_2
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isReady()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isDataAllowed()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    goto :goto_0
.end method

.method private isDummyProfileNeeded()Z
    .locals 5

    .prologue
    .line 2750
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v3}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v1

    .line 2751
    .local v1, "radioTech":I
    invoke-static {v1}, Lcom/android/internal/telephony/uicc/UiccController;->getFamilyFromRadioTechnology(I)I

    move-result v2

    .line 2752
    .local v2, "radioTechFam":I
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/uicc/IccRecords;

    .line 2753
    .local v0, "r":Lcom/android/internal/telephony/uicc/IccRecords;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isDummyProfileNeeded: radioTechFam = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2756
    const/4 v3, 0x2

    if-eq v2, v3, :cond_0

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    if-eqz v0, :cond_1

    instance-of v3, v0, Lcom/android/internal/telephony/uicc/RuimRecords;

    if-eqz v3, :cond_1

    :cond_0
    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private isHigherPriorityApnContextActive(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z
    .locals 5
    .param p1, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;

    .prologue
    const/4 v2, 0x0

    .line 1626
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPrioritySortedApnContexts:Ljava/util/PriorityQueue;

    invoke-virtual {v3}, Ljava/util/PriorityQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 1627
    .local v1, "otherContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1632
    .end local v1    # "otherContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :cond_1
    :goto_0
    return v2

    .line 1628
    .restart local v1    # "otherContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :cond_2
    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/DctConstants$State;->FAILED:Lcom/android/internal/telephony/DctConstants$State;

    if-eq v3, v4, :cond_0

    .line 1629
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private isNvSubscription()Z
    .locals 5

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 2520
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v3}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v3

    invoke-virtual {v3}, Landroid/telephony/ServiceState;->getRilVoiceRadioTechnology()I

    move-result v0

    .line 2521
    .local v0, "radioTech":I
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCdmaSsm:Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;

    if-nez v3, :cond_1

    .line 2529
    :cond_0
    :goto_0
    return v1

    .line 2524
    :cond_1
    invoke-static {v0}, Lcom/android/internal/telephony/uicc/UiccController;->getFamilyFromRadioTechnology(I)I

    move-result v3

    const/4 v4, 0x2

    if-ne v3, v4, :cond_0

    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCdmaSsm:Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;

    invoke-virtual {v3}, Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;->getCdmaSubscriptionSource()I

    move-result v3

    if-ne v3, v2, :cond_0

    move v1, v2

    .line 2527
    goto :goto_0
.end method

.method private isOnlySingleDcAllowed(I)Z
    .locals 5
    .param p1, "rilRadioTech"    # I

    .prologue
    .line 1642
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v3}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, #android:array@config_onlySingleDcAllowed#t

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object v2

    .line 1644
    .local v2, "singleDcRats":[I
    const/4 v1, 0x0

    .line 1645
    .local v1, "onlySingleDcAllowed":Z
    sget-boolean v3, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v3, :cond_0

    const-string v3, "persist.telephony.test.singleDc"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 1647
    const/4 v1, 0x1

    .line 1649
    :cond_0
    if-eqz v2, :cond_2

    .line 1650
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_2

    if-nez v1, :cond_2

    .line 1651
    aget v3, v2, v0

    if-ne p1, v3, :cond_1

    const/4 v1, 0x1

    .line 1650
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1655
    .end local v0    # "i":I
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isOnlySingleDcAllowed("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "): "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1656
    return v1
.end method

.method private makeApnSetting(Landroid/database/Cursor;)Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .locals 28
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 1318
    const-string v3, "type"

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    invoke-direct {v0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->parseTypes(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v15

    .line 1320
    .local v15, "types":[Ljava/lang/String;
    new-instance v2, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    const-string v3, "_id"

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v3

    move-object/from16 v0, p1

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    const-string v4, "numeric"

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v4

    move-object/from16 v0, p1

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "name"

    move-object/from16 v0, p1

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v5

    move-object/from16 v0, p1

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    const-string v6, "apn"

    move-object/from16 v0, p1

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v6

    move-object/from16 v0, p1

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "proxy"

    move-object/from16 v0, p1

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v7

    move-object/from16 v0, p1

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/NetworkUtils;->trimV4AddrZeros(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "port"

    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v8

    move-object/from16 v0, p1

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const-string v9, "mmsc"

    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v9

    move-object/from16 v0, p1

    invoke-interface {v0, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/net/NetworkUtils;->trimV4AddrZeros(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "mmsproxy"

    move-object/from16 v0, p1

    invoke-interface {v0, v10}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v10

    move-object/from16 v0, p1

    invoke-interface {v0, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/net/NetworkUtils;->trimV4AddrZeros(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "mmsport"

    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v11

    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const-string v12, "user"

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v12

    move-object/from16 v0, p1

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    const-string v13, "password"

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v13

    move-object/from16 v0, p1

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    const-string v14, "authtype"

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v14

    move-object/from16 v0, p1

    invoke-interface {v0, v14}, Landroid/database/Cursor;->getInt(I)I

    move-result v14

    const-string v16, "protocol"

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v16

    move-object/from16 v0, p1

    move/from16 v1, v16

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    const-string v17, "roaming_protocol"

    move-object/from16 v0, p1

    move-object/from16 v1, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v17

    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v17

    const-string v18, "carrier_enabled"

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v18

    move-object/from16 v0, p1

    move/from16 v1, v18

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v18

    const/16 v19, 0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_0

    const/16 v18, 0x1

    :goto_0
    const-string v19, "bearer"

    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v19

    move-object/from16 v0, p1

    move/from16 v1, v19

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v19

    const-string v20, "profile_id"

    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v20

    move-object/from16 v0, p1

    move/from16 v1, v20

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v20

    const-string v21, "modem_cognitive"

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v21

    move-object/from16 v0, p1

    move/from16 v1, v21

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v21

    const/16 v22, 0x1

    move/from16 v0, v21

    move/from16 v1, v22

    if-ne v0, v1, :cond_1

    const/16 v21, 0x1

    :goto_1
    const-string v22, "max_conns"

    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v22

    move-object/from16 v0, p1

    move/from16 v1, v22

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v22

    const-string v23, "wait_time"

    move-object/from16 v0, p1

    move-object/from16 v1, v23

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v23

    move-object/from16 v0, p1

    move/from16 v1, v23

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v23

    const-string v24, "max_conns_time"

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v24

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v24

    const-string v25, "mtu"

    move-object/from16 v0, p1

    move-object/from16 v1, v25

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v25

    move-object/from16 v0, p1

    move/from16 v1, v25

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v25

    const-string v26, "mvno_type"

    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v26

    move-object/from16 v0, p1

    move/from16 v1, v26

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v26

    const-string v27, "mvno_match_data"

    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    move-result v27

    move-object/from16 v0, p1

    move/from16 v1, v27

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v27

    invoke-direct/range {v2 .. v27}, Lcom/android/internal/telephony/dataconnection/ApnSetting;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIIZIIIILjava/lang/String;Ljava/lang/String;)V

    .line 1356
    .local v2, "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    return-object v2

    .line 1320
    .end local v2    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :cond_0
    const/16 v18, 0x0

    goto/16 :goto_0

    :cond_1
    const/16 v21, 0x0

    goto :goto_1
.end method

.method private mergeApns(Lcom/android/internal/telephony/dataconnection/ApnSetting;Lcom/android/internal/telephony/dataconnection/ApnSetting;)Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .locals 33
    .param p1, "dest"    # Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .param p2, "src"    # Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .prologue
    .line 2727
    new-instance v31, Ljava/util/ArrayList;

    invoke-direct/range {v31 .. v31}, Ljava/util/ArrayList;-><init>()V

    .line 2728
    .local v31, "resultTypes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->types:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    move-object/from16 v0, v31

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 2729
    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->types:[Ljava/lang/String;

    move-object/from16 v28, v0

    .local v28, "arr$":[Ljava/lang/String;
    move-object/from16 v0, v28

    array-length v0, v0

    move/from16 v30, v0

    .local v30, "len$":I
    const/16 v29, 0x0

    .local v29, "i$":I
    :goto_0
    move/from16 v0, v29

    move/from16 v1, v30

    if-ge v0, v1, :cond_1

    aget-object v32, v28, v29

    .line 2730
    .local v32, "srcType":Ljava/lang/String;
    invoke-virtual/range {v31 .. v32}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual/range {v31 .. v32}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2729
    :cond_0
    add-int/lit8 v29, v29, 0x1

    goto :goto_0

    .line 2732
    .end local v32    # "srcType":Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsc:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    move-object/from16 v0, p2

    iget-object v9, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsc:Ljava/lang/String;

    .line 2733
    .local v9, "mmsc":Ljava/lang/String;
    :goto_1
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsProxy:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4

    move-object/from16 v0, p2

    iget-object v10, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsProxy:Ljava/lang/String;

    .line 2734
    .local v10, "mmsProxy":Ljava/lang/String;
    :goto_2
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsPort:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_5

    move-object/from16 v0, p2

    iget-object v11, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsPort:Ljava/lang/String;

    .line 2735
    .local v11, "mmsPort":Ljava/lang/String;
    :goto_3
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->proxy:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6

    move-object/from16 v0, p2

    iget-object v7, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->proxy:Ljava/lang/String;

    .line 2736
    .local v7, "proxy":Ljava/lang/String;
    :goto_4
    move-object/from16 v0, p1

    iget-object v2, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->port:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_7

    move-object/from16 v0, p2

    iget-object v8, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->port:Ljava/lang/String;

    .line 2737
    .local v8, "port":Ljava/lang/String;
    :goto_5
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->protocol:Ljava/lang/String;

    const-string v3, "IPV4V6"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_8

    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->protocol:Ljava/lang/String;

    move-object/from16 v16, v0

    .line 2738
    .local v16, "protocol":Ljava/lang/String;
    :goto_6
    move-object/from16 v0, p2

    iget-object v2, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->roamingProtocol:Ljava/lang/String;

    const-string v3, "IPV4V6"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_9

    move-object/from16 v0, p2

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->roamingProtocol:Ljava/lang/String;

    move-object/from16 v17, v0

    .line 2741
    .local v17, "roamingProtocol":Ljava/lang/String;
    :goto_7
    new-instance v2, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-object/from16 v0, p1

    iget v3, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->id:I

    move-object/from16 v0, p1

    iget-object v4, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->numeric:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v5, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->carrier:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v6, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->apn:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v12, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->user:Ljava/lang/String;

    move-object/from16 v0, p1

    iget-object v13, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->password:Ljava/lang/String;

    move-object/from16 v0, p1

    iget v14, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->authType:I

    const/4 v15, 0x0

    new-array v15, v15, [Ljava/lang/String;

    move-object/from16 v0, v31

    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v15

    check-cast v15, [Ljava/lang/String;

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->carrierEnabled:Z

    move/from16 v18, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->bearer:I

    move/from16 v19, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->profileId:I

    move/from16 v20, v0

    move-object/from16 v0, p1

    iget-boolean v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->modemCognitive:Z

    move/from16 v21, v0

    if-nez v21, :cond_2

    move-object/from16 v0, p2

    iget-boolean v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->modemCognitive:Z

    move/from16 v21, v0

    if-eqz v21, :cond_a

    :cond_2
    const/16 v21, 0x1

    :goto_8
    move-object/from16 v0, p1

    iget v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->maxConns:I

    move/from16 v22, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->waitTime:I

    move/from16 v23, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->maxConnsTime:I

    move/from16 v24, v0

    move-object/from16 v0, p1

    iget v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mtu:I

    move/from16 v25, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mvnoType:Ljava/lang/String;

    move-object/from16 v26, v0

    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mvnoMatchData:Ljava/lang/String;

    move-object/from16 v27, v0

    invoke-direct/range {v2 .. v27}, Lcom/android/internal/telephony/dataconnection/ApnSetting;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZIIZIIIILjava/lang/String;Ljava/lang/String;)V

    return-object v2

    .line 2732
    .end local v7    # "proxy":Ljava/lang/String;
    .end local v8    # "port":Ljava/lang/String;
    .end local v9    # "mmsc":Ljava/lang/String;
    .end local v10    # "mmsProxy":Ljava/lang/String;
    .end local v11    # "mmsPort":Ljava/lang/String;
    .end local v16    # "protocol":Ljava/lang/String;
    .end local v17    # "roamingProtocol":Ljava/lang/String;
    :cond_3
    move-object/from16 v0, p1

    iget-object v9, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsc:Ljava/lang/String;

    goto/16 :goto_1

    .line 2733
    .restart local v9    # "mmsc":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p1

    iget-object v10, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsProxy:Ljava/lang/String;

    goto/16 :goto_2

    .line 2734
    .restart local v10    # "mmsProxy":Ljava/lang/String;
    :cond_5
    move-object/from16 v0, p1

    iget-object v11, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->mmsPort:Ljava/lang/String;

    goto/16 :goto_3

    .line 2735
    .restart local v11    # "mmsPort":Ljava/lang/String;
    :cond_6
    move-object/from16 v0, p1

    iget-object v7, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->proxy:Ljava/lang/String;

    goto/16 :goto_4

    .line 2736
    .restart local v7    # "proxy":Ljava/lang/String;
    :cond_7
    move-object/from16 v0, p1

    iget-object v8, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->port:Ljava/lang/String;

    goto/16 :goto_5

    .line 2737
    .restart local v8    # "port":Ljava/lang/String;
    :cond_8
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->protocol:Ljava/lang/String;

    move-object/from16 v16, v0

    goto/16 :goto_6

    .line 2738
    .restart local v16    # "protocol":Ljava/lang/String;
    :cond_9
    move-object/from16 v0, p1

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->roamingProtocol:Ljava/lang/String;

    move-object/from16 v17, v0

    goto/16 :goto_7

    .line 2741
    .restart local v17    # "roamingProtocol":Ljava/lang/String;
    :cond_a
    const/16 v21, 0x0

    goto :goto_8
.end method

.method private notifyNoData(Lcom/android/internal/telephony/dataconnection/DcFailCause;Lcom/android/internal/telephony/dataconnection/ApnContext;)V
    .locals 3
    .param p1, "lastFailCauseCode"    # Lcom/android/internal/telephony/dataconnection/DcFailCause;
    .param p2, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;

    .prologue
    .line 1736
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "notifyNoData: type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1737
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isPermanentFail(Lcom/android/internal/telephony/dataconnection/DcFailCause;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "default"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1739
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/android/internal/telephony/PhoneBase;->notifyDataConnectionFailed(Ljava/lang/String;Ljava/lang/String;)V

    .line 1741
    :cond_0
    return-void
.end method

.method private onApnChanged()V
    .locals 2

    .prologue
    .line 1504
    const-string v0, "onApnChanged: tryRestartDataConnections"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1505
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->create3gppApnsList()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mSimRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/uicc/IccRecords;

    invoke-virtual {p0, v1, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setInitialAttachApn(Ljava/util/ArrayList;Lcom/android/internal/telephony/uicc/IccRecords;)V

    .line 1506
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isApnCleanupNeeded()Z

    move-result v0

    const-string v1, "apnChanged"

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->tryRestartDataConnections(ZLjava/lang/String;)V

    .line 1507
    return-void
.end method

.method private onDataConnectionAttached()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 845
    const-string v0, "onDataConnectionAttached"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 846
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAttached:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 847
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getOverallState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v0

    sget-object v1, Lcom/android/internal/telephony/DctConstants$State;->CONNECTED:Lcom/android/internal/telephony/DctConstants$State;

    if-ne v0, v1, :cond_1

    .line 848
    const-string v0, "onDataConnectionAttached: start polling notify attached"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 849
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->startNetStatPoll()V

    .line 850
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->startDataStallAlarm(Z)V

    .line 851
    const-string v0, "dataAttached"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyDataConnection(Ljava/lang/String;)V

    .line 856
    :goto_0
    iget-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAutoAttachOnCreationConfig:Z

    if-eqz v0, :cond_0

    .line 857
    iput-boolean v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAutoAttachOnCreation:Z

    .line 859
    :cond_0
    const-string v0, "dataAttached"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setupDataOnConnectableApns(Ljava/lang/String;)V

    .line 860
    return-void

    .line 854
    :cond_1
    const-string v0, "dataAttached"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyOffApnsOfAvailability(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private onModemApnProfileReady()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1592
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mState:Lcom/android/internal/telephony/DctConstants$State;

    sget-object v1, Lcom/android/internal/telephony/DctConstants$State;->FAILED:Lcom/android/internal/telephony/DctConstants$State;

    if-ne v0, v1, :cond_0

    .line 1593
    const-string v0, "psRestrictEnabled"

    invoke-virtual {p0, v2, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(ZLjava/lang/String;)Z

    .line 1595
    :cond_0
    const-string v0, "OMH: onModemApnProfileReady(): Setting up data call"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1596
    const-string v0, "simLoaded"

    invoke-direct {p0, v2, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->tryRestartDataConnections(ZLjava/lang/String;)V

    .line 1597
    return-void
.end method

.method private onNvReady()V
    .locals 1

    .prologue
    .line 1767
    const-string v0, "onNvReady"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1768
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->createAllApnList()V

    .line 1769
    const-string v0, "nvReady"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setupDataOnConnectableApns(Ljava/lang/String;)V

    .line 1770
    return-void
.end method

.method private onRecordsLoaded()V
    .locals 2

    .prologue
    .line 1744
    const-string v0, "onRecordsLoaded: createAllApnList"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1745
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, #android:bool@config_auto_attach_data_on_creation#t

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v0

    iput-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAutoAttachOnCreationConfig:Z

    .line 1748
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOmhApt:Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;

    if-eqz v0, :cond_1

    .line 1749
    const-string v0, "OMH: onRecordsLoaded(): calling loadProfiles()"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1751
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOmhApt:Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;->loadProfiles()V

    .line 1752
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v0, v0, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v0}, Lcom/android/internal/telephony/CommandsInterface;->getRadioState()Lcom/android/internal/telephony/CommandsInterface$RadioState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/CommandsInterface$RadioState;->isOn()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1753
    const-string v0, "onRecordsLoaded: notifying data availability"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1754
    const-string v0, "simLoaded"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyOffApnsOfAvailability(Ljava/lang/String;)V

    .line 1764
    :cond_0
    :goto_0
    return-void

    .line 1757
    :cond_1
    const-string v0, "onRecordsLoaded: createAllApnList"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1758
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v0, v0, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v0}, Lcom/android/internal/telephony/CommandsInterface;->getRadioState()Lcom/android/internal/telephony/CommandsInterface$RadioState;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/CommandsInterface$RadioState;->isOn()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1759
    const-string v0, "onRecordsLoaded: notifying data availability"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1760
    const-string v0, "simLoaded"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyOffApnsOfAvailability(Ljava/lang/String;)V

    .line 1762
    :cond_2
    const/4 v0, 0x0

    const-string v1, "simLoaded"

    invoke-direct {p0, v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->tryRestartDataConnections(ZLjava/lang/String;)V

    goto :goto_0
.end method

.method private onSimNotReady()V
    .locals 2

    .prologue
    .line 1773
    const-string v0, "onSimNotReady"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1775
    const/4 v0, 0x1

    const-string v1, "simNotReady"

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(ZLjava/lang/String;)Z

    .line 1776
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 1777
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAutoAttachOnCreationConfig:Z

    .line 1778
    return-void
.end method

.method private onSimRecordsLoaded()V
    .locals 2

    .prologue
    .line 3248
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->create3gppApnsList()Ljava/util/ArrayList;

    move-result-object v1

    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mSimRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/uicc/IccRecords;

    invoke-virtual {p0, v1, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setInitialAttachApn(Ljava/util/ArrayList;Lcom/android/internal/telephony/uicc/IccRecords;)V

    .line 3249
    return-void
.end method

.method private onWwanIwlanCoexistenceDone(Landroid/os/AsyncResult;)V
    .locals 6
    .param p1, "ar"    # Landroid/os/AsyncResult;

    .prologue
    .line 1563
    iget-object v4, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-eqz v4, :cond_1

    .line 1564
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onWwanIwlanCoexistenceDone: error = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1589
    :cond_0
    :goto_0
    return-void

    .line 1566
    :cond_1
    iget-object v4, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v4, [B

    move-object v0, v4

    check-cast v0, [B

    .line 1567
    .local v0, "array":[B
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onWwanIwlanCoexistenceDone, payload hexdump = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v0}, Lcom/android/internal/telephony/uicc/IccUtils;->bytesToHexString([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1569
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 1570
    .local v1, "oemHookResponse":Ljava/nio/ByteBuffer;
    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 1571
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->get()B

    move-result v2

    .line 1572
    .local v2, "resp":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onWwanIwlanCoexistenceDone: resp = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1574
    if-lez v2, :cond_2

    const/4 v3, 0x1

    .line 1576
    .local v3, "tempStatus":Z
    :goto_1
    iget-boolean v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mWwanIwlanCoexistFlag:Z

    if-ne v4, v3, :cond_3

    .line 1577
    const-string v4, "onWwanIwlanCoexistenceDone: no change in status, ignore."

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1574
    .end local v3    # "tempStatus":Z
    :cond_2
    const/4 v3, 0x0

    goto :goto_1

    .line 1580
    .restart local v3    # "tempStatus":Z
    :cond_3
    iput-boolean v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mWwanIwlanCoexistFlag:Z

    .line 1582
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v4

    invoke-virtual {v4}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v4

    const/16 v5, 0x12

    if-ne v4, v5, :cond_0

    .line 1584
    const-string v4, "notifyDataConnection IWLAN_AVAILABLE"

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1585
    const-string v4, "iwlanAvailable"

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyDataConnection(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private parseTypes(Ljava/lang/String;)[Ljava/lang/String;
    .locals 3
    .param p1, "types"    # Ljava/lang/String;

    .prologue
    .line 1255
    if-eqz p1, :cond_0

    const-string v1, ""

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1256
    :cond_0
    const/4 v1, 0x1

    new-array v0, v1, [Ljava/lang/String;

    .line 1257
    .local v0, "result":[Ljava/lang/String;
    const/4 v1, 0x0

    const-string v2, "*"

    aput-object v2, v0, v1

    .line 1261
    :goto_0
    return-object v0

    .line 1259
    .end local v0    # "result":[Ljava/lang/String;
    :cond_1
    const-string v1, ","

    invoke-virtual {p1, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .restart local v0    # "result":[Ljava/lang/String;
    goto :goto_0
.end method

.method private retryAfterDisconnected(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z
    .locals 3
    .param p1, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;

    .prologue
    .line 1684
    const/4 v1, 0x1

    .line 1685
    .local v1, "retry":Z
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v0

    .line 1687
    .local v0, "reason":Ljava/lang/String;
    const-string v2, "radioTurnedOff"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isOnlySingleDcAllowed(I)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-direct {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isHigherPriorityApnContextActive(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1690
    :cond_0
    const/4 v1, 0x0

    .line 1692
    :cond_1
    return v1
.end method

.method private setPreferredApn(I)V
    .locals 6
    .param p1, "pos"    # I

    .prologue
    const/4 v5, 0x0

    .line 2929
    iget-boolean v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCanSetPreferApn:Z

    if-nez v4, :cond_1

    .line 2930
    const-string v4, "setPreferredApn: X !canSEtPreferApn"

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2946
    :cond_0
    :goto_0
    return-void

    .line 2934
    :cond_1
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneBase;->getSubId()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    .line 2935
    .local v1, "subId":Ljava/lang/String;
    sget-object v4, Lcom/android/internal/telephony/dataconnection/DcTracker;->PREFERAPN_NO_UPDATE_URI_USING_SUBID:Landroid/net/Uri;

    invoke-static {v4, v1}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 2936
    .local v2, "uri":Landroid/net/Uri;
    const-string v4, "setPreferredApn: delete"

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2937
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 2938
    .local v0, "resolver":Landroid/content/ContentResolver;
    invoke-virtual {v0, v2, v5, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 2940
    if-ltz p1, :cond_0

    .line 2941
    const-string v4, "setPreferredApn: insert"

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2942
    new-instance v3, Landroid/content/ContentValues;

    invoke-direct {v3}, Landroid/content/ContentValues;-><init>()V

    .line 2943
    .local v3, "values":Landroid/content/ContentValues;
    const-string v4, "apn_id"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 2944
    invoke-virtual {v0, v2, v3}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    goto :goto_0
.end method

.method private setRadio(Z)V
    .locals 2
    .param p1, "on"    # Z

    .prologue
    .line 409
    const-string v1, "phone"

    invoke-static {v1}, Landroid/os/ServiceManager;->checkService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    invoke-static {v1}, Lcom/android/internal/telephony/ITelephony$Stub;->asInterface(Landroid/os/IBinder;)Lcom/android/internal/telephony/ITelephony;

    move-result-object v0

    .line 411
    .local v0, "phone":Lcom/android/internal/telephony/ITelephony;
    :try_start_0
    invoke-interface {v0, p1}, Lcom/android/internal/telephony/ITelephony;->setRadio(Z)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 415
    :goto_0
    return-void

    .line 412
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private setupData(Lcom/android/internal/telephony/dataconnection/ApnContext;I)Z
    .locals 10
    .param p1, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;
    .param p2, "radioTech"    # I

    .prologue
    const/4 v9, 0x1

    const/4 v1, 0x0

    .line 1417
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "setupData: apnContext="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1419
    const/4 v0, 0x0

    .line 1421
    .local v0, "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getNextWaitingApn()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v7

    .line 1422
    .local v7, "apnSetting":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    if-nez v7, :cond_0

    .line 1423
    const-string v2, "setupData: return for no apn found!"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1497
    :goto_0
    return v1

    .line 1427
    :cond_0
    iget v3, v7, Lcom/android/internal/telephony/dataconnection/ApnSetting;->profileId:I

    .line 1428
    .local v3, "profileId":I
    if-nez v3, :cond_1

    .line 1429
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getApnProfileID(Ljava/lang/String;)I

    move-result v3

    .line 1436
    :cond_1
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v2

    const-string v4, "dun"

    if-ne v2, v4, :cond_2

    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->teardownForDun()Z

    move-result v2

    if-nez v2, :cond_3

    .line 1438
    :cond_2
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->checkForCompatibleConnectedApnContext(Lcom/android/internal/telephony/dataconnection/ApnContext;)Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v0

    .line 1439
    if-eqz v0, :cond_3

    .line 1441
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->getApnSettingSync()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v8

    .line 1442
    .local v8, "dcacApnSetting":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    if-eqz v8, :cond_3

    .line 1444
    move-object v7, v8

    .line 1448
    .end local v8    # "dcacApnSetting":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :cond_3
    if-nez v0, :cond_8

    .line 1449
    invoke-direct {p0, p2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isOnlySingleDcAllowed(I)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1450
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isHigherPriorityApnContextActive(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 1452
    const-string v2, "setupData: Higher priority ApnContext active.  Ignoring call"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1460
    :cond_4
    const-string v2, "SinglePdnArbitration"

    invoke-virtual {p0, v9, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(ZLjava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1464
    const-string v2, "setupData: Some calls are disconnecting first.  Wait and retry"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1469
    :cond_5
    const-string v2, "setupData: Single pdp. Continue setting up data call."

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1472
    :cond_6
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->findFreeDataConnection()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v0

    .line 1474
    if-nez v0, :cond_7

    .line 1475
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->createDataConnection()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v0

    .line 1478
    :cond_7
    if-nez v0, :cond_8

    .line 1479
    const-string v2, "setupData: No free DataConnection and couldn\'t create one, WEIRD"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_0

    .line 1483
    :cond_8
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setupData: dcac="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " apnSetting="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1485
    invoke-virtual {p1, v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setDataConnectionAc(Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;)V

    .line 1486
    invoke-virtual {p1, v7}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setApnSetting(Lcom/android/internal/telephony/dataconnection/ApnSetting;)V

    .line 1487
    sget-object v1, Lcom/android/internal/telephony/DctConstants$State;->CONNECTING:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {p1, v1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 1488
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Lcom/android/internal/telephony/PhoneBase;->notifyDataConnection(Ljava/lang/String;Ljava/lang/String;)V

    .line 1490
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->obtainMessage()Landroid/os/Message;

    move-result-object v6

    .line 1491
    .local v6, "msg":Landroid/os/Message;
    const v1, 0x42000

    iput v1, v6, Landroid/os/Message;->what:I

    .line 1492
    iput-object p1, v6, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 1493
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getInitialMaxRetry()I

    move-result v2

    iget-boolean v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAutoAttachOnCreation:Z

    move-object v1, p1

    move v4, p2

    invoke-virtual/range {v0 .. v6}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->bringUp(Lcom/android/internal/telephony/dataconnection/ApnContext;IIIZLandroid/os/Message;)V

    .line 1496
    const-string v1, "setupData: initing!"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    move v1, v9

    .line 1497
    goto/16 :goto_0
.end method

.method private setupDataOnConnectableApns(Ljava/lang/String;)V
    .locals 4
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 938
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setupDataOnConnectableApns: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 940
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPrioritySortedApnContexts:Ljava/util/PriorityQueue;

    invoke-virtual {v2}, Ljava/util/PriorityQueue;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 941
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setupDataOnConnectableApns: apnContext "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 942
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/DctConstants$State;->FAILED:Lcom/android/internal/telephony/DctConstants$State;

    if-ne v2, v3, :cond_1

    .line 943
    sget-object v2, Lcom/android/internal/telephony/DctConstants$State;->IDLE:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 945
    :cond_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isConnectable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 946
    const-string v2, "setupDataOnConnectableApns: isConnectable() call trySetupData"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 947
    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReason(Ljava/lang/String;)V

    .line 948
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->trySetupData(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z

    goto :goto_0

    .line 951
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :cond_2
    return-void
.end method

.method private startAlarmForReconnect(ILcom/android/internal/telephony/dataconnection/ApnContext;)V
    .locals 10
    .param p1, "delay"    # I
    .param p2, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;

    .prologue
    .line 1696
    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v1

    .line 1698
    .local v1, "apnType":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "com.android.internal.telephony.data-reconnect."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1699
    .local v2, "intent":Landroid/content/Intent;
    const-string v4, "reconnect_alarm_extra_reason"

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1700
    const-string v4, "reconnect_alarm_extra_type"

    invoke-virtual {v2, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1703
    invoke-static {}, Landroid/telephony/SubscriptionManager;->getDefaultDataSubId()I

    move-result v3

    .line 1704
    .local v3, "subId":I
    const-string v4, "subscription"

    invoke-virtual {v2, v4, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1707
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "startAlarmForReconnect: delay="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " action="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " apn="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1711
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v4}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v4

    const/4 v5, 0x0

    const/high16 v6, 0x8000000

    invoke-static {v4, v5, v2, v6}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 1713
    .local v0, "alarmIntent":Landroid/app/PendingIntent;
    invoke-virtual {p2, v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReconnectIntent(Landroid/app/PendingIntent;)V

    .line 1714
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAlarmManager:Landroid/app/AlarmManager;

    const/4 v5, 0x2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    int-to-long v8, p1

    add-long/2addr v6, v8

    invoke-virtual {v4, v5, v6, v7, v0}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 1716
    return-void
.end method

.method private startAlarmForRestartTrySetup(ILcom/android/internal/telephony/dataconnection/ApnContext;)V
    .locals 10
    .param p1, "delay"    # I
    .param p2, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;

    .prologue
    .line 1719
    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v1

    .line 1720
    .local v1, "apnType":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "com.android.internal.telephony.data-restart-trysetup."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 1721
    .local v2, "intent":Landroid/content/Intent;
    const-string v3, "restart_trysetup_alarm_extra_type"

    invoke-virtual {v2, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 1724
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "startAlarmForRestartTrySetup: delay="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " action="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " apn="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1727
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v3}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v3

    const/4 v4, 0x0

    const/high16 v5, 0x8000000

    invoke-static {v3, v4, v2, v5}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 1729
    .local v0, "alarmIntent":Landroid/app/PendingIntent;
    invoke-virtual {p2, v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReconnectIntent(Landroid/app/PendingIntent;)V

    .line 1730
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAlarmManager:Landroid/app/AlarmManager;

    const/4 v4, 0x2

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v6

    int-to-long v8, p1

    add-long/2addr v6, v8

    invoke-virtual {v3, v4, v6, v7, v0}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 1732
    return-void
.end method

.method private teardownForDun()Z
    .locals 3

    .prologue
    const/4 v1, 0x1

    .line 1224
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v0

    .line 1225
    .local v0, "rilRat":I
    invoke-static {v0}, Landroid/telephony/ServiceState;->isCdma(I)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1227
    :cond_0
    :goto_0
    return v1

    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->fetchDunApn()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v2

    if-nez v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0
.end method

.method private tryRestartDataConnections(ZLjava/lang/String;)V
    .locals 5
    .param p1, "isCleanupNeeded"    # Z
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1538
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getOverallState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v1

    .line 1539
    .local v1, "overallState":Lcom/android/internal/telephony/DctConstants$State;
    sget-object v2, Lcom/android/internal/telephony/DctConstants$State;->IDLE:Lcom/android/internal/telephony/DctConstants$State;

    if-eq v1, v2, :cond_0

    sget-object v2, Lcom/android/internal/telephony/DctConstants$State;->FAILED:Lcom/android/internal/telephony/DctConstants$State;

    if-ne v1, v2, :cond_4

    :cond_0
    move v0, v4

    .line 1542
    .local v0, "isDisconnected":Z
    :goto_0
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    instance-of v2, v2, Lcom/android/internal/telephony/gsm/GSMPhone;

    if-eqz v2, :cond_1

    .line 1544
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    check-cast v2, Lcom/android/internal/telephony/gsm/GSMPhone;

    invoke-virtual {v2}, Lcom/android/internal/telephony/gsm/GSMPhone;->updateCurrentCarrierInProvider()Z

    .line 1549
    :cond_1
    const-string v2, "tryRestartDataConnections: createAllApnList and cleanUpAllConnections"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1550
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->createAllApnList()V

    .line 1551
    if-eqz p1, :cond_2

    .line 1552
    if-nez v0, :cond_5

    :goto_1
    invoke-virtual {p0, v4, p2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(ZLjava/lang/String;)Z

    .line 1555
    :cond_2
    if-eqz v0, :cond_3

    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getSubId()I

    move-result v2

    invoke-static {}, Landroid/telephony/SubscriptionManager;->getDefaultDataSubId()I

    move-result v3

    if-ne v2, v3, :cond_3

    .line 1558
    invoke-direct {p0, p2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setupDataOnConnectableApns(Ljava/lang/String;)V

    .line 1560
    :cond_3
    return-void

    .end local v0    # "isDisconnected":Z
    :cond_4
    move v0, v3

    .line 1539
    goto :goto_0

    .restart local v0    # "isDisconnected":Z
    :cond_5
    move v4, v3

    .line 1552
    goto :goto_1
.end method

.method private trySetupData(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z
    .locals 10
    .param p1, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 955
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "trySetupData for type:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " due to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " apnContext="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 957
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "trySetupData with mIsPsRestricted="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-boolean v9, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIsPsRestricted:Z

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 960
    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v8}, Lcom/android/internal/telephony/PhoneBase;->getSimulatedRadioControl()Lcom/android/internal/telephony/test/SimulatedRadioControl;

    move-result-object v8

    if-eqz v8, :cond_0

    .line 963
    sget-object v7, Lcom/android/internal/telephony/DctConstants$State;->CONNECTED:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {p1, v7}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 964
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/android/internal/telephony/PhoneBase;->notifyDataConnection(Ljava/lang/String;Ljava/lang/String;)V

    .line 966
    const-string v7, "trySetupData: X We\'re on the simulator; assuming connected retValue=true"

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    move v7, v6

    .line 1030
    :goto_0
    return v7

    .line 972
    :cond_0
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v8

    const-string v9, "emergency"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    .line 973
    .local v2, "isEmergencyApn":Z
    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v8}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v8

    invoke-virtual {v8}, Lcom/android/internal/telephony/ServiceStateTracker;->getDesiredPowerState()Z

    move-result v1

    .line 974
    .local v1, "desiredPowerState":Z
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v8

    const-string v9, "ims"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_4

    move v0, v6

    .line 978
    .local v0, "checkUserDataEnabled":Z
    :goto_1
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v8

    const-string v9, "mms"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_1

    .line 979
    if-eqz v0, :cond_5

    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v8}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v8

    invoke-virtual {v8}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, #android:bool@config_enable_mms_with_mobile_data_off#t

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v8

    if-nez v8, :cond_5

    move v0, v6

    .line 983
    :cond_1
    :goto_2
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isConnectable()Z

    move-result v6

    if-eqz v6, :cond_9

    if-nez v2, :cond_2

    invoke-direct {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isDataAllowed(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getAnyDataEnabled(Z)Z

    move-result v6

    if-eqz v6, :cond_9

    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isEmergency()Z

    move-result v6

    if-nez v6, :cond_9

    .line 986
    :cond_2
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v6

    sget-object v8, Lcom/android/internal/telephony/DctConstants$State;->FAILED:Lcom/android/internal/telephony/DctConstants$State;

    if-ne v6, v8, :cond_3

    .line 987
    const-string v6, "trySetupData: make a FAILED ApnContext IDLE so its reusable"

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 988
    sget-object v6, Lcom/android/internal/telephony/DctConstants$State;->IDLE:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {p1, v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 990
    :cond_3
    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v6}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v6

    invoke-virtual {v6}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v3

    .line 991
    .local v3, "radioTech":I
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v6

    sget-object v8, Lcom/android/internal/telephony/DctConstants$State;->IDLE:Lcom/android/internal/telephony/DctConstants$State;

    if-ne v6, v8, :cond_7

    .line 993
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v6

    invoke-direct {p0, v6, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->buildWaitingApns(Ljava/lang/String;I)Ljava/util/ArrayList;

    move-result-object v5

    .line 995
    .local v5, "waitingApns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_6

    .line 996
    sget-object v6, Lcom/android/internal/telephony/dataconnection/DcFailCause;->MISSING_UNKNOWN_APN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    invoke-direct {p0, v6, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyNoData(Lcom/android/internal/telephony/dataconnection/DcFailCause;Lcom/android/internal/telephony/dataconnection/ApnContext;)V

    .line 997
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyOffApnsOfAvailability(Ljava/lang/String;)V

    .line 998
    const-string v6, "trySetupData: X No APN found retValue=false"

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .end local v0    # "checkUserDataEnabled":Z
    .end local v3    # "radioTech":I
    .end local v5    # "waitingApns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    :cond_4
    move v0, v7

    .line 974
    goto/16 :goto_1

    .restart local v0    # "checkUserDataEnabled":Z
    :cond_5
    move v0, v7

    .line 979
    goto :goto_2

    .line 1001
    .restart local v3    # "radioTech":I
    .restart local v5    # "waitingApns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    :cond_6
    invoke-virtual {p1, v5}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setWaitingApns(Ljava/util/ArrayList;)V

    .line 1003
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "trySetupData: Create from mAllApnSettings : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-direct {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->apnListToString(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1010
    .end local v5    # "waitingApns":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/dataconnection/ApnSetting;>;"
    :cond_7
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getWaitingApns()Ljava/util/ArrayList;

    move-result-object v6

    if-nez v6, :cond_8

    .line 1011
    const-string v6, "trySetupData: call setupData, waitingApns : null"

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1018
    :goto_3
    invoke-direct {p0, p1, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setupData(Lcom/android/internal/telephony/dataconnection/ApnContext;I)Z

    move-result v4

    .line 1019
    .local v4, "retValue":Z
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyOffApnsOfAvailability(Ljava/lang/String;)V

    .line 1021
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "trySetupData: X retValue="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    move v7, v4

    .line 1022
    goto/16 :goto_0

    .line 1014
    .end local v4    # "retValue":Z
    :cond_8
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "trySetupData: call setupData, waitingApns : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getWaitingApns()Ljava/util/ArrayList;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->apnListToString(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_3

    .line 1024
    .end local v3    # "radioTech":I
    :cond_9
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v6

    const-string v8, "default"

    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_a

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isConnectable()Z

    move-result v6

    if-eqz v6, :cond_a

    .line 1026
    iget-object v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v6, v8, v9}, Lcom/android/internal/telephony/PhoneBase;->notifyDataConnectionFailed(Ljava/lang/String;Ljava/lang/String;)V

    .line 1028
    :cond_a
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyOffApnsOfAvailability(Ljava/lang/String;)V

    .line 1029
    const-string v6, "trySetupData: X apnContext not \'ready\' retValue=false"

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private updateSimRecords()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 3224
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    if-nez v2, :cond_1

    .line 3245
    :cond_0
    :goto_0
    return-void

    .line 3228
    :cond_1
    const/4 v2, 0x1

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getUiccRecords(I)Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v0

    .line 3229
    .local v0, "newSimRecords":Lcom/android/internal/telephony/uicc/IccRecords;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateSimRecords: newSimRecords = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3231
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mSimRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/android/internal/telephony/uicc/IccRecords;

    .line 3232
    .local v1, "r":Lcom/android/internal/telephony/uicc/IccRecords;
    if-eq v1, v0, :cond_0

    .line 3233
    if-eqz v1, :cond_2

    .line 3234
    const-string v2, "Removing stale sim objects."

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3235
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mSimRecordsLoadedHandler:Landroid/os/Handler;

    invoke-virtual {v1, v2}, Lcom/android/internal/telephony/uicc/IccRecords;->unregisterForRecordsLoaded(Landroid/os/Handler;)V

    .line 3236
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mSimRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v4}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 3238
    :cond_2
    if-eqz v0, :cond_0

    .line 3239
    const-string v2, "New sim records found"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3240
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mSimRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 3241
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mSimRecordsLoadedHandler:Landroid/os/Handler;

    const/16 v3, 0x64

    invoke-virtual {v0, v2, v3, v4}, Lcom/android/internal/telephony/uicc/IccRecords;->registerForRecordsLoaded(Landroid/os/Handler;ILjava/lang/Object;)V

    goto :goto_0
.end method

.method private xorEquals(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 1
    .param p1, "first"    # Ljava/lang/String;
    .param p2, "second"    # Ljava/lang/String;

    .prologue
    .line 2721
    invoke-static {p1, p2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public cleanUpAllConnections(Ljava/lang/String;)V
    .locals 1
    .param p1, "cause"    # Ljava/lang/String;

    .prologue
    .line 3272
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(Ljava/lang/String;Landroid/os/Message;)V

    .line 3273
    return-void
.end method

.method public cleanUpAllConnections(Ljava/lang/String;Landroid/os/Message;)V
    .locals 2
    .param p1, "cause"    # Ljava/lang/String;
    .param p2, "disconnectAllCompleteMsg"    # Landroid/os/Message;

    .prologue
    .line 3280
    const-string v1, "cleanUpAllConnections"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3281
    if-eqz p2, :cond_0

    .line 3282
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 3285
    :cond_0
    const v1, 0x4201d

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 3286
    .local v0, "msg":Landroid/os/Message;
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 3287
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->sendMessage(Landroid/os/Message;)Z

    .line 3288
    return-void
.end method

.method protected cleanUpAllConnections(ZLjava/lang/String;)Z
    .locals 6
    .param p1, "tearDown"    # Z
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 1064
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cleanUpAllConnections: tearDown="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " reason="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1065
    const/4 v1, 0x0

    .line 1066
    .local v1, "didDisconnect":Z
    const/4 v3, 0x0

    .line 1068
    .local v3, "specificdisable":Z
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1069
    const-string v4, "specificDisabled"

    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 1072
    :cond_0
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 1073
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isDisconnected()Z

    move-result v4

    if-nez v4, :cond_2

    const/4 v1, 0x1

    .line 1074
    :cond_2
    if-eqz v3, :cond_3

    .line 1075
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v4

    const-string v5, "ims"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1076
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ApnConextType: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1077
    invoke-virtual {v0, p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReason(Ljava/lang/String;)V

    .line 1078
    invoke-virtual {p0, p1, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpConnection(ZLcom/android/internal/telephony/dataconnection/ApnContext;)V

    goto :goto_0

    .line 1082
    :cond_3
    invoke-virtual {v0, p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReason(Ljava/lang/String;)V

    .line 1083
    invoke-virtual {p0, p1, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpConnection(ZLcom/android/internal/telephony/dataconnection/ApnContext;)V

    goto :goto_0

    .line 1087
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :cond_4
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->stopNetStatPoll()V

    .line 1088
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->stopDataStallAlarm()V

    .line 1091
    const-string v4, "default"

    iput-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mRequestedApnType:Ljava/lang/String;

    .line 1093
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cleanUpConnection: mDisconnectPendingCount = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1094
    if-eqz p1, :cond_5

    iget v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    if-nez v4, :cond_5

    .line 1095
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyDataDisconnectComplete()V

    .line 1096
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyAllDataDisconnected()V

    .line 1099
    :cond_5
    return v1
.end method

.method protected cleanUpConnection(ZLcom/android/internal/telephony/dataconnection/ApnContext;)V
    .locals 7
    .param p1, "tearDown"    # Z
    .param p2, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;

    .prologue
    const/4 v6, 0x0

    .line 1119
    if-nez p2, :cond_0

    .line 1120
    const-string v3, "cleanUpConnection: apn context is null"

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1202
    :goto_0
    return-void

    .line 1124
    :cond_0
    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDcAc()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v0

    .line 1126
    .local v0, "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cleanUpConnection: E tearDown="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " reason="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " apnContext="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1129
    if-eqz p1, :cond_a

    .line 1130
    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isDisconnected()Z

    move-result v3

    if-eqz v3, :cond_5

    .line 1133
    sget-object v3, Lcom/android/internal/telephony/DctConstants$State;->IDLE:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {p2, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 1134
    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isReady()Z

    move-result v3

    if-nez v3, :cond_2

    .line 1135
    if-eqz v0, :cond_1

    .line 1136
    const-string v3, ""

    invoke-virtual {v0, p2, v3, v6}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->tearDown(Lcom/android/internal/telephony/dataconnection/ApnContext;Ljava/lang/String;Landroid/os/Message;)V

    .line 1138
    :cond_1
    invoke-virtual {p2, v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setDataConnectionAc(Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;)V

    .line 1186
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOmhApt:Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;

    if-eqz v3, :cond_3

    .line 1187
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOmhApt:Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;

    invoke-virtual {v3}, Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;->clearActiveApnProfile()V

    .line 1192
    :cond_3
    if-eqz v0, :cond_4

    .line 1193
    invoke-direct {p0, p2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cancelReconnectAlarm(Lcom/android/internal/telephony/dataconnection/ApnContext;)V

    .line 1196
    :cond_4
    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setupDataForSinglePdnArbitration(Ljava/lang/String;)V

    .line 1199
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cleanUpConnection: X tearDown="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " reason="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " apnContext="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " dcac="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDcAc()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 1142
    :cond_5
    if-eqz v0, :cond_9

    .line 1143
    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v3

    sget-object v4, Lcom/android/internal/telephony/DctConstants$State;->DISCONNECTING:Lcom/android/internal/telephony/DctConstants$State;

    if-eq v3, v4, :cond_2

    .line 1144
    const/4 v1, 0x0

    .line 1145
    .local v1, "disconnectAll":Z
    const-string v3, "dun"

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1148
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->teardownForDun()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 1149
    const-string v3, "tearing down dedicated DUN connection"

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1154
    const/4 v1, 0x1

    .line 1158
    :cond_6
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "cleanUpConnection: tearing down"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    if-eqz v1, :cond_7

    const-string v3, " all"

    :goto_2
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1160
    const v3, 0x4200f

    invoke-virtual {p0, v3, p2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 1161
    .local v2, "msg":Landroid/os/Message;
    if-eqz v1, :cond_8

    .line 1162
    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDcAc()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v3

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4, v2}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->tearDownAll(Ljava/lang/String;Landroid/os/Message;)V

    .line 1167
    :goto_3
    sget-object v3, Lcom/android/internal/telephony/DctConstants$State;->DISCONNECTING:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {p2, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 1168
    iget v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    goto/16 :goto_1

    .line 1158
    .end local v2    # "msg":Landroid/os/Message;
    :cond_7
    const-string v3, ""

    goto :goto_2

    .line 1164
    .restart local v2    # "msg":Landroid/os/Message;
    :cond_8
    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDcAc()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v3

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, p2, v4, v2}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->tearDown(Lcom/android/internal/telephony/dataconnection/ApnContext;Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_3

    .line 1173
    .end local v1    # "disconnectAll":Z
    .end local v2    # "msg":Landroid/os/Message;
    :cond_9
    sget-object v3, Lcom/android/internal/telephony/DctConstants$State;->IDLE:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {p2, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 1174
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/android/internal/telephony/PhoneBase;->notifyDataConnection(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1180
    :cond_a
    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->reqReset()V

    .line 1181
    :cond_b
    sget-object v3, Lcom/android/internal/telephony/DctConstants$State;->IDLE:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {p2, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 1182
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/android/internal/telephony/PhoneBase;->notifyDataConnection(Ljava/lang/String;Ljava/lang/String;)V

    .line 1183
    invoke-virtual {p2, v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setDataConnectionAc(Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;)V

    goto/16 :goto_1
.end method

.method protected completeConnection(Lcom/android/internal/telephony/dataconnection/ApnContext;)V
    .locals 7
    .param p1, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;

    .prologue
    const/4 v6, 0x0

    .line 2055
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isProvisioningApn()Z

    move-result v1

    .line 2057
    .local v1, "isProvApn":Z
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "completeConnection: successful, notify the world apnContext="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2059
    iget-boolean v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIsProvisioning:Z

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningUrl:Ljava/lang/String;

    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2061
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "completeConnection: MOBILE_PROVISIONING_ACTION url="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningUrl:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2064
    const-string v3, "android.intent.action.MAIN"

    const-string v4, "android.intent.category.APP_BROWSER"

    invoke-static {v3, v4}, Landroid/content/Intent;->makeMainSelectorActivity(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v2

    .line 2066
    .local v2, "newIntent":Landroid/content/Intent;
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningUrl:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 2067
    const/high16 v3, 0x10400000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 2070
    :try_start_0
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v3}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Landroid/content/ActivityNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2075
    .end local v2    # "newIntent":Landroid/content/Intent;
    :cond_0
    :goto_0
    iput-boolean v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIsProvisioning:Z

    .line 2076
    const/4 v3, 0x0

    iput-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningUrl:Ljava/lang/String;

    .line 2077
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningSpinner:Landroid/app/ProgressDialog;

    if-eqz v3, :cond_1

    .line 2078
    const v3, 0x4202a

    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningSpinner:Landroid/app/ProgressDialog;

    invoke-virtual {p0, v3, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->sendMessage(Landroid/os/Message;)Z

    .line 2082
    :cond_1
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/android/internal/telephony/PhoneBase;->notifyDataConnection(Ljava/lang/String;Ljava/lang/String;)V

    .line 2083
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->startNetStatPoll()V

    .line 2084
    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->startDataStallAlarm(Z)V

    .line 2085
    return-void

    .line 2071
    .restart local v2    # "newIntent":Landroid/content/Intent;
    :catch_0
    move-exception v0

    .line 2072
    .local v0, "e":Landroid/content/ActivityNotFoundException;
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "completeConnection: startActivityAsUser failed"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public decApnRefCount(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 377
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 378
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-eqz v0, :cond_0

    .line 379
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->decRefCount()V

    .line 381
    :cond_0
    return-void
.end method

.method public dispose()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 311
    const-string v0, "DcTracker.dispose"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 313
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisionBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 314
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisionBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 315
    iput-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisionBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 317
    :cond_0
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningSpinner:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_1

    .line 318
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningSpinner:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 319
    iput-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningSpinner:Landroid/app/ProgressDialog;

    .line 322
    :cond_1
    const/4 v0, 0x1

    invoke-virtual {p0, v0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(ZLjava/lang/String;)Z

    .line 324
    invoke-super {p0}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;->dispose()V

    .line 326
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnObserver:Lcom/android/internal/telephony/dataconnection/DcTracker$ApnChangeObserver;

    invoke-virtual {v0, v1}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 327
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0}, Ljava/util/concurrent/ConcurrentHashMap;->clear()V

    .line 328
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPrioritySortedApnContexts:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->clear()V

    .line 330
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCdmaSsm:Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;

    if-eqz v0, :cond_2

    .line 331
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCdmaSsm:Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;

    invoke-virtual {v0, p0}, Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;->dispose(Landroid/os/Handler;)V

    .line 334
    :cond_2
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOmhApt:Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;

    if-eqz v0, :cond_3

    .line 335
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOmhApt:Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;

    invoke-virtual {v0, p0}, Lcom/android/internal/telephony/dataconnection/CdmaApnProfileTracker;->unregisterForModemProfileReady(Landroid/os/Handler;)V

    .line 337
    :cond_3
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->unregisterForAllEvents()V

    .line 339
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->destroyDataConnections()V

    .line 340
    return-void
.end method

.method public dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V
    .locals 2
    .param p1, "fd"    # Ljava/io/FileDescriptor;
    .param p2, "pw"    # Ljava/io/PrintWriter;
    .param p3, "args"    # [Ljava/lang/String;

    .prologue
    .line 3390
    const-string v0, "DcTracker extends:"

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3391
    invoke-super {p0, p1, p2, p3}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;->dump(Ljava/io/FileDescriptor;Ljava/io/PrintWriter;[Ljava/lang/String;)V

    .line 3392
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " mReregisterOnReconnectFailure="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mReregisterOnReconnectFailure:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3393
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " canSetPreferApn="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCanSetPreferApn:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3394
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " mApnObserver="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnObserver:Lcom/android/internal/telephony/dataconnection/DcTracker$ApnChangeObserver;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3395
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " getOverallState="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getOverallState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3396
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " mDataConnectionAsyncChannels=%s\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDataConnectionAcHashMap:Ljava/util/HashMap;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3397
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, " mAttached="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAttached:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 3398
    return-void
.end method

.method protected finalize()V
    .locals 1

    .prologue
    .line 546
    const-string v0, "finalize"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 547
    return-void
.end method

.method public getActiveApnString(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "apnType"    # Ljava/lang/String;

    .prologue
    .line 669
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 670
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-eqz v0, :cond_0

    .line 671
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnSetting()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v1

    .line 672
    .local v1, "apnSetting":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    if-eqz v1, :cond_0

    .line 673
    iget-object v2, v1, Lcom/android/internal/telephony/dataconnection/ApnSetting;->apn:Ljava/lang/String;

    .line 676
    .end local v1    # "apnSetting":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :goto_0
    return-object v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public getActiveApnTypes()[Ljava/lang/String;
    .locals 4

    .prologue
    .line 653
    const-string v3, "get all active apn types"

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 654
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 656
    .local v2, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 657
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAttached:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isReady()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 658
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 662
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :cond_1
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/String;

    return-object v3
.end method

.method public getAnyDataEnabled()Z
    .locals 5

    .prologue
    const/4 v2, 0x0

    .line 782
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDataEnabledLock:Ljava/lang/Object;

    monitor-enter v3

    .line 783
    :try_start_0
    iget-boolean v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mInternalDataEnabled:Z

    if-eqz v4, :cond_0

    iget-boolean v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mUserDataEnabled:Z

    if-eqz v4, :cond_0

    sget-boolean v4, Lcom/android/internal/telephony/dataconnection/DcTracker;->sPolicyDataEnabled:Z

    if-nez v4, :cond_1

    :cond_0
    monitor-exit v3

    .line 791
    :goto_0
    return v2

    .line 784
    :cond_1
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 787
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isDataAllowed(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 788
    const/4 v2, 0x1

    monitor-exit v3

    goto :goto_0

    .line 792
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 791
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_3
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public getAnyDataEnabled(Z)Z
    .locals 5
    .param p1, "checkUserDataEnabled"    # Z

    .prologue
    const/4 v2, 0x0

    .line 796
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDataEnabledLock:Ljava/lang/Object;

    monitor-enter v3

    .line 797
    :try_start_0
    iget-boolean v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mInternalDataEnabled:Z

    if-eqz v4, :cond_1

    if-eqz p1, :cond_0

    iget-boolean v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mUserDataEnabled:Z

    if-eqz v4, :cond_1

    :cond_0
    if-eqz p1, :cond_2

    sget-boolean v4, Lcom/android/internal/telephony/dataconnection/DcTracker;->sPolicyDataEnabled:Z

    if-nez v4, :cond_2

    .line 799
    :cond_1
    monitor-exit v3

    .line 808
    :goto_0
    return v2

    .line 801
    :cond_2
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v4}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 804
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isDataAllowed(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 805
    const/4 v2, 0x1

    monitor-exit v3

    goto :goto_0

    .line 809
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2

    .line 808
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_4
    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public getApnPriority(Ljava/lang/String;)I
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 400
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 401
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-nez v0, :cond_0

    .line 402
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Request for unsupported mobile name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    .line 404
    :cond_0
    iget v1, v0, Lcom/android/internal/telephony/dataconnection/ApnContext;->priority:I

    return v1
.end method

.method protected getApnProfileID(Ljava/lang/String;)I
    .locals 2
    .param p1, "apnType"    # Ljava/lang/String;

    .prologue
    const/4 v0, 0x0

    .line 3133
    const-string v1, "ims"

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3134
    const/4 v0, 0x2

    .line 3146
    :cond_0
    :goto_0
    return v0

    .line 3135
    :cond_1
    const-string v1, "fota"

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 3136
    const/4 v0, 0x3

    goto :goto_0

    .line 3137
    :cond_2
    const-string v1, "cbs"

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 3138
    const/4 v0, 0x4

    goto :goto_0

    .line 3139
    :cond_3
    const-string v1, "ia"

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 3141
    const-string v1, "dun"

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 3142
    const/4 v0, 0x1

    goto :goto_0

    .line 3143
    :cond_4
    const-string v1, "mms"

    invoke-static {p1, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3144
    sget v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->MMS_DATA_PROFILE:I

    goto :goto_0
.end method

.method public getLinkProperties(Ljava/lang/String;)Landroid/net/LinkProperties;
    .locals 4
    .param p1, "apnType"    # Ljava/lang/String;

    .prologue
    .line 622
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 623
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-eqz v0, :cond_0

    .line 624
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDcAc()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v1

    .line 625
    .local v1, "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    if-eqz v1, :cond_0

    .line 626
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "return link properites for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 627
    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->getLinkPropertiesSync()Landroid/net/LinkProperties;

    move-result-object v2

    .line 631
    .end local v1    # "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    :goto_0
    return-object v2

    .line 630
    :cond_0
    const-string v2, "return new LinkProperties"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 631
    new-instance v2, Landroid/net/LinkProperties;

    invoke-direct {v2}, Landroid/net/LinkProperties;-><init>()V

    goto :goto_0
.end method

.method public getNetworkCapabilities(Ljava/lang/String;)Landroid/net/NetworkCapabilities;
    .locals 4
    .param p1, "apnType"    # Ljava/lang/String;

    .prologue
    .line 636
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 637
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-eqz v0, :cond_0

    .line 638
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDcAc()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v1

    .line 639
    .local v1, "dataConnectionAc":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    if-eqz v1, :cond_0

    .line 641
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "get active pdp is not null, return NetworkCapabilities for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 643
    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->getNetworkCapabilitiesSync()Landroid/net/NetworkCapabilities;

    move-result-object v2

    .line 647
    .end local v1    # "dataConnectionAc":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    :goto_0
    return-object v2

    .line 646
    :cond_0
    const-string v2, "return new NetworkCapabilities"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 647
    new-instance v2, Landroid/net/NetworkCapabilities;

    invoke-direct {v2}, Landroid/net/NetworkCapabilities;-><init>()V

    goto :goto_0
.end method

.method public getOverallState()Lcom/android/internal/telephony/DctConstants$State;
    .locals 7

    .prologue
    .line 716
    const/4 v3, 0x0

    .line 717
    .local v3, "isConnecting":Z
    const/4 v4, 0x1

    .line 718
    .local v4, "isFailed":Z
    const/4 v2, 0x0

    .line 720
    .local v2, "isAnyEnabled":Z
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v5}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 721
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isEnabled()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 722
    const/4 v2, 0x1

    .line 723
    sget-object v5, Lcom/android/internal/telephony/dataconnection/DcTracker$2;->$SwitchMap$com$android$internal$telephony$DctConstants$State:[I

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v6

    invoke-virtual {v6}, Lcom/android/internal/telephony/DctConstants$State;->ordinal()I

    move-result v6

    aget v5, v5, v6

    packed-switch v5, :pswitch_data_0

    .line 738
    const/4 v2, 0x1

    goto :goto_0

    .line 726
    :pswitch_0
    const-string v5, "overall state is CONNECTED"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 727
    sget-object v5, Lcom/android/internal/telephony/DctConstants$State;->CONNECTED:Lcom/android/internal/telephony/DctConstants$State;

    .line 757
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :goto_1
    return-object v5

    .line 730
    .restart local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :pswitch_1
    const/4 v3, 0x1

    .line 731
    const/4 v4, 0x0

    .line 732
    goto :goto_0

    .line 735
    :pswitch_2
    const/4 v4, 0x0

    .line 736
    goto :goto_0

    .line 744
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :cond_1
    if-nez v2, :cond_2

    .line 745
    const-string v5, "overall state is IDLE"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 746
    sget-object v5, Lcom/android/internal/telephony/DctConstants$State;->IDLE:Lcom/android/internal/telephony/DctConstants$State;

    goto :goto_1

    .line 749
    :cond_2
    if-eqz v3, :cond_3

    .line 750
    const-string v5, "overall state is CONNECTING"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 751
    sget-object v5, Lcom/android/internal/telephony/DctConstants$State;->CONNECTING:Lcom/android/internal/telephony/DctConstants$State;

    goto :goto_1

    .line 752
    :cond_3
    if-nez v4, :cond_4

    .line 753
    const-string v5, "overall state is IDLE"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 754
    sget-object v5, Lcom/android/internal/telephony/DctConstants$State;->IDLE:Lcom/android/internal/telephony/DctConstants$State;

    goto :goto_1

    .line 756
    :cond_4
    const-string v5, "overall state is FAILED"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 757
    sget-object v5, Lcom/android/internal/telephony/DctConstants$State;->FAILED:Lcom/android/internal/telephony/DctConstants$State;

    goto :goto_1

    .line 723
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_2
    .end packed-switch
.end method

.method public getPcscfAddress(Ljava/lang/String;)[Ljava/lang/String;
    .locals 7
    .param p1, "apnType"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 3402
    const-string v5, "getPcscfAddress()"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3403
    const/4 v0, 0x0

    .line 3405
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-nez p1, :cond_1

    .line 3406
    const-string v5, "apnType is null, return null"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    move-object v3, v4

    .line 3435
    :cond_0
    :goto_0
    return-object v3

    .line 3410
    :cond_1
    const-string v5, "emergency"

    invoke-static {p1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 3411
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    const-string v6, "emergency"

    invoke-virtual {v5, v6}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 3419
    .restart local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :goto_1
    if-nez v0, :cond_4

    .line 3420
    const-string v5, "apnContext is null, return null"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    move-object v3, v4

    .line 3421
    goto :goto_0

    .line 3412
    :cond_2
    const-string v5, "ims"

    invoke-static {p1, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 3413
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    const-string v6, "ims"

    invoke-virtual {v5, v6}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .restart local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    goto :goto_1

    .line 3415
    :cond_3
    const-string v5, "apnType is invalid, return null"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    move-object v3, v4

    .line 3416
    goto :goto_0

    .line 3424
    :cond_4
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDcAc()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v1

    .line 3425
    .local v1, "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    const/4 v3, 0x0

    .line 3427
    .local v3, "result":[Ljava/lang/String;
    if-eqz v1, :cond_5

    .line 3428
    invoke-virtual {v1}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->getPcscfAddr()[Ljava/lang/String;

    move-result-object v3

    .line 3430
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    array-length v4, v3

    if-ge v2, v4, :cond_0

    .line 3431
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Pcscf["

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "]: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    aget-object v5, v3, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3430
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .end local v2    # "i":I
    :cond_5
    move-object v3, v4

    .line 3435
    goto :goto_0
.end method

.method public getState(Ljava/lang/String;)Lcom/android/internal/telephony/DctConstants$State;
    .locals 2
    .param p1, "apnType"    # Ljava/lang/String;

    .prologue
    .line 696
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 697
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-eqz v0, :cond_0

    .line 698
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v1

    .line 700
    :goto_0
    return-object v1

    :cond_0
    sget-object v1, Lcom/android/internal/telephony/DctConstants$State;->FAILED:Lcom/android/internal/telephony/DctConstants$State;

    goto :goto_0
.end method

.method protected gotoIdleAndNotifyDataConnection(Ljava/lang/String;)V
    .locals 2
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 1615
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "gotoIdleAndNotifyDataConnection: reason="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1616
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyDataConnection(Ljava/lang/String;)V

    .line 1617
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mActiveApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 1618
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 8
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v7, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 2992
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "handleMessage msg="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2994
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-boolean v5, v5, Lcom/android/internal/telephony/PhoneBase;->mIsTheCurrentActivePhone:Z

    if-eqz v5, :cond_0

    iget-boolean v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIsDisposed:Z

    if-eqz v5, :cond_2

    .line 2995
    :cond_0
    const-string v4, "handleMessage: Ignore GSM msgs since GSM phone is inactive"

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    .line 3130
    :cond_1
    :goto_0
    return-void

    .line 2999
    :cond_2
    iget v5, p1, Landroid/os/Message;->what:I

    sparse-switch v5, :sswitch_data_0

    .line 3127
    invoke-super {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;->handleMessage(Landroid/os/Message;)V

    goto :goto_0

    .line 3001
    :sswitch_0
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onRecordsLoaded()V

    goto :goto_0

    .line 3005
    :sswitch_1
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onDataConnectionDetached()V

    goto :goto_0

    .line 3009
    :sswitch_2
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onDataConnectionAttached()V

    goto :goto_0

    .line 3013
    :sswitch_3
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->doRecovery()V

    goto :goto_0

    .line 3017
    :sswitch_4
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onApnChanged()V

    goto :goto_0

    .line 3027
    :sswitch_5
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "EVENT_PS_RESTRICT_ENABLED "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-boolean v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIsPsRestricted:Z

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3028
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->stopNetStatPoll()V

    .line 3029
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->stopDataStallAlarm()V

    .line 3030
    iput-boolean v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIsPsRestricted:Z

    goto :goto_0

    .line 3038
    :sswitch_6
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EVENT_PS_RESTRICT_DISABLED "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIsPsRestricted:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3039
    iput-boolean v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIsPsRestricted:Z

    .line 3040
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 3041
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->startNetStatPoll()V

    .line 3042
    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->startDataStallAlarm(Z)V

    goto :goto_0

    .line 3045
    :cond_3
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mState:Lcom/android/internal/telephony/DctConstants$State;

    sget-object v5, Lcom/android/internal/telephony/DctConstants$State;->FAILED:Lcom/android/internal/telephony/DctConstants$State;

    if-ne v4, v5, :cond_4

    .line 3046
    const-string v4, "psRestrictEnabled"

    invoke-virtual {p0, v3, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(ZLjava/lang/String;)Z

    .line 3047
    iput-boolean v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mReregisterOnReconnectFailure:Z

    .line 3049
    :cond_4
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    const-string v5, "default"

    invoke-virtual {v4, v5}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 3050
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-eqz v0, :cond_5

    .line 3051
    const-string v4, "psRestrictEnabled"

    invoke-virtual {v0, v4}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReason(Ljava/lang/String;)V

    .line 3052
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->trySetupData(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z

    goto/16 :goto_0

    .line 3054
    :cond_5
    const-string v4, "**** Default ApnContext not found ****"

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    .line 3055
    sget-boolean v4, Landroid/os/Build;->IS_DEBUGGABLE:Z

    if-eqz v4, :cond_1

    .line 3056
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "Default ApnContext not found"

    invoke-direct {v4, v5}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 3063
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :sswitch_7
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v4, v4, Lcom/android/internal/telephony/dataconnection/ApnContext;

    if-eqz v4, :cond_6

    .line 3064
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Lcom/android/internal/telephony/dataconnection/ApnContext;

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onTrySetupData(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z

    goto/16 :goto_0

    .line 3065
    :cond_6
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v4, v4, Ljava/lang/String;

    if-eqz v4, :cond_7

    .line 3066
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Ljava/lang/String;

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onTrySetupData(Ljava/lang/String;)Z

    goto/16 :goto_0

    .line 3068
    :cond_7
    const-string v4, "EVENT_TRY_SETUP request w/o apnContext or String"

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 3073
    :sswitch_8
    iget v5, p1, Landroid/os/Message;->arg1:I

    if-nez v5, :cond_8

    .line 3074
    .local v3, "tearDown":Z
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "EVENT_CLEAN_UP_CONNECTION tearDown="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3075
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v4, v4, Lcom/android/internal/telephony/dataconnection/ApnContext;

    if-eqz v4, :cond_9

    .line 3076
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Lcom/android/internal/telephony/dataconnection/ApnContext;

    invoke-virtual {p0, v3, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpConnection(ZLcom/android/internal/telephony/dataconnection/ApnContext;)V

    goto/16 :goto_0

    .end local v3    # "tearDown":Z
    :cond_8
    move v3, v4

    .line 3073
    goto :goto_1

    .line 3078
    .restart local v3    # "tearDown":Z
    :cond_9
    const-string v4, "EVENT_CLEAN_UP_CONNECTION request w/o apn context, call super"

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    .line 3079
    invoke-super {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;->handleMessage(Landroid/os/Message;)V

    goto/16 :goto_0

    .line 3083
    .end local v3    # "tearDown":Z
    :sswitch_9
    iget v5, p1, Landroid/os/Message;->arg1:I

    if-ne v5, v4, :cond_a

    move v1, v4

    .line 3084
    .local v1, "enabled":Z
    :goto_2
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/Message;

    invoke-virtual {p0, v1, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onSetInternalDataEnabled(ZLandroid/os/Message;)V

    goto/16 :goto_0

    .end local v1    # "enabled":Z
    :cond_a
    move v1, v3

    .line 3083
    goto :goto_2

    .line 3088
    :sswitch_a
    const v4, 0x4201d

    invoke-virtual {p0, v4, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v2

    .line 3089
    .local v2, "mCause":Landroid/os/Message;
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v4, :cond_b

    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    instance-of v4, v4, Ljava/lang/String;

    if-eqz v4, :cond_b

    .line 3090
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    iput-object v4, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 3092
    :cond_b
    invoke-super {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTrackerBase;->handleMessage(Landroid/os/Message;)V

    goto/16 :goto_0

    .line 3099
    .end local v2    # "mCause":Landroid/os/Message;
    :sswitch_b
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onUpdateIcc()Z

    move-result v5

    if-eqz v5, :cond_c

    .line 3100
    const-string v5, "onUpdateIcc: tryRestartDataConnections nwTypeChanged"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3101
    const-string v5, "nwTypeChanged"

    invoke-direct {p0, v4, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->tryRestartDataConnections(ZLjava/lang/String;)V

    goto/16 :goto_0

    .line 3102
    :cond_c
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isNvSubscription()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 3105
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onNvReady()V

    goto/16 :goto_0

    .line 3111
    :sswitch_c
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningSpinner:Landroid/app/ProgressDialog;

    iget-object v5, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-ne v4, v5, :cond_1

    .line 3112
    iget-object v4, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningSpinner:Landroid/app/ProgressDialog;

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->dismiss()V

    .line 3113
    iput-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisioningSpinner:Landroid/app/ProgressDialog;

    goto/16 :goto_0

    .line 3118
    :sswitch_d
    iget-object v4, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v4, Landroid/os/AsyncResult;

    invoke-direct {p0, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onWwanIwlanCoexistenceDone(Landroid/os/AsyncResult;)V

    goto/16 :goto_0

    .line 3122
    :sswitch_e
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onModemApnProfileReady()V

    goto/16 :goto_0

    .line 2999
    :sswitch_data_0
    .sparse-switch
        0x42002 -> :sswitch_0
        0x42003 -> :sswitch_7
        0x42009 -> :sswitch_1
        0x42010 -> :sswitch_2
        0x42012 -> :sswitch_3
        0x42013 -> :sswitch_4
        0x42015 -> :sswitch_b
        0x42016 -> :sswitch_5
        0x42017 -> :sswitch_6
        0x42018 -> :sswitch_8
        0x4201b -> :sswitch_9
        0x4201d -> :sswitch_a
        0x42029 -> :sswitch_b
        0x4202a -> :sswitch_c
        0x4202b -> :sswitch_e
        0x4202c -> :sswitch_d
    .end sparse-switch
.end method

.method public incApnRefCount(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 369
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 370
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-eqz v0, :cond_0

    .line 371
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->incRefCount()V

    .line 373
    :cond_0
    return-void
.end method

.method protected initApnContexts()V
    .locals 9

    .prologue
    .line 572
    const-string v7, "initApnContexts: E"

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 574
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v7}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, #android:array@networkAttributes#t

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v6

    .line 576
    .local v6, "networkConfigStrings":[Ljava/lang/String;
    move-object v1, v6

    .local v1, "arr$":[Ljava/lang/String;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v5, v1, v2

    .line 577
    .local v5, "networkConfigString":Ljava/lang/String;
    new-instance v4, Landroid/net/NetworkConfig;

    invoke-direct {v4, v5}, Landroid/net/NetworkConfig;-><init>(Ljava/lang/String;)V

    .line 578
    .local v4, "networkConfig":Landroid/net/NetworkConfig;
    const/4 v0, 0x0

    .line 580
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    iget v7, v4, Landroid/net/NetworkConfig;->type:I

    packed-switch v7, :pswitch_data_0

    .line 612
    :pswitch_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "initApnContexts: skipping unknown type="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget v8, v4, Landroid/net/NetworkConfig;->type:I

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 576
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 582
    :pswitch_1
    const-string v7, "default"

    invoke-direct {p0, v7, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addApnContext(Ljava/lang/String;Landroid/net/NetworkConfig;)Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v0

    .line 615
    :goto_2
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "initApnContexts: apnContext="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_1

    .line 585
    :pswitch_2
    const-string v7, "mms"

    invoke-direct {p0, v7, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addApnContext(Ljava/lang/String;Landroid/net/NetworkConfig;)Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v0

    .line 586
    goto :goto_2

    .line 588
    :pswitch_3
    const-string v7, "supl"

    invoke-direct {p0, v7, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addApnContext(Ljava/lang/String;Landroid/net/NetworkConfig;)Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v0

    .line 589
    goto :goto_2

    .line 591
    :pswitch_4
    const-string v7, "dun"

    invoke-direct {p0, v7, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addApnContext(Ljava/lang/String;Landroid/net/NetworkConfig;)Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v0

    .line 592
    goto :goto_2

    .line 594
    :pswitch_5
    const-string v7, "hipri"

    invoke-direct {p0, v7, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addApnContext(Ljava/lang/String;Landroid/net/NetworkConfig;)Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v0

    .line 595
    goto :goto_2

    .line 597
    :pswitch_6
    const-string v7, "fota"

    invoke-direct {p0, v7, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addApnContext(Ljava/lang/String;Landroid/net/NetworkConfig;)Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v0

    .line 598
    goto :goto_2

    .line 600
    :pswitch_7
    const-string v7, "ims"

    invoke-direct {p0, v7, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addApnContext(Ljava/lang/String;Landroid/net/NetworkConfig;)Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v0

    .line 601
    goto :goto_2

    .line 603
    :pswitch_8
    const-string v7, "cbs"

    invoke-direct {p0, v7, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addApnContext(Ljava/lang/String;Landroid/net/NetworkConfig;)Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v0

    .line 604
    goto :goto_2

    .line 606
    :pswitch_9
    const-string v7, "ia"

    invoke-direct {p0, v7, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addApnContext(Ljava/lang/String;Landroid/net/NetworkConfig;)Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v0

    .line 607
    goto :goto_2

    .line 609
    :pswitch_a
    const-string v7, "emergency"

    invoke-direct {p0, v7, v4}, Lcom/android/internal/telephony/dataconnection/DcTracker;->addApnContext(Ljava/lang/String;Landroid/net/NetworkConfig;)Lcom/android/internal/telephony/dataconnection/ApnContext;

    move-result-object v0

    .line 610
    goto :goto_2

    .line 617
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    .end local v4    # "networkConfig":Landroid/net/NetworkConfig;
    .end local v5    # "networkConfigString":Ljava/lang/String;
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "initApnContexts: X mApnContexts="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 618
    return-void

    .line 580
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_0
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method public isApnSupported(Ljava/lang/String;)Z
    .locals 4
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 385
    if-nez p1, :cond_0

    .line 386
    const-string v2, "isApnSupported: name=null"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    .line 395
    :goto_0
    return v1

    .line 390
    :cond_0
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 391
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-nez v0, :cond_1

    .line 392
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Request for unsupported mobile name: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    goto :goto_0

    .line 395
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public isApnTypeActive(Ljava/lang/String;)Z
    .locals 3
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 470
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 471
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-nez v0, :cond_1

    .line 473
    :cond_0
    :goto_0
    return v1

    :cond_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDcAc()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method protected isApnTypeAvailable(Ljava/lang/String;)Z
    .locals 4
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 763
    const-string v3, "dun"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->fetchDunApn()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 772
    :goto_0
    return v2

    .line 767
    :cond_0
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllApnSettings:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 768
    .local v0, "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/dataconnection/ApnSetting;->canHandleType(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 772
    .end local v0    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    :cond_2
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public isApnTypeEnabled(Ljava/lang/String;)Z
    .locals 2
    .param p1, "apnType"    # Ljava/lang/String;

    .prologue
    .line 681
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 682
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-nez v0, :cond_0

    .line 683
    const/4 v1, 0x0

    .line 685
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isEnabled()Z

    move-result v1

    goto :goto_0
.end method

.method protected isConnected()Z
    .locals 4

    .prologue
    .line 2484
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 2485
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v2

    sget-object v3, Lcom/android/internal/telephony/DctConstants$State;->CONNECTED:Lcom/android/internal/telephony/DctConstants$State;

    if-ne v2, v3, :cond_0

    .line 2487
    const/4 v2, 0x1

    .line 2491
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method protected isDataAllowed()Z
    .locals 17

    .prologue
    .line 865
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDataEnabledLock:Ljava/lang/Object;

    move-object/from16 v16, v0

    monitor-enter v16

    .line 866
    :try_start_0
    move-object/from16 v0, p0

    iget-boolean v6, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mInternalDataEnabled:Z

    .line 867
    .local v6, "internalDataEnabled":Z
    monitor-exit v16
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 869
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAttached:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v15}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    .line 870
    .local v2, "attachedState":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v15}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v15

    invoke-virtual {v15}, Lcom/android/internal/telephony/ServiceStateTracker;->getDesiredPowerState()Z

    move-result v5

    .line 871
    .local v5, "desiredPowerState":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v15}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v15

    invoke-virtual {v15}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v10

    .line 872
    .local v10, "radioTech":I
    const/16 v15, 0x12

    if-ne v10, v15, :cond_0

    if-nez v5, :cond_0

    .line 874
    const/4 v5, 0x1

    .line 875
    const/4 v2, 0x1

    .line 878
    :cond_0
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v15}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lcom/android/internal/telephony/uicc/IccRecords;

    .line 879
    .local v9, "r":Lcom/android/internal/telephony/uicc/IccRecords;
    const/4 v12, 0x0

    .line 880
    .local v12, "recordsLoaded":Z
    if-eqz v9, :cond_1

    .line 881
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "isDataAllowed mIccRecords=IccRecords {"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v9}, Lcom/android/internal/telephony/uicc/IccRecords;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "}"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 882
    invoke-virtual {v9}, Lcom/android/internal/telephony/uicc/IccRecords;->getRecordsLoaded()Z

    move-result v12

    .line 883
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "isDataAllowed getRecordsLoaded="

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 885
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isNvSubscription()Z

    move-result v14

    .line 887
    .local v14, "subscriptionFromNv":Z
    invoke-static {}, Landroid/telephony/SubscriptionManager;->getDefaultDataSubId()I

    move-result v3

    .line 888
    .local v3, "dataSub":I
    invoke-static {v3}, Landroid/telephony/SubscriptionManager;->isValidSubscriptionId(I)Z

    move-result v4

    .line 890
    .local v4, "defaultDataSelected":Z
    move-object/from16 v0, p0

    iget-boolean v8, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIsPsRestricted:Z

    .line 891
    .local v8, "psRestricted":Z
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v15}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v15

    invoke-virtual {v15}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v15

    const v16, #android:bool@config_user_notification_of_restrictied_mobile_access#t

    invoke-virtual/range {v15 .. v16}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v7

    .line 893
    .local v7, "isSetNotification":Z
    if-nez v7, :cond_2

    .line 894
    const/4 v2, 0x1

    .line 895
    const/4 v8, 0x0

    .line 898
    :cond_2
    sget-object v13, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    .line 899
    .local v13, "state":Lcom/android/internal/telephony/PhoneConstants$State;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v15}, Lcom/android/internal/telephony/PhoneBase;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v15

    if-eqz v15, :cond_3

    .line 900
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v15}, Lcom/android/internal/telephony/PhoneBase;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v15

    invoke-virtual {v15}, Lcom/android/internal/telephony/CallTracker;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v13

    .line 902
    :cond_3
    if-nez v2, :cond_4

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAutoAttachOnCreation:Z

    if-eqz v15, :cond_11

    :cond_4
    if-nez v14, :cond_5

    if-eqz v12, :cond_11

    :cond_5
    sget-object v15, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v13, v15, :cond_6

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v15}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v15

    invoke-virtual {v15}, Lcom/android/internal/telephony/ServiceStateTracker;->isConcurrentVoiceAndDataAllowed()Z

    move-result v15

    if-eqz v15, :cond_11

    :cond_6
    if-eqz v6, :cond_11

    if-eqz v4, :cond_11

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v15}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v15

    invoke-virtual {v15}, Landroid/telephony/ServiceState;->getDataRoaming()Z

    move-result v15

    if-eqz v15, :cond_7

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getDataOnRoamingEnabled()Z

    move-result v15

    if-eqz v15, :cond_11

    :cond_7
    if-nez v8, :cond_11

    if-eqz v5, :cond_11

    const/4 v1, 0x1

    .line 912
    .local v1, "allowed":Z
    :goto_0
    if-nez v1, :cond_10

    .line 913
    const-string v11, ""

    .line 914
    .local v11, "reason":Ljava/lang/String;
    if-nez v2, :cond_8

    move-object/from16 v0, p0

    iget-boolean v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAutoAttachOnCreation:Z

    if-nez v15, :cond_8

    .line 915
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " - Attached= "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 917
    :cond_8
    if-nez v14, :cond_9

    if-nez v12, :cond_9

    .line 918
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " - SIM not loaded and not NV subscription"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 920
    :cond_9
    sget-object v15, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v13, v15, :cond_a

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v15}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v15

    invoke-virtual {v15}, Lcom/android/internal/telephony/ServiceStateTracker;->isConcurrentVoiceAndDataAllowed()Z

    move-result v15

    if-nez v15, :cond_a

    .line 922
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " - PhoneState= "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 923
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " - Concurrent voice and data not allowed"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 925
    :cond_a
    if-nez v6, :cond_b

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " - mInternalDataEnabled= false"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 926
    :cond_b
    if-nez v4, :cond_c

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " - defaultDataSelected= false"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 927
    :cond_c
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v15}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v15

    invoke-virtual {v15}, Landroid/telephony/ServiceState;->getDataRoaming()Z

    move-result v15

    if-eqz v15, :cond_d

    invoke-virtual/range {p0 .. p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getDataOnRoamingEnabled()Z

    move-result v15

    if-nez v15, :cond_d

    .line 928
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " - Roaming and data roaming not enabled"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 930
    :cond_d
    if-eqz v8, :cond_e

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " - mIsPsRestricted= true"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 931
    :cond_e
    if-nez v5, :cond_f

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " - desiredPowerState= false"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 932
    :cond_f
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "isDataAllowed: not allowed due to"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 934
    .end local v11    # "reason":Ljava/lang/String;
    :cond_10
    return v1

    .line 867
    .end local v1    # "allowed":Z
    .end local v2    # "attachedState":Z
    .end local v3    # "dataSub":I
    .end local v4    # "defaultDataSelected":Z
    .end local v5    # "desiredPowerState":Z
    .end local v6    # "internalDataEnabled":Z
    .end local v7    # "isSetNotification":Z
    .end local v8    # "psRestricted":Z
    .end local v9    # "r":Lcom/android/internal/telephony/uicc/IccRecords;
    .end local v10    # "radioTech":I
    .end local v12    # "recordsLoaded":Z
    .end local v13    # "state":Lcom/android/internal/telephony/PhoneConstants$State;
    .end local v14    # "subscriptionFromNv":Z
    :catchall_0
    move-exception v15

    :try_start_1
    monitor-exit v16
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v15

    .line 902
    .restart local v2    # "attachedState":Z
    .restart local v3    # "dataSub":I
    .restart local v4    # "defaultDataSelected":Z
    .restart local v5    # "desiredPowerState":Z
    .restart local v6    # "internalDataEnabled":Z
    .restart local v7    # "isSetNotification":Z
    .restart local v8    # "psRestricted":Z
    .restart local v9    # "r":Lcom/android/internal/telephony/uicc/IccRecords;
    .restart local v10    # "radioTech":I
    .restart local v12    # "recordsLoaded":Z
    .restart local v13    # "state":Lcom/android/internal/telephony/PhoneConstants$State;
    .restart local v14    # "subscriptionFromNv":Z
    :cond_11
    const/4 v1, 0x0

    goto/16 :goto_0
.end method

.method public isDataPossible(Ljava/lang/String;)Z
    .locals 11
    .param p1, "apnType"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 512
    iget-object v9, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v9, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 513
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-nez v0, :cond_0

    .line 541
    :goto_0
    return v7

    .line 516
    :cond_0
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isEnabled()Z

    move-result v1

    .line 517
    .local v1, "apnContextIsEnabled":Z
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v2

    .line 518
    .local v2, "apnContextState":Lcom/android/internal/telephony/DctConstants$State;
    if-eqz v1, :cond_1

    sget-object v9, Lcom/android/internal/telephony/DctConstants$State;->FAILED:Lcom/android/internal/telephony/DctConstants$State;

    if-eq v2, v9, :cond_5

    :cond_1
    move v3, v8

    .line 520
    .local v3, "apnTypePossible":Z
    :goto_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v9

    const-string v10, "emergency"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 523
    .local v5, "isEmergencyApn":Z
    if-nez v5, :cond_2

    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isDataAllowed()Z

    move-result v9

    if-eqz v9, :cond_6

    :cond_2
    move v4, v8

    .line 524
    .local v4, "dataAllowed":Z
    :goto_2
    if-eqz v4, :cond_7

    if-eqz v3, :cond_7

    move v6, v8

    .line 526
    .local v6, "possible":Z
    :goto_3
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v7

    const-string v8, "default"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v7

    const-string v8, "ia"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    :cond_3
    iget-object v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v7}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v7

    invoke-virtual {v7}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v7

    const/16 v8, 0x12

    if-ne v7, v8, :cond_4

    iget-boolean v7, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mWwanIwlanCoexistFlag:Z

    if-nez v7, :cond_4

    .line 531
    const-string v7, "Default data call activation not possible in iwlan."

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 532
    const/4 v6, 0x0

    :cond_4
    move v7, v6

    .line 541
    goto :goto_0

    .end local v3    # "apnTypePossible":Z
    .end local v4    # "dataAllowed":Z
    .end local v5    # "isEmergencyApn":Z
    .end local v6    # "possible":Z
    :cond_5
    move v3, v7

    .line 518
    goto :goto_1

    .restart local v3    # "apnTypePossible":Z
    .restart local v5    # "isEmergencyApn":Z
    :cond_6
    move v4, v7

    .line 523
    goto :goto_2

    .restart local v4    # "dataAllowed":Z
    :cond_7
    move v6, v7

    .line 524
    goto :goto_3
.end method

.method public isDisconnected()Z
    .locals 3

    .prologue
    .line 2496
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 2497
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isDisconnected()Z

    move-result v2

    if-nez v2, :cond_0

    .line 2499
    const/4 v2, 0x0

    .line 2503
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public isOnDemandDataPossible(Ljava/lang/String;)Z
    .locals 11
    .param p1, "apnType"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 484
    const/4 v4, 0x0

    .line 485
    .local v4, "flag":Z
    iget-object v9, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v9, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 486
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-nez v0, :cond_0

    .line 507
    :goto_0
    return v7

    .line 489
    :cond_0
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isEnabled()Z

    move-result v1

    .line 491
    .local v1, "apnContextIsEnabled":Z
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v2

    .line 492
    .local v2, "apnContextState":Lcom/android/internal/telephony/DctConstants$State;
    if-eqz v1, :cond_1

    sget-object v9, Lcom/android/internal/telephony/DctConstants$State;->FAILED:Lcom/android/internal/telephony/DctConstants$State;

    if-eq v2, v9, :cond_4

    :cond_1
    move v3, v8

    .line 495
    .local v3, "apnTypePossible":Z
    :goto_1
    iget-boolean v6, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mUserDataEnabled:Z

    .line 497
    .local v6, "userDataEnabled":Z
    const-string v9, "mms"

    invoke-virtual {v9, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 498
    iget-object v9, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v9}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v9

    invoke-virtual {v9}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, #android:bool@config_enable_mms_with_mobile_data_off#t

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v5

    .line 500
    .local v5, "mobileDataOffOveride":Z
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "isOnDemandDataPossible MobileDataEnabled override = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 502
    iget-boolean v9, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mUserDataEnabled:Z

    if-nez v9, :cond_2

    if-eqz v5, :cond_5

    :cond_2
    move v6, v8

    .line 505
    .end local v5    # "mobileDataOffOveride":Z
    :cond_3
    :goto_2
    if-eqz v3, :cond_6

    if-eqz v6, :cond_6

    move v4, v8

    .line 506
    :goto_3
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "isOnDemandDataPossible, possible ="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", apnContext = "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    move v7, v4

    .line 507
    goto :goto_0

    .end local v3    # "apnTypePossible":Z
    .end local v6    # "userDataEnabled":Z
    :cond_4
    move v3, v7

    .line 492
    goto :goto_1

    .restart local v3    # "apnTypePossible":Z
    .restart local v5    # "mobileDataOffOveride":Z
    .restart local v6    # "userDataEnabled":Z
    :cond_5
    move v6, v7

    .line 502
    goto :goto_2

    .end local v5    # "mobileDataOffOveride":Z
    :cond_6
    move v4, v7

    .line 505
    goto :goto_3
.end method

.method protected isPermanentFail(Lcom/android/internal/telephony/dataconnection/DcFailCause;)Z
    .locals 1
    .param p1, "dcFailCause"    # Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .prologue
    .line 1313
    invoke-virtual {p1}, Lcom/android/internal/telephony/dataconnection/DcFailCause;->isPermanentFail()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAttached:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lcom/android/internal/telephony/dataconnection/DcFailCause;->SIGNAL_LOST:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    if-eq p1, v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected isProvisioningApn(Ljava/lang/String;)Z
    .locals 2
    .param p1, "apnType"    # Ljava/lang/String;

    .prologue
    .line 706
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 707
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-eqz v0, :cond_0

    .line 708
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isProvisioningApn()Z

    move-result v1

    .line 710
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method protected log(Ljava/lang/String;)V
    .locals 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 3380
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

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

    .line 3381
    return-void
.end method

.method protected loge(Ljava/lang/String;)V
    .locals 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 3385
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

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

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3386
    return-void
.end method

.method protected mvnoMatches(Lcom/android/internal/telephony/uicc/IccRecords;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p1, "r"    # Lcom/android/internal/telephony/uicc/IccRecords;
    .param p2, "mvnoType"    # Ljava/lang/String;
    .param p3, "mvnoMatchData"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1290
    const-string v5, "spn"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1291
    invoke-virtual {p1}, Lcom/android/internal/telephony/uicc/IccRecords;->getServiceProviderName()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_2

    invoke-virtual {p1}, Lcom/android/internal/telephony/uicc/IccRecords;->getServiceProviderName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1308
    :cond_0
    :goto_0
    return v3

    .line 1295
    :cond_1
    const-string v5, "imsi"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1296
    invoke-virtual {p1}, Lcom/android/internal/telephony/uicc/IccRecords;->getIMSI()Ljava/lang/String;

    move-result-object v1

    .line 1297
    .local v1, "imsiSIM":Ljava/lang/String;
    if-eqz v1, :cond_2

    invoke-direct {p0, p3, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->imsiMatches(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_0

    .end local v1    # "imsiSIM":Ljava/lang/String;
    :cond_2
    move v3, v4

    .line 1308
    goto :goto_0

    .line 1300
    :cond_3
    const-string v5, "gid"

    invoke-virtual {p2, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 1301
    invoke-virtual {p1}, Lcom/android/internal/telephony/uicc/IccRecords;->getGid1()Ljava/lang/String;

    move-result-object v0

    .line 1302
    .local v0, "gid1":Ljava/lang/String;
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v2

    .line 1303
    .local v2, "mvno_match_data_length":I
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    if-lt v5, v2, :cond_2

    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    goto :goto_0
.end method

.method protected notifyAllDataDisconnected()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 3300
    sput v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->sEnableFailFastRefCounter:I

    .line 3301
    iput-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mFailFast:Z

    .line 3302
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0}, Landroid/os/RegistrantList;->notifyRegistrants()V

    .line 3303
    return-void
.end method

.method protected notifyDataConnection(Ljava/lang/String;)V
    .locals 5
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 2508
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyDataConnection: reason="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2509
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 2510
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAttached:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_1

    iget-boolean v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOosIsDisconnect:Z

    if-nez v2, :cond_0

    :cond_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isReady()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 2511
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "notifyDataConnection: type:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2512
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    if-eqz p1, :cond_2

    move-object v2, p1

    :goto_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v2, v4}, Lcom/android/internal/telephony/PhoneBase;->notifyDataConnection(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 2516
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :cond_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyOffApnsOfAvailability(Ljava/lang/String;)V

    .line 2517
    return-void
.end method

.method protected notifyDataDisconnectComplete()V
    .locals 3

    .prologue
    .line 3291
    const-string v2, "notifyDataDisconnectComplete"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3292
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/os/Message;

    .line 3293
    .local v1, "m":Landroid/os/Message;
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    goto :goto_0

    .line 3295
    .end local v1    # "m":Landroid/os/Message;
    :cond_0
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectAllCompleteMsgList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 3296
    return-void
.end method

.method protected notifyOffApnsOfAvailability(Ljava/lang/String;)V
    .locals 6
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 1037
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 1038
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAttached:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_1

    iget-boolean v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mOosIsDisconnect:Z

    if-nez v2, :cond_2

    :cond_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isReady()Z

    move-result v2

    if-nez v2, :cond_0

    .line 1040
    :cond_2
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    if-eqz p1, :cond_3

    move-object v2, p1

    :goto_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/android/internal/telephony/PhoneConstants$DataState;->DISCONNECTED:Lcom/android/internal/telephony/PhoneConstants$DataState;

    invoke-virtual {v3, v2, v4, v5}, Lcom/android/internal/telephony/PhoneBase;->notifyDataConnection(Ljava/lang/String;Ljava/lang/String;Lcom/android/internal/telephony/PhoneConstants$DataState;)V

    goto :goto_0

    :cond_3
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v2

    goto :goto_1

    .line 1050
    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    :cond_4
    return-void
.end method

.method protected onCleanUpAllConnections(Ljava/lang/String;)V
    .locals 1
    .param p1, "cause"    # Ljava/lang/String;

    .prologue
    .line 1114
    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(ZLjava/lang/String;)Z

    .line 1115
    return-void
.end method

.method protected onCleanUpConnection(ZILjava/lang/String;)V
    .locals 3
    .param p1, "tearDown"    # Z
    .param p2, "apnId"    # I
    .param p3, "reason"    # Ljava/lang/String;

    .prologue
    .line 2474
    const-string v1, "onCleanUpConnection"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2475
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0, p2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->apnIdToType(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 2476
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-eqz v0, :cond_0

    .line 2477
    invoke-virtual {v0, p3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setReason(Ljava/lang/String;)V

    .line 2478
    invoke-virtual {p0, p1, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpConnection(ZLcom/android/internal/telephony/dataconnection/ApnContext;)V

    .line 2480
    :cond_0
    return-void
.end method

.method protected onDataConnectionDetached()V
    .locals 2

    .prologue
    .line 837
    const-string v0, "onDataConnectionDetached: stop polling and notify detached"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 838
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->stopNetStatPoll()V

    .line 839
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->stopDataStallAlarm()V

    .line 840
    const-string v0, "dataDetached"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyDataConnection(Ljava/lang/String;)V

    .line 841
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAttached:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 842
    return-void
.end method

.method protected onDataSetupComplete(Landroid/os/AsyncResult;)V
    .locals 26
    .param p1, "ar"    # Landroid/os/AsyncResult;

    .prologue
    .line 2094
    sget-object v8, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNKNOWN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 2095
    .local v8, "cause":Lcom/android/internal/telephony/dataconnection/DcFailCause;
    const/4 v13, 0x0

    .line 2096
    .local v13, "handleError":Z
    const/4 v6, 0x0

    .line 2098
    .local v6, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    instance-of v0, v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    move/from16 v21, v0

    if-eqz v21, :cond_2

    .line 2099
    move-object/from16 v0, p1

    iget-object v6, v0, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    .end local v6    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    check-cast v6, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 2104
    .restart local v6    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    move-object/from16 v21, v0

    if-nez v21, :cond_e

    .line 2105
    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDcAc()Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;

    move-result-object v11

    .line 2125
    .local v11, "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    if-nez v11, :cond_3

    .line 2126
    const-string v21, "onDataSetupComplete: no connection to DC, handle as error"

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2127
    sget-object v8, Lcom/android/internal/telephony/dataconnection/DcFailCause;->CONNECTION_TO_DATACONNECTIONAC_BROKEN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 2128
    const/4 v13, 0x1

    .line 2272
    .end local v11    # "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    :goto_0
    if-eqz v13, :cond_0

    .line 2273
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onDataSetupCompleteError(Landroid/os/AsyncResult;)V

    .line 2279
    :cond_0
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mInternalDataEnabled:Z

    move/from16 v21, v0

    if-nez v21, :cond_1

    .line 2280
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(Ljava/lang/String;)V

    .line 2283
    :cond_1
    return-void

    .line 2101
    :cond_2
    new-instance v21, Ljava/lang/RuntimeException;

    const-string v22, "onDataSetupComplete: No apnContext"

    invoke-direct/range {v21 .. v22}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 2130
    .restart local v11    # "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    :cond_3
    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnSetting()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v5

    .line 2132
    .local v5, "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "onDataSetupComplete: success apn="

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    if-nez v5, :cond_9

    const-string v21, "unknown"

    :goto_1
    move-object/from16 v0, v22

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2134
    if-eqz v5, :cond_5

    iget-object v0, v5, Lcom/android/internal/telephony/dataconnection/ApnSetting;->proxy:Ljava/lang/String;

    move-object/from16 v21, v0

    if-eqz v21, :cond_5

    iget-object v0, v5, Lcom/android/internal/telephony/dataconnection/ApnSetting;->proxy:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/lang/String;->length()I

    move-result v21

    if-eqz v21, :cond_5

    .line 2136
    :try_start_0
    iget-object v0, v5, Lcom/android/internal/telephony/dataconnection/ApnSetting;->port:Ljava/lang/String;

    move-object/from16 v19, v0

    .line 2137
    .local v19, "port":Ljava/lang/String;
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v21

    if-eqz v21, :cond_4

    const-string v19, "8080"

    .line 2138
    :cond_4
    new-instance v20, Landroid/net/ProxyInfo;

    iget-object v0, v5, Lcom/android/internal/telephony/dataconnection/ApnSetting;->proxy:Ljava/lang/String;

    move-object/from16 v21, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v22

    const/16 v23, 0x0

    invoke-direct/range {v20 .. v23}, Landroid/net/ProxyInfo;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 2140
    .local v20, "proxy":Landroid/net/ProxyInfo;
    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;->setLinkPropertiesHttpProxySync(Landroid/net/ProxyInfo;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2148
    .end local v19    # "port":Ljava/lang/String;
    .end local v20    # "proxy":Landroid/net/ProxyInfo;
    :cond_5
    :goto_2
    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v21

    const-string v22, "default"

    invoke-static/range {v21 .. v22}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v21

    if-eqz v21, :cond_a

    .line 2149
    const-string v21, "gsm.defaultpdpcontext.active"

    const-string v22, "true"

    invoke-static/range {v21 .. v22}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 2150
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCanSetPreferApn:Z

    move/from16 v21, v0

    if-eqz v21, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-object/from16 v21, v0

    if-nez v21, :cond_6

    .line 2151
    const-string v21, "onDataSetupComplete: PREFERED APN is null"

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2152
    move-object/from16 v0, p0

    iput-object v5, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    .line 2153
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-object/from16 v21, v0

    if-eqz v21, :cond_6

    .line 2154
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPreferredApn:Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->id:I

    move/from16 v21, v0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setPreferredApn(I)V

    .line 2162
    :cond_6
    :goto_3
    sget-object v21, Lcom/android/internal/telephony/DctConstants$State;->CONNECTED:Lcom/android/internal/telephony/DctConstants$State;

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 2163
    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isProvisioningApn()Z

    move-result v16

    .line 2164
    .local v16, "isProvApn":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v21

    invoke-static/range {v21 .. v21}, Landroid/net/ConnectivityManager;->from(Landroid/content/Context;)Landroid/net/ConnectivityManager;

    move-result-object v10

    .line 2165
    .local v10, "cm":Landroid/net/ConnectivityManager;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisionBroadcastReceiver:Landroid/content/BroadcastReceiver;

    move-object/from16 v21, v0

    if-eqz v21, :cond_7

    .line 2166
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisionBroadcastReceiver:Landroid/content/BroadcastReceiver;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 2167
    const/16 v21, 0x0

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisionBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 2169
    :cond_7
    if-eqz v16, :cond_8

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIsProvisioning:Z

    move/from16 v21, v0

    if-eqz v21, :cond_b

    .line 2171
    :cond_8
    const/16 v21, 0x0

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisionActionName:Ljava/lang/String;

    move-object/from16 v23, v0

    move/from16 v0, v21

    move/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v10, v0, v1, v2}, Landroid/net/ConnectivityManager;->setProvisioningNotificationVisible(ZILjava/lang/String;)V

    .line 2176
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/android/internal/telephony/dataconnection/DcTracker;->completeConnection(Lcom/android/internal/telephony/dataconnection/ApnContext;)V

    .line 2226
    :goto_4
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "onDataSetupComplete: SETUP complete type="

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, ", reason:"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 2132
    .end local v10    # "cm":Landroid/net/ConnectivityManager;
    .end local v16    # "isProvApn":Z
    :cond_9
    iget-object v0, v5, Lcom/android/internal/telephony/dataconnection/ApnSetting;->apn:Ljava/lang/String;

    move-object/from16 v21, v0

    goto/16 :goto_1

    .line 2141
    :catch_0
    move-exception v12

    .line 2142
    .local v12, "e":Ljava/lang/NumberFormatException;
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "onDataSetupComplete: NumberFormatException making ProxyProperties ("

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    iget-object v0, v5, Lcom/android/internal/telephony/dataconnection/ApnSetting;->port:Ljava/lang/String;

    move-object/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, "): "

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 2158
    .end local v12    # "e":Ljava/lang/NumberFormatException;
    :cond_a
    const-string v21, "gsm.defaultpdpcontext.active"

    const-string v22, "false"

    invoke-static/range {v21 .. v22}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 2184
    .restart local v10    # "cm":Landroid/net/ConnectivityManager;
    .restart local v16    # "isProvApn":Z
    :cond_b
    new-instance v21, Ljava/lang/StringBuilder;

    invoke-direct/range {v21 .. v21}, Ljava/lang/StringBuilder;-><init>()V

    const-string v22, "onDataSetupComplete: successful, BUT send connected to prov apn as mIsProvisioning:"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIsProvisioning:Z

    move/from16 v22, v0

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " == false"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " && (isProvisioningApn:"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    move-object/from16 v0, v21

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v21

    const-string v22, " == true"

    invoke-virtual/range {v21 .. v22}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2191
    new-instance v21, Lcom/android/internal/telephony/dataconnection/DcTracker$ProvisionNotificationBroadcastReceiver;

    invoke-virtual {v10}, Landroid/net/ConnectivityManager;->getMobileProvisioningUrl()Ljava/lang/String;

    move-result-object v22

    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v23

    invoke-virtual/range {v23 .. v23}, Landroid/telephony/TelephonyManager;->getNetworkOperatorName()Ljava/lang/String;

    move-result-object v23

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    move-object/from16 v2, v22

    move-object/from16 v3, v23

    invoke-direct {v0, v1, v2, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker$ProvisionNotificationBroadcastReceiver;-><init>(Lcom/android/internal/telephony/dataconnection/DcTracker;Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v21

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisionBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 2194
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v21

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisionBroadcastReceiver:Landroid/content/BroadcastReceiver;

    move-object/from16 v22, v0

    new-instance v23, Landroid/content/IntentFilter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisionActionName:Ljava/lang/String;

    move-object/from16 v24, v0

    invoke-direct/range {v23 .. v24}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v21 .. v23}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 2197
    const/16 v21, 0x1

    const/16 v22, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mProvisionActionName:Ljava/lang/String;

    move-object/from16 v23, v0

    move/from16 v0, v21

    move/from16 v1, v22

    move-object/from16 v2, v23

    invoke-virtual {v10, v0, v1, v2}, Landroid/net/ConnectivityManager;->setProvisioningNotificationVisible(ZILjava/lang/String;)V

    .line 2201
    const/16 v21, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v21

    invoke-direct {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setRadio(Z)V

    .line 2203
    new-instance v15, Landroid/content/Intent;

    const-string v21, "android.intent.action.DATA_CONNECTION_CONNECTED_TO_PROVISIONING_APN"

    move-object/from16 v0, v21

    invoke-direct {v15, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2205
    .local v15, "intent":Landroid/content/Intent;
    const-string v21, "apn"

    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnSetting()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v22

    move-object/from16 v0, v22

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/ApnSetting;->apn:Ljava/lang/String;

    move-object/from16 v22, v0

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v15, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2206
    const-string v21, "apnType"

    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v22

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v15, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2208
    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v7

    .line 2209
    .local v7, "apnType":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getLinkProperties(Ljava/lang/String;)Landroid/net/LinkProperties;

    move-result-object v17

    .line 2210
    .local v17, "linkProperties":Landroid/net/LinkProperties;
    if-eqz v17, :cond_c

    .line 2211
    const-string v21, "linkProperties"

    move-object/from16 v0, v21

    move-object/from16 v1, v17

    invoke-virtual {v15, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2212
    invoke-virtual/range {v17 .. v17}, Landroid/net/LinkProperties;->getInterfaceName()Ljava/lang/String;

    move-result-object v14

    .line 2213
    .local v14, "iface":Ljava/lang/String;
    if-eqz v14, :cond_c

    .line 2214
    const-string v21, "iface"

    move-object/from16 v0, v21

    invoke-virtual {v15, v0, v14}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 2217
    .end local v14    # "iface":Ljava/lang/String;
    :cond_c
    move-object/from16 v0, p0

    invoke-virtual {v0, v7}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getNetworkCapabilities(Ljava/lang/String;)Landroid/net/NetworkCapabilities;

    move-result-object v18

    .line 2218
    .local v18, "networkCapabilities":Landroid/net/NetworkCapabilities;
    if-eqz v18, :cond_d

    .line 2219
    const-string v21, "networkCapabilities"

    move-object/from16 v0, v21

    move-object/from16 v1, v18

    invoke-virtual {v15, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 2223
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v21

    sget-object v22, Landroid/os/UserHandle;->ALL:Landroid/os/UserHandle;

    move-object/from16 v0, v21

    move-object/from16 v1, v22

    invoke-virtual {v0, v15, v1}, Landroid/content/Context;->sendBroadcastAsUser(Landroid/content/Intent;Landroid/os/UserHandle;)V

    goto/16 :goto_4

    .line 2231
    .end local v5    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    .end local v7    # "apnType":Ljava/lang/String;
    .end local v10    # "cm":Landroid/net/ConnectivityManager;
    .end local v11    # "dcac":Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;
    .end local v15    # "intent":Landroid/content/Intent;
    .end local v16    # "isProvApn":Z
    .end local v17    # "linkProperties":Landroid/net/LinkProperties;
    .end local v18    # "networkCapabilities":Landroid/net/NetworkCapabilities;
    :cond_e
    move-object/from16 v0, p1

    iget-object v0, v0, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    move-object/from16 v21, v0

    check-cast v21, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    move-object/from16 v8, v21

    check-cast v8, Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 2233
    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnSetting()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v5

    .line 2234
    .restart local v5    # "apn":Lcom/android/internal/telephony/dataconnection/ApnSetting;
    const-string v22, "onDataSetupComplete: error apn=%s cause=%s"

    const/16 v21, 0x2

    move/from16 v0, v21

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v23, v0

    const/16 v24, 0x0

    if-nez v5, :cond_12

    const-string v21, "unknown"

    :goto_5
    aput-object v21, v23, v24

    const/16 v21, 0x1

    aput-object v8, v23, v21

    invoke-static/range {v22 .. v23}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2238
    if-nez v8, :cond_f

    .line 2239
    sget-object v8, Lcom/android/internal/telephony/dataconnection/DcFailCause;->UNKNOWN:Lcom/android/internal/telephony/dataconnection/DcFailCause;

    .line 2242
    :cond_f
    invoke-virtual {v8}, Lcom/android/internal/telephony/dataconnection/DcFailCause;->isEventLoggable()Z

    move-result v21

    if-eqz v21, :cond_10

    .line 2244
    invoke-direct/range {p0 .. p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getCellLocationId()I

    move-result v9

    .line 2245
    .local v9, "cid":I
    const v21, 0xc3b9

    const/16 v22, 0x3

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual {v8}, Lcom/android/internal/telephony/dataconnection/DcFailCause;->ordinal()I

    move-result v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x1

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x2

    invoke-static {}, Landroid/telephony/TelephonyManager;->getDefault()Landroid/telephony/TelephonyManager;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Landroid/telephony/TelephonyManager;->getNetworkType()I

    move-result v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v21 .. v22}, Landroid/util/EventLog;->writeEvent(I[Ljava/lang/Object;)I

    .line 2248
    .end local v9    # "cid":I
    :cond_10
    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnSetting()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v5

    .line 2249
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    move-object/from16 v22, v0

    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v23

    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v24

    if-eqz v5, :cond_13

    iget-object v0, v5, Lcom/android/internal/telephony/dataconnection/ApnSetting;->apn:Ljava/lang/String;

    move-object/from16 v21, v0

    :goto_6
    invoke-virtual {v8}, Lcom/android/internal/telephony/dataconnection/DcFailCause;->toString()Ljava/lang/String;

    move-result-object v25

    move-object/from16 v0, v22

    move-object/from16 v1, v23

    move-object/from16 v2, v24

    move-object/from16 v3, v21

    move-object/from16 v4, v25

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/android/internal/telephony/PhoneBase;->notifyPreciseDataConnectionFailed(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2253
    move-object/from16 v0, p0

    invoke-virtual {v0, v8}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isPermanentFail(Lcom/android/internal/telephony/dataconnection/DcFailCause;)Z

    move-result v21

    if-eqz v21, :cond_11

    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->decWaitingApnsPermFailCount()V

    .line 2255
    :cond_11
    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnSetting()Lcom/android/internal/telephony/dataconnection/ApnSetting;

    move-result-object v21

    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->removeWaitingApn(Lcom/android/internal/telephony/dataconnection/ApnSetting;)V

    .line 2257
    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getWaitingApns()Ljava/util/ArrayList;

    move-result-object v21

    if-nez v21, :cond_14

    .line 2258
    const-string v21, "onDataSetupComplete: WaitingApns.size = null WaitingApnsPermFailureCountDown=%d"

    const/16 v22, 0x1

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getWaitingApnsPermFailCount()I

    move-result v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2269
    :goto_7
    const/4 v13, 0x1

    goto/16 :goto_0

    .line 2234
    :cond_12
    iget-object v0, v5, Lcom/android/internal/telephony/dataconnection/ApnSetting;->apn:Ljava/lang/String;

    move-object/from16 v21, v0

    goto/16 :goto_5

    .line 2249
    :cond_13
    const-string v21, "unknown"

    goto :goto_6

    .line 2263
    :cond_14
    const-string v21, "onDataSetupComplete: WaitingApns.size=%d WaitingApnsPermFailureCountDown=%d"

    const/16 v22, 0x2

    move/from16 v0, v22

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v22, v0

    const/16 v23, 0x0

    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getWaitingApns()Ljava/util/ArrayList;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/util/ArrayList;->size()I

    move-result v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    const/16 v23, 0x1

    invoke-virtual {v6}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getWaitingApnsPermFailCount()I

    move-result v24

    invoke-static/range {v24 .. v24}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v24

    aput-object v24, v22, v23

    invoke-static/range {v21 .. v22}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v21

    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_7
.end method

.method protected onDataSetupCompleteError(Landroid/os/AsyncResult;)V
    .locals 6
    .param p1, "ar"    # Landroid/os/AsyncResult;

    .prologue
    .line 2306
    const-string v2, ""

    .line 2307
    .local v2, "reason":Ljava/lang/String;
    const/4 v0, 0x0

    .line 2309
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    iget-object v3, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    instance-of v3, v3, Lcom/android/internal/telephony/dataconnection/ApnContext;

    if-eqz v3, :cond_1

    .line 2310
    iget-object v0, p1, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 2316
    .restart local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getWaitingApns()Ljava/util/ArrayList;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getWaitingApns()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 2317
    :cond_0
    sget-object v3, Lcom/android/internal/telephony/DctConstants$State;->FAILED:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 2318
    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    const-string v4, "apnFailed"

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/android/internal/telephony/PhoneBase;->notifyDataConnection(Ljava/lang/String;Ljava/lang/String;)V

    .line 2320
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setDataConnectionAc(Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;)V

    .line 2322
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getWaitingApnsPermFailCount()I

    move-result v3

    if-nez v3, :cond_2

    .line 2324
    const-string v3, "onDataSetupCompleteError: All APN\'s had permanent failures, stop retrying"

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2341
    :goto_0
    return-void

    .line 2312
    :cond_1
    new-instance v3, Ljava/lang/RuntimeException;

    const-string v4, "onDataSetupCompleteError: No apnContext"

    invoke-direct {v3, v4}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 2327
    :cond_2
    const-string v3, "apnFailed"

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getApnDelay(Ljava/lang/String;)I

    move-result v1

    .line 2329
    .local v1, "delay":I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "onDataSetupCompleteError: Not all APN\'s had permanent failures delay="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2332
    invoke-direct {p0, v1, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->startAlarmForRestartTrySetup(ILcom/android/internal/telephony/dataconnection/ApnContext;)V

    goto :goto_0

    .line 2335
    .end local v1    # "delay":I
    :cond_3
    const-string v3, "onDataSetupCompleteError: Try next APN"

    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2336
    sget-object v3, Lcom/android/internal/telephony/DctConstants$State;->SCANNING:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {v0, v3}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 2339
    const-string v3, "apnFailed"

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getApnDelay(Ljava/lang/String;)I

    move-result v3

    invoke-direct {p0, v3, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->startAlarmForReconnect(ILcom/android/internal/telephony/dataconnection/ApnContext;)V

    goto :goto_0
.end method

.method protected onDisconnectDcRetrying(ILandroid/os/AsyncResult;)V
    .locals 4
    .param p1, "connId"    # I
    .param p2, "ar"    # Landroid/os/AsyncResult;

    .prologue
    .line 2426
    const/4 v0, 0x0

    .line 2428
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    iget-object v1, p2, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    instance-of v1, v1, Lcom/android/internal/telephony/dataconnection/ApnContext;

    if-eqz v1, :cond_0

    .line 2429
    iget-object v0, p2, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 2435
    .restart local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    sget-object v1, Lcom/android/internal/telephony/DctConstants$State;->RETRYING:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 2436
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onDisconnectDcRetrying: apnContext="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2438
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/android/internal/telephony/PhoneBase;->notifyDataConnection(Ljava/lang/String;Ljava/lang/String;)V

    .line 2439
    :goto_0
    return-void

    .line 2431
    :cond_0
    const-string v1, "onDisconnectDcRetrying: Invalid ar in onDisconnectDone, ignore"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onDisconnectDone(ILandroid/os/AsyncResult;)V
    .locals 6
    .param p1, "connId"    # I
    .param p2, "ar"    # Landroid/os/AsyncResult;

    .prologue
    const/4 v5, 0x0

    .line 2348
    const/4 v0, 0x0

    .line 2350
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    iget-object v2, p2, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    instance-of v2, v2, Lcom/android/internal/telephony/dataconnection/ApnContext;

    if-eqz v2, :cond_2

    .line 2351
    iget-object v0, p2, Landroid/os/AsyncResult;->userObj:Ljava/lang/Object;

    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 2357
    .restart local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onDisconnectDone: EVENT_DISCONNECT_DONE apnContext="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2358
    sget-object v2, Lcom/android/internal/telephony/DctConstants$State;->IDLE:Lcom/android/internal/telephony/DctConstants$State;

    invoke-virtual {v0, v2}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setState(Lcom/android/internal/telephony/DctConstants$State;)V

    .line 2360
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getApnType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/android/internal/telephony/PhoneBase;->notifyDataConnection(Ljava/lang/String;Ljava/lang/String;)V

    .line 2364
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isDisconnected()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2365
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v2

    invoke-virtual {v2}, Lcom/android/internal/telephony/ServiceStateTracker;->processPendingRadioPowerOffAfterDataOff()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 2366
    const-string v2, "onDisconnectDone: radio will be turned off, no retries"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2368
    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setApnSetting(Lcom/android/internal/telephony/dataconnection/ApnSetting;)V

    .line 2369
    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setDataConnectionAc(Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;)V

    .line 2373
    iget v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    if-lez v2, :cond_0

    .line 2374
    iget v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    .line 2376
    :cond_0
    iget v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    if-nez v2, :cond_1

    .line 2377
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyDataDisconnectComplete()V

    .line 2378
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyAllDataDisconnected()V

    .line 2418
    :cond_1
    :goto_0
    return-void

    .line 2353
    :cond_2
    const-string v2, "onDisconnectDone: Invalid ar in onDisconnectDone, ignore"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    goto :goto_0

    .line 2385
    :cond_3
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAttached:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isReady()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->retryAfterDisconnected(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 2386
    const-string v2, "gsm.defaultpdpcontext.active"

    const-string v3, "false"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 2390
    const-string v2, "onDisconnectDone: attached, ready and retry after disconnect"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2391
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getReason()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getApnDelay(Ljava/lang/String;)I

    move-result v2

    invoke-direct {p0, v2, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->startAlarmForReconnect(ILcom/android/internal/telephony/dataconnection/ApnContext;)V

    .line 2410
    :goto_1
    iget v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    if-lez v2, :cond_4

    .line 2411
    iget v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    add-int/lit8 v2, v2, -0x1

    iput v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    .line 2413
    :cond_4
    iget v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDisconnectPendingCount:I

    if-nez v2, :cond_1

    .line 2414
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyDataDisconnectComplete()V

    .line 2415
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyAllDataDisconnected()V

    goto :goto_0

    .line 2393
    :cond_5
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, #android:bool@config_restartRadioAfterProvisioning#t

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v1

    .line 2396
    .local v1, "restartRadioAfterProvisioning":Z
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isProvisioningApn()Z

    move-result v2

    if-eqz v2, :cond_6

    if-eqz v1, :cond_6

    .line 2397
    const-string v2, "onDisconnectDone: restartRadio after provisioning"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2398
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->restartRadio()V

    .line 2400
    :cond_6
    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setApnSetting(Lcom/android/internal/telephony/dataconnection/ApnSetting;)V

    .line 2401
    invoke-virtual {v0, v5}, Lcom/android/internal/telephony/dataconnection/ApnContext;->setDataConnectionAc(Lcom/android/internal/telephony/dataconnection/DcAsyncChannel;)V

    .line 2402
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v2

    invoke-virtual {v2}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v2

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isOnlySingleDcAllowed(I)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 2403
    const-string v2, "onDisconnectDone: isOnlySigneDcAllowed true so setup single apn"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2404
    const-string v2, "SinglePdnArbitration"

    invoke-direct {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setupDataOnConnectableApns(Ljava/lang/String;)V

    goto :goto_1

    .line 2406
    :cond_7
    const-string v2, "onDisconnectDone: not retrying"

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method protected onEnableApn(II)V
    .locals 4
    .param p1, "apnId"    # I
    .param p2, "enabled"    # I

    .prologue
    const/4 v1, 0x1

    .line 1959
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->apnIdToType(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 1960
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-nez v0, :cond_0

    .line 1961
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onEnableApn("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "): NO ApnContext"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    .line 1967
    :goto_0
    return-void

    .line 1965
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onEnableApn: apnContext="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " call applyNewState"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1966
    if-ne p2, v1, :cond_1

    :goto_1
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->getDependencyMet()Z

    move-result v2

    invoke-direct {p0, v0, v1, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->applyNewState(Lcom/android/internal/telephony/dataconnection/ApnContext;ZZ)V

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method protected onRadioAvailable()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 2015
    const-string v1, "onRadioAvailable"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2016
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getSimulatedRadioControl()Lcom/android/internal/telephony/test/SimulatedRadioControl;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 2020
    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyDataConnection(Ljava/lang/String;)V

    .line 2022
    const-string v1, "onRadioAvailable: We\'re on the simulator; assuming data is connected"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2025
    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/uicc/IccRecords;

    .line 2026
    .local v0, "r":Lcom/android/internal/telephony/uicc/IccRecords;
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/android/internal/telephony/uicc/IccRecords;->getRecordsLoaded()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2027
    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyOffApnsOfAvailability(Ljava/lang/String;)V

    .line 2030
    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getOverallState()Lcom/android/internal/telephony/DctConstants$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/DctConstants$State;->IDLE:Lcom/android/internal/telephony/DctConstants$State;

    if-eq v1, v2, :cond_2

    .line 2031
    const/4 v1, 0x1

    invoke-virtual {p0, v1, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpConnection(ZLcom/android/internal/telephony/dataconnection/ApnContext;)V

    .line 2033
    :cond_2
    return-void
.end method

.method protected onRadioOffOrNotAvailable()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 2040
    iput-boolean v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mReregisterOnReconnectFailure:Z

    .line 2042
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getSimulatedRadioControl()Lcom/android/internal/telephony/test/SimulatedRadioControl;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2045
    const-string v0, "We\'re on the simulator; assuming radio off is meaningless"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2050
    :goto_0
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyOffApnsOfAvailability(Ljava/lang/String;)V

    .line 2051
    return-void

    .line 2047
    :cond_0
    const-string v0, "onRadioOffOrNotAvailable: is off and clean up all connections"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2048
    const-string v0, "radioTurnedOff"

    invoke-virtual {p0, v1, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(ZLjava/lang/String;)Z

    goto :goto_0
.end method

.method protected onRoamingOff()V
    .locals 1

    .prologue
    .line 1984
    const-string v0, "onRoamingOff"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1986
    iget-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mUserDataEnabled:Z

    if-nez v0, :cond_0

    .line 1994
    :goto_0
    return-void

    .line 1988
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getDataOnRoamingEnabled()Z

    move-result v0

    if-nez v0, :cond_1

    .line 1989
    const-string v0, "roamingOff"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyOffApnsOfAvailability(Ljava/lang/String;)V

    .line 1990
    const-string v0, "roamingOff"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setupDataOnConnectableApns(Ljava/lang/String;)V

    goto :goto_0

    .line 1992
    :cond_1
    const-string v0, "roamingOff"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyDataConnection(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onRoamingOn()V
    .locals 2

    .prologue
    .line 1998
    const-string v0, "onRoamingOn"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2000
    iget-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mUserDataEnabled:Z

    if-nez v0, :cond_0

    .line 2011
    :goto_0
    return-void

    .line 2002
    :cond_0
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getDataOnRoamingEnabled()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2003
    const-string v0, "onRoamingOn: setup data on roaming"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2004
    const-string v0, "roamingOn"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setupDataOnConnectableApns(Ljava/lang/String;)V

    .line 2005
    const-string v0, "roamingOn"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyDataConnection(Ljava/lang/String;)V

    goto :goto_0

    .line 2007
    :cond_1
    const-string v0, "onRoamingOn: Tear down data connection on roaming."

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2008
    const/4 v0, 0x1

    const-string v1, "roamingOn"

    invoke-virtual {p0, v0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(ZLjava/lang/String;)Z

    .line 2009
    const-string v0, "roamingOn"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyOffApnsOfAvailability(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onSetDependencyMet(Ljava/lang/String;Z)V
    .locals 3
    .param p1, "apnType"    # Ljava/lang/String;
    .param p2, "met"    # Z

    .prologue
    .line 1783
    const-string v1, "hipri"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1797
    :cond_0
    :goto_0
    return-void

    .line 1785
    :cond_1
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1, p1}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 1786
    .local v0, "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-nez v0, :cond_2

    .line 1787
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSetDependencyMet: ApnContext not found in onSetDependencyMet("

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ")"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    goto :goto_0

    .line 1791
    :cond_2
    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isEnabled()Z

    move-result v1

    invoke-direct {p0, v0, v1, p2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->applyNewState(Lcom/android/internal/telephony/dataconnection/ApnContext;ZZ)V

    .line 1792
    const-string v1, "default"

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1794
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mApnContexts:Ljava/util/concurrent/ConcurrentHashMap;

    const-string v2, "hipri"

    invoke-virtual {v1, v2}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    check-cast v0, Lcom/android/internal/telephony/dataconnection/ApnContext;

    .line 1795
    .restart local v0    # "apnContext":Lcom/android/internal/telephony/dataconnection/ApnContext;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/android/internal/telephony/dataconnection/ApnContext;->isEnabled()Z

    move-result v1

    invoke-direct {p0, v0, v1, p2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->applyNewState(Lcom/android/internal/telephony/dataconnection/ApnContext;ZZ)V

    goto :goto_0
.end method

.method protected onSetInternalDataEnabled(Z)V
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 3321
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onSetInternalDataEnabled: enabled="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3322
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onSetInternalDataEnabled(ZLandroid/os/Message;)V

    .line 3323
    return-void
.end method

.method protected onSetInternalDataEnabled(ZLandroid/os/Message;)V
    .locals 3
    .param p1, "enabled"    # Z
    .param p2, "onCompleteMsg"    # Landroid/os/Message;

    .prologue
    .line 3326
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onSetInternalDataEnabled: enabled="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3327
    const/4 v0, 0x1

    .line 3329
    .local v0, "sendOnComplete":Z
    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mDataEnabledLock:Ljava/lang/Object;

    monitor-enter v2

    .line 3330
    :try_start_0
    iput-boolean p1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mInternalDataEnabled:Z

    .line 3331
    if-eqz p1, :cond_1

    .line 3332
    const-string v1, "onSetInternalDataEnabled: changed to enabled, try to setup data call"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3333
    const-string v1, "dataEnabled"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onTrySetupData(Ljava/lang/String;)Z

    .line 3339
    :goto_0
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3341
    if-eqz v0, :cond_0

    .line 3342
    if-eqz p2, :cond_0

    .line 3343
    invoke-virtual {p2}, Landroid/os/Message;->sendToTarget()V

    .line 3346
    :cond_0
    return-void

    .line 3335
    :cond_1
    const/4 v0, 0x0

    .line 3336
    :try_start_1
    const-string v1, "onSetInternalDataEnabled: changed to disabled, cleanUpAllConnections"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3337
    const/4 v1, 0x0

    invoke-virtual {p0, v1, p2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(Ljava/lang/String;Landroid/os/Message;)V

    goto :goto_0

    .line 3339
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method protected onTrySetupData(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z
    .locals 2
    .param p1, "apnContext"    # Lcom/android/internal/telephony/dataconnection/ApnContext;

    .prologue
    .line 1978
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onTrySetupData: apnContext="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1979
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->trySetupData(Lcom/android/internal/telephony/dataconnection/ApnContext;)Z

    move-result v0

    return v0
.end method

.method protected onTrySetupData(Ljava/lang/String;)Z
    .locals 2
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 1972
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "onTrySetupData: reason="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1973
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setupDataOnConnectableApns(Ljava/lang/String;)V

    .line 1974
    const/4 v0, 0x1

    return v0
.end method

.method protected onUpdateIcc()Z
    .locals 9

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x0

    .line 3176
    const/4 v4, 0x0

    .line 3177
    .local v4, "result":Z
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    if-nez v5, :cond_0

    .line 3178
    const-string v5, "onUpdateIcc: mUiccController is null. Error!"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->loge(Ljava/lang/String;)V

    move v5, v7

    .line 3216
    :goto_0
    return v5

    .line 3182
    :cond_0
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->updateSimRecords()V

    .line 3184
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v5}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v5

    invoke-virtual {v5}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v1

    .line 3185
    .local v1, "dataRat":I
    invoke-static {v1}, Lcom/android/internal/telephony/uicc/UiccController;->getFamilyFromRadioTechnology(I)I

    move-result v0

    .line 3186
    .local v0, "appFamily":I
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->getUiccRecords(I)Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v2

    .line 3187
    .local v2, "newIccRecords":Lcom/android/internal/telephony/uicc/IccRecords;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "onUpdateIcc: newIccRecords "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    :goto_1
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3189
    if-nez v1, :cond_2

    move v5, v7

    .line 3193
    goto :goto_0

    :cond_1
    move-object v5, v6

    .line 3187
    goto :goto_1

    .line 3196
    :cond_2
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/android/internal/telephony/uicc/IccRecords;

    .line 3197
    .local v3, "r":Lcom/android/internal/telephony/uicc/IccRecords;
    if-eq v3, v2, :cond_4

    .line 3198
    if-eqz v3, :cond_3

    .line 3199
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Removing stale icc objects. "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v3, :cond_5

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    :goto_2
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3201
    invoke-virtual {v3, p0}, Lcom/android/internal/telephony/uicc/IccRecords;->unregisterForRecordsLoaded(Landroid/os/Handler;)V

    .line 3202
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v6}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 3204
    :cond_3
    if-eqz v2, :cond_7

    .line 3205
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "New records found "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    if-eqz v2, :cond_6

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    :goto_3
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3207
    iget-object v5, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 3208
    const v5, 0x42002

    invoke-virtual {v2, p0, v5, v6}, Lcom/android/internal/telephony/uicc/IccRecords;->registerForRecordsLoaded(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 3214
    :goto_4
    const/4 v4, 0x1

    :cond_4
    move v5, v4

    .line 3216
    goto/16 :goto_0

    :cond_5
    move-object v5, v6

    .line 3199
    goto :goto_2

    :cond_6
    move-object v5, v6

    .line 3205
    goto :goto_3

    .line 3211
    :cond_7
    invoke-direct {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onSimNotReady()V

    goto :goto_4
.end method

.method protected onVoiceCallEnded()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 2456
    const-string v0, "onVoiceCallEnded"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2457
    iput-boolean v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mInVoiceCall:Z

    .line 2458
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2459
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/ServiceStateTracker;->isConcurrentVoiceAndDataAllowed()Z

    move-result v0

    if-nez v0, :cond_1

    .line 2460
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->startNetStatPoll()V

    .line 2461
    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->startDataStallAlarm(Z)V

    .line 2462
    const-string v0, "2GVoiceCallEnded"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyDataConnection(Ljava/lang/String;)V

    .line 2469
    :cond_0
    :goto_0
    const-string v0, "2GVoiceCallEnded"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setupDataOnConnectableApns(Ljava/lang/String;)V

    .line 2470
    return-void

    .line 2465
    :cond_1
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->resetPollStats()V

    goto :goto_0
.end method

.method protected onVoiceCallStarted()V
    .locals 1

    .prologue
    .line 2444
    const-string v0, "onVoiceCallStarted"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2445
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mInVoiceCall:Z

    .line 2446
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isConnected()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/internal/telephony/ServiceStateTracker;->isConcurrentVoiceAndDataAllowed()Z

    move-result v0

    if-nez v0, :cond_0

    .line 2447
    const-string v0, "onVoiceCallStarted stop polling"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 2448
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->stopNetStatPoll()V

    .line 2449
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->stopDataStallAlarm()V

    .line 2450
    const-string v0, "2GVoiceCallStarted"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyDataConnection(Ljava/lang/String;)V

    .line 2452
    :cond_0
    return-void
.end method

.method public registerForAllDataDisconnected(Landroid/os/Handler;ILjava/lang/Object;)V
    .locals 1
    .param p1, "h"    # Landroid/os/Handler;
    .param p2, "what"    # I
    .param p3, "obj"    # Ljava/lang/Object;

    .prologue
    .line 3306
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/RegistrantList;->addUnique(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 3308
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isDisconnected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 3309
    const-string v0, "notify All Data Disconnected"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3310
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->notifyAllDataDisconnected()V

    .line 3312
    :cond_0
    return-void
.end method

.method protected registerForAllEvents()V
    .locals 4

    .prologue
    const v3, 0x42015

    const/4 v2, 0x0

    .line 274
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v0, v0, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const v1, 0x42001

    invoke-interface {v0, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 275
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v0, v0, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const v1, 0x42006

    invoke-interface {v0, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForOffOrNotAvailable(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 277
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v0, v0, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const v1, 0x4202c

    invoke-interface {v0, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForWwanIwlanCoexistence(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 279
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v0, v0, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    const v1, 0x42004

    invoke-interface {v0, p0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->registerForDataNetworkStateChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 281
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v0

    const v1, 0x42008

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/CallTracker;->registerForVoiceCallEnded(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 283
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v0

    const v1, 0x42007

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/CallTracker;->registerForVoiceCallStarted(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 285
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x42010

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForDataConnectionAttached(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 287
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x42009

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForDataConnectionDetached(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 289
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x4200b

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForDataRoamingOn(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 291
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x4200c

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForDataRoamingOff(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 293
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x42016

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForPsRestrictedEnabled(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 295
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x42017

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForPsRestrictedDisabled(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 299
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    const v1, 0x42029

    invoke-virtual {v0, p0, v1, v2}, Lcom/android/internal/telephony/ServiceStateTracker;->registerForDataRegStateOrRatChanged(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 301
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getPhoneType()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    .line 302
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v1, v1, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-static {v0, v1, p0, v3, v2}, Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;->getInstance(Landroid/content/Context;Lcom/android/internal/telephony/CommandsInterface;Landroid/os/Handler;ILjava/lang/Object;)Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;

    move-result-object v0

    iput-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mCdmaSsm:Lcom/android/internal/telephony/cdma/CdmaSubscriptionSourceManager;

    .line 306
    invoke-virtual {p0, v3}, Lcom/android/internal/telephony/dataconnection/DcTracker;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->sendMessage(Landroid/os/Message;)Z

    .line 308
    :cond_0
    return-void
.end method

.method protected restartRadio()V
    .locals 3

    .prologue
    .line 1661
    const-string v1, "restartRadio: ************TURN OFF RADIO**************"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1662
    const/4 v1, 0x1

    const-string v2, "radioTurnedOff"

    invoke-virtual {p0, v1, v2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->cleanUpAllConnections(ZLjava/lang/String;)Z

    .line 1663
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->powerOffRadioSafely(Lcom/android/internal/telephony/dataconnection/DcTrackerBase;)V

    .line 1672
    const-string v1, "net.ppp.reset-by-timeout"

    const-string v2, "0"

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 1673
    .local v0, "reset":I
    const-string v1, "net.ppp.reset-by-timeout"

    add-int/lit8 v2, v0, 0x1

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 1674
    return-void
.end method

.method public setDataAllowed(ZLandroid/os/Message;)V
    .locals 2
    .param p1, "enable"    # Z
    .param p2, "response"    # Landroid/os/Message;

    .prologue
    .line 3372
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setDataAllowed: enable="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3373
    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIsCleanupRequired:Z

    .line 3374
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v0, v0, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v0, p1, p2}, Lcom/android/internal/telephony/CommandsInterface;->setDataAllowed(ZLandroid/os/Message;)V

    .line 3375
    iput-boolean p1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mInternalDataEnabled:Z

    .line 3376
    return-void

    .line 3373
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setImsRegistrationState(Z)V
    .locals 3
    .param p1, "registered"    # Z

    .prologue
    .line 3440
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "setImsRegistrationState - mImsRegistrationState(before): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mImsRegistrationState:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", registered(current) : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3443
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    if-nez v1, :cond_1

    .line 3449
    :cond_0
    :goto_0
    return-void

    .line 3445
    :cond_1
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v0

    .line 3446
    .local v0, "sst":Lcom/android/internal/telephony/ServiceStateTracker;
    if-eqz v0, :cond_0

    .line 3448
    invoke-virtual {v0, p1}, Lcom/android/internal/telephony/ServiceStateTracker;->setImsRegistrationState(Z)V

    goto :goto_0
.end method

.method public setInternalDataEnabled(Z)Z
    .locals 1
    .param p1, "enable"    # Z

    .prologue
    .line 3359
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setInternalDataEnabled(ZLandroid/os/Message;)Z

    move-result v0

    return v0
.end method

.method public setInternalDataEnabled(ZLandroid/os/Message;)Z
    .locals 4
    .param p1, "enable"    # Z
    .param p2, "onCompleteMsg"    # Landroid/os/Message;

    .prologue
    const/4 v2, 0x1

    .line 3363
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setInternalDataEnabled("

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, ")"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3365
    const v1, 0x4201b

    invoke-virtual {p0, v1, p2}, Lcom/android/internal/telephony/dataconnection/DcTracker;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    .line 3366
    .local v0, "msg":Landroid/os/Message;
    if-eqz p1, :cond_0

    move v1, v2

    :goto_0
    iput v1, v0, Landroid/os/Message;->arg1:I

    .line 3367
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->sendMessage(Landroid/os/Message;)Z

    .line 3368
    return v2

    .line 3366
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setInternalDataEnabledFlag(Z)Z
    .locals 2
    .param p1, "enable"    # Z

    .prologue
    .line 3349
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setInternalDataEnabledFlag("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3351
    iget-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mInternalDataEnabled:Z

    if-eq v0, p1, :cond_0

    .line 3352
    iput-boolean p1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mInternalDataEnabled:Z

    .line 3354
    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method protected setState(Lcom/android/internal/telephony/DctConstants$State;)V
    .locals 2
    .param p1, "s"    # Lcom/android/internal/telephony/DctConstants$State;

    .prologue
    .line 690
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setState should not be used in GSM"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 691
    return-void
.end method

.method protected setupDataForSinglePdnArbitration(Ljava/lang/String;)V
    .locals 2
    .param p1, "reason"    # Ljava/lang/String;

    .prologue
    .line 1209
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setupDataForSinglePdn: reason = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " isDisconnected = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isDisconnected()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 1212
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v0}, Lcom/android/internal/telephony/PhoneBase;->getServiceState()Landroid/telephony/ServiceState;

    move-result-object v0

    invoke-virtual {v0}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v0

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isOnlySingleDcAllowed(I)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->isDisconnected()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "SinglePdnArbitration"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1215
    const-string v0, "SinglePdnArbitration"

    invoke-direct {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->setupDataOnConnectableApns(Ljava/lang/String;)V

    .line 1217
    :cond_0
    return-void
.end method

.method protected supplyMessenger()V
    .locals 3

    .prologue
    .line 550
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "connectivity"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    .line 552
    .local v0, "cm":Landroid/net/ConnectivityManager;
    const/4 v1, 0x0

    new-instance v2, Landroid/os/Messenger;

    invoke-direct {v2, p0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2}, Landroid/net/ConnectivityManager;->supplyMessenger(ILandroid/os/Messenger;)V

    .line 553
    const/4 v1, 0x2

    new-instance v2, Landroid/os/Messenger;

    invoke-direct {v2, p0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2}, Landroid/net/ConnectivityManager;->supplyMessenger(ILandroid/os/Messenger;)V

    .line 554
    const/4 v1, 0x3

    new-instance v2, Landroid/os/Messenger;

    invoke-direct {v2, p0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2}, Landroid/net/ConnectivityManager;->supplyMessenger(ILandroid/os/Messenger;)V

    .line 555
    const/4 v1, 0x4

    new-instance v2, Landroid/os/Messenger;

    invoke-direct {v2, p0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2}, Landroid/net/ConnectivityManager;->supplyMessenger(ILandroid/os/Messenger;)V

    .line 556
    const/4 v1, 0x5

    new-instance v2, Landroid/os/Messenger;

    invoke-direct {v2, p0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2}, Landroid/net/ConnectivityManager;->supplyMessenger(ILandroid/os/Messenger;)V

    .line 557
    const/16 v1, 0xa

    new-instance v2, Landroid/os/Messenger;

    invoke-direct {v2, p0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2}, Landroid/net/ConnectivityManager;->supplyMessenger(ILandroid/os/Messenger;)V

    .line 558
    const/16 v1, 0xb

    new-instance v2, Landroid/os/Messenger;

    invoke-direct {v2, p0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2}, Landroid/net/ConnectivityManager;->supplyMessenger(ILandroid/os/Messenger;)V

    .line 559
    const/16 v1, 0xc

    new-instance v2, Landroid/os/Messenger;

    invoke-direct {v2, p0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2}, Landroid/net/ConnectivityManager;->supplyMessenger(ILandroid/os/Messenger;)V

    .line 560
    const/16 v1, 0xf

    new-instance v2, Landroid/os/Messenger;

    invoke-direct {v2, p0}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    invoke-virtual {v0, v1, v2}, Landroid/net/ConnectivityManager;->supplyMessenger(ILandroid/os/Messenger;)V

    .line 561
    return-void
.end method

.method public unregisterForAllDataDisconnected(Landroid/os/Handler;)V
    .locals 1
    .param p1, "h"    # Landroid/os/Handler;

    .prologue
    .line 3315
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mAllDataDisconnectedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v0, p1}, Landroid/os/RegistrantList;->remove(Landroid/os/Handler;)V

    .line 3316
    return-void
.end method

.method protected unregisterForAllEvents()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 343
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v1, v1, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v1, p0}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForAvailable(Landroid/os/Handler;)V

    .line 344
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v1, v1, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v1, p0}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForOffOrNotAvailable(Landroid/os/Handler;)V

    .line 345
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/android/internal/telephony/uicc/IccRecords;

    .line 346
    .local v0, "r":Lcom/android/internal/telephony/uicc/IccRecords;
    if-eqz v0, :cond_0

    .line 347
    invoke-virtual {v0, p0}, Lcom/android/internal/telephony/uicc/IccRecords;->unregisterForRecordsLoaded(Landroid/os/Handler;)V

    .line 348
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mIccRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 350
    :cond_0
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mSimRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "r":Lcom/android/internal/telephony/uicc/IccRecords;
    check-cast v0, Lcom/android/internal/telephony/uicc/IccRecords;

    .line 351
    .restart local v0    # "r":Lcom/android/internal/telephony/uicc/IccRecords;
    if-eqz v0, :cond_1

    .line 352
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mSimRecordsLoadedHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/android/internal/telephony/uicc/IccRecords;->unregisterForRecordsLoaded(Landroid/os/Handler;)V

    .line 353
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mSimRecords:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 355
    :cond_1
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    iget-object v1, v1, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    invoke-interface {v1, p0}, Lcom/android/internal/telephony/CommandsInterface;->unregisterForDataNetworkStateChanged(Landroid/os/Handler;)V

    .line 356
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/CallTracker;->unregisterForVoiceCallEnded(Landroid/os/Handler;)V

    .line 357
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getCallTracker()Lcom/android/internal/telephony/CallTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/CallTracker;->unregisterForVoiceCallStarted(Landroid/os/Handler;)V

    .line 358
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForDataConnectionAttached(Landroid/os/Handler;)V

    .line 359
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForDataConnectionDetached(Landroid/os/Handler;)V

    .line 360
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForDataRoamingOn(Landroid/os/Handler;)V

    .line 361
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForDataRoamingOff(Landroid/os/Handler;)V

    .line 362
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForPsRestrictedEnabled(Landroid/os/Handler;)V

    .line 363
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getServiceStateTracker()Lcom/android/internal/telephony/ServiceStateTracker;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/android/internal/telephony/ServiceStateTracker;->unregisterForPsRestrictedDisabled(Landroid/os/Handler;)V

    .line 365
    return-void
.end method

.method public update()V
    .locals 4

    .prologue
    const/4 v0, 0x1

    .line 3252
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "update sub = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneBase;->getSubId()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3253
    const-string v1, "update(): Active DDS, register for all events now!"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    .line 3254
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onUpdateIcc()Z

    .line 3256
    iget-object v1, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v1}, Lcom/android/internal/telephony/PhoneBase;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "mobile_data"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    invoke-virtual {v3}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v2, "mobile_data"

    invoke-static {v1, v2, v0}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    move-result v1

    if-ne v1, v0, :cond_0

    :goto_0
    iput-boolean v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mUserDataEnabled:Z

    .line 3259
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    instance-of v0, v0, Lcom/android/internal/telephony/cdma/CDMALTEPhone;

    if-eqz v0, :cond_1

    .line 3260
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    check-cast v0, Lcom/android/internal/telephony/cdma/CDMALTEPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/cdma/CDMALTEPhone;->updateCurrentCarrierInProvider()Z

    .line 3261
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->supplyMessenger()V

    .line 3268
    :goto_1
    return-void

    .line 3256
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 3262
    :cond_1
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    instance-of v0, v0, Lcom/android/internal/telephony/gsm/GSMPhone;

    if-eqz v0, :cond_2

    .line 3263
    iget-object v0, p0, Lcom/android/internal/telephony/dataconnection/DcTracker;->mPhone:Lcom/android/internal/telephony/PhoneBase;

    check-cast v0, Lcom/android/internal/telephony/gsm/GSMPhone;

    invoke-virtual {v0}, Lcom/android/internal/telephony/gsm/GSMPhone;->updateCurrentCarrierInProvider()Z

    .line 3264
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->supplyMessenger()V

    goto :goto_1

    .line 3266
    :cond_2
    const-string v0, "Phone object is not MultiSim. This should not hit!!!!"

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->log(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public updateRecords()V
    .locals 0

    .prologue
    .line 3276
    invoke-virtual {p0}, Lcom/android/internal/telephony/dataconnection/DcTracker;->onUpdateIcc()Z

    .line 3277
    return-void
.end method
