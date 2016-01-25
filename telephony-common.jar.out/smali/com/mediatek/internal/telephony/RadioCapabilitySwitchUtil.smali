.class public Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;
.super Ljava/lang/Object;
.source "RadioCapabilitySwitchUtil.java"


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "GSM"

.field public static final MAIN_SIM_PROP:Ljava/lang/String; = "persist.radio.simswitch.iccid"

.field private static final PLMN_TABLE_TYPE1:[Ljava/lang/String;

.field private static final PLMN_TABLE_TYPE3:[Ljava/lang/String;

.field private static final PROPERTY_ICCID:Ljava/lang/String; = "ril.iccid.sim"

.field public static final SIM_OP_INFO_OP01:I = 0x1

.field public static final SIM_OP_INFO_OP02:I = 0x2

.field public static final SIM_OP_INFO_OVERSEA:I = 0x0

.field public static final SIM_TYPE_OTHER:I = 0x2

.field public static final SIM_TYPE_SIM:I = 0x0

.field public static final SIM_TYPE_USIM:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 70
    const/16 v0, 0x15

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "46000"

    aput-object v1, v0, v3

    const-string v1, "46002"

    aput-object v1, v0, v4

    const-string v1, "46007"

    aput-object v1, v0, v5

    const-string v1, "46008"

    aput-object v1, v0, v6

    const-string v1, "46011"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "00101"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "00211"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "00321"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "00431"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "00541"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "00651"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "00761"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "00871"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "00902"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "01012"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "01122"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "01232"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "46004"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "46602"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "50270"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "46003"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;->PLMN_TABLE_TYPE1:[Ljava/lang/String;

    .line 79
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const-string v1, "46001"

    aput-object v1, v0, v3

    const-string v1, "46006"

    aput-object v1, v0, v4

    const-string v1, "46009"

    aput-object v1, v0, v5

    const-string v1, "45407"

    aput-object v1, v0, v6

    const-string v1, "46005"

    aput-object v1, v0, v7

    const/4 v1, 0x5

    const-string v2, "45502"

    aput-object v2, v0, v1

    sput-object v0, Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;->PLMN_TABLE_TYPE3:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getSimInfo([I[I)V
    .locals 12
    .param p0, "simOpInfo"    # [I
    .param p1, "simType"    # [I

    .prologue
    .line 108
    array-length v9, p0

    new-array v6, v9, [Ljava/lang/String;

    .line 109
    .local v6, "strMnc":[Ljava/lang/String;
    array-length v9, p0

    new-array v7, v9, [Ljava/lang/String;

    .line 112
    .local v7, "strSimType":[Ljava/lang/String;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v9, p0

    if-ge v1, v9, :cond_a

    .line 113
    if-nez v1, :cond_3

    .line 114
    const-string v5, "gsm.ril.uicctype"

    .line 118
    .local v5, "propStr":Ljava/lang/String;
    :goto_1
    const-string v9, ""

    invoke-static {v5, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v1

    .line 119
    aget-object v9, v7, v1

    const-string v10, "SIM"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_4

    .line 120
    const/4 v9, 0x0

    aput v9, p1, v1

    .line 126
    :goto_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "SimType["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]= "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v7, v1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", simType["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget v10, p1, v1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;->logd(Ljava/lang/String;)V

    .line 127
    const-string v9, "gsm.sim.operator.numeric"

    invoke-static {v1}, Landroid/telephony/SubscriptionManager;->getSubId(I)[I

    move-result-object v10

    const/4 v11, 0x0

    aget v10, v10, v11

    const/4 v11, -0x1

    invoke-static {v9, v10, v11}, Landroid/telephony/TelephonyManager;->getTelephonyProperty(Ljava/lang/String;II)I

    move-result v8

    .line 129
    .local v8, "tmpMnc":I
    if-gez v8, :cond_6

    const-string v9, ""

    :goto_3
    aput-object v9, v6, v1

    .line 130
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "strMnc["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "] from operator.numeric:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v6, v1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;->logd(Ljava/lang/String;)V

    .line 131
    aget-object v9, v6, v1

    const-string v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 132
    if-nez v1, :cond_7

    .line 133
    const-string v5, "gsm.sim.ril.mcc.mnc"

    .line 137
    :goto_4
    const-string v9, ""

    invoke-static {v5, v9}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    aput-object v9, v6, v1

    .line 138
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "strMnc["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "] from ril.mcc.mnc:"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v6, v1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;->logd(Ljava/lang/String;)V

    .line 140
    :cond_0
    sget-object v0, Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;->PLMN_TABLE_TYPE1:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_5
    if-ge v2, v3, :cond_1

    aget-object v4, v0, v2

    .line 141
    .local v4, "mccmnc":Ljava/lang/String;
    aget-object v9, v6, v1

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_8

    .line 142
    const/4 v9, 0x1

    aput v9, p0, v1

    .line 147
    .end local v4    # "mccmnc":Ljava/lang/String;
    :cond_1
    sget-object v0, Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;->PLMN_TABLE_TYPE3:[Ljava/lang/String;

    array-length v3, v0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v3, :cond_2

    aget-object v4, v0, v2

    .line 148
    .restart local v4    # "mccmnc":Ljava/lang/String;
    aget-object v9, v6, v1

    invoke-virtual {v9, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_9

    .line 149
    const/4 v9, 0x2

    aput v9, p0, v1

    .line 153
    .end local v4    # "mccmnc":Ljava/lang/String;
    :cond_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "strMnc["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]= "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget-object v10, v6, v1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ", simOpInfo["

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "]="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    aget v10, p0, v1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;->logd(Ljava/lang/String;)V

    .line 112
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 116
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "propStr":Ljava/lang/String;
    .end local v8    # "tmpMnc":I
    :cond_3
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "gsm.ril.uicctype."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-int/lit8 v10, v1, 0x1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .restart local v5    # "propStr":Ljava/lang/String;
    goto/16 :goto_1

    .line 121
    :cond_4
    aget-object v9, v7, v1

    const-string v10, "USIM"

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 122
    const/4 v9, 0x1

    aput v9, p1, v1

    goto/16 :goto_2

    .line 124
    :cond_5
    const/4 v9, 0x2

    aput v9, p1, v1

    goto/16 :goto_2

    .line 129
    .restart local v8    # "tmpMnc":I
    :cond_6
    invoke-static {v8}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v9

    goto/16 :goto_3

    .line 135
    :cond_7
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "gsm.sim.ril.mcc.mnc."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    add-int/lit8 v10, v1, 0x1

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto/16 :goto_4

    .line 140
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    .restart local v4    # "mccmnc":Ljava/lang/String;
    :cond_8
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_5

    .line 147
    :cond_9
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_6

    .line 155
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v4    # "mccmnc":Ljava/lang/String;
    .end local v5    # "propStr":Ljava/lang/String;
    .end local v8    # "tmpMnc":I
    :cond_a
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getSimInfo(simOpInfo): "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {p0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;->logd(Ljava/lang/String;)V

    .line 156
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "getSimInfo(simType): "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-static {p1}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;->logd(Ljava/lang/String;)V

    .line 157
    return-void
.end method

.method public static isNeedSwitchInOpPackage([Lcom/android/internal/telephony/Phone;[Landroid/telephony/PhoneRatFamily;)Z
    .locals 5
    .param p0, "mProxyPhones"    # [Lcom/android/internal/telephony/Phone;
    .param p1, "rats"    # [Landroid/telephony/PhoneRatFamily;

    .prologue
    .line 167
    const-string v3, "ro.operator.optr"

    const-string v4, ""

    invoke-static {v3, v4}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 168
    .local v0, "operatorSpec":Ljava/lang/String;
    array-length v3, p0

    new-array v1, v3, [I

    .line 169
    .local v1, "simOpInfo":[I
    array-length v3, p0

    new-array v2, v3, [I

    .line 171
    .local v2, "simType":[I
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Operator Spec:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;->logd(Ljava/lang/String;)V

    .line 173
    const/4 v3, 0x1

    return v3
.end method

.method private static logd(Ljava/lang/String;)V
    .locals 3
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 306
    const-string v0, "GSM"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[RadioCapSwitchUtil] "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    return-void
.end method

.method public static updateIccid([Lcom/android/internal/telephony/Phone;)V
    .locals 4
    .param p0, "mProxyPhones"    # [Lcom/android/internal/telephony/Phone;

    .prologue
    .line 90
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 91
    aget-object v2, p0, v1

    invoke-interface {v2}, Lcom/android/internal/telephony/Phone;->getPhoneRatFamily()I

    move-result v2

    and-int/lit8 v2, v2, 0x2

    const/4 v3, 0x2

    if-ne v2, v3, :cond_1

    .line 93
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ril.iccid.sim"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    add-int/lit8 v3, v1, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 94
    .local v0, "currIccId":Ljava/lang/String;
    const-string v2, "persist.radio.simswitch.iccid"

    invoke-static {v2, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateIccid "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/mediatek/internal/telephony/RadioCapabilitySwitchUtil;->logd(Ljava/lang/String;)V

    .line 99
    .end local v0    # "currIccId":Ljava/lang/String;
    :cond_0
    return-void

    .line 90
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
