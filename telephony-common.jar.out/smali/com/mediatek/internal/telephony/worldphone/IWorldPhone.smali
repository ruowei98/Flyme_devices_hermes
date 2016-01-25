.class public interface abstract Lcom/mediatek/internal/telephony/worldphone/IWorldPhone;
.super Ljava/lang/Object;
.source "IWorldPhone.java"


# static fields
.field public static final ACTION_ADB_SWITCH_MODEM:Ljava/lang/String; = "android.intent.action.ACTION_ADB_SWITCH_MODEM"

.field public static final ACTION_SHUTDOWN_IPO:Ljava/lang/String; = "android.intent.action.ACTION_SHUTDOWN_IPO"

.field public static final AUTO_SWITCH_OFF:I = -0x62

.field public static final CAMP_ON_DENY_REASON_DOMESTIC_FDD_MD:I = 0x4

.field public static final CAMP_ON_DENY_REASON_NEED_SWITCH_TO_FDD:I = 0x2

.field public static final CAMP_ON_DENY_REASON_NEED_SWITCH_TO_TDD:I = 0x3

.field public static final CAMP_ON_DENY_REASON_UNKNOWN:I = 0x1

.field public static final CAMP_ON_NOT_DENIED:I = 0x0

.field public static final DEFAULT_MAJOR_SIM:I = 0x0

.field public static final EVENT_INVALID_SIM_NOTIFY_1:I = 0x3c

.field public static final EVENT_INVALID_SIM_NOTIFY_2:I = 0x3d

.field public static final EVENT_QUERY_MODEM_TYPE:I = 0x32

.field public static final EVENT_RADIO_ON_1:I = 0x0

.field public static final EVENT_RADIO_ON_2:I = 0x1

.field public static final EVENT_REG_PLMN_CHANGED_1:I = 0xa

.field public static final EVENT_REG_PLMN_CHANGED_2:I = 0xb

.field public static final EVENT_REG_SUSPENDED_1:I = 0x1e

.field public static final EVENT_REG_SUSPENDED_2:I = 0x1f

.field public static final EVENT_STORE_MODEM_TYPE:I = 0x28

.field public static final ICC_CARD_TYPE_SIM:I = 0x1

.field public static final ICC_CARD_TYPE_UNKNOWN:I = 0x0

.field public static final ICC_CARD_TYPE_USIM:I = 0x2

.field public static final LOG_TAG:Ljava/lang/String; = "PHONE"

.field public static final MAJOR_CAPABILITY_OFF:I = -0x1

.field public static final MAJOR_SIM_UNKNOWN:I = -0x63

.field public static final NO_OP:Ljava/lang/String; = "OM"

.field public static final POLICY_OM:I = 0x0

.field public static final POLICY_OP01:I = 0x1

.field public static final REGION_DOMESTIC:I = 0x1

.field public static final REGION_FOREIGN:I = 0x2

.field public static final REGION_UNKNOWN:I = 0x0

.field public static final SELECTION_MODE_AUTO:I = 0x1

.field public static final SELECTION_MODE_MANUAL:I = 0x0

.field public static final TYPE1_USER:I = 0x1

.field public static final TYPE2_USER:I = 0x2

.field public static final TYPE3_USER:I = 0x3

.field public static final UNKNOWN_USER:I


# virtual methods
.method public abstract setModemSelectionMode(II)V
.end method
