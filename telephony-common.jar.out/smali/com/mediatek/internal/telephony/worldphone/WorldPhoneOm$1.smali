.class Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;
.super Landroid/content/BroadcastReceiver;
.source "WorldPhoneOm.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;


# direct methods
.method constructor <init>(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V
    .locals 0

    .prologue
    .line 180
    iput-object p1, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/16 v11, -0x63

    const/16 v10, 0x64

    const/4 v9, 0x3

    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 182
    const-string v5, "[Receiver]+"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 183
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 184
    .local v0, "action":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Action: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 186
    const-string v5, "android.intent.action.SIM_STATE_CHANGED"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_c

    .line 187
    const-string v5, "ss"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 188
    .local v2, "simStatus":Ljava/lang/String;
    const-string v5, "slot"

    invoke-virtual {p2, v5, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 189
    .local v3, "slotId":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "slotId: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " simStatus: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 190
    const-string v5, "IMSI"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_a

    .line 191
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$100()I

    move-result v5

    if-ne v5, v11, :cond_0

    .line 192
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getMajorSim()I

    move-result v5

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$102(I)I

    .line 194
    :cond_0
    invoke-static {}, Lcom/android/internal/telephony/uicc/UiccController;->getInstance()Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v5

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUiccController:Lcom/android/internal/telephony/uicc/UiccController;
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$202(Lcom/android/internal/telephony/uicc/UiccController;)Lcom/android/internal/telephony/uicc/UiccController;

    .line 195
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUiccController:Lcom/android/internal/telephony/uicc/UiccController;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$200()Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v5

    if-eqz v5, :cond_3

    .line 196
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccRecordsInstance:[Lcom/android/internal/telephony/uicc/IccRecords;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$300()[Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v5

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUiccController:Lcom/android/internal/telephony/uicc/UiccController;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$200()Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v6

    invoke-virtual {v6, v3, v8}, Lcom/android/internal/telephony/uicc/UiccController;->getIccRecords(II)Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v6

    aput-object v6, v5, v3

    .line 201
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccRecordsInstance:[Lcom/android/internal/telephony/uicc/IccRecords;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$300()[Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v5

    aget-object v5, v5, v3

    if-eqz v5, :cond_4

    .line 202
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sImsi:[Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$400()[Ljava/lang/String;

    move-result-object v5

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccRecordsInstance:[Lcom/android/internal/telephony/uicc/IccRecords;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$300()[Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v6

    aget-object v6, v6, v3

    invoke-virtual {v6}, Lcom/android/internal/telephony/uicc/IccRecords;->getIMSI()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v3

    .line 207
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccCardType:[I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$500()[I

    move-result-object v5

    iget-object v6, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->getIccCardType(I)I
    invoke-static {v6, v3}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$600(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)I

    move-result v6

    aput v6, v5, v3

    .line 208
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sImsi["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sImsi:[Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$400()[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 209
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$100()I

    move-result v5

    if-ne v3, v5, :cond_9

    .line 210
    const-string v5, "Major SIM"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 211
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sImsi:[Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$400()[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v3

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->getUserType(Ljava/lang/String;)I
    invoke-static {v5, v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$800(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;Ljava/lang/String;)I

    move-result v5

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$702(I)I

    .line 212
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFirstSelect:[Z
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$900()[Z

    move-result-object v5

    aget-boolean v5, v5, v3

    if-eqz v5, :cond_1

    .line 213
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFirstSelect:[Z
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$900()[Z

    move-result-object v5

    aput-boolean v7, v5, v3

    .line 214
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$700()I

    move-result v5

    if-ne v5, v8, :cond_7

    .line 215
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1000()I

    move-result v5

    if-ne v5, v8, :cond_5

    .line 216
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    const/16 v6, 0x65

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSwitchModem(I)V
    invoke-static {v5, v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1100(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)V

    .line 226
    :cond_1
    :goto_0
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendWaitImsi:[Z
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1200()[Z

    move-result-object v5

    aget-boolean v5, v5, v3

    if-eqz v5, :cond_2

    .line 227
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendWaitImsi:[Z
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1200()[Z

    move-result-object v5

    aput-boolean v7, v5, v3

    .line 228
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "IMSI fot slot"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " now ready, resuming PLMN:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sNwPlmnStrings:[Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1300()[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v7

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " with ID:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendId:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1400()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 230
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->resumeCampingProcedure(I)V
    invoke-static {v5, v3}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1500(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)V

    .line 333
    .end local v2    # "simStatus":Ljava/lang/String;
    .end local v3    # "slotId":I
    :cond_2
    :goto_1
    const-string v5, "[Receiver]-"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 334
    :goto_2
    return-void

    .line 198
    .restart local v2    # "simStatus":Ljava/lang/String;
    .restart local v3    # "slotId":I
    :cond_3
    const-string v5, "Null sUiccController"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    goto :goto_2

    .line 204
    :cond_4
    const-string v5, "Null sIccRecordsInstance"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    goto :goto_2

    .line 217
    :cond_5
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRegion:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1000()I

    move-result v5

    const/4 v6, 0x2

    if-ne v5, v6, :cond_6

    .line 218
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSwitchModem(I)V
    invoke-static {v5, v10}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1100(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)V

    goto :goto_0

    .line 220
    :cond_6
    const-string v5, "Region unknown"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    goto :goto_0

    .line 222
    :cond_7
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$700()I

    move-result v5

    const/4 v6, 0x2

    if-eq v5, v6, :cond_8

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$700()I

    move-result v5

    if-ne v5, v9, :cond_1

    .line 223
    :cond_8
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSwitchModem(I)V
    invoke-static {v5, v10}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1100(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;I)V

    goto :goto_0

    .line 233
    :cond_9
    const-string v5, "Not major SIM"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 234
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sImsi:[Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$400()[Ljava/lang/String;

    move-result-object v6

    aget-object v6, v6, v3

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->getUserType(Ljava/lang/String;)I
    invoke-static {v5, v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$800(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;Ljava/lang/String;)I

    goto :goto_1

    .line 236
    :cond_a
    const-string v5, "ABSENT"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 237
    const/4 v5, 0x0

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sLastPlmn:Ljava/lang/String;
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1602(Ljava/lang/String;)Ljava/lang/String;

    .line 238
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sImsi:[Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$400()[Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    aput-object v6, v5, v3

    .line 239
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFirstSelect:[Z
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$900()[Z

    move-result-object v5

    aput-boolean v8, v5, v3

    .line 240
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIsInvalidSim:[Z
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1700()[Z

    move-result-object v5

    aput-boolean v7, v5, v3

    .line 241
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sSuspendWaitImsi:[Z
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1200()[Z

    move-result-object v5

    aput-boolean v7, v5, v3

    .line 242
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccCardType:[I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$500()[I

    move-result-object v5

    aput v7, v5, v3

    .line 243
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$100()I

    move-result v5

    if-ne v3, v5, :cond_b

    .line 244
    const-string v5, "Major SIM removed, no world phone service"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 245
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->removeModemStandByTimer()V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1800(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V

    .line 246
    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sUserType:I
    invoke-static {v7}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$702(I)I

    .line 247
    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDenyReason:I
    invoke-static {v8}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1902(I)I

    .line 248
    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I
    invoke-static {v11}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$102(I)I

    goto/16 :goto_1

    .line 250
    :cond_b
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SIM"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " is not major SIM"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 253
    .end local v2    # "simStatus":Ljava/lang/String;
    .end local v3    # "slotId":I
    :cond_c
    const-string v5, "android.intent.action.SERVICE_STATE"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_f

    .line 254
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    invoke-static {v5}, Landroid/telephony/ServiceState;->newFromBundle(Landroid/os/Bundle;)Landroid/telephony/ServiceState;

    move-result-object v5

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sServiceState:Landroid/telephony/ServiceState;
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2002(Landroid/telephony/ServiceState;)Landroid/telephony/ServiceState;

    .line 255
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sServiceState:Landroid/telephony/ServiceState;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2000()Landroid/telephony/ServiceState;

    move-result-object v5

    if-eqz v5, :cond_e

    .line 256
    const-string v5, "slot"

    invoke-virtual {p2, v5, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 257
    .restart local v3    # "slotId":I
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sServiceState:Landroid/telephony/ServiceState;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2000()Landroid/telephony/ServiceState;

    move-result-object v5

    invoke-virtual {v5}, Landroid/telephony/ServiceState;->getOperatorNumeric()Ljava/lang/String;

    move-result-object v5

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sPlmnSs:Ljava/lang/String;
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2102(Ljava/lang/String;)Ljava/lang/String;

    .line 258
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sServiceState:Landroid/telephony/ServiceState;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2000()Landroid/telephony/ServiceState;

    move-result-object v5

    invoke-virtual {v5}, Landroid/telephony/ServiceState;->getVoiceRegState()I

    move-result v5

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sVoiceRegState:I
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2202(I)I

    .line 260
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sServiceState:Landroid/telephony/ServiceState;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2000()Landroid/telephony/ServiceState;

    move-result-object v5

    invoke-virtual {v5}, Landroid/telephony/ServiceState;->getRilVoiceRadioTechnology()I

    move-result v5

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRilVoiceRadioTechnology:I
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2302(I)I

    .line 261
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sServiceState:Landroid/telephony/ServiceState;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2000()Landroid/telephony/ServiceState;

    move-result-object v5

    invoke-virtual {v5}, Landroid/telephony/ServiceState;->getDataRegState()I

    move-result v5

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDataRegState:I
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2402(I)I

    .line 263
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sServiceState:Landroid/telephony/ServiceState;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2000()Landroid/telephony/ServiceState;

    move-result-object v5

    invoke-virtual {v5}, Landroid/telephony/ServiceState;->getRilDataRadioTechnology()I

    move-result v5

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRilDataRadioTechnology:I
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2502(I)I

    .line 264
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "slotId: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ", "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIccCardType:[I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$500()[I

    move-result-object v6

    aget v6, v6, v3

    invoke-static {v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->iccCardTypeToString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 265
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sMajorSim: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$100()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 266
    invoke-static {}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->getActiveModemType()I

    move-result v5

    invoke-static {v5}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->modemToString(I)Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 267
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sPlmnSs: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sPlmnSs:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2100()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 268
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sVoiceRegState: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sVoiceRegState:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2200()I

    move-result v6

    invoke-static {v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->stateToString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 270
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sRilVoiceRadioTech: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sServiceState:Landroid/telephony/ServiceState;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2000()Landroid/telephony/ServiceState;

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRilVoiceRadioTechnology:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2300()I

    move-result v6

    invoke-static {v6}, Landroid/telephony/ServiceState;->rilRadioTechnologyToString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 271
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sDataRegState: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDataRegState:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2400()I

    move-result v6

    invoke-static {v6}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->stateToString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 273
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sRilDataRadioTech: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sServiceState:Landroid/telephony/ServiceState;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2000()Landroid/telephony/ServiceState;

    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sRilDataRadioTechnology:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2500()I

    move-result v6

    invoke-static {v6}, Landroid/telephony/ServiceState;->rilRadioTechnologyToString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 274
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$100()I

    move-result v5

    if-ne v3, v5, :cond_2

    .line 275
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->isNoService()Z
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2600(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)Z

    move-result v5

    if-eqz v5, :cond_d

    .line 276
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleNoService()V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2700(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V

    goto/16 :goto_1

    .line 277
    :cond_d
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->isInService()Z
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2800(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 278
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sPlmnSs:Ljava/lang/String;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2100()Ljava/lang/String;

    move-result-object v5

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sLastPlmn:Ljava/lang/String;
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1602(Ljava/lang/String;)Ljava/lang/String;

    .line 279
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->removeModemStandByTimer()V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1800(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V

    goto/16 :goto_1

    .line 283
    .end local v3    # "slotId":I
    :cond_e
    const-string v5, "Null sServiceState"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 285
    :cond_f
    const-string v5, "android.intent.action.ACTION_SHUTDOWN_IPO"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_13

    .line 286
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDefaultBootUpModem:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2900()I

    move-result v5

    if-ne v5, v10, :cond_11

    .line 287
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->isLteSupport()Z

    move-result v5

    if-eqz v5, :cond_10

    .line 288
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$3000()[Lcom/android/internal/telephony/CommandsInterface;

    move-result-object v5

    aget-object v5, v5, v7

    const/4 v6, 0x5

    invoke-static {v5, v6}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->reloadModem(Lcom/android/internal/telephony/CommandsInterface;I)V

    .line 289
    const-string v5, "Reload to FDD CSFB modem"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 291
    :cond_10
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$3000()[Lcom/android/internal/telephony/CommandsInterface;

    move-result-object v5

    aget-object v5, v5, v7

    invoke-static {v5, v9}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->reloadModem(Lcom/android/internal/telephony/CommandsInterface;I)V

    .line 292
    const-string v5, "Reload to WG modem"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 294
    :cond_11
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sDefaultBootUpModem:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$2900()I

    move-result v5

    const/16 v6, 0x65

    if-ne v5, v6, :cond_2

    .line 295
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->isLteSupport()Z

    move-result v5

    if-eqz v5, :cond_12

    .line 296
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$3000()[Lcom/android/internal/telephony/CommandsInterface;

    move-result-object v5

    aget-object v5, v5, v7

    const/4 v6, 0x6

    invoke-static {v5, v6}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->reloadModem(Lcom/android/internal/telephony/CommandsInterface;I)V

    .line 297
    const-string v5, "Reload to TDD CSFB modem"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 299
    :cond_12
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sCi:[Lcom/android/internal/telephony/CommandsInterface;
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$3000()[Lcom/android/internal/telephony/CommandsInterface;

    move-result-object v5

    aget-object v5, v5, v7

    const/4 v6, 0x4

    invoke-static {v5, v6}, Lcom/mediatek/internal/telephony/ModemSwitchHandler;->reloadModem(Lcom/android/internal/telephony/CommandsInterface;I)V

    .line 300
    const-string v5, "Reload to TG modem"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 303
    :cond_13
    const-string v5, "android.intent.action.ACTION_ADB_SWITCH_MODEM"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_16

    .line 304
    const-string v5, "mdType"

    invoke-virtual {p2, v5, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    .line 305
    .local v4, "toModem":I
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "toModem: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 306
    if-eq v4, v9, :cond_14

    const/4 v5, 0x4

    if-eq v4, v5, :cond_14

    const/4 v5, 0x5

    if-eq v4, v5, :cond_14

    const/4 v5, 0x6

    if-ne v4, v5, :cond_15

    .line 310
    :cond_14
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-virtual {v5, v7, v4}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->setModemSelectionMode(II)V

    goto/16 :goto_1

    .line 312
    :cond_15
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    invoke-virtual {v5, v8, v4}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->setModemSelectionMode(II)V

    goto/16 :goto_1

    .line 314
    .end local v4    # "toModem":I
    :cond_16
    const-string v5, "android.intent.action.AIRPLANE_MODE"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_18

    .line 315
    const-string v5, "state"

    invoke-virtual {p2, v5, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_17

    .line 316
    const-string v5, "Leave flight mode"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 317
    const/4 v5, 0x0

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sLastPlmn:Ljava/lang/String;
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1602(Ljava/lang/String;)Ljava/lang/String;

    .line 318
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$3100()I

    move-result v5

    if-ge v1, v5, :cond_2

    .line 319
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sIsInvalidSim:[Z
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$1700()[Z

    move-result-object v5

    aput-boolean v7, v5, v1

    .line 318
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 322
    .end local v1    # "i":I
    :cond_17
    const-string v5, "Enter flight mode"

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->logd(Ljava/lang/String;)V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$000(Ljava/lang/String;)V

    .line 323
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_4
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->PROJECT_SIM_NUM:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$3100()I

    move-result v5

    if-ge v1, v5, :cond_2

    .line 324
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sFirstSelect:[Z
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$900()[Z

    move-result-object v5

    aput-boolean v8, v5, v1

    .line 323
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 327
    .end local v1    # "i":I
    :cond_18
    const-string v5, "android.intent.action.ACTION_SET_PHONE_RAT_FAMILY_DONE"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 328
    # getter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$100()I

    move-result v5

    const/16 v6, -0x62

    if-eq v5, v6, :cond_19

    .line 329
    invoke-static {}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneUtil;->getMajorSim()I

    move-result v5

    # setter for: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->sMajorSim:I
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$102(I)I

    .line 331
    :cond_19
    iget-object v5, p0, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm$1;->this$0:Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;

    # invokes: Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->handleSimSwitched()V
    invoke-static {v5}, Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;->access$3200(Lcom/mediatek/internal/telephony/worldphone/WorldPhoneOm;)V

    goto/16 :goto_1
.end method
