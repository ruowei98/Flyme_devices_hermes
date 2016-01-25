.class Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;
.super Landroid/content/BroadcastReceiver;
.source "FdManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mediatek/internal/telephony/dataconnection/FdManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;


# direct methods
.method constructor <init>(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)V
    .locals 0

    .prologue
    .line 114
    iput-object p1, p0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 17
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 117
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v1

    .line 118
    .local v1, "action":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "onReceive: action="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 119
    const-string v11, "ril.fd.mode"

    const-string v12, "0"

    invoke-static {v11, v12}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 120
    .local v3, "fdMdEnableMode":I
    const-string v11, "gsm.3gswitch"

    const/4 v12, 0x1

    invoke-static {v11, v12}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v11

    add-int/lit8 v4, v11, -0x1

    .line 121
    .local v4, "fdSimId":I
    const-string v11, "android.intent.action.SCREEN_ON"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_2

    .line 122
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const/4 v12, 0x1

    # setter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsScreenOn:Z
    invoke-static {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$002(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)Z

    .line 123
    invoke-static {}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->isFdSupport()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 124
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "fdMdEnableMode="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", 3gSimID="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", when switching to SCREEN ON"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 126
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const/4 v12, 0x1

    # setter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsScreenOn:Z
    invoke-static {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$002(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)Z

    .line 127
    const/4 v11, 0x1

    if-ne v3, v11, :cond_1

    .line 130
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$100(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Lcom/android/internal/telephony/PhoneBase;

    move-result-object v11

    invoke-virtual {v11}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v11

    if-ne v11, v4, :cond_0

    .line 131
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$100(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Lcom/android/internal/telephony/PhoneBase;

    move-result-object v11

    iget-object v11, v11, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    sget-object v12, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->INFO_MD_SCREEN_STATUS:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;

    invoke-virtual {v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->ordinal()I

    move-result v12

    const/4 v13, 0x1

    const/4 v14, -0x1

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->obtainMessage(I)Landroid/os/Message;

    move-result-object v15

    invoke-interface {v11, v12, v13, v14, v15}, Lcom/android/internal/telephony/CommandsInterface;->setFDMode(IIILandroid/os/Message;)V

    .line 134
    invoke-static {}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->isFdScreenOffOnly()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 136
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const-string v12, "Because FD_SCREEN_OFF_ONLY, disable fd when screen on."

    invoke-virtual {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 138
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const/4 v12, 0x0

    # invokes: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->updateFdMdEnableStatus(Z)V
    invoke-static {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$200(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)V

    .line 224
    :cond_0
    :goto_0
    return-void

    .line 142
    :cond_1
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const-string v12, "Not Support AP-trigger FD now"

    invoke-virtual {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    goto :goto_0

    .line 145
    :cond_2
    const-string v11, "android.intent.action.SCREEN_OFF"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 146
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const/4 v12, 0x0

    # setter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsScreenOn:Z
    invoke-static {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$002(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)Z

    .line 147
    invoke-static {}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->isFdSupport()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 148
    const/4 v11, 0x1

    if-ne v3, v11, :cond_3

    .line 149
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "fdMdEnableMode="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", 3gSimID="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", when switching to SCREEN OFF"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 151
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$100(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Lcom/android/internal/telephony/PhoneBase;

    move-result-object v11

    invoke-virtual {v11}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v11

    if-ne v11, v4, :cond_0

    .line 152
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$100(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Lcom/android/internal/telephony/PhoneBase;

    move-result-object v11

    iget-object v11, v11, Lcom/android/internal/telephony/PhoneBase;->mCi:Lcom/android/internal/telephony/CommandsInterface;

    sget-object v12, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->INFO_MD_SCREEN_STATUS:Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;

    invoke-virtual {v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager$FdModeType;->ordinal()I

    move-result v12

    const/4 v13, 0x0

    const/4 v14, -0x1

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const/16 v16, 0x0

    invoke-virtual/range {v15 .. v16}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->obtainMessage(I)Landroid/os/Message;

    move-result-object v15

    invoke-interface {v11, v12, v13, v14, v15}, Lcom/android/internal/telephony/CommandsInterface;->setFDMode(IIILandroid/os/Message;)V

    .line 155
    invoke-static {}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->isFdScreenOffOnly()Z

    move-result v11

    if-eqz v11, :cond_0

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # invokes: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->checkNeedTurnOn()Z
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$300(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 157
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const-string v12, "Because FD_SCREEN_OFF_ONLY, turn on fd when screen off."

    invoke-virtual {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 159
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const/4 v12, 0x1

    # invokes: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->updateFdMdEnableStatus(Z)V
    invoke-static {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$200(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)V

    goto/16 :goto_0

    .line 163
    :cond_3
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const-string v12, "Not Support AP-trigger FD now"

    invoke-virtual {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 166
    :cond_4
    const-string v11, "android.intent.action.BATTERY_CHANGED"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_e

    .line 167
    invoke-static {}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->isFdSupport()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 168
    const-string v11, "status"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v10

    .line 169
    .local v10, "status":I
    const-string v11, "plugged"

    const/4 v12, 0x0

    move-object/from16 v0, p2

    invoke-virtual {v0, v11, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v5

    .line 170
    .local v5, "plugged":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$400(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z

    move-result v6

    .line 172
    .local v6, "previousChargingMode":Z
    const-string v8, ""

    .local v8, "sChargingModeStr":Ljava/lang/String;
    const-string v9, ""

    .line 173
    .local v9, "sPluggedStr":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const/4 v11, 0x2

    if-ne v10, v11, :cond_b

    const/4 v11, 0x1

    :goto_1
    # setter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z
    invoke-static {v12, v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$402(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)Z

    .line 174
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$400(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z

    move-result v11

    if-eqz v11, :cond_c

    const-string v8, "Charging"

    .line 176
    :goto_2
    const/4 v11, 0x1

    if-ne v5, v11, :cond_d

    .line 177
    const-string v9, "Plugged in AC"

    .line 182
    :cond_5
    :goto_3
    const/4 v11, 0x1

    if-eq v5, v11, :cond_6

    const/4 v11, 0x2

    if-ne v5, v11, :cond_7

    .line 184
    :cond_6
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const/4 v12, 0x1

    # setter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z
    invoke-static {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$402(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)Z

    .line 187
    :cond_7
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mEnableFdOnCharging:I
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$500(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)I

    move-result v7

    .line 188
    .local v7, "previousEnableFDOnCharging":I
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const-string v12, "fd.on.charge"

    const-string v13, "0"

    invoke-static {v12, v13}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v12

    # setter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mEnableFdOnCharging:I
    invoke-static {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$502(Lcom/mediatek/internal/telephony/dataconnection/FdManager;I)I

    .line 191
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$400(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z

    move-result v11

    if-ne v6, v11, :cond_8

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mEnableFdOnCharging:I
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$500(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)I

    move-result v11

    if-eq v7, v11, :cond_9

    .line 193
    :cond_8
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "fdMdEnableMode="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", 3gSimID="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", when charging state is changed"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 195
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "previousEnableFdOnCharging="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", mEnableFdOnCharging="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mEnableFdOnCharging:I
    invoke-static {v13}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$500(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)I

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", when charging state is changed"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 198
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "previousChargingMode="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", mChargingMode="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z
    invoke-static {v13}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$400(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ", status="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "("

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, ")"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 204
    :cond_9
    const/4 v11, 0x1

    if-ne v3, v11, :cond_0

    .line 205
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mPhone:Lcom/android/internal/telephony/PhoneBase;
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$100(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Lcom/android/internal/telephony/PhoneBase;

    move-result-object v11

    invoke-virtual {v11}, Lcom/android/internal/telephony/PhoneBase;->getPhoneId()I

    move-result v11

    if-ne v11, v4, :cond_0

    .line 206
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$400(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z

    move-result v11

    if-ne v6, v11, :cond_a

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mEnableFdOnCharging:I
    invoke-static {v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$500(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)I

    move-result v11

    if-eq v7, v11, :cond_0

    .line 208
    :cond_a
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # invokes: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->checkNeedTurnOn()Z
    invoke-static {v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$300(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z

    move-result v12

    # invokes: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->updateFdMdEnableStatus(Z)V
    invoke-static {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$200(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)V

    goto/16 :goto_0

    .line 173
    .end local v7    # "previousEnableFDOnCharging":I
    :cond_b
    const/4 v11, 0x0

    goto/16 :goto_1

    .line 174
    :cond_c
    const-string v8, "Non-Charging"

    goto/16 :goto_2

    .line 178
    :cond_d
    const/4 v11, 0x2

    if-ne v5, v11, :cond_5

    .line 179
    const-string v9, "Plugged in USB"

    goto/16 :goto_3

    .line 213
    .end local v5    # "plugged":I
    .end local v6    # "previousChargingMode":Z
    .end local v8    # "sChargingModeStr":Ljava/lang/String;
    .end local v9    # "sPluggedStr":Ljava/lang/String;
    .end local v10    # "status":I
    :cond_e
    const-string v11, "android.net.conn.TETHER_STATE_CHANGED"

    invoke-virtual {v1, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_0

    .line 214
    invoke-static {}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->isFdSupport()Z

    move-result v11

    if-eqz v11, :cond_0

    .line 215
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    const-string v12, "Received ConnectivityManager.ACTION_TETHER_STATE_CHANGED"

    invoke-virtual {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 216
    const-string v11, "activeArray"

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    .line 218
    .local v2, "active":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    if-eqz v2, :cond_f

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v11

    if-lez v11, :cond_f

    const/4 v11, 0x1

    :goto_4
    # setter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsTetheredMode:Z
    invoke-static {v12, v11}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$602(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)Z

    .line 219
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "[TETHER_STATE_CHANGED]mIsTetheredMode = "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mIsTetheredMode:Z
    invoke-static {v13}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$600(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "mChargingMode="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # getter for: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->mChargingMode:Z
    invoke-static {v13}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$400(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z

    move-result v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->logd(Ljava/lang/String;)V

    .line 221
    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/mediatek/internal/telephony/dataconnection/FdManager$1;->this$0:Lcom/mediatek/internal/telephony/dataconnection/FdManager;

    # invokes: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->checkNeedTurnOn()Z
    invoke-static {v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$300(Lcom/mediatek/internal/telephony/dataconnection/FdManager;)Z

    move-result v12

    # invokes: Lcom/mediatek/internal/telephony/dataconnection/FdManager;->updateFdMdEnableStatus(Z)V
    invoke-static {v11, v12}, Lcom/mediatek/internal/telephony/dataconnection/FdManager;->access$200(Lcom/mediatek/internal/telephony/dataconnection/FdManager;Z)V

    goto/16 :goto_0

    .line 218
    :cond_f
    const/4 v11, 0x0

    goto :goto_4
.end method
