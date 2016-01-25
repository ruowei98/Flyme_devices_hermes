.class public Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;
.super Lcom/android/internal/telephony/RIL$RILReceiver;
.source "MediaTekRIL.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/internal/telephony/MediaTekRIL;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "MTKRILReceiver"
.end annotation


# instance fields
.field buffer:[B

.field final synthetic this$0:Lcom/android/internal/telephony/MediaTekRIL;


# direct methods
.method protected constructor <init>(Lcom/android/internal/telephony/MediaTekRIL;)V
    .locals 1

    .prologue
    .line 2060
    iput-object p1, p0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    invoke-direct {p0, p1}, Lcom/android/internal/telephony/RIL$RILReceiver;-><init>(Lcom/android/internal/telephony/RIL;)V

    .line 2061
    const/16 v0, 0x2000

    new-array v0, v0, [B

    iput-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->buffer:[B

    .line 2062
    return-void
.end method


# virtual methods
.method public run()V
    .locals 22

    .prologue
    .line 2067
    const/4 v13, 0x0

    .line 2068
    .local v13, "retryCount":I
    const-string v14, "rild"

    .line 2071
    .local v14, "rilSocket":Ljava/lang/String;
    :goto_0
    const/4 v15, 0x0

    .line 2074
    .local v15, "s":Landroid/net/LocalSocket;
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v19, v0

    if-eqz v19, :cond_0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    if-nez v19, :cond_5

    .line 2075
    :cond_0
    sget-object v19, Lcom/android/internal/telephony/RIL;->SOCKET_NAME_RIL:[Ljava/lang/String;

    const/16 v20, 0x0

    aget-object v14, v19, v20

    .line 2081
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v19, v0

    if-eqz v19, :cond_1

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v19

    if-nez v19, :cond_6

    .line 2082
    :cond_1
    const/4 v4, 0x0

    .line 2087
    .local v4, "currentSim":I
    :goto_2
    const/4 v11, 0x0

    .line 2088
    .local v11, "m3GsimId":I
    const-string v19, "gsm.3gswitch"

    const/16 v20, 0x0

    invoke-static/range {v19 .. v20}, Landroid/os/SystemProperties;->getInt(Ljava/lang/String;I)I

    move-result v11

    .line 2089
    if-lez v11, :cond_7

    const/16 v19, 0x2

    move/from16 v0, v19

    if-gt v11, v0, :cond_7

    .line 2090
    add-int/lit8 v11, v11, -0x1

    .line 2095
    :goto_3
    const/16 v19, 0x1

    move/from16 v0, v19

    if-lt v11, v0, :cond_3

    .line 2096
    if-nez v4, :cond_8

    .line 2097
    sget-object v19, Lcom/android/internal/telephony/RIL;->SOCKET_NAME_RIL:[Ljava/lang/String;

    aget-object v14, v19, v11

    .line 2102
    :cond_2
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Capability switched, swap sockets ["

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ", "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "]"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_2

    .line 2106
    :cond_3
    :try_start_1
    new-instance v16, Landroid/net/LocalSocket;

    invoke-direct/range {v16 .. v16}, Landroid/net/LocalSocket;-><init>()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_2

    .line 2107
    .end local v15    # "s":Landroid/net/LocalSocket;
    .local v16, "s":Landroid/net/LocalSocket;
    :try_start_2
    new-instance v9, Landroid/net/LocalSocketAddress;

    sget-object v19, Landroid/net/LocalSocketAddress$Namespace;->RESERVED:Landroid/net/LocalSocketAddress$Namespace;

    move-object/from16 v0, v19

    invoke-direct {v9, v14, v0}, Landroid/net/LocalSocketAddress;-><init>(Ljava/lang/String;Landroid/net/LocalSocketAddress$Namespace;)V

    .line 2109
    .local v9, "l":Landroid/net/LocalSocketAddress;
    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Landroid/net/LocalSocket;->connect(Landroid/net/LocalSocketAddress;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_a
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 2142
    const/4 v13, 0x0

    .line 2144
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    move-object/from16 v0, v16

    move-object/from16 v1, v19

    iput-object v0, v1, Lcom/android/internal/telephony/MediaTekRIL;->mSocket:Landroid/net/LocalSocket;

    .line 2145
    const-string v19, "RILJ"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "("

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ") Connected to \'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\' socket"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2149
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    const-string v20, "qcomdsds"

    invoke-virtual/range {v19 .. v20}, Lcom/android/internal/telephony/MediaTekRIL;->needsOldRilFeature(Ljava/lang/String;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 2150
    const-string v17, "SUB1"

    .line 2151
    .local v17, "str":Ljava/lang/String;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/String;->getBytes()[B
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v5

    .line 2153
    .local v5, "data":[B
    :try_start_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL;->mSocket:Landroid/net/LocalSocket;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/net/LocalSocket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v5}, Ljava/io/OutputStream;->write([B)V

    .line 2154
    const-string v19, "RILJ"

    const-string v20, "Data sent!!"

    invoke-static/range {v19 .. v20}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    .line 2162
    .end local v5    # "data":[B
    .end local v17    # "str":Ljava/lang/String;
    :cond_4
    :goto_5
    const/4 v10, 0x0

    .line 2164
    .local v10, "length":I
    :try_start_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL;->mSocket:Landroid/net/LocalSocket;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/net/LocalSocket;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    .line 2169
    .local v8, "is":Ljava/io/InputStream;
    :goto_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->buffer:[B

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    # invokes: Lcom/android/internal/telephony/MediaTekRIL;->readRilMessage(Ljava/io/InputStream;[B)I
    invoke-static {v8, v0}, Lcom/android/internal/telephony/MediaTekRIL;->access$000(Ljava/io/InputStream;[B)I
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Ljava/lang/Throwable; {:try_start_5 .. :try_end_5} :catch_6

    move-result v10

    .line 2171
    if-gez v10, :cond_c

    .line 2193
    .end local v8    # "is":Ljava/io/InputStream;
    :goto_7
    :try_start_6
    const-string v19, "RILJ"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "("

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, ") Disconnected from \'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\' socket"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 2196
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    sget-object v20, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_UNAVAILABLE:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    invoke-virtual/range {v19 .. v20}, Lcom/android/internal/telephony/MediaTekRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0

    .line 2199
    :try_start_7
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL;->mSocket:Landroid/net/LocalSocket;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/net/LocalSocket;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_9
    .catch Ljava/lang/Throwable; {:try_start_7 .. :try_end_7} :catch_0

    .line 2203
    :goto_8
    :try_start_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    iput-object v0, v1, Lcom/android/internal/telephony/MediaTekRIL;->mSocket:Landroid/net/LocalSocket;

    .line 2204
    invoke-static {}, Lcom/android/internal/telephony/RILRequest;->resetSerial()V

    .line 2207
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    const/16 v20, 0x1

    const/16 v21, 0x0

    invoke-virtual/range {v19 .. v21}, Lcom/android/internal/telephony/MediaTekRIL;->clearRequestList(IZ)V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_0

    goto/16 :goto_0

    .line 2208
    .end local v9    # "l":Landroid/net/LocalSocketAddress;
    .end local v10    # "length":I
    :catch_0
    move-exception v18

    move-object/from16 v15, v16

    .line 2209
    .end local v4    # "currentSim":I
    .end local v11    # "m3GsimId":I
    .end local v16    # "s":Landroid/net/LocalSocket;
    .restart local v15    # "s":Landroid/net/LocalSocket;
    .local v18, "tr":Ljava/lang/Throwable;
    :goto_9
    const-string v19, "RILJ"

    const-string v20, "Uncaught exception"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-object/from16 v2, v18

    invoke-static {v0, v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 2213
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    const/16 v20, -0x1

    invoke-virtual/range {v19 .. v20}, Lcom/android/internal/telephony/MediaTekRIL;->notifyRegistrantsRilConnectionChanged(I)V

    .line 2214
    return-void

    .line 2077
    .end local v18    # "tr":Ljava/lang/Throwable;
    :cond_5
    :try_start_9
    sget-object v19, Lcom/android/internal/telephony/RIL;->SOCKET_NAME_RIL:[Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v20, v0

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Integer;->intValue()I

    move-result v20

    aget-object v14, v19, v20

    goto/16 :goto_1

    .line 2084
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .restart local v4    # "currentSim":I
    goto/16 :goto_2

    .line 2092
    .restart local v11    # "m3GsimId":I
    :cond_7
    const/4 v11, 0x0

    goto/16 :goto_3

    .line 2099
    :cond_8
    if-ne v4, v11, :cond_2

    .line 2100
    sget-object v19, Lcom/android/internal/telephony/RIL;->SOCKET_NAME_RIL:[Ljava/lang/String;

    const/16 v20, 0x0

    aget-object v14, v19, v20
    :try_end_9
    .catch Ljava/lang/Throwable; {:try_start_9 .. :try_end_9} :catch_2

    goto/16 :goto_4

    .line 2110
    :catch_1
    move-exception v6

    .line 2112
    .local v6, "ex":Ljava/io/IOException;
    :goto_a
    if-eqz v15, :cond_9

    .line 2113
    :try_start_a
    invoke-virtual {v15}, Landroid/net/LocalSocket;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_7
    .catch Ljava/lang/Throwable; {:try_start_a .. :try_end_a} :catch_2

    .line 2122
    :cond_9
    :goto_b
    const/16 v19, 0x8

    move/from16 v0, v19

    if-ne v13, v0, :cond_b

    .line 2123
    :try_start_b
    const-string v19, "RILJ"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Couldn\'t find \'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\' socket after "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, " times, continuing to retry silently"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_b
    .catch Ljava/lang/Throwable; {:try_start_b .. :try_end_b} :catch_2

    .line 2134
    :cond_a
    :goto_c
    const-wide/16 v20, 0xfa0

    :try_start_c
    invoke-static/range {v20 .. v21}, Ljava/lang/Thread;->sleep(J)V
    :try_end_c
    .catch Ljava/lang/InterruptedException; {:try_start_c .. :try_end_c} :catch_8
    .catch Ljava/lang/Throwable; {:try_start_c .. :try_end_c} :catch_2

    .line 2138
    :goto_d
    add-int/lit8 v13, v13, 0x1

    .line 2139
    goto/16 :goto_0

    .line 2127
    :cond_b
    if-ltz v13, :cond_a

    const/16 v19, 0x8

    move/from16 v0, v19

    if-ge v13, v0, :cond_a

    .line 2128
    :try_start_d
    const-string v19, "RILJ"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Couldn\'t find \'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\' socket; retrying after timeout"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_d
    .catch Ljava/lang/Throwable; {:try_start_d .. :try_end_d} :catch_2

    goto :goto_c

    .line 2208
    .end local v4    # "currentSim":I
    .end local v6    # "ex":Ljava/io/IOException;
    .end local v11    # "m3GsimId":I
    :catch_2
    move-exception v18

    goto/16 :goto_9

    .line 2155
    .end local v15    # "s":Landroid/net/LocalSocket;
    .restart local v4    # "currentSim":I
    .restart local v5    # "data":[B
    .restart local v9    # "l":Landroid/net/LocalSocketAddress;
    .restart local v11    # "m3GsimId":I
    .restart local v16    # "s":Landroid/net/LocalSocket;
    .restart local v17    # "str":Ljava/lang/String;
    :catch_3
    move-exception v6

    .line 2156
    .restart local v6    # "ex":Ljava/io/IOException;
    :try_start_e
    const-string v19, "RILJ"

    const-string v20, "IOException"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v6}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_5

    .line 2157
    .end local v6    # "ex":Ljava/io/IOException;
    :catch_4
    move-exception v7

    .line 2158
    .local v7, "exc":Ljava/lang/RuntimeException;
    const-string v19, "RILJ"

    const-string v20, "Uncaught exception "

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_e
    .catch Ljava/lang/Throwable; {:try_start_e .. :try_end_e} :catch_0

    goto/16 :goto_5

    .line 2176
    .end local v5    # "data":[B
    .end local v7    # "exc":Ljava/lang/RuntimeException;
    .end local v17    # "str":Ljava/lang/String;
    .restart local v8    # "is":Ljava/io/InputStream;
    .restart local v10    # "length":I
    :cond_c
    :try_start_f
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v12

    .line 2177
    .local v12, "p":Landroid/os/Parcel;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->buffer:[B

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v20

    invoke-virtual {v12, v0, v1, v10}, Landroid/os/Parcel;->unmarshall([BII)V

    .line 2178
    const/16 v19, 0x0

    move/from16 v0, v19

    invoke-virtual {v12, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 2182
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;->this$0:Lcom/android/internal/telephony/MediaTekRIL;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v12}, Lcom/android/internal/telephony/MediaTekRIL;->processResponse(Landroid/os/Parcel;)V

    .line 2183
    invoke-virtual {v12}, Landroid/os/Parcel;->recycle()V
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_5
    .catch Ljava/lang/Throwable; {:try_start_f .. :try_end_f} :catch_6

    goto/16 :goto_6

    .line 2185
    .end local v8    # "is":Ljava/io/InputStream;
    .end local v12    # "p":Landroid/os/Parcel;
    :catch_5
    move-exception v6

    .line 2186
    .restart local v6    # "ex":Ljava/io/IOException;
    :try_start_10
    const-string v19, "RILJ"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "\'"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "\' socket closed"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v6}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_7

    .line 2188
    .end local v6    # "ex":Ljava/io/IOException;
    :catch_6
    move-exception v18

    .line 2189
    .restart local v18    # "tr":Ljava/lang/Throwable;
    const-string v19, "RILJ"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string v21, "Uncaught exception read length="

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string v21, "Exception:"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_10
    .catch Ljava/lang/Throwable; {:try_start_10 .. :try_end_10} :catch_0

    goto/16 :goto_7

    .line 2115
    .end local v9    # "l":Landroid/net/LocalSocketAddress;
    .end local v10    # "length":I
    .end local v16    # "s":Landroid/net/LocalSocket;
    .end local v18    # "tr":Ljava/lang/Throwable;
    .restart local v6    # "ex":Ljava/io/IOException;
    .restart local v15    # "s":Landroid/net/LocalSocket;
    :catch_7
    move-exception v19

    goto/16 :goto_b

    .line 2135
    :catch_8
    move-exception v19

    goto/16 :goto_d

    .line 2200
    .end local v6    # "ex":Ljava/io/IOException;
    .end local v15    # "s":Landroid/net/LocalSocket;
    .restart local v9    # "l":Landroid/net/LocalSocketAddress;
    .restart local v10    # "length":I
    .restart local v16    # "s":Landroid/net/LocalSocket;
    :catch_9
    move-exception v19

    goto/16 :goto_8

    .line 2110
    .end local v9    # "l":Landroid/net/LocalSocketAddress;
    .end local v10    # "length":I
    :catch_a
    move-exception v6

    move-object/from16 v15, v16

    .end local v16    # "s":Landroid/net/LocalSocket;
    .restart local v15    # "s":Landroid/net/LocalSocket;
    goto/16 :goto_a
.end method
