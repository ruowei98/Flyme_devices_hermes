.class public Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;
.super Ljava/lang/Object;
.source "WorldPhoneWrapper.java"

# interfaces
.implements Lcom/mediatek/internal/telephony/worldphone/IWorldPhone;


# static fields
.field private static sOperatorSpec:I

.field private static sWorldPhoneInstance:Lcom/mediatek/internal/telephony/worldphone/IWorldPhone;

.field private static sWorldPhoneUtil:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 46
    const/4 v0, -0x1

    sput v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sOperatorSpec:I

    .line 47
    sput-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sWorldPhoneInstance:Lcom/mediatek/internal/telephony/worldphone/IWorldPhone;

    .line 48
    sput-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sWorldPhoneUtil:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    return-void
.end method

.method public static getWorldPhoneInstance()Lcom/mediatek/internal/telephony/worldphone/IWorldPhone;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 54
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sWorldPhoneInstance:Lcom/mediatek/internal/telephony/worldphone/IWorldPhone;

    if-nez v1, :cond_0

    .line 55
    const-string v1, "ro.operator.optr"

    invoke-static {v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 56
    .local v0, "optr":Ljava/lang/String;
    if-eqz v0, :cond_1

    const-string v1, "OP01"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 58
    const-string v1, "getWorldPhoneInstance: POLICY_OP01 not implemented!"

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->logd(Ljava/lang/String;)V

    .line 59
    sput v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sOperatorSpec:I

    .line 63
    :goto_0
    new-instance v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;

    invoke-direct {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;-><init>()V

    sput-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sWorldPhoneUtil:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;

    .line 64
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sOperatorSpec:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_2

    .line 70
    :cond_0
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "sOperatorSpec: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sOperatorSpec:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", isLteSupport: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->isLteSupport()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->logd(Ljava/lang/String;)V

    .line 72
    sget-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sWorldPhoneInstance:Lcom/mediatek/internal/telephony/worldphone/IWorldPhone;

    return-object v1

    .line 61
    :cond_1
    sput v2, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sOperatorSpec:I

    goto :goto_0

    .line 66
    :cond_2
    sget v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sOperatorSpec:I

    if-nez v1, :cond_0

    .line 67
    new-instance v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-direct {v1}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;-><init>()V

    sput-object v1, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sWorldPhoneInstance:Lcom/mediatek/internal/telephony/worldphone/IWorldPhone;

    goto :goto_1
.end method

.method private static logd(Ljava/lang/String;)V
    .locals 3
    .param p0, "msg"    # Ljava/lang/String;

    .prologue
    .line 84
    const-string v0, "PHONE"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "[WPO_WRAPPER]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    return-void
.end method


# virtual methods
.method public setModemSelectionMode(II)V
    .locals 2
    .param p1, "mode"    # I
    .param p2, "modemType"    # I

    .prologue
    .line 76
    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sOperatorSpec:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    sget v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sOperatorSpec:I

    if-nez v0, :cond_1

    .line 77
    :cond_0
    sget-object v0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->sWorldPhoneInstance:Lcom/mediatek/internal/telephony/worldphone/IWorldPhone;

    invoke-interface {v0, p1, p2}, Lcom/mediatek/internal/telephony/worldphone/IWorldPhone;->setModemSelectionMode(II)V

    .line 81
    :goto_0
    return-void

    .line 79
    :cond_1
    const-string v0, "Unknown World Phone Spec"

    invoke-static {v0}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneWrapper;->logd(Ljava/lang/String;)V

    goto :goto_0
.end method
