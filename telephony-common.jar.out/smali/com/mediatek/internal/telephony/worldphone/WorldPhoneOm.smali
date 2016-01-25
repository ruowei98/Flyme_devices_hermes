.class public Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;
.super Landroid/os/Handler;
.source "WorldPhoneOm.java"

# interfaces
.implements Lcom/mediatek/internal/telephony/worldphone/IWorldPhone;


# static fields
.field private static final FDD_STANDBY_TIMER:[I

.field private static final MCC_TABLE_DOMESTIC:[Ljava/lang/String;

.field private static final PLMN_TABLE_TYPE1:[Ljava/lang/String;

.field private static final PLMN_TABLE_TYPE3:[Ljava/lang/String;

.field private static final PROJECT_SIM_NUM:I

.field private static final TDD_STANDBY_TIMER:[I

.field private static sActivePhones:[Lcom/android/internal/telephony/Phone;

.field private static sCi:[Lcom/android/internal/telephony/CommandsInterface;

.field private static sContext:Landroid/content/Context;

.field private static sDataRegState:I

.field private static sDefaultBootUpModem:I

.field private static sDefultPhone:Lcom/android/internal/telephony/Phone;

.field private static sDenyReason:I

.field private static sFddStandByCounter:I

.field private static sFirstSelect:[Z

.field private static sIccCardType:[I

.field private static sIccRecordsInstance:[Lcom/android/internal/telephony/uicc/IccRecords;

.field private static sImsi:[Ljava/lang/String;

.field private static sIsInvalidSim:[Z

.field private static sLastPlmn:Ljava/lang/String;

.field private static sLock:Ljava/lang/Object;

.field private static sMajorSim:I

.field private static sModemSwitchHandler:Lcom/mediatek/internal/telephony/ModemSwitchHandler;

.field private static sNwPlmnStrings:[Ljava/lang/String;

.field private static sOperatorSpec:Ljava/lang/String;

.field private static sPlmnSs:Ljava/lang/String;

.field private static sProxyPhones:[Lcom/android/internal/telephony/Phone;

.field private static sRegion:I

.field private static sRilDataRadioTechnology:I

.field private static sRilVoiceRadioTechnology:I

.field private static sServiceState:Landroid/telephony/ServiceState;

.field private static sSuspendId:I

.field private static sSuspendWaitImsi:[Z

.field private static sTddStandByCounter:I

.field private static sUiccController:Lcom/android/internal/telephony/uicc/UiccController;

.field private static sUserType:I

.field private static sVoiceCapable:Z

.field private static sVoiceRegState:I

.field private static sWaitInFdd:Z

.field private static sWaitInTdd:Z


# instance fields
.field private mFddStandByTimerRunnable:Ljava/lang/Runnable;

.field private mTddStandByTimerRunnable:Ljava/lang/Runnable;

.field private final mWorldPhoneReceiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 66
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sLock:Ljava/lang/Object;

    .line 67
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getProjectSimNum()I

    move-result v0

    sput v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    .line 68
    new-array v0, v4, [I

    const/16 v1, 0x3c

    aput v1, v0, v3

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->FDD_STANDBY_TIMER:[I

    .line 71
    new-array v0, v4, [I

    const/16 v1, 0x28

    aput v1, v0, v3

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->TDD_STANDBY_TIMER:[I

    .line 74
    const/4 v0, 0x5

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "46000"

    aput-object v1, v0, v3

    const-string v1, "46002"

    aput-object v1, v0, v4

    const-string v1, "46007"

    aput-object v1, v0, v6

    const-string v1, "46008"

    aput-object v1, v0, v7

    const/4 v1, 0x4

    const-string v2, "46011"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PLMN_TABLE_TYPE1:[Ljava/lang/String;

    .line 77
    const/4 v0, 0x7

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "46001"

    aput-object v1, v0, v3

    const-string v1, "46006"

    aput-object v1, v0, v4

    const-string v1, "46009"

    aput-object v1, v0, v6

    const-string v1, "45407"

    aput-object v1, v0, v7

    const/4 v1, 0x4

    const-string v2, "46003"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "46005"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "45502"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PLMN_TABLE_TYPE3:[Ljava/lang/String;

    .line 81
    new-array v0, v4, [Ljava/lang/String;

    const-string v1, "460"

    aput-object v1, v0, v3

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->MCC_TABLE_DOMESTIC:[Ljava/lang/String;

    .line 85
    sput-object v5, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sContext:Landroid/content/Context;

    .line 86
    sput-object v5, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDefultPhone:Lcom/android/internal/telephony/Phone;

    .line 87
    sput-object v5, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sProxyPhones:[Lcom/android/internal/telephony/Phone;

    .line 88
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    new-array v0, v0, [Lcom/android/internal/telephony/Phone;

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sActivePhones:[Lcom/android/internal/telephony/Phone;

    .line 89
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    new-array v0, v0, [Lcom/android/internal/telephony/CommandsInterface;

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    .line 93
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    new-array v0, v0, [Ljava/lang/String;

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sImsi:[Ljava/lang/String;

    .line 106
    sput v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDefaultBootUpModem:I

    .line 107
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    new-array v0, v0, [I

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccCardType:[I

    .line 109
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    new-array v0, v0, [Z

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIsInvalidSim:[Z

    .line 110
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    new-array v0, v0, [Z

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendWaitImsi:[Z

    .line 111
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    new-array v0, v0, [Z

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFirstSelect:[Z

    .line 112
    sput-object v5, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    .line 113
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    new-array v0, v0, [Lcom/android/internal/telephony/uicc/IccRecords;

    sput-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccRecordsInstance:[Lcom/android/internal/telephony/uicc/IccRecords;

    .line 115
    sput-object v5, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sModemSwitchHandler:Lcom/mediatek/internal/telephony/ModemSwitchHandler;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x0

    .line 121
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 180
    new-instance v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;

    invoke-direct {v2, p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;-><init>(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V

    iput-object v2, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->mWorldPhoneReceiver:Landroid/content/BroadcastReceiver;

    .line 809
    new-instance v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$2;

    invoke-direct {v2, p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$2;-><init>(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V

    iput-object v2, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->mTddStandByTimerRunnable:Ljava/lang/Runnable;

    .line 820
    new-instance v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$3;

    invoke-direct {v2, p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$3;-><init>(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V

    iput-object v2, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->mFddStandByTimerRunnable:Ljava/lang/Runnable;

    .line 122
    const-string v2, "Constructor invoked"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 123
    const-string v2, "ro.operator.optr"

    const-string v3, "OM"

    invoke-static {v2, v3}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sOperatorSpec:Ljava/lang/String;

    .line 124
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Operator Spec:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sOperatorSpec:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 125
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getDefaultPhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    sput-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDefultPhone:Lcom/android/internal/telephony/Phone;

    .line 126
    invoke-static {}, Lcom/android/internal/telephony/PhoneFactory;->getPhones()[Lcom/android/internal/telephony/Phone;

    move-result-object v2

    sput-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sProxyPhones:[Lcom/android/internal/telephony/Phone;

    .line 127
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    if-ge v0, v2, :cond_0

    .line 128
    sget-object v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sActivePhones:[Lcom/android/internal/telephony/Phone;

    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sProxyPhones:[Lcom/android/internal/telephony/Phone;

    aget-object v2, v2, v0

    check-cast v2, Lcom/android/internal/telephony/PhoneProxy;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneProxy;->getActivePhone()Lcom/android/internal/telephony/Phone;

    move-result-object v2

    aput-object v2, v3, v0

    .line 129
    sget-object v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sActivePhones:[Lcom/android/internal/telephony/Phone;

    aget-object v2, v2, v0

    check-cast v2, Lcom/android/internal/telephony/PhoneBase;

    iget-object v2, v2, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    aput-object v2, v3, v0

    .line 127
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 131
    :cond_0
    const/4 v0, 0x0

    :goto_1
    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    if-ge v0, v2, :cond_1

    .line 132
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v2, v2, v0

    add-int/lit8 v3, v0, 0xa

    invoke-interface {v2, p0, v3, v5}, Lcom/android/internal/telephony/CommandsInterface;->setOnPlmnChangeNotification(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 133
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v2, v2, v0

    add-int/lit8 v3, v0, 0x1e

    invoke-interface {v2, p0, v3, v5}, Lcom/android/internal/telephony/CommandsInterface;->setOnRegistrationSuspended(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 134
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v2, v2, v0

    add-int/lit8 v3, v0, 0x0

    invoke-interface {v2, p0, v3, v5}, Lcom/android/internal/telephony/CommandsInterface;->registerForOn(Landroid/os/Handler;ILjava/lang/Object;)V

    .line 131
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 138
    :cond_1
    new-instance v2, Lcom/mediatek/internal/telephony/ModemSwitchHandler;

    invoke-direct {v2}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;-><init>()V

    sput-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sModemSwitchHandler:Lcom/mediatek/internal/telephony/ModemSwitchHandler;

    .line 139
    invoke-static {}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->getActiveModemType()I

    move-result v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->modemToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 141
    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "android.intent.action.SIM_STATE_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 142
    .local v1, "intentFilter":Landroid/content/IntentFilter;
    const-string v2, "android.intent.action.SERVICE_STATE"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 143
    const-string v2, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 144
    const-string v2, "android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 145
    const-string v2, "android.intent.action.ACTION_ADB_SWITCH_MODEM"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 146
    const-string v2, "android.intent.action.ACTION_SET_PHONE_RAT_FAMILY_DONE"

    invoke-virtual {v1, v2}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 147
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDefultPhone:Lcom/android/internal/telephony/Phone;

    if-eqz v2, :cond_2

    .line 148
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDefultPhone:Lcom/android/internal/telephony/Phone;

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getContext()Landroid/content/Context;

    move-result-object v2

    sput-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sContext:Landroid/content/Context;

    .line 152
    :goto_2
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x112005e

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    sput-boolean v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sVoiceCapable:Z

    .line 153
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sContext:Landroid/content/Context;

    iget-object v3, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->mWorldPhoneReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v2, v3, v1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 155
    sput v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sTddStandByCounter:I

    .line 156
    sput v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFddStandByCounter:I

    .line 157
    sput-boolean v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sWaitInTdd:Z

    .line 158
    sput-boolean v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sWaitInFdd:Z

    .line 159
    sput v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I

    .line 160
    sput-object v5, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sLastPlmn:Ljava/lang/String;

    .line 161
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->resetAllProperties()V

    .line 162
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getModemSelectionMode()I

    move-result v2

    if-nez v2, :cond_3

    .line 163
    const-string v2, "Auto select disable"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 164
    const/16 v2, -0x62

    sput v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    .line 176
    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "FDD_STANDBY_TIMER = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->FDD_STANDBY_TIMER:[I

    sget v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFddStandByCounter:I

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "s"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 177
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "sDefaultBootUpModem = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDefaultBootUpModem:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 178
    return-void

    .line 150
    :cond_2
    const-string v2, "DefaultPhone = null"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_2

    .line 168
    :cond_3
    const-string v2, "Auto select enable"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_3
.end method

.method static synthetic access$000(Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-static {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$100()I
    .locals 1

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    return v0
.end method

.method static synthetic access$1000()I
    .locals 1

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I

    return v0
.end method

.method static synthetic access$102(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 65
    sput p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    return p0
.end method

.method static synthetic access$1100(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;
    .param p1, "x1"    # I

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSwitchModem(I)V

    return-void
.end method

.method static synthetic access$1200()[Z
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendWaitImsi:[Z

    return-object v0
.end method

.method static synthetic access$1300()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sNwPlmnStrings:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$1400()I
    .locals 1

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendId:I

    return v0
.end method

.method static synthetic access$1500(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;
    .param p1, "x1"    # I

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->resumeCampingProcedure(I)V

    return-void
.end method

.method static synthetic access$1602(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 65
    sput-object p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sLastPlmn:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$1700()[Z
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIsInvalidSim:[Z

    return-object v0
.end method

.method static synthetic access$1800(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->removeModemStandByTimer()V

    return-void
.end method

.method static synthetic access$1902(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 65
    sput p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    return p0
.end method

.method static synthetic access$200()Lcom/android/internal/telephony/uicc/UiccController;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    return-object v0
.end method

.method static synthetic access$2000()Landroid/telephony/ServiceState;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sServiceState:Landroid/telephony/ServiceState;

    return-object v0
.end method

.method static synthetic access$2002(Landroid/telephony/ServiceState;)Landroid/telephony/ServiceState;
    .locals 0
    .param p0, "x0"    # Landroid/telephony/ServiceState;

    .prologue
    .line 65
    sput-object p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sServiceState:Landroid/telephony/ServiceState;

    return-object p0
.end method

.method static synthetic access$202(Lcom/android/internal/telephony/uicc/UiccController;)Lcom/android/internal/telephony/uicc/UiccController;
    .locals 0
    .param p0, "x0"    # Lcom/android/internal/telephony/uicc/UiccController;

    .prologue
    .line 65
    sput-object p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUiccController:Lcom/android/internal/telephony/uicc/UiccController;

    return-object p0
.end method

.method static synthetic access$2100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sPlmnSs:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$2102(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Ljava/lang/String;

    .prologue
    .line 65
    sput-object p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sPlmnSs:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$2200()I
    .locals 1

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sVoiceRegState:I

    return v0
.end method

.method static synthetic access$2202(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 65
    sput p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sVoiceRegState:I

    return p0
.end method

.method static synthetic access$2300()I
    .locals 1

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRilVoiceRadioTechnology:I

    return v0
.end method

.method static synthetic access$2302(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 65
    sput p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRilVoiceRadioTechnology:I

    return p0
.end method

.method static synthetic access$2400()I
    .locals 1

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDataRegState:I

    return v0
.end method

.method static synthetic access$2402(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 65
    sput p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDataRegState:I

    return p0
.end method

.method static synthetic access$2500()I
    .locals 1

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRilDataRadioTechnology:I

    return v0
.end method

.method static synthetic access$2502(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 65
    sput p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRilDataRadioTechnology:I

    return p0
.end method

.method static synthetic access$2600(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->isNoService()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2700(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleNoService()V

    return-void
.end method

.method static synthetic access$2800(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)Z
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->isInService()Z

    move-result v0

    return v0
.end method

.method static synthetic access$2900()I
    .locals 1

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDefaultBootUpModem:I

    return v0
.end method

.method static synthetic access$300()[Lcom/android/internal/telephony/uicc/IccRecords;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccRecordsInstance:[Lcom/android/internal/telephony/uicc/IccRecords;

    return-object v0
.end method

.method static synthetic access$3000()[Lcom/android/internal/telephony/CommandsInterface;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    return-object v0
.end method

.method static synthetic access$3100()I
    .locals 1

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    return v0
.end method

.method static synthetic access$3200(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V
    .locals 0
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    .prologue
    .line 65
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSimSwitched()V

    return-void
.end method

.method static synthetic access$3300()I
    .locals 1

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sTddStandByCounter:I

    return v0
.end method

.method static synthetic access$3302(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 65
    sput p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sTddStandByCounter:I

    return p0
.end method

.method static synthetic access$3308()I
    .locals 2

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sTddStandByCounter:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sTddStandByCounter:I

    return v0
.end method

.method static synthetic access$3400()[I
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->TDD_STANDBY_TIMER:[I

    return-object v0
.end method

.method static synthetic access$3500()I
    .locals 1

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFddStandByCounter:I

    return v0
.end method

.method static synthetic access$3502(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 65
    sput p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFddStandByCounter:I

    return p0
.end method

.method static synthetic access$3508()I
    .locals 2

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFddStandByCounter:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFddStandByCounter:I

    return v0
.end method

.method static synthetic access$3600()[I
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->FDD_STANDBY_TIMER:[I

    return-object v0
.end method

.method static synthetic access$400()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sImsi:[Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$500()[I
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccCardType:[I

    return-object v0
.end method

.method static synthetic access$600(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)I
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;
    .param p1, "x1"    # I

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->getIccCardType(I)I

    move-result v0

    return v0
.end method

.method static synthetic access$700()I
    .locals 1

    .prologue
    .line 65
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    return v0
.end method

.method static synthetic access$702(I)I
    .locals 0
    .param p0, "x0"    # I

    .prologue
    .line 65
    sput p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    return p0
.end method

.method static synthetic access$800(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;Ljava/lang/String;)I
    .locals 1
    .param p0, "x0"    # Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 65
    invoke-direct {p0, p1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->getUserType(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method static synthetic access$900()[Z
    .locals 1

    .prologue
    .line 65
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFirstSelect:[Z

    return-object v0
.end method

.method private getIccCardType(I)I
    .locals 3
    .param p1, "slotId"    # I

    .prologue
    .line 736
    const-string v0, "Unknown"

    .line 738
    .local v0, "simString":Ljava/lang/String;
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sProxyPhones:[Lcom/android/internal/telephony/Phone;

    aget-object v2, v2, p1

    check-cast v2, Lcom/android/internal/telephony/PhoneProxy;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneProxy;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/IccCard;->getIccCardType()Ljava/lang/String;

    move-result-object v0

    .line 739
    const-string v2, "SIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 740
    const-string v2, "IccCard type: SIM"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 741
    const/4 v1, 0x1

    .line 750
    .local v1, "simType":I
    :goto_0
    return v1

    .line 742
    .end local v1    # "simType":I
    :cond_0
    const-string v2, "USIM"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 743
    const-string v2, "IccCard type: USIM"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 744
    const/4 v1, 0x2

    .restart local v1    # "simType":I
    goto :goto_0

    .line 746
    .end local v1    # "simType":I
    :cond_1
    const-string v2, "IccCard type: Unknown"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 747
    const/4 v1, 0x0

    .restart local v1    # "simType":I
    goto :goto_0
.end method

.method private getRegion(Ljava/lang/String;)I
    .locals 7
    .param p1, "plmn"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 755
    if-nez p1, :cond_0

    .line 756
    const-string v6, "[getRegion] null PLMN"

    invoke-static {v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 767
    :goto_0
    return v5

    .line 759
    :cond_0
    const/4 v6, 0x3

    invoke-virtual {p1, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 760
    .local v1, "currentMcc":Ljava/lang/String;
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->MCC_TABLE_DOMESTIC:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v3, :cond_2

    aget-object v4, v0, v2

    .line 761
    .local v4, "mcc":Ljava/lang/String;
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 762
    const-string v5, "[getRegion] REGION_DOMESTIC"

    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 763
    const/4 v5, 0x1

    goto :goto_0

    .line 760
    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 766
    .end local v4    # "mcc":Ljava/lang/String;
    :cond_2
    const-string v5, "[getRegion] REGION_FOREIGN"

    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 767
    const/4 v5, 0x2

    goto :goto_0
.end method

.method private getUserType(Ljava/lang/String;)I
    .locals 6
    .param p1, "imsi"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 771
    if-eqz p1, :cond_4

    const-string v5, ""

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 772
    const/4 v5, 0x5

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 773
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PLMN_TABLE_TYPE1:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 774
    .local v3, "mccmnc":Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 775
    const-string v4, "[getUserType] Type1 user"

    invoke-static {v4}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 776
    const/4 v4, 0x1

    .line 789
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "mccmnc":Ljava/lang/String;
    :goto_1
    return v4

    .line 773
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v1    # "i$":I
    .restart local v2    # "len$":I
    .restart local v3    # "mccmnc":Ljava/lang/String;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 779
    .end local v3    # "mccmnc":Ljava/lang/String;
    :cond_1
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PLMN_TABLE_TYPE3:[Ljava/lang/String;

    array-length v2, v0

    const/4 v1, 0x0

    :goto_2
    if-ge v1, v2, :cond_3

    aget-object v3, v0, v1

    .line 780
    .restart local v3    # "mccmnc":Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 781
    const-string v4, "[getUserType] Type3 user"

    invoke-static {v4}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 782
    const/4 v4, 0x3

    goto :goto_1

    .line 779
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 785
    .end local v3    # "mccmnc":Ljava/lang/String;
    :cond_3
    const-string v4, "[getUserType] Type2 user"

    invoke-static {v4}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 786
    const/4 v4, 0x2

    goto :goto_1

    .line 788
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    :cond_4
    const-string v5, "[getUserType] null IMSI"

    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private handleInvalidSimNotify(ILandroid/os/AsyncResult;)V
    .locals 10
    .param p1, "slotId"    # I
    .param p2, "ar"    # Landroid/os/AsyncResult;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 435
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Slot"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 436
    iget-object v6, p2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v6, :cond_3

    iget-object v6, p2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v6, :cond_3

    .line 437
    iget-object v6, p2, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v6, [Ljava/lang/String;

    move-object v2, v6

    check-cast v2, [Ljava/lang/String;

    .line 438
    .local v2, "invalidSimInfo":[Ljava/lang/String;
    aget-object v3, v2, v9

    .line 439
    .local v3, "plmn":Ljava/lang/String;
    aget-object v6, v2, v8

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 440
    .local v1, "cs_invalid":I
    const/4 v6, 0x2

    aget-object v6, v2, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 441
    .local v4, "ps_invalid":I
    const/4 v6, 0x3

    aget-object v6, v2, v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 442
    .local v0, "cause":I
    const/4 v5, -0x1

    .line 443
    .local v5, "testMode":I
    const-string v6, "gsm.gcf.testmode"

    invoke-static {v6, v9}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v5

    .line 444
    if-eqz v5, :cond_1

    .line 445
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Invalid SIM notified during test mode: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 466
    .end local v0    # "cause":I
    .end local v1    # "cs_invalid":I
    .end local v2    # "invalidSimInfo":[Ljava/lang/String;
    .end local v3    # "plmn":Ljava/lang/String;
    .end local v4    # "ps_invalid":I
    .end local v5    # "testMode":I
    :cond_0
    :goto_0
    return-void

    .line 448
    .restart local v0    # "cause":I
    .restart local v1    # "cs_invalid":I
    .restart local v2    # "invalidSimInfo":[Ljava/lang/String;
    .restart local v3    # "plmn":Ljava/lang/String;
    .restart local v4    # "ps_invalid":I
    .restart local v5    # "testMode":I
    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "testMode:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", cause: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", cs_invalid: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", ps_invalid: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", plmn: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 449
    sget-boolean v6, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sVoiceCapable:Z

    if-eqz v6, :cond_2

    if-ne v1, v8, :cond_2

    .line 450
    sget-object v6, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sLastPlmn:Ljava/lang/String;

    if-nez v6, :cond_2

    .line 451
    const-string v6, "CS reject, invalid SIM"

    invoke-static {v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 452
    sget-object v6, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIsInvalidSim:[Z

    aput-boolean v8, v6, p1

    goto :goto_0

    .line 456
    :cond_2
    if-ne v4, v8, :cond_0

    .line 457
    sget-object v6, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sLastPlmn:Ljava/lang/String;

    if-nez v6, :cond_0

    .line 458
    const-string v6, "PS reject, invalid SIM"

    invoke-static {v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 459
    sget-object v6, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIsInvalidSim:[Z

    aput-boolean v8, v6, p1

    goto :goto_0

    .line 464
    .end local v0    # "cause":I
    .end local v1    # "cs_invalid":I
    .end local v2    # "invalidSimInfo":[Ljava/lang/String;
    .end local v3    # "plmn":Ljava/lang/String;
    .end local v4    # "ps_invalid":I
    .end local v5    # "testMode":I
    :cond_3
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "AsyncResult is wrong "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p2, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private handleNoService()V
    .locals 7

    .prologue
    const/4 v6, 0x5

    const/4 v5, 0x3

    const/4 v4, 0x1

    .line 589
    const-string v2, "[handleNoService]+ Can not find service"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 590
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Type"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " user"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 591
    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->regionToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 592
    invoke-static {}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->getActiveModemType()I

    move-result v1

    .line 593
    .local v1, "mdType":I
    invoke-static {v1}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->modemToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 594
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sProxyPhones:[Lcom/android/internal/telephony/Phone;

    sget v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    aget-object v2, v2, v3

    check-cast v2, Lcom/android/internal/telephony/PhoneProxy;

    invoke-virtual {v2}, Lcom/android/internal/telephony/PhoneProxy;->getIccCard()Lcom/android/internal/telephony/IccCard;

    move-result-object v2

    invoke-interface {v2}, Lcom/android/internal/telephony/IccCard;->getState()Lcom/android/internal/telephony/IccCardConstants$State;

    move-result-object v0

    .line 595
    .local v0, "iccState":Lcom/android/internal/telephony/IccCardConstants$State;
    sget-object v2, Lcom/android/internal/telephony/IccCardConstants$State;->READY:Lcom/android/internal/telephony/IccCardConstants$State;

    if-ne v0, v2, :cond_d

    .line 596
    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    if-ne v2, v4, :cond_8

    .line 597
    const/4 v2, 0x6

    if-eq v1, v2, :cond_0

    const/4 v2, 0x4

    if-ne v1, v2, :cond_4

    .line 599
    :cond_0
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->TDD_STANDBY_TIMER:[I

    sget v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sTddStandByCounter:I

    aget v2, v2, v3

    if-ltz v2, :cond_3

    .line 600
    sget-boolean v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sWaitInTdd:Z

    if-nez v2, :cond_2

    .line 601
    sput-boolean v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sWaitInTdd:Z

    .line 602
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Wait "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->TDD_STANDBY_TIMER:[I

    sget v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sTddStandByCounter:I

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "s. Timer index = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sTddStandByCounter:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 603
    iget-object v2, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->mTddStandByTimerRunnable:Ljava/lang/Runnable;

    sget-object v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->TDD_STANDBY_TIMER:[I

    sget v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sTddStandByCounter:I

    aget v3, v3, v4

    mul-int/lit16 v3, v3, 0x3e8

    int-to-long v4, v3

    invoke-virtual {p0, v2, v4, v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 637
    :cond_1
    :goto_0
    const-string v2, "[handleNoService]-"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 639
    return-void

    .line 605
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Timer already set:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->TDD_STANDBY_TIMER:[I

    sget v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sTddStandByCounter:I

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "s"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 608
    :cond_3
    const-string v2, "Standby in TDD modem"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 610
    :cond_4
    if-eq v1, v6, :cond_5

    if-ne v1, v5, :cond_1

    .line 612
    :cond_5
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->FDD_STANDBY_TIMER:[I

    sget v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFddStandByCounter:I

    aget v2, v2, v3

    if-ltz v2, :cond_7

    .line 613
    sget-boolean v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sWaitInFdd:Z

    if-nez v2, :cond_6

    .line 614
    sput-boolean v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sWaitInFdd:Z

    .line 615
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Wait "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->FDD_STANDBY_TIMER:[I

    sget v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFddStandByCounter:I

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "s. Timer index = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFddStandByCounter:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 616
    iget-object v2, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->mFddStandByTimerRunnable:Ljava/lang/Runnable;

    sget-object v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->FDD_STANDBY_TIMER:[I

    sget v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFddStandByCounter:I

    aget v3, v3, v4

    mul-int/lit16 v3, v3, 0x3e8

    int-to-long v4, v3

    invoke-virtual {p0, v2, v4, v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 618
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Timer already set:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->FDD_STANDBY_TIMER:[I

    sget v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFddStandByCounter:I

    aget v3, v3, v4

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "s"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 621
    :cond_7
    const-string v2, "Standby in FDD modem"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 624
    :cond_8
    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    const/4 v3, 0x2

    if-eq v2, v3, :cond_9

    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    if-ne v2, v5, :cond_c

    .line 625
    :cond_9
    if-eq v1, v6, :cond_a

    if-ne v1, v5, :cond_b

    .line 627
    :cond_a
    const-string v2, "Standby in FDD modem"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 629
    :cond_b
    const-string v2, "Should not enter this state"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 632
    :cond_c
    const-string v2, "Unknow user type"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 635
    :cond_d
    const-string v2, "IccState not ready"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private handlePlmnChange(Landroid/os/AsyncResult;I)V
    .locals 6
    .param p1, "ar"    # Landroid/os/AsyncResult;
    .param p2, "slotId"    # I

    .prologue
    const/4 v5, 0x2

    const/4 v4, 0x0

    .line 385
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Slot"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 386
    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    const/16 v3, -0x63

    if-ne v2, v3, :cond_0

    .line 387
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getMajorSim()I

    move-result v2

    sput v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    .line 389
    :cond_0
    iget-object v2, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v2, :cond_5

    iget-object v2, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v2, :cond_5

    .line 390
    iget-object v2, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v2, [Ljava/lang/String;

    move-object v1, v2

    check-cast v1, [Ljava/lang/String;

    .line 391
    .local v1, "plmnString":[Ljava/lang/String;
    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    if-ne p2, v2, :cond_1

    .line 392
    sput-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sNwPlmnStrings:[Ljava/lang/String;

    .line 394
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, v1

    if-ge v0, v2, :cond_2

    .line 395
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "plmnString["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, v1, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 394
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 397
    :cond_2
    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    if-ne v2, p2, :cond_3

    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_3

    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    if-eq v2, v5, :cond_3

    .line 399
    aget-object v2, v1, v4

    invoke-direct {p0, v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->searchForDesignateService(Ljava/lang/String;)V

    .line 403
    :cond_3
    aget-object v2, v1, v4

    invoke-direct {p0, v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->getRegion(Ljava/lang/String;)I

    move-result v2

    sput v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I

    .line 404
    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    const/4 v3, 0x3

    if-eq v2, v3, :cond_4

    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I

    if-ne v2, v5, :cond_4

    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    const/16 v3, -0x62

    if-eq v2, v3, :cond_4

    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    const/4 v3, -0x1

    if-eq v2, v3, :cond_4

    .line 406
    const/16 v2, 0x64

    invoke-direct {p0, v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSwitchModem(I)V

    .line 411
    .end local v0    # "i":I
    .end local v1    # "plmnString":[Ljava/lang/String;
    :cond_4
    :goto_1
    return-void

    .line 409
    :cond_5
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "AsyncResult is wrong "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private handleRadioOn(I)V
    .locals 2
    .param p1, "slotId"    # I

    .prologue
    .line 378
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Slot"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 379
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    const/16 v1, -0x63

    if-ne v0, v1, :cond_0

    .line 380
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getMajorSim()I

    move-result v0

    sput v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    .line 382
    :cond_0
    return-void
.end method

.method private handleRegistrationSuspend(Landroid/os/AsyncResult;I)V
    .locals 3
    .param p1, "ar"    # Landroid/os/AsyncResult;
    .param p2, "slotId"    # I

    .prologue
    .line 414
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Slot"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 415
    iget-object v0, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    if-nez v0, :cond_2

    iget-object v0, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    if-eqz v0, :cond_2

    .line 416
    iget-object v0, p1, Landroid/os/AsyncResult;->result:Ljava/lang/Object;

    check-cast v0, [I

    check-cast v0, [I

    const/4 v1, 0x0

    aget v0, v0, v1

    sput v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendId:I

    .line 417
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Suspending with Id="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 418
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    if-ne v0, p2, :cond_1

    .line 419
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    if-eqz v0, :cond_0

    .line 420
    invoke-direct {p0, p2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->resumeCampingProcedure(I)V

    .line 432
    :goto_0
    return-void

    .line 422
    :cond_0
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendWaitImsi:[Z

    const/4 v1, 0x1

    aput-boolean v1, v0, p2

    .line 423
    const-string v0, "User type unknown, wait for IMSI"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 426
    :cond_1
    const-string v0, "Not major slot, camp on OK"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 427
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v0, v0, p2

    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendId:I

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/android/internal/telephony/CommandsInterface;->setResumeRegistration(ILandroid/os/Message;)V

    goto :goto_0

    .line 430
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "AsyncResult is wrong "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p1, Landroid/os/AsyncResult;->exception:Ljava/lang/Throwable;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private handleSimSwitched()V
    .locals 6

    .prologue
    const/16 v5, 0x64

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 546
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    .line 547
    const-string v0, "Major capability turned off"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 548
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->removeModemStandByTimer()V

    .line 549
    sput v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    .line 586
    :goto_0
    return-void

    .line 550
    :cond_0
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    const/16 v1, -0x62

    if-ne v0, v1, :cond_1

    .line 551
    const-string v0, "Auto modem selection disabled"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 552
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->removeModemStandByTimer()V

    goto :goto_0

    .line 553
    :cond_1
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    const/16 v1, -0x63

    if-ne v0, v1, :cond_2

    .line 554
    const-string v0, "Major SIM unknown"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 556
    :cond_2
    const-string v0, "Auto modem selection enabled"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 557
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Major capability in slot"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 558
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sImsi:[Ljava/lang/String;

    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    aget-object v0, v0, v1

    if-eqz v0, :cond_3

    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sImsi:[Ljava/lang/String;

    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    aget-object v0, v0, v1

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 560
    :cond_3
    const-string v0, "Major slot IMSI not ready"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 561
    sput v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    goto :goto_0

    .line 564
    :cond_4
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sImsi:[Ljava/lang/String;

    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    aget-object v0, v0, v1

    invoke-direct {p0, v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->getUserType(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    .line 565
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    if-ne v0, v3, :cond_8

    .line 566
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sNwPlmnStrings:[Ljava/lang/String;

    if-eqz v0, :cond_5

    .line 567
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sNwPlmnStrings:[Ljava/lang/String;

    aget-object v0, v0, v2

    invoke-direct {p0, v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->getRegion(Ljava/lang/String;)I

    move-result v0

    sput v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I

    .line 569
    :cond_5
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I

    if-ne v0, v3, :cond_6

    .line 570
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFirstSelect:[Z

    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    aput-boolean v2, v0, v1

    .line 571
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccCardType:[I

    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    invoke-direct {p0, v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->getIccCardType(I)I

    move-result v2

    aput v2, v0, v1

    .line 572
    const/16 v0, 0x65

    invoke-direct {p0, v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSwitchModem(I)V

    goto/16 :goto_0

    .line 573
    :cond_6
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I

    if-ne v0, v4, :cond_7

    .line 574
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFirstSelect:[Z

    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    aput-boolean v2, v0, v1

    .line 575
    invoke-direct {p0, v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSwitchModem(I)V

    goto/16 :goto_0

    .line 577
    :cond_7
    const-string v0, "Unknown region"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 579
    :cond_8
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    if-eq v0, v4, :cond_9

    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_a

    .line 580
    :cond_9
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFirstSelect:[Z

    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    aput-boolean v2, v0, v1

    .line 581
    invoke-direct {p0, v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSwitchModem(I)V

    goto/16 :goto_0

    .line 583
    :cond_a
    const-string v0, "Unknown user type"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method private handleSwitchModem(I)V
    .locals 8
    .param p1, "toModem"    # I

    .prologue
    const/4 v7, 0x5

    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 469
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIsInvalidSim:[Z

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getMajorSim()I

    move-result v2

    aget-boolean v1, v1, v2

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getModemSelectionMode()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_1

    .line 471
    const-string v1, "Invalid SIM, switch not executed!"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 543
    :cond_0
    :goto_0
    return-void

    .line 474
    :cond_1
    const/16 v1, 0x65

    if-ne p1, v1, :cond_5

    .line 475
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->isLteSupport()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 476
    const/4 p1, 0x6

    .line 487
    :cond_2
    :goto_1
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    const/16 v2, -0x62

    if-ne v1, v2, :cond_7

    .line 488
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Storing modem type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 489
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v1, v1, v3

    invoke-interface {v1, p1, v4}, Lcom/android/internal/telephony/CommandsInterface;->storeModemType(ILandroid/os/Message;)V

    .line 512
    :cond_3
    :goto_2
    invoke-static {}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->getActiveModemType()I

    move-result v1

    if-ne p1, v1, :cond_f

    .line 513
    if-ne p1, v5, :cond_c

    .line 514
    const-string v1, "Already in WG modem"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 478
    :cond_4
    const/4 p1, 0x4

    goto :goto_1

    .line 480
    :cond_5
    const/16 v1, 0x64

    if-ne p1, v1, :cond_2

    .line 481
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->isLteSupport()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 482
    const/4 p1, 0x5

    goto :goto_1

    .line 484
    :cond_6
    const/4 p1, 0x3

    goto :goto_1

    .line 491
    :cond_7
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDefaultBootUpModem:I

    if-nez v1, :cond_8

    .line 492
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Storing modem type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 493
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v1, v1, v3

    invoke-interface {v1, p1, v4}, Lcom/android/internal/telephony/CommandsInterface;->storeModemType(ILandroid/os/Message;)V

    goto :goto_2

    .line 494
    :cond_8
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDefaultBootUpModem:I

    const/16 v2, 0x64

    if-ne v1, v2, :cond_a

    .line 495
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->isLteSupport()Z

    move-result v1

    if-eqz v1, :cond_9

    .line 496
    const-string v1, "Storing modem type: 3"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 497
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v1, v1, v3

    invoke-interface {v1, v7, v4}, Lcom/android/internal/telephony/CommandsInterface;->storeModemType(ILandroid/os/Message;)V

    goto :goto_2

    .line 499
    :cond_9
    const-string v1, "Storing modem type: 5"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 500
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v1, v1, v3

    invoke-interface {v1, v5, v4}, Lcom/android/internal/telephony/CommandsInterface;->storeModemType(ILandroid/os/Message;)V

    goto :goto_2

    .line 502
    :cond_a
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDefaultBootUpModem:I

    const/16 v2, 0x65

    if-ne v1, v2, :cond_3

    .line 503
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->isLteSupport()Z

    move-result v1

    if-eqz v1, :cond_b

    .line 504
    const-string v1, "Storing modem type: 3"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 505
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v1, v1, v3

    const/4 v2, 0x6

    invoke-interface {v1, v2, v4}, Lcom/android/internal/telephony/CommandsInterface;->storeModemType(ILandroid/os/Message;)V

    goto :goto_2

    .line 507
    :cond_b
    const-string v1, "Storing modem type: 5"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 508
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v1, v1, v3

    invoke-interface {v1, v6, v4}, Lcom/android/internal/telephony/CommandsInterface;->storeModemType(ILandroid/os/Message;)V

    goto/16 :goto_2

    .line 515
    :cond_c
    if-ne p1, v6, :cond_d

    .line 516
    const-string v1, "Already in TG modem"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 517
    :cond_d
    if-ne p1, v7, :cond_e

    .line 518
    const-string v1, "Already in FDD CSFB modem"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 519
    :cond_e
    const/4 v1, 0x6

    if-ne p1, v1, :cond_0

    .line 520
    const-string v1, "Already in TDD CSFB modem"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 524
    :cond_f
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    if-ge v0, v1, :cond_11

    .line 525
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sActivePhones:[Lcom/android/internal/telephony/Phone;

    aget-object v1, v1, v0

    invoke-interface {v1}, Lcom/android/internal/telephony/Phone;->getState()Lcom/android/internal/telephony/PhoneConstants$State;

    move-result-object v1

    sget-object v2, Lcom/android/internal/telephony/PhoneConstants$State;->IDLE:Lcom/android/internal/telephony/PhoneConstants$State;

    if-eq v1, v2, :cond_10

    .line 526
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Phone"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is not idle, modem switch not allowed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 524
    :cond_10
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 530
    :cond_11
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->removeModemStandByTimer()V

    .line 531
    if-ne p1, v5, :cond_13

    .line 532
    const-string v1, "Switching to WG modem"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 540
    :cond_12
    :goto_4
    invoke-static {p1}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->switchModem(I)V

    .line 541
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->resetNetworkProperties()V

    goto/16 :goto_0

    .line 533
    :cond_13
    if-ne p1, v6, :cond_14

    .line 534
    const-string v1, "Switching to TG modem"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_4

    .line 535
    :cond_14
    if-ne p1, v7, :cond_15

    .line 536
    const-string v1, "Switching to FDD CSFB modem"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_4

    .line 537
    :cond_15
    const/4 v1, 0x6

    if-ne p1, v1, :cond_12

    .line 538
    const-string v1, "Switching to TDD CSFB modem"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_4
.end method

.method private isAllowCampOn(Ljava/lang/String;I)Z
    .locals 8
    .param p1, "plmnString"    # Ljava/lang/String;
    .param p2, "slotId"    # I

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x2

    const/4 v5, 0x3

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 643
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[isAllowCampOn]+ "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 644
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "User type: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget v4, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 645
    sget-object v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccCardType:[I

    aget v3, v3, p2

    invoke-static {v3}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->iccCardTypeToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 646
    invoke-direct {p0, p1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->getRegion(Ljava/lang/String;)I

    move-result v3

    sput v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I

    .line 647
    invoke-static {}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->getActiveModemType()I

    move-result v0

    .line 648
    .local v0, "mdType":I
    invoke-static {v0}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->modemToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 649
    sget v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    if-ne v3, v2, :cond_9

    .line 650
    sget v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I

    if-ne v3, v2, :cond_3

    .line 651
    const/4 v3, 0x6

    if-eq v0, v3, :cond_0

    if-ne v0, v7, :cond_1

    .line 653
    :cond_0
    sput v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    .line 654
    const-string v1, "Camp on OK"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 655
    const-string v1, "[isAllowCampOn]-"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    move v1, v2

    .line 702
    :goto_0
    return v1

    .line 657
    :cond_1
    const/4 v3, 0x5

    if-eq v0, v3, :cond_2

    if-ne v0, v5, :cond_8

    .line 659
    :cond_2
    sput v5, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    .line 660
    const-string v2, "Camp on REJECT"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 661
    const-string v2, "[isAllowCampOn]-"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 664
    :cond_3
    sget v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I

    if-ne v3, v6, :cond_7

    .line 665
    const/4 v3, 0x6

    if-eq v0, v3, :cond_4

    if-ne v0, v7, :cond_5

    .line 667
    :cond_4
    sput v6, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    .line 668
    const-string v2, "Camp on REJECT"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 669
    const-string v2, "[isAllowCampOn]-"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 671
    :cond_5
    const/4 v3, 0x5

    if-eq v0, v3, :cond_6

    if-ne v0, v5, :cond_8

    .line 673
    :cond_6
    sput v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    .line 674
    const-string v1, "Camp on OK"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 675
    const-string v1, "[isAllowCampOn]-"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    move v1, v2

    .line 676
    goto :goto_0

    .line 679
    :cond_7
    const-string v3, "Unknow region"

    invoke-static {v3}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 698
    :cond_8
    :goto_1
    sput v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    .line 699
    const-string v2, "Camp on REJECT"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 700
    const-string v2, "[isAllowCampOn]-"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 681
    :cond_9
    sget v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    if-eq v3, v6, :cond_a

    sget v3, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    if-ne v3, v5, :cond_e

    .line 682
    :cond_a
    const/4 v3, 0x6

    if-eq v0, v3, :cond_b

    if-ne v0, v7, :cond_c

    .line 684
    :cond_b
    sput v6, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    .line 685
    const-string v2, "Camp on REJECT"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 686
    const-string v2, "[isAllowCampOn]-"

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 688
    :cond_c
    const/4 v3, 0x5

    if-eq v0, v3, :cond_d

    if-ne v0, v5, :cond_8

    .line 690
    :cond_d
    sput v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    .line 691
    const-string v1, "Camp on OK"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 692
    const-string v1, "[isAllowCampOn]-"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    move v1, v2

    .line 693
    goto :goto_0

    .line 696
    :cond_e
    const-string v3, "Unknown user type"

    invoke-static {v3}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    goto :goto_1
.end method

.method private isInService()Z
    .locals 3

    .prologue
    .line 706
    const/4 v0, 0x0

    .line 708
    .local v0, "inService":Z
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sVoiceRegState:I

    if-eqz v1, :cond_0

    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDataRegState:I

    if-nez v1, :cond_1

    .line 710
    :cond_0
    const/4 v0, 0x1

    .line 712
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "inService: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 714
    return v0
.end method

.method private isNoService()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 718
    const/4 v0, 0x0

    .line 720
    .local v0, "noService":Z
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sVoiceRegState:I

    if-ne v1, v2, :cond_0

    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDataRegState:I

    if-ne v1, v2, :cond_0

    .line 725
    const/4 v0, 0x1

    .line 729
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "noService: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 731
    return v0

    .line 727
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static logd(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 910
    const-string v0, "PHONE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[WPOM]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 911
    return-void
.end method

.method private removeModemStandByTimer()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 832
    sget-boolean v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sWaitInTdd:Z

    if-eqz v0, :cond_0

    .line 833
    const-string v0, "Remove TDD wait timer. Set sWaitInTdd = false"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 834
    sput-boolean v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sWaitInTdd:Z

    .line 835
    iget-object v0, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->mTddStandByTimerRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 837
    :cond_0
    sget-boolean v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sWaitInFdd:Z

    if-eqz v0, :cond_1

    .line 838
    const-string v0, "Remove FDD wait timer. Set sWaitInFdd = false"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 839
    sput-boolean v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sWaitInFdd:Z

    .line 840
    iget-object v0, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->mFddStandByTimerRunnable:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 842
    :cond_1
    return-void
.end method

.method private resetAllProperties()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 845
    const-string v1, "[resetAllProperties]"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 846
    const/4 v1, 0x0

    sput-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sNwPlmnStrings:[Ljava/lang/String;

    .line 847
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    if-ge v0, v1, :cond_0

    .line 848
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFirstSelect:[Z

    aput-boolean v2, v1, v0

    .line 847
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 850
    :cond_0
    sput v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    .line 851
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->resetSimProperties()V

    .line 852
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->resetNetworkProperties()V

    .line 853
    return-void
.end method

.method private resetNetworkProperties()V
    .locals 4

    .prologue
    .line 856
    const-string v1, "[resetNetworkProperties]"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 857
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sLock:Ljava/lang/Object;

    monitor-enter v2

    .line 858
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    if-ge v0, v1, :cond_0

    .line 859
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendWaitImsi:[Z

    const/4 v3, 0x0

    aput-boolean v3, v1, v0

    .line 858
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 861
    :cond_0
    monitor-exit v2

    .line 862
    return-void

    .line 861
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private resetSimProperties()V
    .locals 4

    .prologue
    .line 865
    const-string v1, "[resetSimProperties]"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 866
    sget-object v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sLock:Ljava/lang/Object;

    monitor-enter v2

    .line 867
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    :try_start_0
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I

    if-ge v0, v1, :cond_0

    .line 868
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sImsi:[Ljava/lang/String;

    const-string v3, ""

    aput-object v3, v1, v0

    .line 869
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccCardType:[I

    const/4 v3, 0x0

    aput v3, v1, v0

    .line 867
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 871
    :cond_0
    const/4 v1, 0x0

    sput v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    .line 872
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getMajorSim()I

    move-result v1

    sput v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    .line 873
    monitor-exit v2

    .line 874
    return-void

    .line 873
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method private resumeCampingProcedure(I)V
    .locals 4
    .param p1, "slotId"    # I

    .prologue
    .line 794
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Resume camping slot"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 795
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sNwPlmnStrings:[Ljava/lang/String;

    const/4 v2, 0x0

    aget-object v0, v1, v2

    .line 796
    .local v0, "plmnString":Ljava/lang/String;
    invoke-direct {p0, v0, p1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->isAllowCampOn(Ljava/lang/String;I)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 797
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->removeModemStandByTimer()V

    .line 798
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;

    aget-object v1, v1, p1

    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendId:I

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lcom/android/internal/telephony/CommandsInterface;->setResumeRegistration(ILandroid/os/Message;)V

    .line 807
    :cond_0
    :goto_0
    return-void

    .line 800
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Because: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    invoke-static {v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->denyReasonToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 801
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    const/4 v2, 0x2

    if-ne v1, v2, :cond_2

    .line 802
    const/16 v1, 0x64

    invoke-direct {p0, v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSwitchModem(I)V

    goto :goto_0

    .line 803
    :cond_2
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I

    const/4 v2, 0x3

    if-ne v1, v2, :cond_0

    .line 804
    const/16 v1, 0x65

    invoke-direct {p0, v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSwitchModem(I)V

    goto :goto_0
.end method

.method private searchForDesignateService(Ljava/lang/String;)V
    .locals 6
    .param p1, "strPlmn"    # Ljava/lang/String;

    .prologue
    .line 877
    if-nez p1, :cond_1

    .line 878
    const-string v4, "[searchForDesignateService]- null source"

    invoke-static {v4}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 892
    :cond_0
    :goto_0
    return-void

    .line 881
    :cond_1
    const/4 v4, 0x0

    const/4 v5, 0x5

    invoke-virtual {p1, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    .line 882
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PLMN_TABLE_TYPE1:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 883
    .local v3, "mccmnc":Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 884
    const-string v4, "Find TD service"

    invoke-static {v4}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 885
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sUserType: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget v5, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " sRegion: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget v5, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 886
    invoke-static {}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->getActiveModemType()I

    move-result v4

    invoke-static {v4}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->modemToString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 887
    const/16 v4, 0x65

    invoke-direct {p0, v4}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSwitchModem(I)V

    goto :goto_0

    .line 882
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 338
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Landroid/os/AsyncResult;

    .line 339
    .local v0, "ar":Landroid/os/AsyncResult;
    iget v1, p1, Landroid/os/Message;->what:I

    sparse-switch v1, :sswitch_data_0

    .line 373
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unknown msg:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 375
    :goto_0
    return-void

    .line 341
    :sswitch_0
    const-string v1, "handleMessage : <EVENT_RADIO_ON>"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 342
    invoke-direct {p0, v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleRadioOn(I)V

    goto :goto_0

    .line 345
    :sswitch_1
    const-string v1, "handleMessage : <EVENT_REG_PLMN_CHANGED>"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 346
    invoke-direct {p0, v0, v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handlePlmnChange(Landroid/os/AsyncResult;I)V

    goto :goto_0

    .line 349
    :sswitch_2
    const-string v1, "handleMessage : <EVENT_REG_SUSPENDED>"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 350
    invoke-direct {p0, v0, v2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleRegistrationSuspend(Landroid/os/AsyncResult;I)V

    goto :goto_0

    .line 353
    :sswitch_3
    const-string v1, "handleMessage : <EVENT_RADIO_ON>"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 354
    invoke-direct {p0, v3}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleRadioOn(I)V

    goto :goto_0

    .line 357
    :sswitch_4
    const-string v1, "handleMessage : <EVENT_REG_PLMN_CHANGED>"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 358
    invoke-direct {p0, v0, v3}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handlePlmnChange(Landroid/os/AsyncResult;I)V

    goto :goto_0

    .line 361
    :sswitch_5
    const-string v1, "handleMessage : <EVENT_REG_SUSPENDED>"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 362
    invoke-direct {p0, v0, v3}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleRegistrationSuspend(Landroid/os/AsyncResult;I)V

    goto :goto_0

    .line 365
    :sswitch_6
    const-string v1, "handleMessage : <EVENT_INVALID_SIM_NOTIFY>"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 366
    invoke-direct {p0, v2, v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleInvalidSimNotify(ILandroid/os/AsyncResult;)V

    goto :goto_0

    .line 369
    :sswitch_7
    const-string v1, "handleMessage : <EVENT_INVALID_SIM_NOTIFY>"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 370
    invoke-direct {p0, v3, v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleInvalidSimNotify(ILandroid/os/AsyncResult;)V

    goto :goto_0

    .line 339
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x1 -> :sswitch_3
        0xa -> :sswitch_1
        0xb -> :sswitch_4
        0x1e -> :sswitch_2
        0x1f -> :sswitch_5
        0x3c -> :sswitch_6
        0x3d -> :sswitch_7
    .end sparse-switch
.end method

.method public setModemSelectionMode(II)V
    .locals 1
    .param p1, "mode"    # I
    .param p2, "modemType"    # I

    .prologue
    .line 898
    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 899
    const-string v0, "Modem Selection <AUTO>"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 900
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getMajorSim()I

    move-result v0

    sput v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    .line 901
    invoke-direct {p0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSimSwitched()V

    .line 907
    :goto_0
    return-void

    .line 903
    :cond_0
    const-string v0, "Modem Selection <MANUAL>"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V

    .line 904
    const/16 v0, -0x62

    sput v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I

    .line 905
    invoke-direct {p0, p2}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSwitchModem(I)V

    goto :goto_0
.end method
