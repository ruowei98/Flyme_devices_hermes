.class public Lcom/android/internal/telephony/MediaTekRIL;
.super Lcom/android/internal/telephony/RIL;
.source "MediaTekRIL.java"

# interfaces
.implements Lcom/android/internal/telephony/CommandsInterface;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;,
        Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;
    }
.end annotation


# instance fields
.field private mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

.field private mPreviousPreferredType:I

.field mSimId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "networkMode"    # I
    .param p3, "cdmaSubscription"    # I

    .prologue
    .line 131
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 50
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSimId:I

    .line 53
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPreviousPreferredType:I

    .line 127
    new-instance v0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;-><init>(Lcom/android/internal/telephony/MediaTekRIL;)V

    iput-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    .line 132
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;IILjava/lang/Integer;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "networkMode"    # I
    .param p3, "cdmaSubscription"    # I
    .param p4, "instanceId"    # Ljava/lang/Integer;

    .prologue
    .line 135
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/internal/telephony/RIL;-><init>(Landroid/content/Context;IILjava/lang/Integer;)V

    .line 50
    const/4 v0, 0x0

    iput v0, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSimId:I

    .line 53
    const/4 v0, -0x1

    iput v0, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPreviousPreferredType:I

    .line 127
    new-instance v0, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;-><init>(Lcom/android/internal/telephony/MediaTekRIL;)V

    iput-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    .line 136
    return-void
.end method

.method static synthetic access$000(Ljava/io/InputStream;[B)I
    .locals 1
    .param p0, "x0"    # Ljava/io/InputStream;
    .param p1, "x1"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 46
    invoke-static {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->readRilMessage(Ljava/io/InputStream;[B)I

    move-result v0

    return v0
.end method

.method private handleChldRelatedRequest(Lcom/android/internal/telephony/RILRequest;)V
    .locals 9
    .param p1, "rr"    # Lcom/android/internal/telephony/RILRequest;

    .prologue
    const/4 v8, 0x1

    .line 1772
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    monitor-enter v6

    .line 1773
    :try_start_0
    iget-object v5, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v5}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->size()I

    move-result v2

    .line 1775
    .local v2, "queueSize":I
    if-lez v2, :cond_4

    .line 1776
    iget-object v5, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v5}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->get()Lcom/android/internal/telephony/RILRequest;

    move-result-object v3

    .line 1777
    .local v3, "rr2":Lcom/android/internal/telephony/RILRequest;
    iget v5, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v7, 0x31

    if-ne v5, v7, :cond_3

    .line 1779
    const-string v5, "DTMF queue isn\'t 0, first request is START, send stop dtmf and pending switch"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1780
    if-le v2, v8, :cond_0

    .line 1781
    const/4 v1, 0x2

    .line 1786
    .local v1, "j":I
    :goto_0
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "queue size  "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v7, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v7}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->size()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1788
    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_1
    if-lt v0, v1, :cond_1

    .line 1789
    iget-object v5, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v5, v0}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->remove(I)V

    .line 1788
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    .line 1784
    .end local v0    # "i":I
    .end local v1    # "j":I
    :cond_0
    const/4 v1, 0x1

    .restart local v1    # "j":I
    goto :goto_0

    .line 1791
    .restart local v0    # "i":I
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "queue size  after "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v7, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v7}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->size()I

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1792
    iget-object v5, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v5}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->size()I

    move-result v5

    if-ne v5, v8, :cond_2

    .line 1793
    const/16 v5, 0x32

    const/4 v7, 0x0

    invoke-static {v5, v7}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v4

    .line 1794
    .local v4, "rr3":Lcom/android/internal/telephony/RILRequest;
    const-string v5, "add dummy stop dtmf request"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1795
    iget-object v5, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v5}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->stop()V

    .line 1796
    iget-object v5, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v5, v4}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->add(Lcom/android/internal/telephony/RILRequest;)V

    .line 1807
    .end local v4    # "rr3":Lcom/android/internal/telephony/RILRequest;
    :cond_2
    iget-object v5, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v5, p1}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->setPendingRequest(Lcom/android/internal/telephony/RILRequest;)V

    .line 1813
    .end local v0    # "i":I
    .end local v1    # "j":I
    .end local v3    # "rr2":Lcom/android/internal/telephony/RILRequest;
    :goto_2
    monitor-exit v6

    .line 1814
    return-void

    .line 1801
    .restart local v3    # "rr2":Lcom/android/internal/telephony/RILRequest;
    :cond_3
    const-string v5, "DTMF queue isn\'t 0, first request is STOP, penging switch"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1802
    const/4 v1, 0x1

    .line 1803
    .restart local v1    # "j":I
    add-int/lit8 v0, v2, -0x1

    .restart local v0    # "i":I
    :goto_3
    if-lt v0, v1, :cond_2

    .line 1804
    iget-object v5, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v5, v0}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->remove(I)V

    .line 1803
    add-int/lit8 v0, v0, -0x1

    goto :goto_3

    .line 1809
    .end local v0    # "i":I
    .end local v1    # "j":I
    .end local v3    # "rr2":Lcom/android/internal/telephony/RILRequest;
    :cond_4
    const-string v5, "DTMF queue is 0, send switch Immediately"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1810
    iget-object v5, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v5}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->setSendChldRequest()V

    .line 1811
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    goto :goto_2

    .line 1813
    .end local v2    # "queueSize":I
    :catchall_0
    move-exception v5

    monitor-exit v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v5
.end method

.method static hexCharToInt(C)I
    .locals 3
    .param p0, "c"    # C

    .prologue
    .line 155
    const/16 v0, 0x30

    if-lt p0, v0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    add-int/lit8 v0, p0, -0x30

    .line 157
    :goto_0
    return v0

    .line 156
    :cond_0
    const/16 v0, 0x41

    if-lt p0, v0, :cond_1

    const/16 v0, 0x46

    if-gt p0, v0, :cond_1

    add-int/lit8 v0, p0, -0x41

    add-int/lit8 v0, v0, 0xa

    goto :goto_0

    .line 157
    :cond_1
    const/16 v0, 0x61

    if-lt p0, v0, :cond_2

    const/16 v0, 0x66

    if-gt p0, v0, :cond_2

    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    goto :goto_0

    .line 159
    :cond_2
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "invalid hex char \'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "\'"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static hexStringToBytes(Ljava/lang/String;)[B
    .locals 6
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 141
    if-nez p0, :cond_1

    const/4 v2, 0x0

    .line 151
    :cond_0
    return-object v2

    .line 143
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    .line 144
    .local v1, "len":I
    div-int/lit8 v3, v1, 0x2

    new-array v2, v3, [B

    .line 146
    .local v2, "ret":[B
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 147
    div-int/lit8 v3, v0, 0x2

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/android/internal/telephony/MediaTekRIL;->hexCharToInt(C)I

    move-result v4

    shl-int/lit8 v4, v4, 0x4

    add-int/lit8 v5, v0, 0x1

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lcom/android/internal/telephony/MediaTekRIL;->hexCharToInt(C)I

    move-result v5

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v2, v3

    .line 146
    add-int/lit8 v0, v0, 0x2

    goto :goto_0
.end method

.method private static readRilMessage(Ljava/io/InputStream;[B)I
    .locals 8
    .param p0, "is"    # Ljava/io/InputStream;
    .param p1, "buffer"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v4, -0x1

    .line 2015
    const/4 v2, 0x0

    .line 2016
    .local v2, "offset":I
    const/4 v3, 0x4

    .line 2018
    .local v3, "remaining":I
    :cond_0
    invoke-virtual {p0, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 2020
    .local v0, "countRead":I
    if-gez v0, :cond_1

    .line 2021
    const-string v5, "RILJ"

    const-string v6, "Hit EOS reading message length"

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v4

    .line 2050
    :goto_0
    return v1

    .line 2025
    :cond_1
    add-int/2addr v2, v0

    .line 2026
    sub-int/2addr v3, v0

    .line 2027
    if-gtz v3, :cond_0

    .line 2029
    const/4 v5, 0x0

    aget-byte v5, p1, v5

    and-int/lit16 v5, v5, 0xff

    shl-int/lit8 v5, v5, 0x18

    const/4 v6, 0x1

    aget-byte v6, p1, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x10

    or-int/2addr v5, v6

    const/4 v6, 0x2

    aget-byte v6, p1, v6

    and-int/lit16 v6, v6, 0xff

    shl-int/lit8 v6, v6, 0x8

    or-int/2addr v5, v6

    const/4 v6, 0x3

    aget-byte v6, p1, v6

    and-int/lit16 v6, v6, 0xff

    or-int v1, v5, v6

    .line 2035
    .local v1, "messageLength":I
    const/4 v2, 0x0

    .line 2036
    move v3, v1

    .line 2038
    :cond_2
    invoke-virtual {p0, p1, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v0

    .line 2040
    if-gez v0, :cond_3

    .line 2041
    const-string v5, "RILJ"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Hit EOS reading message.  messageLength="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " remaining="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    move v1, v4

    .line 2043
    goto :goto_0

    .line 2046
    :cond_3
    add-int/2addr v2, v0

    .line 2047
    sub-int/2addr v3, v0

    .line 2048
    if-gtz v3, :cond_2

    goto :goto_0
.end method

.method static requestToString(I)Ljava/lang/String;
    .locals 2
    .param p0, "request"    # I

    .prologue
    .line 1300
    sparse-switch p0, :sswitch_data_0

    .line 1564
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<unknown request> ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 1301
    :sswitch_0
    const-string v0, "GET_SIM_STATUS"

    goto :goto_0

    .line 1302
    :sswitch_1
    const-string v0, "ENTER_SIM_PIN"

    goto :goto_0

    .line 1303
    :sswitch_2
    const-string v0, "ENTER_SIM_PUK"

    goto :goto_0

    .line 1304
    :sswitch_3
    const-string v0, "ENTER_SIM_PIN2"

    goto :goto_0

    .line 1305
    :sswitch_4
    const-string v0, "ENTER_SIM_PUK2"

    goto :goto_0

    .line 1306
    :sswitch_5
    const-string v0, "CHANGE_SIM_PIN"

    goto :goto_0

    .line 1307
    :sswitch_6
    const-string v0, "CHANGE_SIM_PIN2"

    goto :goto_0

    .line 1308
    :sswitch_7
    const-string v0, "ENTER_DEPERSONALIZATION_CODE"

    goto :goto_0

    .line 1309
    :sswitch_8
    const-string v0, "GET_CURRENT_CALLS"

    goto :goto_0

    .line 1310
    :sswitch_9
    const-string v0, "DIAL"

    goto :goto_0

    .line 1311
    :sswitch_a
    const-string v0, "GET_IMSI"

    goto :goto_0

    .line 1312
    :sswitch_b
    const-string v0, "HANGUP"

    goto :goto_0

    .line 1313
    :sswitch_c
    const-string v0, "HANGUP_WAITING_OR_BACKGROUND"

    goto :goto_0

    .line 1314
    :sswitch_d
    const-string v0, "HANGUP_FOREGROUND_RESUME_BACKGROUND"

    goto :goto_0

    .line 1315
    :sswitch_e
    const-string v0, "REQUEST_SWITCH_WAITING_OR_HOLDING_AND_ACTIVE"

    goto :goto_0

    .line 1316
    :sswitch_f
    const-string v0, "CONFERENCE"

    goto :goto_0

    .line 1317
    :sswitch_10
    const-string v0, "UDUB"

    goto :goto_0

    .line 1318
    :sswitch_11
    const-string v0, "LAST_CALL_FAIL_CAUSE"

    goto :goto_0

    .line 1319
    :sswitch_12
    const-string v0, "SIGNAL_STRENGTH"

    goto :goto_0

    .line 1320
    :sswitch_13
    const-string v0, "VOICE_REGISTRATION_STATE"

    goto :goto_0

    .line 1321
    :sswitch_14
    const-string v0, "DATA_REGISTRATION_STATE"

    goto :goto_0

    .line 1322
    :sswitch_15
    const-string v0, "OPERATOR"

    goto :goto_0

    .line 1323
    :sswitch_16
    const-string v0, "RADIO_POWER"

    goto :goto_0

    .line 1324
    :sswitch_17
    const-string v0, "DTMF"

    goto :goto_0

    .line 1325
    :sswitch_18
    const-string v0, "SEND_SMS"

    goto :goto_0

    .line 1326
    :sswitch_19
    const-string v0, "SEND_SMS_EXPECT_MORE"

    goto :goto_0

    .line 1327
    :sswitch_1a
    const-string v0, "SETUP_DATA_CALL"

    goto :goto_0

    .line 1328
    :sswitch_1b
    const-string v0, "SIM_IO"

    goto :goto_0

    .line 1329
    :sswitch_1c
    const-string v0, "SEND_USSD"

    goto :goto_0

    .line 1332
    :sswitch_1d
    const-string v0, "SEND_CNAP"

    goto :goto_0

    .line 1334
    :sswitch_1e
    const-string v0, "CANCEL_USSD"

    goto :goto_0

    .line 1335
    :sswitch_1f
    const-string v0, "GET_CLIR"

    goto :goto_0

    .line 1336
    :sswitch_20
    const-string v0, "SET_CLIR"

    goto :goto_0

    .line 1337
    :sswitch_21
    const-string v0, "QUERY_CALL_FORWARD_STATUS"

    goto :goto_0

    .line 1338
    :sswitch_22
    const-string v0, "SET_CALL_FORWARD"

    goto :goto_0

    .line 1339
    :sswitch_23
    const-string v0, "QUERY_CALL_WAITING"

    goto :goto_0

    .line 1340
    :sswitch_24
    const-string v0, "SET_CALL_WAITING"

    goto :goto_0

    .line 1341
    :sswitch_25
    const-string v0, "SMS_ACKNOWLEDGE"

    goto :goto_0

    .line 1342
    :sswitch_26
    const-string v0, "GET_IMEI"

    goto :goto_0

    .line 1343
    :sswitch_27
    const-string v0, "GET_IMEISV"

    goto :goto_0

    .line 1344
    :sswitch_28
    const-string v0, "ANSWER"

    goto :goto_0

    .line 1345
    :sswitch_29
    const-string v0, "DEACTIVATE_DATA_CALL"

    goto :goto_0

    .line 1346
    :sswitch_2a
    const-string v0, "QUERY_FACILITY_LOCK"

    goto/16 :goto_0

    .line 1347
    :sswitch_2b
    const-string v0, "SET_FACILITY_LOCK"

    goto/16 :goto_0

    .line 1348
    :sswitch_2c
    const-string v0, "CHANGE_BARRING_PASSWORD"

    goto/16 :goto_0

    .line 1349
    :sswitch_2d
    const-string v0, "QUERY_NETWORK_SELECTION_MODE"

    goto/16 :goto_0

    .line 1350
    :sswitch_2e
    const-string v0, "SET_NETWORK_SELECTION_AUTOMATIC"

    goto/16 :goto_0

    .line 1351
    :sswitch_2f
    const-string v0, "SET_NETWORK_SELECTION_MANUAL"

    goto/16 :goto_0

    .line 1352
    :sswitch_30
    const-string v0, "QUERY_AVAILABLE_NETWORKS "

    goto/16 :goto_0

    .line 1353
    :sswitch_31
    const-string v0, "ABORT_QUERY_AVAILABLE_NETWORKS"

    goto/16 :goto_0

    .line 1354
    :sswitch_32
    const-string v0, "DTMF_START"

    goto/16 :goto_0

    .line 1355
    :sswitch_33
    const-string v0, "DTMF_STOP"

    goto/16 :goto_0

    .line 1356
    :sswitch_34
    const-string v0, "BASEBAND_VERSION"

    goto/16 :goto_0

    .line 1357
    :sswitch_35
    const-string v0, "SEPARATE_CONNECTION"

    goto/16 :goto_0

    .line 1358
    :sswitch_36
    const-string v0, "SET_MUTE"

    goto/16 :goto_0

    .line 1359
    :sswitch_37
    const-string v0, "GET_MUTE"

    goto/16 :goto_0

    .line 1360
    :sswitch_38
    const-string v0, "QUERY_CLIP"

    goto/16 :goto_0

    .line 1361
    :sswitch_39
    const-string v0, "LAST_DATA_CALL_FAIL_CAUSE"

    goto/16 :goto_0

    .line 1362
    :sswitch_3a
    const-string v0, "DATA_CALL_LIST"

    goto/16 :goto_0

    .line 1363
    :sswitch_3b
    const-string v0, "RESET_RADIO"

    goto/16 :goto_0

    .line 1364
    :sswitch_3c
    const-string v0, "OEM_HOOK_RAW"

    goto/16 :goto_0

    .line 1365
    :sswitch_3d
    const-string v0, "OEM_HOOK_STRINGS"

    goto/16 :goto_0

    .line 1366
    :sswitch_3e
    const-string v0, "SCREEN_STATE"

    goto/16 :goto_0

    .line 1367
    :sswitch_3f
    const-string v0, "SET_SUPP_SVC_NOTIFICATION"

    goto/16 :goto_0

    .line 1368
    :sswitch_40
    const-string v0, "WRITE_SMS_TO_SIM"

    goto/16 :goto_0

    .line 1369
    :sswitch_41
    const-string v0, "DELETE_SMS_ON_SIM"

    goto/16 :goto_0

    .line 1370
    :sswitch_42
    const-string v0, "SET_BAND_MODE"

    goto/16 :goto_0

    .line 1371
    :sswitch_43
    const-string v0, "QUERY_AVAILABLE_BAND_MODE"

    goto/16 :goto_0

    .line 1372
    :sswitch_44
    const-string v0, "REQUEST_STK_GET_PROFILE"

    goto/16 :goto_0

    .line 1373
    :sswitch_45
    const-string v0, "REQUEST_STK_SET_PROFILE"

    goto/16 :goto_0

    .line 1374
    :sswitch_46
    const-string v0, "REQUEST_STK_SEND_ENVELOPE_COMMAND"

    goto/16 :goto_0

    .line 1375
    :sswitch_47
    const-string v0, "REQUEST_STK_SEND_TERMINAL_RESPONSE"

    goto/16 :goto_0

    .line 1376
    :sswitch_48
    const-string v0, "REQUEST_STK_HANDLE_CALL_SETUP_REQUESTED_FROM_SIM"

    goto/16 :goto_0

    .line 1377
    :sswitch_49
    const-string v0, "REQUEST_EXPLICIT_CALL_TRANSFER"

    goto/16 :goto_0

    .line 1378
    :sswitch_4a
    const-string v0, "REQUEST_SET_PREFERRED_NETWORK_TYPE"

    goto/16 :goto_0

    .line 1379
    :sswitch_4b
    const-string v0, "REQUEST_GET_PREFERRED_NETWORK_TYPE"

    goto/16 :goto_0

    .line 1380
    :sswitch_4c
    const-string v0, "REQUEST_GET_NEIGHBORING_CELL_IDS"

    goto/16 :goto_0

    .line 1381
    :sswitch_4d
    const-string v0, "REQUEST_SET_LOCATION_UPDATES"

    goto/16 :goto_0

    .line 1382
    :sswitch_4e
    const-string v0, "RIL_REQUEST_CDMA_SET_SUBSCRIPTION_SOURCE"

    goto/16 :goto_0

    .line 1383
    :sswitch_4f
    const-string v0, "RIL_REQUEST_CDMA_SET_ROAMING_PREFERENCE"

    goto/16 :goto_0

    .line 1384
    :sswitch_50
    const-string v0, "RIL_REQUEST_CDMA_QUERY_ROAMING_PREFERENCE"

    goto/16 :goto_0

    .line 1385
    :sswitch_51
    const-string v0, "RIL_REQUEST_SET_TTY_MODE"

    goto/16 :goto_0

    .line 1386
    :sswitch_52
    const-string v0, "RIL_REQUEST_QUERY_TTY_MODE"

    goto/16 :goto_0

    .line 1387
    :sswitch_53
    const-string v0, "RIL_REQUEST_CDMA_SET_PREFERRED_VOICE_PRIVACY_MODE"

    goto/16 :goto_0

    .line 1388
    :sswitch_54
    const-string v0, "RIL_REQUEST_CDMA_QUERY_PREFERRED_VOICE_PRIVACY_MODE"

    goto/16 :goto_0

    .line 1389
    :sswitch_55
    const-string v0, "RIL_REQUEST_CDMA_FLASH"

    goto/16 :goto_0

    .line 1390
    :sswitch_56
    const-string v0, "RIL_REQUEST_CDMA_BURST_DTMF"

    goto/16 :goto_0

    .line 1391
    :sswitch_57
    const-string v0, "RIL_REQUEST_CDMA_SEND_SMS"

    goto/16 :goto_0

    .line 1392
    :sswitch_58
    const-string v0, "RIL_REQUEST_CDMA_SMS_ACKNOWLEDGE"

    goto/16 :goto_0

    .line 1393
    :sswitch_59
    const-string v0, "RIL_REQUEST_GSM_GET_BROADCAST_CONFIG"

    goto/16 :goto_0

    .line 1394
    :sswitch_5a
    const-string v0, "RIL_REQUEST_GSM_SET_BROADCAST_CONFIG"

    goto/16 :goto_0

    .line 1395
    :sswitch_5b
    const-string v0, "RIL_REQUEST_CDMA_GET_BROADCAST_CONFIG"

    goto/16 :goto_0

    .line 1396
    :sswitch_5c
    const-string v0, "RIL_REQUEST_CDMA_SET_BROADCAST_CONFIG"

    goto/16 :goto_0

    .line 1397
    :sswitch_5d
    const-string v0, "RIL_REQUEST_GSM_BROADCAST_ACTIVATION"

    goto/16 :goto_0

    .line 1398
    :sswitch_5e
    const-string v0, "RIL_REQUEST_CDMA_VALIDATE_AND_WRITE_AKEY"

    goto/16 :goto_0

    .line 1399
    :sswitch_5f
    const-string v0, "RIL_REQUEST_CDMA_BROADCAST_ACTIVATION"

    goto/16 :goto_0

    .line 1400
    :sswitch_60
    const-string v0, "RIL_REQUEST_CDMA_SUBSCRIPTION"

    goto/16 :goto_0

    .line 1401
    :sswitch_61
    const-string v0, "RIL_REQUEST_CDMA_WRITE_SMS_TO_RUIM"

    goto/16 :goto_0

    .line 1402
    :sswitch_62
    const-string v0, "RIL_REQUEST_CDMA_DELETE_SMS_ON_RUIM"

    goto/16 :goto_0

    .line 1403
    :sswitch_63
    const-string v0, "RIL_REQUEST_DEVICE_IDENTITY"

    goto/16 :goto_0

    .line 1404
    :sswitch_64
    const-string v0, "RIL_REQUEST_GET_SMSC_ADDRESS"

    goto/16 :goto_0

    .line 1405
    :sswitch_65
    const-string v0, "RIL_REQUEST_SET_SMSC_ADDRESS"

    goto/16 :goto_0

    .line 1406
    :sswitch_66
    const-string v0, "REQUEST_EXIT_EMERGENCY_CALLBACK_MODE"

    goto/16 :goto_0

    .line 1407
    :sswitch_67
    const-string v0, "RIL_REQUEST_REPORT_SMS_MEMORY_STATUS"

    goto/16 :goto_0

    .line 1408
    :sswitch_68
    const-string v0, "RIL_REQUEST_REPORT_STK_SERVICE_IS_RUNNING"

    goto/16 :goto_0

    .line 1409
    :sswitch_69
    const-string v0, "RIL_REQUEST_CDMA_GET_SUBSCRIPTION_SOURCE"

    goto/16 :goto_0

    .line 1410
    :sswitch_6a
    const-string v0, "RIL_REQUEST_ISIM_AUTHENTICATION"

    goto/16 :goto_0

    .line 1411
    :sswitch_6b
    const-string v0, "RIL_REQUEST_ACKNOWLEDGE_INCOMING_GSM_SMS_WITH_PDU"

    goto/16 :goto_0

    .line 1412
    :sswitch_6c
    const-string v0, "RIL_REQUEST_STK_SEND_ENVELOPE_WITH_STATUS"

    goto/16 :goto_0

    .line 1413
    :sswitch_6d
    const-string v0, "RIL_REQUEST_VOICE_RADIO_TECH"

    goto/16 :goto_0

    .line 1414
    :sswitch_6e
    const-string v0, "RIL_REQUEST_GET_CELL_INFO_LIST"

    goto/16 :goto_0

    .line 1415
    :sswitch_6f
    const-string v0, "RIL_REQUEST_SET_CELL_INFO_LIST_RATE"

    goto/16 :goto_0

    .line 1416
    :sswitch_70
    const-string v0, "RIL_REQUEST_SET_INITIAL_ATTACH_APN"

    goto/16 :goto_0

    .line 1417
    :sswitch_71
    const-string v0, "RIL_REQUEST_SET_DATA_PROFILE"

    goto/16 :goto_0

    .line 1418
    :sswitch_72
    const-string v0, "RIL_REQUEST_IMS_REGISTRATION_STATE"

    goto/16 :goto_0

    .line 1419
    :sswitch_73
    const-string v0, "RIL_REQUEST_IMS_SEND_SMS"

    goto/16 :goto_0

    .line 1420
    :sswitch_74
    const-string v0, "RIL_REQUEST_SIM_TRANSMIT_APDU_BASIC"

    goto/16 :goto_0

    .line 1421
    :sswitch_75
    const-string v0, "RIL_REQUEST_SIM_OPEN_CHANNEL"

    goto/16 :goto_0

    .line 1422
    :sswitch_76
    const-string v0, "RIL_REQUEST_SIM_CLOSE_CHANNEL"

    goto/16 :goto_0

    .line 1423
    :sswitch_77
    const-string v0, "RIL_REQUEST_SIM_TRANSMIT_APDU_CHANNEL"

    goto/16 :goto_0

    .line 1424
    :sswitch_78
    const-string v0, "RIL_REQUEST_NV_READ_ITEM"

    goto/16 :goto_0

    .line 1425
    :sswitch_79
    const-string v0, "RIL_REQUEST_NV_WRITE_ITEM"

    goto/16 :goto_0

    .line 1426
    :sswitch_7a
    const-string v0, "RIL_REQUEST_NV_WRITE_CDMA_PRL"

    goto/16 :goto_0

    .line 1427
    :sswitch_7b
    const-string v0, "RIL_REQUEST_NV_RESET_CONFIG"

    goto/16 :goto_0

    .line 1428
    :sswitch_7c
    const-string v0, "RIL_REQUEST_SET_UICC_SUBSCRIPTION"

    goto/16 :goto_0

    .line 1429
    :sswitch_7d
    const-string v0, "RIL_REQUEST_ALLOW_DATA"

    goto/16 :goto_0

    .line 1430
    :sswitch_7e
    const-string v0, "GET_HARDWARE_CONFIG"

    goto/16 :goto_0

    .line 1431
    :sswitch_7f
    const-string v0, "RIL_REQUEST_SIM_AUTHENTICATION"

    goto/16 :goto_0

    .line 1432
    :sswitch_80
    const-string v0, "RIL_REQUEST_SHUTDOWN"

    goto/16 :goto_0

    .line 1433
    :sswitch_81
    const-string v0, "RIL_REQUEST_SET_PHONE_RAT_FAMILY"

    goto/16 :goto_0

    .line 1434
    :sswitch_82
    const-string v0, "RIL_REQUEST_GET_PHONE_RAT_FAMILY"

    goto/16 :goto_0

    .line 1437
    :sswitch_83
    const-string v0, "HANGUP_ALL"

    goto/16 :goto_0

    .line 1438
    :sswitch_84
    const-string v0, "FORCE_RELEASE_CALL"

    goto/16 :goto_0

    .line 1439
    :sswitch_85
    const-string v0, "SET_CALL_INDICATION"

    goto/16 :goto_0

    .line 1440
    :sswitch_86
    const-string v0, "EMERGENCY_DIAL"

    goto/16 :goto_0

    .line 1441
    :sswitch_87
    const-string v0, "SET_ECC_SERVICE_CATEGORY"

    goto/16 :goto_0

    .line 1442
    :sswitch_88
    const-string v0, "SET_ECC_LIST"

    goto/16 :goto_0

    .line 1443
    :sswitch_89
    const-string v0, "SET_SPEECH_CODEC_INFO"

    goto/16 :goto_0

    .line 1447
    :sswitch_8a
    const-string v0, "RIL_REQUEST_ADD_IMS_CONFERENCE_CALL_MEMBER"

    goto/16 :goto_0

    .line 1448
    :sswitch_8b
    const-string v0, "RIL_REQUEST_REMOVE_IMS_CONFERENCE_CALL_MEMBER"

    goto/16 :goto_0

    .line 1449
    :sswitch_8c
    const-string v0, "RIL_REQUEST_DIAL_WITH_SIP_URI"

    goto/16 :goto_0

    .line 1450
    :sswitch_8d
    const-string v0, "RIL_REQUEST_RETRIEVE_HELD_CALL"

    goto/16 :goto_0

    .line 1454
    :sswitch_8e
    const-string v0, "QUERY_SIM_NETWORK_LOCK"

    goto/16 :goto_0

    .line 1455
    :sswitch_8f
    const-string v0, "SET_SIM_NETWORK_LOCK"

    goto/16 :goto_0

    .line 1458
    :sswitch_90
    const-string v0, "RIL_REQUEST_GENERAL_SIM_AUTH"

    goto/16 :goto_0

    .line 1459
    :sswitch_91
    const-string v0, "RIL_REQUEST_OPEN_ICC_APPLICATION"

    goto/16 :goto_0

    .line 1460
    :sswitch_92
    const-string v0, "RIL_REQUEST_GET_ICC_APPLICATION_STATUS"

    goto/16 :goto_0

    .line 1461
    :sswitch_93
    const-string v0, "SIM_IO_EX"

    goto/16 :goto_0

    .line 1464
    :sswitch_94
    const-string v0, "RIL_REQUEST_QUERY_PHB_STORAGE_INFO"

    goto/16 :goto_0

    .line 1465
    :sswitch_95
    const-string v0, "RIL_REQUEST_WRITE_PHB_ENTRY"

    goto/16 :goto_0

    .line 1466
    :sswitch_96
    const-string v0, "RIL_REQUEST_READ_PHB_ENTRY"

    goto/16 :goto_0

    .line 1467
    :sswitch_97
    const-string v0, "RIL_REQUEST_QUERY_UPB_CAPABILITY"

    goto/16 :goto_0

    .line 1468
    :sswitch_98
    const-string v0, "RIL_REQUEST_EDIT_UPB_ENTRY"

    goto/16 :goto_0

    .line 1469
    :sswitch_99
    const-string v0, "RIL_REQUEST_DELETE_UPB_ENTRY"

    goto/16 :goto_0

    .line 1470
    :sswitch_9a
    const-string v0, "RIL_REQUEST_READ_UPB_GAS_LIST"

    goto/16 :goto_0

    .line 1471
    :sswitch_9b
    const-string v0, "RIL_REQUEST_READ_UPB_GRP"

    goto/16 :goto_0

    .line 1472
    :sswitch_9c
    const-string v0, "RIL_REQUEST_WRITE_UPB_GRP"

    goto/16 :goto_0

    .line 1473
    :sswitch_9d
    const-string v0, "RIL_REQUEST_GET_PHB_STRING_LENGTH"

    goto/16 :goto_0

    .line 1474
    :sswitch_9e
    const-string v0, "RIL_REQUEST_GET_PHB_MEM_STORAGE"

    goto/16 :goto_0

    .line 1475
    :sswitch_9f
    const-string v0, "RIL_REQUEST_SET_PHB_MEM_STORAGE"

    goto/16 :goto_0

    .line 1476
    :sswitch_a0
    const-string v0, "RIL_REQUEST_READ_PHB_ENTRY_EXT"

    goto/16 :goto_0

    .line 1477
    :sswitch_a1
    const-string v0, "RIL_REQUEST_WRITE_PHB_ENTRY_EXT"

    goto/16 :goto_0

    .line 1481
    :sswitch_a2
    const-string v0, "SET_NETWORK_SELECTION_MANUAL_WITH_ACT"

    goto/16 :goto_0

    .line 1482
    :sswitch_a3
    const-string v0, "RIL_REQUEST_GET_POL_CAPABILITY"

    goto/16 :goto_0

    .line 1483
    :sswitch_a4
    const-string v0, "RIL_REQUEST_GET_POL_LIST"

    goto/16 :goto_0

    .line 1484
    :sswitch_a5
    const-string v0, "RIL_REQUEST_SET_POL_ENTRY"

    goto/16 :goto_0

    .line 1485
    :sswitch_a6
    const-string v0, "RIL_REQUEST_SET_TRM"

    goto/16 :goto_0

    .line 1486
    :sswitch_a7
    const-string v0, "QUERY_AVAILABLE_NETWORKS_WITH_ACT"

    goto/16 :goto_0

    .line 1488
    :sswitch_a8
    const-string v0, "RIL_REQUEST_GET_FEMTOCELL_LIST"

    goto/16 :goto_0

    .line 1489
    :sswitch_a9
    const-string v0, "RIL_REQUEST_ABORT_FEMTOCELL_LIST"

    goto/16 :goto_0

    .line 1490
    :sswitch_aa
    const-string v0, "RIL_REQUEST_SELECT_FEMTOCELL"

    goto/16 :goto_0

    .line 1493
    :sswitch_ab
    const-string v0, "RIL_REQUEST_STK_EVDL_CALL_BY_AP"

    goto/16 :goto_0

    .line 1494
    :sswitch_ac
    const-string v0, "RIL_REQUEST_QUERY_MODEM_TYPE"

    goto/16 :goto_0

    .line 1495
    :sswitch_ad
    const-string v0, "RIL_REQUEST_STORE_MODEM_TYPE"

    goto/16 :goto_0

    .line 1496
    :sswitch_ae
    const-string v0, "SIM_GET_ATR"

    goto/16 :goto_0

    .line 1497
    :sswitch_af
    const-string v0, "SIM_OPEN_CHANNEL_WITH_SW"

    goto/16 :goto_0

    .line 1499
    :sswitch_b0
    const-string v0, "RIL_REQUEST_SETUP_DEDICATE_DATA_CALL"

    goto/16 :goto_0

    .line 1500
    :sswitch_b1
    const-string v0, "RIL_REQUEST_DEACTIVATE_DEDICATE_DATA_CALL"

    goto/16 :goto_0

    .line 1501
    :sswitch_b2
    const-string v0, "RIL_REQUEST_MODIFY_DATA_CALL"

    goto/16 :goto_0

    .line 1502
    :sswitch_b3
    const-string v0, "RIL_REQUEST_ABORT_SETUP_DATA_CALL"

    goto/16 :goto_0

    .line 1503
    :sswitch_b4
    const-string v0, "RIL_REQUEST_PCSCF_DISCOVERY_PCO"

    goto/16 :goto_0

    .line 1504
    :sswitch_b5
    const-string v0, "RIL_REQUEST_CLEAR_DATA_BEARER"

    goto/16 :goto_0

    .line 1507
    :sswitch_b6
    const-string v0, "RIL_REQUEST_SET_IMS_ENABLE"

    goto/16 :goto_0

    .line 1510
    :sswitch_b7
    const-string v0, "RIL_REQUEST_SET_SCRI"

    goto/16 :goto_0

    .line 1511
    :sswitch_b8
    const-string v0, "RIL_REQUEST_SET_FD_MODE"

    goto/16 :goto_0

    .line 1513
    :sswitch_b9
    const-string v0, "RIL_REQUEST_GET_SMS_PARAMS"

    goto/16 :goto_0

    .line 1514
    :sswitch_ba
    const-string v0, "RIL_REQUEST_SET_SMS_PARAMS"

    goto/16 :goto_0

    .line 1515
    :sswitch_bb
    const-string v0, "RIL_REQUEST_GET_SMS_SIM_MEM_STATUS"

    goto/16 :goto_0

    .line 1516
    :sswitch_bc
    const-string v0, "RIL_REQUEST_SET_ETWS"

    goto/16 :goto_0

    .line 1518
    :sswitch_bd
    const-string v0, "RIL_REQUEST_SET_CB_CHANNEL_CONFIG_INFO"

    goto/16 :goto_0

    .line 1520
    :sswitch_be
    const-string v0, "RIL_REQUEST_SET_CB_LANGUAGE_CONFIG_INFO"

    goto/16 :goto_0

    .line 1521
    :sswitch_bf
    const-string v0, "RIL_REQUEST_GET_CB_CONFIG_INFO"

    goto/16 :goto_0

    .line 1522
    :sswitch_c0
    const-string v0, "RIL_REQUEST_REMOVE_CB_MESSAGE"

    goto/16 :goto_0

    .line 1524
    :sswitch_c1
    const-string v0, "RIL_REQUEST_SET_DATA_CENTRIC"

    goto/16 :goto_0

    .line 1526
    :sswitch_c2
    const-string v0, "MODEM_POWEROFF"

    goto/16 :goto_0

    .line 1527
    :sswitch_c3
    const-string v0, "MODEM_POWERON"

    goto/16 :goto_0

    .line 1529
    :sswitch_c4
    const-string v0, "RIL_REQUEST_SET_DATA_ON_TO_MD"

    goto/16 :goto_0

    .line 1530
    :sswitch_c5
    const-string v0, "RIL_REQUEST_SET_REMOVE_RESTRICT_EUTRAN_MODE"

    goto/16 :goto_0

    .line 1531
    :sswitch_c6
    const-string v0, "RIL_REQUEST_BTSIM_CONNECT"

    goto/16 :goto_0

    .line 1532
    :sswitch_c7
    const-string v0, "RIL_REQUEST_BTSIM_DISCONNECT_OR_POWEROFF"

    goto/16 :goto_0

    .line 1533
    :sswitch_c8
    const-string v0, "RIL_REQUEST_BTSIM_POWERON_OR_RESETSIM"

    goto/16 :goto_0

    .line 1534
    :sswitch_c9
    const-string v0, "RIL_REQUEST_SEND_BTSIM_TRANSFERAPDU"

    goto/16 :goto_0

    .line 1537
    :sswitch_ca
    const-string v0, "RIL_REQUEST_SET_IMS_CALL_STATUS"

    goto/16 :goto_0

    .line 1541
    :sswitch_cb
    const-string v0, "RIL_REQUEST_GET_NITZ_TIME"

    goto/16 :goto_0

    .line 1542
    :sswitch_cc
    const-string v0, "RIL_REQUEST_QUERY_UIM_INSERTED"

    goto/16 :goto_0

    .line 1543
    :sswitch_cd
    const-string v0, "RIL_REQUEST_SWITCH_HPF"

    goto/16 :goto_0

    .line 1544
    :sswitch_ce
    const-string v0, "RIL_REQUEST_SET_AVOID_SYS"

    goto/16 :goto_0

    .line 1545
    :sswitch_cf
    const-string v0, "RIL_REQUEST_QUERY_AVOID_SYS"

    goto/16 :goto_0

    .line 1546
    :sswitch_d0
    const-string v0, "RIL_REQUEST_QUERY_CDMA_NETWORK_INFO"

    goto/16 :goto_0

    .line 1547
    :sswitch_d1
    const-string v0, "RIL_REQUEST_GET_LOCAL_INFO"

    goto/16 :goto_0

    .line 1548
    :sswitch_d2
    const-string v0, "RIL_REQUEST_UTK_REFRESH"

    goto/16 :goto_0

    .line 1550
    :sswitch_d3
    const-string v0, "RIL_REQUEST_QUERY_SMS_AND_PHONEBOOK_STATUS"

    goto/16 :goto_0

    .line 1552
    :sswitch_d4
    const-string v0, "RIL_REQUEST_QUERY_NETWORK_REGISTRATION"

    goto/16 :goto_0

    .line 1553
    :sswitch_d5
    const-string v0, "RIL_REQUEST_AGPS_TCP_CONNIND"

    goto/16 :goto_0

    .line 1554
    :sswitch_d6
    const-string v0, "RIL_REQUEST_AGPS_SET_MPC_IPPORT"

    goto/16 :goto_0

    .line 1555
    :sswitch_d7
    const-string v0, "RIL_REQUEST_AGPS_GET_MPC_IPPORT"

    goto/16 :goto_0

    .line 1556
    :sswitch_d8
    const-string v0, "RIL_REQUEST_SET_MEID"

    goto/16 :goto_0

    .line 1557
    :sswitch_d9
    const-string v0, "RIL_REQUEST_SET_REG_RESUME"

    goto/16 :goto_0

    .line 1558
    :sswitch_da
    const-string v0, "RIL_REQUEST_ENABLE_REG_PAUSE"

    goto/16 :goto_0

    .line 1559
    :sswitch_db
    const-string v0, "RIL_REQUEST_SET_ETS_DEV"

    goto/16 :goto_0

    .line 1560
    :sswitch_dc
    const-string v0, "RIL_REQUEST_WRITE_MDN"

    goto/16 :goto_0

    .line 1561
    :sswitch_dd
    const-string v0, "RIL_REQUEST_SET_VIA_TRM"

    goto/16 :goto_0

    .line 1562
    :sswitch_de
    const-string v0, "RIL_REQUEST_SET_ARSI_THRESHOLD"

    goto/16 :goto_0

    .line 1300
    nop

    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x3 -> :sswitch_2
        0x4 -> :sswitch_3
        0x5 -> :sswitch_4
        0x6 -> :sswitch_5
        0x7 -> :sswitch_6
        0x8 -> :sswitch_7
        0x9 -> :sswitch_8
        0xa -> :sswitch_9
        0xb -> :sswitch_a
        0xc -> :sswitch_b
        0xd -> :sswitch_c
        0xe -> :sswitch_d
        0xf -> :sswitch_e
        0x10 -> :sswitch_f
        0x11 -> :sswitch_10
        0x12 -> :sswitch_11
        0x13 -> :sswitch_12
        0x14 -> :sswitch_13
        0x15 -> :sswitch_14
        0x16 -> :sswitch_15
        0x17 -> :sswitch_16
        0x18 -> :sswitch_17
        0x19 -> :sswitch_18
        0x1a -> :sswitch_19
        0x1b -> :sswitch_1a
        0x1c -> :sswitch_1b
        0x1d -> :sswitch_1c
        0x1e -> :sswitch_1e
        0x1f -> :sswitch_1f
        0x20 -> :sswitch_20
        0x21 -> :sswitch_21
        0x22 -> :sswitch_22
        0x23 -> :sswitch_23
        0x24 -> :sswitch_24
        0x25 -> :sswitch_25
        0x26 -> :sswitch_26
        0x27 -> :sswitch_27
        0x28 -> :sswitch_28
        0x29 -> :sswitch_29
        0x2a -> :sswitch_2a
        0x2b -> :sswitch_2b
        0x2c -> :sswitch_2c
        0x2d -> :sswitch_2d
        0x2e -> :sswitch_2e
        0x2f -> :sswitch_2f
        0x30 -> :sswitch_30
        0x31 -> :sswitch_32
        0x32 -> :sswitch_33
        0x33 -> :sswitch_34
        0x34 -> :sswitch_35
        0x35 -> :sswitch_36
        0x36 -> :sswitch_37
        0x37 -> :sswitch_38
        0x38 -> :sswitch_39
        0x39 -> :sswitch_3a
        0x3a -> :sswitch_3b
        0x3b -> :sswitch_3c
        0x3c -> :sswitch_3d
        0x3d -> :sswitch_3e
        0x3e -> :sswitch_3f
        0x3f -> :sswitch_40
        0x40 -> :sswitch_41
        0x41 -> :sswitch_42
        0x42 -> :sswitch_43
        0x43 -> :sswitch_44
        0x44 -> :sswitch_45
        0x45 -> :sswitch_46
        0x46 -> :sswitch_47
        0x47 -> :sswitch_48
        0x48 -> :sswitch_49
        0x49 -> :sswitch_4a
        0x4a -> :sswitch_4b
        0x4b -> :sswitch_4c
        0x4c -> :sswitch_4d
        0x4d -> :sswitch_4e
        0x4e -> :sswitch_4f
        0x4f -> :sswitch_50
        0x50 -> :sswitch_51
        0x51 -> :sswitch_52
        0x52 -> :sswitch_53
        0x53 -> :sswitch_54
        0x54 -> :sswitch_55
        0x55 -> :sswitch_56
        0x56 -> :sswitch_5e
        0x57 -> :sswitch_57
        0x58 -> :sswitch_58
        0x59 -> :sswitch_59
        0x5a -> :sswitch_5a
        0x5b -> :sswitch_5d
        0x5c -> :sswitch_5b
        0x5d -> :sswitch_5c
        0x5e -> :sswitch_5f
        0x5f -> :sswitch_60
        0x60 -> :sswitch_61
        0x61 -> :sswitch_62
        0x62 -> :sswitch_63
        0x63 -> :sswitch_66
        0x64 -> :sswitch_64
        0x65 -> :sswitch_65
        0x66 -> :sswitch_67
        0x67 -> :sswitch_68
        0x68 -> :sswitch_69
        0x69 -> :sswitch_6a
        0x6a -> :sswitch_6b
        0x6b -> :sswitch_6c
        0x6c -> :sswitch_6d
        0x6d -> :sswitch_6e
        0x6e -> :sswitch_6f
        0x6f -> :sswitch_70
        0x70 -> :sswitch_72
        0x71 -> :sswitch_73
        0x72 -> :sswitch_74
        0x73 -> :sswitch_75
        0x74 -> :sswitch_76
        0x75 -> :sswitch_77
        0x76 -> :sswitch_78
        0x77 -> :sswitch_79
        0x78 -> :sswitch_7a
        0x79 -> :sswitch_7b
        0x7a -> :sswitch_7c
        0x7b -> :sswitch_7d
        0x7c -> :sswitch_7e
        0x7d -> :sswitch_7f
        0x80 -> :sswitch_71
        0x81 -> :sswitch_80
        0x82 -> :sswitch_82
        0x83 -> :sswitch_81
        0x7da -> :sswitch_c2
        0x7dc -> :sswitch_94
        0x7dd -> :sswitch_95
        0x7de -> :sswitch_96
        0x7e2 -> :sswitch_8e
        0x7e3 -> :sswitch_8f
        0x7e4 -> :sswitch_b7
        0x7e5 -> :sswitch_c6
        0x7e6 -> :sswitch_c7
        0x7e7 -> :sswitch_c8
        0x7e8 -> :sswitch_c9
        0x7e9 -> :sswitch_a2
        0x7ec -> :sswitch_c3
        0x7ed -> :sswitch_bb
        0x7f0 -> :sswitch_a3
        0x7f1 -> :sswitch_a4
        0x7f2 -> :sswitch_a5
        0x7f3 -> :sswitch_97
        0x7f4 -> :sswitch_98
        0x7f5 -> :sswitch_99
        0x7f6 -> :sswitch_9a
        0x7f7 -> :sswitch_9b
        0x7f8 -> :sswitch_9c
        0x7fb -> :sswitch_a6
        0x7fe -> :sswitch_9d
        0x7ff -> :sswitch_9e
        0x800 -> :sswitch_9f
        0x801 -> :sswitch_a0
        0x802 -> :sswitch_a1
        0x803 -> :sswitch_b9
        0x804 -> :sswitch_ba
        0x807 -> :sswitch_ae
        0x808 -> :sswitch_bd
        0x809 -> :sswitch_be
        0x80a -> :sswitch_bf
        0x80c -> :sswitch_bc
        0x80d -> :sswitch_b8
        0x80f -> :sswitch_af
        0x812 -> :sswitch_ad
        0x813 -> :sswitch_ac
        0x81b -> :sswitch_ab
        0x81c -> :sswitch_a8
        0x81d -> :sswitch_a9
        0x81e -> :sswitch_aa
        0x821 -> :sswitch_31
        0x824 -> :sswitch_83
        0x825 -> :sswitch_84
        0x826 -> :sswitch_85
        0x827 -> :sswitch_86
        0x828 -> :sswitch_87
        0x829 -> :sswitch_88
        0x82a -> :sswitch_90
        0x82b -> :sswitch_91
        0x82c -> :sswitch_92
        0x82d -> :sswitch_93
        0x82e -> :sswitch_b6
        0x82f -> :sswitch_a7
        0x830 -> :sswitch_1d
        0x832 -> :sswitch_b0
        0x833 -> :sswitch_b1
        0x834 -> :sswitch_b2
        0x835 -> :sswitch_b3
        0x836 -> :sswitch_b4
        0x837 -> :sswitch_b5
        0x838 -> :sswitch_c0
        0x839 -> :sswitch_c1
        0x83a -> :sswitch_8a
        0x83b -> :sswitch_8b
        0x83c -> :sswitch_8c
        0x83d -> :sswitch_8d
        0x83e -> :sswitch_89
        0x83f -> :sswitch_c4
        0x840 -> :sswitch_c5
        0x841 -> :sswitch_ca
        0xfa0 -> :sswitch_cb
        0xfa1 -> :sswitch_cc
        0xfa2 -> :sswitch_cd
        0xfa3 -> :sswitch_ce
        0xfa4 -> :sswitch_cf
        0xfa5 -> :sswitch_d0
        0xfa6 -> :sswitch_d1
        0xfa7 -> :sswitch_d2
        0xfa8 -> :sswitch_d3
        0xfa9 -> :sswitch_d4
        0xfaa -> :sswitch_d5
        0xfab -> :sswitch_d6
        0xfac -> :sswitch_d7
        0xfad -> :sswitch_d8
        0xfae -> :sswitch_d9
        0xfaf -> :sswitch_da
        0xfb0 -> :sswitch_db
        0xfb1 -> :sswitch_dc
        0xfb2 -> :sswitch_dd
        0xfb3 -> :sswitch_de
    .end sparse-switch
.end method

.method private responseCbConfig(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 368
    const-string v0, "RILJ"

    const-string v1, "responseCbConfig: stub!"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    const/4 v0, 0x0

    return-object v0
.end method

.method private responseCrssNotification(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 276
    const-string v0, "RILJ"

    const-string v1, "NOT PROCESSING CRSS NOTIFICATION"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 277
    const/4 v0, 0x0

    return-object v0
.end method

.method private responseDeactivateDataCall(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 1571
    const/4 v0, 0x0

    .line 1572
    .local v0, "cidArray":[I
    invoke-virtual {p1}, Landroid/os/Parcel;->dataSize()I

    move-result v1

    if-lez v1, :cond_0

    .line 1573
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [I

    move-object v0, v1

    check-cast v0, [I

    .line 1576
    :cond_0
    return-object v0
.end method

.method private responseEtwsNotification(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 290
    const-string v0, "RILJ"

    const-string v1, "NOT PROCESSING ETWS NOTIFICATION"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 292
    const/4 v0, 0x0

    return-object v0
.end method

.method private responseFemtoCellInfos(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 347
    const-string v0, "RILJ"

    const-string v1, "responseFemtoCellInfos: stub!"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 349
    const/4 v0, 0x0

    return-object v0
.end method

.method private responseGetNitzTime(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 389
    const-string v0, "RILJ"

    const-string v1, "responseGetNitzTime: stub!"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    const/4 v0, 0x0

    return-object v0
.end method

.method private responseModifyDataCall(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 375
    const-string v0, "RILJ"

    const-string v1, "responseModifyDataCall: stub!"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 377
    const/4 v0, 0x0

    return-object v0
.end method

.method private responseNetworkInfoWithActs(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 333
    const-string v0, "RILJ"

    const-string v1, "responseNetworkInfoWithActs: stub!"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    const/4 v0, 0x0

    return-object v0
.end method

.method private responseOperator(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 11
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x2

    const/4 v8, 0x0

    .line 1582
    const/4 v3, 0x0

    .line 1584
    .local v3, "response":[Ljava/lang/String;
    invoke-virtual {p1}, Landroid/os/Parcel;->readStringArray()[Ljava/lang/String;

    move-result-object v3

    .line 1595
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v5, v3

    if-ge v1, v5, :cond_1

    .line 1596
    aget-object v5, v3, v1

    if-eqz v5, :cond_0

    aget-object v5, v3, v1

    const-string v6, "uCs2"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-ne v5, v10, :cond_0

    .line 1598
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "responseOperator handling UCS2 format name: response["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1600
    :try_start_0
    new-instance v5, Ljava/lang/String;

    aget-object v6, v3, v1

    const/4 v7, 0x4

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/android/internal/telephony/MediaTekRIL;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v6

    const-string v7, "UTF-16"

    invoke-direct {v5, v6, v7}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    aput-object v5, v3, v1
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1595
    :cond_0
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1601
    :catch_0
    move-exception v0

    .line 1602
    .local v0, "ex":Ljava/io/UnsupportedEncodingException;
    const-string v5, "responseOperatorInfos UnsupportedEncodingException"

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    goto :goto_1

    .line 1609
    .end local v0    # "ex":Ljava/io/UnsupportedEncodingException;
    :cond_1
    array-length v5, v3

    if-le v5, v9, :cond_3

    aget-object v5, v3, v9

    if-eqz v5, :cond_3

    .line 1610
    aget-object v5, v3, v8

    if-eqz v5, :cond_3

    aget-object v5, v3, v8

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    aget-object v5, v3, v8

    aget-object v6, v3, v9

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 1611
    :cond_2
    new-instance v2, Lcom/android/internal/telephony/Operators;

    invoke-direct {v2}, Lcom/android/internal/telephony/Operators;-><init>()V

    .line 1612
    .local v2, "init":Lcom/android/internal/telephony/Operators;
    aget-object v5, v3, v9

    invoke-virtual {v2, v5}, Lcom/android/internal/telephony/Operators;->unOptimizedOperatorReplace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 1613
    .local v4, "temp":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "lookup RIL responseOperator() "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v9

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " gave "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " was "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v8

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "/"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    aget-object v6, v3, v10

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " before."

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1614
    aput-object v4, v3, v8

    .line 1615
    aput-object v4, v3, v10

    .line 1619
    .end local v2    # "init":Lcom/android/internal/telephony/Operators;
    .end local v4    # "temp":Ljava/lang/String;
    :cond_3
    return-object v3
.end method

.method private responseOperatorInfosWithAct(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 340
    const-string v0, "RILJ"

    const-string v1, "responseOperatorInfosWithAct: stub!"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 342
    const/4 v0, 0x0

    return-object v0
.end method

.method private responsePcscfDiscovery(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 382
    const-string v0, "RILJ"

    const-string v1, "responsePcscfDiscovery: stub!"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 384
    const/4 v0, 0x0

    return-object v0
.end method

.method private responsePhoneId()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1624
    iget-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    return-object v0
.end method

.method private responseSetPhoneRatChanged(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 4
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 324
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 325
    .local v0, "num":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 326
    .local v1, "rat":I
    new-instance v2, Landroid/telephony/PhoneRatFamily;

    iget-object v3, p0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-direct {v2, v3, v1}, Landroid/telephony/PhoneRatFamily;-><init>(II)V

    .line 328
    .local v2, "response":Landroid/telephony/PhoneRatFamily;
    return-object v2
.end method

.method private responseSetupDedicateDataCall(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 3
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 296
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 297
    .local v0, "number":I
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "responseSetupDedicateDataCall number="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 317
    const-string v1, "RILJ"

    const-string v2, "responseSetupDedicateDataCall: stub!"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 319
    const/4 v1, 0x0

    return-object v1
.end method

.method private responseSimSmsMemoryStatus(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 361
    const-string v0, "RILJ"

    const-string v1, "responseSimSmsMemoryStatus: stub!"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 363
    const/4 v0, 0x0

    return-object v0
.end method

.method private responseSmsParams(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 2
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 354
    const-string v0, "RILJ"

    const-string v1, "responseSmsParams: stub!"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 356
    const/4 v0, 0x0

    return-object v0
.end method

.method static responseToString(I)Ljava/lang/String;
    .locals 2
    .param p0, "request"    # I

    .prologue
    .line 1635
    sparse-switch p0, :sswitch_data_0

    .line 1762
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "<unknown response> ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 1636
    :sswitch_0
    const-string v0, "UNSOL_RESPONSE_RADIO_STATE_CHANGED"

    goto :goto_0

    .line 1637
    :sswitch_1
    const-string v0, "UNSOL_RESPONSE_CALL_STATE_CHANGED"

    goto :goto_0

    .line 1638
    :sswitch_2
    const-string v0, "UNSOL_RESPONSE_VOICE_NETWORK_STATE_CHANGED"

    goto :goto_0

    .line 1639
    :sswitch_3
    const-string v0, "UNSOL_RESPONSE_NEW_SMS"

    goto :goto_0

    .line 1640
    :sswitch_4
    const-string v0, "UNSOL_RESPONSE_NEW_SMS_STATUS_REPORT"

    goto :goto_0

    .line 1641
    :sswitch_5
    const-string v0, "UNSOL_RESPONSE_NEW_SMS_ON_SIM"

    goto :goto_0

    .line 1642
    :sswitch_6
    const-string v0, "UNSOL_ON_USSD"

    goto :goto_0

    .line 1643
    :sswitch_7
    const-string v0, "UNSOL_ON_USSD_REQUEST"

    goto :goto_0

    .line 1644
    :sswitch_8
    const-string v0, "UNSOL_NITZ_TIME_RECEIVED"

    goto :goto_0

    .line 1645
    :sswitch_9
    const-string v0, "UNSOL_SIGNAL_STRENGTH"

    goto :goto_0

    .line 1646
    :sswitch_a
    const-string v0, "UNSOL_DATA_CALL_LIST_CHANGED"

    goto :goto_0

    .line 1647
    :sswitch_b
    const-string v0, "UNSOL_SUPP_SVC_NOTIFICATION"

    goto :goto_0

    .line 1648
    :sswitch_c
    const-string v0, "UNSOL_STK_SESSION_END"

    goto :goto_0

    .line 1649
    :sswitch_d
    const-string v0, "UNSOL_STK_PROACTIVE_COMMAND"

    goto :goto_0

    .line 1650
    :sswitch_e
    const-string v0, "UNSOL_STK_EVENT_NOTIFY"

    goto :goto_0

    .line 1651
    :sswitch_f
    const-string v0, "UNSOL_STK_CALL_SETUP"

    goto :goto_0

    .line 1652
    :sswitch_10
    const-string v0, "UNSOL_SIM_SMS_STORAGE_FULL"

    goto :goto_0

    .line 1653
    :sswitch_11
    const-string v0, "UNSOL_SIM_REFRESH"

    goto :goto_0

    .line 1654
    :sswitch_12
    const-string v0, "UNSOL_CALL_RING"

    goto :goto_0

    .line 1655
    :sswitch_13
    const-string v0, "UNSOL_RESPONSE_SIM_STATUS_CHANGED"

    goto :goto_0

    .line 1656
    :sswitch_14
    const-string v0, "UNSOL_RESPONSE_CDMA_NEW_SMS"

    goto :goto_0

    .line 1657
    :sswitch_15
    const-string v0, "UNSOL_RESPONSE_NEW_BROADCAST_SMS"

    goto :goto_0

    .line 1658
    :sswitch_16
    const-string v0, "UNSOL_CDMA_RUIM_SMS_STORAGE_FULL"

    goto :goto_0

    .line 1659
    :sswitch_17
    const-string v0, "UNSOL_RESTRICTED_STATE_CHANGED"

    goto :goto_0

    .line 1660
    :sswitch_18
    const-string v0, "UNSOL_ENTER_EMERGENCY_CALLBACK_MODE"

    goto :goto_0

    .line 1661
    :sswitch_19
    const-string v0, "UNSOL_CDMA_CALL_WAITING"

    goto :goto_0

    .line 1662
    :sswitch_1a
    const-string v0, "UNSOL_CDMA_OTA_PROVISION_STATUS"

    goto :goto_0

    .line 1663
    :sswitch_1b
    const-string v0, "UNSOL_CDMA_INFO_REC"

    goto :goto_0

    .line 1664
    :sswitch_1c
    const-string v0, "UNSOL_OEM_HOOK_RAW"

    goto :goto_0

    .line 1665
    :sswitch_1d
    const-string v0, "UNSOL_RINGBACK_TONE"

    goto :goto_0

    .line 1666
    :sswitch_1e
    const-string v0, "UNSOL_RESEND_INCALL_MUTE"

    goto :goto_0

    .line 1667
    :sswitch_1f
    const-string v0, "CDMA_SUBSCRIPTION_SOURCE_CHANGED"

    goto :goto_0

    .line 1668
    :sswitch_20
    const-string v0, "UNSOL_CDMA_PRL_CHANGED"

    goto :goto_0

    .line 1669
    :sswitch_21
    const-string v0, "UNSOL_EXIT_EMERGENCY_CALLBACK_MODE"

    goto :goto_0

    .line 1670
    :sswitch_22
    const-string v0, "UNSOL_RIL_CONNECTED"

    goto :goto_0

    .line 1671
    :sswitch_23
    const-string v0, "UNSOL_VOICE_RADIO_TECH_CHANGED"

    goto :goto_0

    .line 1672
    :sswitch_24
    const-string v0, "UNSOL_CELL_INFO_LIST"

    goto :goto_0

    .line 1674
    :sswitch_25
    const-string v0, "UNSOL_RESPONSE_IMS_NETWORK_STATE_CHANGED"

    goto :goto_0

    .line 1676
    :sswitch_26
    const-string v0, "RIL_UNSOL_UICC_SUBSCRIPTION_STATUS_CHANGED"

    goto :goto_0

    .line 1678
    :sswitch_27
    const-string v0, "UNSOL_SRVCC_STATE_NOTIFY"

    goto :goto_0

    .line 1679
    :sswitch_28
    const-string v0, "RIL_UNSOL_HARDWARE_CONFIG_CHANGED"

    goto :goto_0

    .line 1680
    :sswitch_29
    const-string v0, "UNSOL_ON_SS"

    goto :goto_0

    .line 1681
    :sswitch_2a
    const-string v0, "UNSOL_STK_CC_ALPHA_NOTIFY"

    goto/16 :goto_0

    .line 1682
    :sswitch_2b
    const-string v0, "RIL_UNSOL_STK_SEND_SMS_RESULT"

    goto/16 :goto_0

    .line 1684
    :sswitch_2c
    const-string v0, "RIL_UNSOL_SET_PHONE_RAT_FAMILY_COMPLETE"

    goto/16 :goto_0

    .line 1686
    :sswitch_2d
    const-string v0, "UNSOL_CALL_FORWARDING"

    goto/16 :goto_0

    .line 1687
    :sswitch_2e
    const-string v0, "UNSOL_CRSS_NOTIFICATION"

    goto/16 :goto_0

    .line 1688
    :sswitch_2f
    const-string v0, "UNSOL_INCOMING_CALL_INDICATION"

    goto/16 :goto_0

    .line 1689
    :sswitch_30
    const-string v0, "UNSOL_CIPHER_INDICATION"

    goto/16 :goto_0

    .line 1690
    :sswitch_31
    const-string v0, "UNSOL_CNAP"

    goto/16 :goto_0

    .line 1691
    :sswitch_32
    const-string v0, "UNSOL_SPEECH_CODEC_INFO"

    goto/16 :goto_0

    .line 1694
    :sswitch_33
    const-string v0, "RIL_UNSOL_APPLICATION_SESSION_ID_CHANGED"

    goto/16 :goto_0

    .line 1696
    :sswitch_34
    const-string v0, "UNSOL_SIM_MISSING"

    goto/16 :goto_0

    .line 1697
    :sswitch_35
    const-string v0, "UNSOL_VIRTUAL_SIM_ON"

    goto/16 :goto_0

    .line 1698
    :sswitch_36
    const-string v0, "UNSOL_VIRTUAL_SIM_ON_OFF"

    goto/16 :goto_0

    .line 1699
    :sswitch_37
    const-string v0, "UNSOL_SIM_RECOVERY"

    goto/16 :goto_0

    .line 1700
    :sswitch_38
    const-string v0, "UNSOL_SIM_PLUG_OUT"

    goto/16 :goto_0

    .line 1701
    :sswitch_39
    const-string v0, "UNSOL_SIM_PLUG_IN"

    goto/16 :goto_0

    .line 1702
    :sswitch_3a
    const-string v0, "RIL_UNSOL_SIM_COMMON_SLOT_NO_CHANGED"

    goto/16 :goto_0

    .line 1703
    :sswitch_3b
    const-string v0, "RIL_UNSOL_DATA_ALLOWED"

    goto/16 :goto_0

    .line 1704
    :sswitch_3c
    const-string v0, "UNSOL_PHB_READY_NOTIFICATION"

    goto/16 :goto_0

    .line 1705
    :sswitch_3d
    const-string v0, "UNSOL_IMEI_LOCK"

    goto/16 :goto_0

    .line 1706
    :sswitch_3e
    const-string v0, "UNSOL_ACMT_INFO"

    goto/16 :goto_0

    .line 1707
    :sswitch_3f
    const-string v0, "UNSOL_RESPONSE_PS_NETWORK_STATE_CHANGED"

    goto/16 :goto_0

    .line 1708
    :sswitch_40
    const-string v0, "UNSOL_RESPONSE_MMRR_STATUS_CHANGED"

    goto/16 :goto_0

    .line 1709
    :sswitch_41
    const-string v0, "UNSOL_NEIGHBORING_CELL_INFO"

    goto/16 :goto_0

    .line 1710
    :sswitch_42
    const-string v0, "UNSOL_NETWORK_INFO"

    goto/16 :goto_0

    .line 1711
    :sswitch_43
    const-string v0, "RIL_UNSOL_INVALID_SIM"

    goto/16 :goto_0

    .line 1712
    :sswitch_44
    const-string v0, "RIL_UNSOL_IMS_ENABLE_DONE"

    goto/16 :goto_0

    .line 1713
    :sswitch_45
    const-string v0, "RIL_UNSOL_IMS_DISABLE_DONE"

    goto/16 :goto_0

    .line 1714
    :sswitch_46
    const-string v0, "RIL_UNSOL_IMS_REGISTRATION_INFO"

    goto/16 :goto_0

    .line 1715
    :sswitch_47
    const-string v0, "RIL_UNSOL_STK_SETUP_MENU_RESET"

    goto/16 :goto_0

    .line 1716
    :sswitch_48
    const-string v0, "RIL_UNSOL_RESPONSE_PLMN_CHANGED"

    goto/16 :goto_0

    .line 1717
    :sswitch_49
    const-string v0, "RIL_UNSOL_RESPONSE_REGISTRATION_SUSPENDED"

    goto/16 :goto_0

    .line 1719
    :sswitch_4a
    const-string v0, "RIL_UNSOL_DEDICATE_BEARER_ACTIVATED"

    goto/16 :goto_0

    .line 1720
    :sswitch_4b
    const-string v0, "RIL_UNSOL_DEDICATE_BEARER_MODIFIED"

    goto/16 :goto_0

    .line 1722
    :sswitch_4c
    const-string v0, "RIL_UNSOL_MELOCK_NOTIFICATION"

    goto/16 :goto_0

    .line 1725
    :sswitch_4d
    const-string v0, "RIL_UNSOL_SCRI_RESULT"

    goto/16 :goto_0

    .line 1726
    :sswitch_4e
    const-string v0, "RIL_UNSOL_STK_EVDL_CALL"

    goto/16 :goto_0

    .line 1727
    :sswitch_4f
    const-string v0, "RIL_UNSOL_STK_CALL_CTRL"

    goto/16 :goto_0

    .line 1730
    :sswitch_50
    const-string v0, "RIL_UNSOL_ECONF_SRVCC_INDICATION"

    goto/16 :goto_0

    .line 1732
    :sswitch_51
    const-string v0, "RIL_UNSOL_ECONF_RESULT_INDICATION"

    goto/16 :goto_0

    .line 1734
    :sswitch_52
    const-string v0, "RIL_UNSOL_CALL_INFO_INDICATION"

    goto/16 :goto_0

    .line 1737
    :sswitch_53
    const-string v0, "RIL_UNSOL_VOLTE_EPS_NETWORK_FEATURE_INFO"

    goto/16 :goto_0

    .line 1738
    :sswitch_54
    const-string v0, "RIL_UNSOL_SRVCC_HANDOVER_INFO_INDICATION"

    goto/16 :goto_0

    .line 1740
    :sswitch_55
    const-string v0, "RIL_UNSOL_RAC_UPDATE"

    goto/16 :goto_0

    .line 1741
    :sswitch_56
    const-string v0, "RIL_UNSOL_REMOVE_RESTRICT_EUTRAN"

    goto/16 :goto_0

    .line 1744
    :sswitch_57
    const-string v0, "RIL_UNSOL_MD_STATE_CHANGE"

    goto/16 :goto_0

    .line 1747
    :sswitch_58
    const-string v0, "RIL_UNSOL_MO_DATA_BARRING_INFO"

    goto/16 :goto_0

    .line 1748
    :sswitch_59
    const-string v0, "RIL_UNSOL_SSAC_BARRING_INFO"

    goto/16 :goto_0

    .line 1750
    :sswitch_5a
    const-string v0, "UNSOL_RESPONSE_MO_CALL_STATE_CHANGED"

    goto/16 :goto_0

    .line 1753
    :sswitch_5b
    const-string v0, "RIL_UNSOL_CDMA_CALL_ACCEPTED"

    goto/16 :goto_0

    .line 1754
    :sswitch_5c
    const-string v0, "RIL_UNSOL_UTK_SESSION_END"

    goto/16 :goto_0

    .line 1755
    :sswitch_5d
    const-string v0, "RIL_UNSOL_UTK_PROACTIVE_COMMAND"

    goto/16 :goto_0

    .line 1756
    :sswitch_5e
    const-string v0, "RIL_UNSOL_UTK_EVENT_NOTIFY"

    goto/16 :goto_0

    .line 1757
    :sswitch_5f
    const-string v0, "RIL_UNSOL_VIA_GPS_EVENT"

    goto/16 :goto_0

    .line 1758
    :sswitch_60
    const-string v0, "RIL_UNSOL_VIA_NETWORK_TYPE_CHANGE"

    goto/16 :goto_0

    .line 1759
    :sswitch_61
    const-string v0, "RIL_UNSOL_VIA_PLMN_CHANGE_REG_PAUSE"

    goto/16 :goto_0

    .line 1760
    :sswitch_62
    const-string v0, "RIL_UNSOL_VIA_INVALID_SIM_DETECTED"

    goto/16 :goto_0

    .line 1635
    nop

    :sswitch_data_0
    .sparse-switch
        0x3e8 -> :sswitch_0
        0x3e9 -> :sswitch_1
        0x3ea -> :sswitch_2
        0x3eb -> :sswitch_3
        0x3ec -> :sswitch_4
        0x3ed -> :sswitch_5
        0x3ee -> :sswitch_6
        0x3ef -> :sswitch_7
        0x3f0 -> :sswitch_8
        0x3f1 -> :sswitch_9
        0x3f2 -> :sswitch_a
        0x3f3 -> :sswitch_b
        0x3f4 -> :sswitch_c
        0x3f5 -> :sswitch_d
        0x3f6 -> :sswitch_e
        0x3f7 -> :sswitch_f
        0x3f8 -> :sswitch_10
        0x3f9 -> :sswitch_11
        0x3fa -> :sswitch_12
        0x3fb -> :sswitch_13
        0x3fc -> :sswitch_14
        0x3fd -> :sswitch_15
        0x3fe -> :sswitch_16
        0x3ff -> :sswitch_17
        0x400 -> :sswitch_18
        0x401 -> :sswitch_19
        0x402 -> :sswitch_1a
        0x403 -> :sswitch_1b
        0x404 -> :sswitch_1c
        0x405 -> :sswitch_1d
        0x406 -> :sswitch_1e
        0x407 -> :sswitch_1f
        0x408 -> :sswitch_20
        0x409 -> :sswitch_21
        0x40a -> :sswitch_22
        0x40b -> :sswitch_23
        0x40c -> :sswitch_24
        0x40d -> :sswitch_25
        0x40e -> :sswitch_26
        0x40f -> :sswitch_27
        0x410 -> :sswitch_28
        0x412 -> :sswitch_2c
        0x413 -> :sswitch_29
        0x414 -> :sswitch_2a
        0xbb8 -> :sswitch_41
        0xbb9 -> :sswitch_42
        0xbba -> :sswitch_3c
        0xbbf -> :sswitch_4d
        0xbc0 -> :sswitch_34
        0xbc3 -> :sswitch_37
        0xbc4 -> :sswitch_35
        0xbc5 -> :sswitch_36
        0xbc6 -> :sswitch_43
        0xbc7 -> :sswitch_3f
        0xbc8 -> :sswitch_3e
        0xbca -> :sswitch_3d
        0xbcb -> :sswitch_40
        0xbcc -> :sswitch_38
        0xbcd -> :sswitch_39
        0xbcf -> :sswitch_48
        0xbd0 -> :sswitch_49
        0xbd1 -> :sswitch_4e
        0xbd4 -> :sswitch_47
        0xbd5 -> :sswitch_33
        0xbd6 -> :sswitch_50
        0xbd7 -> :sswitch_44
        0xbd8 -> :sswitch_45
        0xbd9 -> :sswitch_46
        0xbda -> :sswitch_4a
        0xbdb -> :sswitch_4b
        0xbdd -> :sswitch_55
        0xbde -> :sswitch_51
        0xbdf -> :sswitch_4c
        0xbe0 -> :sswitch_2d
        0xbe1 -> :sswitch_2e
        0xbe2 -> :sswitch_2f
        0xbe3 -> :sswitch_30
        0xbe4 -> :sswitch_31
        0xbe5 -> :sswitch_3a
        0xbe6 -> :sswitch_3b
        0xbe7 -> :sswitch_4f
        0xbe9 -> :sswitch_52
        0xbea -> :sswitch_53
        0xbeb -> :sswitch_54
        0xbec -> :sswitch_32
        0xbed -> :sswitch_57
        0xbee -> :sswitch_56
        0xbef -> :sswitch_58
        0xbf0 -> :sswitch_59
        0xbf1 -> :sswitch_5a
        0x1388 -> :sswitch_5b
        0x1389 -> :sswitch_5c
        0x138a -> :sswitch_5d
        0x138b -> :sswitch_5e
        0x138c -> :sswitch_5f
        0x138d -> :sswitch_60
        0x138e -> :sswitch_61
        0x138f -> :sswitch_62
        0x2afa -> :sswitch_2b
    .end sparse-switch
.end method

.method private setCallIndication([Ljava/lang/String;)V
    .locals 7
    .param p1, "incomingCallInfo"    # [Ljava/lang/String;

    .prologue
    const/4 v6, 0x3

    .line 1818
    const/16 v4, 0x826

    const/4 v5, 0x0

    invoke-static {v4, v5}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v2

    .line 1821
    .local v2, "rr":Lcom/android/internal/telephony/RILRequest;
    const/4 v4, 0x0

    aget-object v4, p1, v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 1822
    .local v0, "callId":I
    aget-object v4, p1, v6

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 1823
    .local v1, "callMode":I
    const/4 v4, 0x4

    aget-object v4, p1, v4

    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .line 1826
    .local v3, "seqNumber":I
    const/4 v1, 0x0

    .line 1828
    iget-object v4, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v4, v6}, Landroid/os/Parcel;->writeInt(I)V

    .line 1830
    iget-object v4, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v4, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 1831
    iget-object v4, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v4, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 1832
    iget-object v4, v2, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v4, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1834
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "> "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v2, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v5}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1837
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/MediaTekRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 1838
    return-void
.end method

.method private setRadioStateFromRILInt(I)V
    .locals 5
    .param p1, "stateCode"    # I

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 1882
    packed-switch p1, :pswitch_data_0

    .line 1886
    const/16 v1, 0x7e0

    invoke-static {v1, v4}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 1888
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1890
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1891
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1893
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/MediaTekRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 1896
    const/16 v1, 0x7df

    invoke-static {v1, v4}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 1898
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1900
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1901
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1903
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/MediaTekRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 1906
    .end local v0    # "rr":Lcom/android/internal/telephony/RILRequest;
    :pswitch_0
    return-void

    .line 1882
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public conference(Landroid/os/Message;)V
    .locals 3
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    .line 500
    const/16 v1, 0x10

    invoke-static {v1, p1}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 503
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 506
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/MediaTekRIL;->handleChldRelatedRequest(Lcom/android/internal/telephony/RILRequest;)V

    .line 508
    return-void
.end method

.method protected createRILReceiver()Lcom/android/internal/telephony/RIL$RILReceiver;
    .locals 1

    .prologue
    .line 2054
    new-instance v0, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;

    invoke-direct {v0, p0}, Lcom/android/internal/telephony/MediaTekRIL$MTKRILReceiver;-><init>(Lcom/android/internal/telephony/MediaTekRIL;)V

    return-object v0
.end method

.method public explicitCallTransfer(Landroid/os/Message;)V
    .locals 3
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    .line 530
    const/16 v1, 0x48

    invoke-static {v1, p1}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 533
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 536
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/MediaTekRIL;->handleChldRelatedRequest(Lcom/android/internal/telephony/RILRequest;)V

    .line 538
    return-void
.end method

.method public getModemCapability(Landroid/os/Message;)V
    .locals 2
    .param p1, "response"    # Landroid/os/Message;

    .prologue
    .line 405
    const-string v0, "RILJ"

    const-string v1, "GetModemCapability"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 407
    const-string v0, "RILJ"

    const-string v1, "GetModemCapability: not really implemented!"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 408
    const/4 v0, 0x0

    const/4 v1, 0x6

    invoke-static {v1}, Lcom/android/internal/telephony/CommandException;->fromRilErrno(I)Lcom/android/internal/telephony/CommandException;

    move-result-object v1

    invoke-static {p1, v0, v1}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 409
    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    .line 410
    return-void
.end method

.method protected processSolicited(Landroid/os/Parcel;)Lcom/android/internal/telephony/RILRequest;
    .locals 12
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v11, -0x1

    const/4 v7, 0x0

    .line 545
    const/4 v1, 0x0

    .line 547
    .local v1, "found":Z
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v5

    .line 548
    .local v5, "serial":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 552
    .local v0, "error":I
    invoke-virtual {p0, v5}, Lcom/android/internal/telephony/MediaTekRIL;->findAndRemoveRequestFromList(I)Lcom/android/internal/telephony/RILRequest;

    move-result-object v3

    .line 554
    .local v3, "rr":Lcom/android/internal/telephony/RILRequest;
    if-nez v3, :cond_1

    .line 555
    const-string v8, "RILJ"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unexpected solicited response! sn: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " error: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-object v3, v7

    .line 971
    .end local v3    # "rr":Lcom/android/internal/telephony/RILRequest;
    :cond_0
    :goto_0
    return-object v3

    .line 562
    .restart local v3    # "rr":Lcom/android/internal/telephony/RILRequest;
    :cond_1
    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v9, 0x31

    if-eq v8, v9, :cond_2

    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v9, 0x32

    if-ne v8, v9, :cond_4

    .line 564
    :cond_2
    iget-object v8, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    monitor-enter v8

    .line 565
    :try_start_0
    iget-object v9, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v9, v3}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->remove(Lcom/android/internal/telephony/RILRequest;)V

    .line 566
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "remove first item in dtmf queue done, size = "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget-object v10, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v10}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 567
    iget-object v9, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v9}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->size()I

    move-result v9

    if-lez v9, :cond_d

    .line 568
    iget-object v9, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v9}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->get()Lcom/android/internal/telephony/RILRequest;

    move-result-object v4

    .line 569
    .local v4, "rr2":Lcom/android/internal/telephony/RILRequest;
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "> "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v4, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v10}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 570
    invoke-virtual {p0, v4}, Lcom/android/internal/telephony/MediaTekRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 579
    .end local v4    # "rr2":Lcom/android/internal/telephony/RILRequest;
    :cond_3
    :goto_1
    monitor-exit v8
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 582
    :cond_4
    const/4 v2, 0x0

    .line 584
    .local v2, "ret":Ljava/lang/Object;
    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v9, 0x30

    if-eq v8, v9, :cond_5

    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v9, 0x82f

    if-ne v8, v9, :cond_6

    .line 587
    :cond_5
    const-string v8, "RILJ"

    const-string v9, "mGetAvailableNetworkDoneRegistrant.notifyRegistrants(); -- not implemented!"

    invoke-static {v8, v9}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 591
    :cond_6
    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v9, 0x49

    if-ne v8, v9, :cond_8

    .line 592
    if-eqz v0, :cond_7

    iget v8, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPreviousPreferredType:I

    if-eq v8, v11, :cond_7

    .line 593
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "restore mPreferredNetworkType from "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPreferredNetworkType:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " to "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPreviousPreferredType:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 594
    iget v8, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPreviousPreferredType:I

    iput v8, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPreferredNetworkType:I

    .line 596
    :cond_7
    iput v11, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPreviousPreferredType:I

    .line 601
    :cond_8
    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v9, 0xf

    if-eq v8, v9, :cond_9

    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v9, 0x10

    if-eq v8, v9, :cond_9

    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v9, 0x34

    if-eq v8, v9, :cond_9

    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v9, 0x48

    if-ne v8, v9, :cond_a

    .line 605
    :cond_9
    const-string v8, "clear mIsSendChldRequest"

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 606
    iget-object v8, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v8}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->resetSendChldRequest()V

    .line 610
    :cond_a
    if-eqz v0, :cond_b

    invoke-virtual {p1}, Landroid/os/Parcel;->dataAvail()I

    move-result v8

    if-lez v8, :cond_e

    .line 613
    :cond_b
    const-string v8, "ro.cm.device"

    invoke-static {v8}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "e73"

    invoke-virtual {v8, v9}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v8

    if-nez v8, :cond_c

    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v9, 0xdc

    if-ne v8, v9, :cond_c

    .line 615
    const/16 v8, 0x33

    iput v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    .line 619
    :cond_c
    :try_start_1
    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    sparse-switch v8, :sswitch_data_0

    .line 894
    new-instance v8, Ljava/lang/RuntimeException;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Unrecognized solicited response: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    .line 896
    :catch_0
    move-exception v6

    .line 899
    .local v6, "tr":Ljava/lang/Throwable;
    const-string v8, "RILJ"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "< "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v10}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " exception, possible invalid RIL response"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9, v6}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 903
    iget-object v8, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v8, :cond_0

    .line 904
    iget-object v8, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v8, v7, v6}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 905
    iget-object v7, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v7}, Landroid/os/Message;->sendToTarget()V

    goto/16 :goto_0

    .line 572
    .end local v2    # "ret":Ljava/lang/Object;
    .end local v6    # "tr":Ljava/lang/Throwable;
    :cond_d
    :try_start_2
    iget-object v9, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v9}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->getPendingRequest()Lcom/android/internal/telephony/RILRequest;

    move-result-object v9

    if-eqz v9, :cond_3

    .line 573
    const-string v9, "send pending switch request"

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 574
    iget-object v9, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v9}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->getPendingRequest()Lcom/android/internal/telephony/RILRequest;

    move-result-object v9

    invoke-virtual {p0, v9}, Lcom/android/internal/telephony/MediaTekRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 575
    iget-object v9, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v9}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->setSendChldRequest()V

    .line 576
    iget-object v9, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->setPendingRequest(Lcom/android/internal/telephony/RILRequest;)V

    goto/16 :goto_1

    .line 579
    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v7

    .line 625
    .restart local v2    # "ret":Ljava/lang/Object;
    :sswitch_0
    :try_start_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseIccCardStatus(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0

    move-result-object v2

    .line 911
    .end local v2    # "ret":Ljava/lang/Object;
    :cond_e
    :goto_2
    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    const/16 v9, 0x81

    if-ne v8, v9, :cond_f

    .line 914
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Response to RIL_REQUEST_SHUTDOWN received. Error is "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " Setting Radio State to Unavailable regardless of error."

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 916
    sget-object v8, Lcom/android/internal/telephony/CommandsInterface$RadioState;->RADIO_UNAVAILABLE:Lcom/android/internal/telephony/CommandsInterface$RadioState;

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/MediaTekRIL;->setRadioState(Lcom/android/internal/telephony/CommandsInterface$RadioState;)V

    .line 922
    :cond_f
    iget v8, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    packed-switch v8, :pswitch_data_0

    .line 935
    :cond_10
    :goto_3
    :pswitch_0
    if-eqz v0, :cond_12

    .line 936
    iget v7, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    sparse-switch v7, :sswitch_data_1

    .line 959
    :cond_11
    :goto_4
    invoke-virtual {v3, v0, v2}, Lcom/android/internal/telephony/RILRequest;->onError(ILjava/lang/Object;)V

    goto/16 :goto_0

    .line 626
    .restart local v2    # "ret":Ljava/lang/Object;
    :sswitch_1
    :try_start_4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 627
    :sswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 628
    :sswitch_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 629
    :sswitch_4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 630
    :sswitch_5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 631
    :sswitch_6
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 632
    :sswitch_7
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 633
    :sswitch_8
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 634
    :sswitch_9
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 635
    :sswitch_a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 636
    :sswitch_b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 637
    :sswitch_c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 638
    :sswitch_d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 639
    :sswitch_e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto :goto_2

    .line 640
    :sswitch_f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 641
    :sswitch_10
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 642
    :sswitch_11
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 643
    :sswitch_12
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 644
    :sswitch_13
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 645
    :sswitch_14
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 646
    :sswitch_15
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseOperator(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 647
    :sswitch_16
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 648
    :sswitch_17
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 649
    :sswitch_18
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 650
    :sswitch_19
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 651
    :sswitch_1a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseSetupDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 652
    :sswitch_1b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 653
    :sswitch_1c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 654
    :sswitch_1d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 655
    :sswitch_1e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 656
    :sswitch_1f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 657
    :sswitch_20
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseCallForward(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 658
    :sswitch_21
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 659
    :sswitch_22
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 660
    :sswitch_23
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 661
    :sswitch_24
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 662
    :sswitch_25
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 663
    :sswitch_26
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 664
    :sswitch_27
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 665
    :sswitch_28
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseDeactivateDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 666
    :sswitch_29
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 667
    :sswitch_2a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 668
    :sswitch_2b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 669
    :sswitch_2c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 670
    :sswitch_2d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 671
    :sswitch_2e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 672
    :sswitch_2f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseOperatorInfos(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 673
    :sswitch_30
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 674
    :sswitch_31
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 675
    :sswitch_32
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 676
    :sswitch_33
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 677
    :sswitch_34
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 678
    :sswitch_35
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 679
    :sswitch_36
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 680
    :sswitch_37
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 681
    :sswitch_38
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 682
    :sswitch_39
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseDataCallList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 683
    :sswitch_3a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 684
    :sswitch_3b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseRaw(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 685
    :sswitch_3c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 686
    :sswitch_3d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 687
    :sswitch_3e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 688
    :sswitch_3f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 689
    :sswitch_40
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 690
    :sswitch_41
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 691
    :sswitch_42
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 692
    :sswitch_43
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 693
    :sswitch_44
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 694
    :sswitch_45
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 695
    :sswitch_46
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 696
    :sswitch_47
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 697
    :sswitch_48
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 698
    :sswitch_49
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 699
    :sswitch_4a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseGetPreferredNetworkType(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 700
    :sswitch_4b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseCellList(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 701
    :sswitch_4c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 702
    :sswitch_4d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 703
    :sswitch_4e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 704
    :sswitch_4f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 705
    :sswitch_50
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 706
    :sswitch_51
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 707
    :sswitch_52
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 708
    :sswitch_53
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 709
    :sswitch_54
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 710
    :sswitch_55
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 711
    :sswitch_56
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 712
    :sswitch_57
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 713
    :sswitch_58
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseGmsBroadcastConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 714
    :sswitch_59
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 715
    :sswitch_5a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 716
    :sswitch_5b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseCdmaBroadcastConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 717
    :sswitch_5c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 718
    :sswitch_5d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 719
    :sswitch_5e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 720
    :sswitch_5f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 721
    :sswitch_60
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 722
    :sswitch_61
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 723
    :sswitch_62
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 724
    :sswitch_63
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 725
    :sswitch_64
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 726
    :sswitch_65
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 727
    :sswitch_66
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 728
    :sswitch_67
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 729
    :sswitch_68
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 730
    :sswitch_69
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 731
    :sswitch_6a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 732
    :sswitch_6b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 733
    :sswitch_6c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 734
    :sswitch_6d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseCellInfoList(Landroid/os/Parcel;)Ljava/util/ArrayList;

    move-result-object v2

    .local v2, "ret":Ljava/util/ArrayList;
    goto/16 :goto_2

    .line 735
    .local v2, "ret":Ljava/lang/Object;
    :sswitch_6e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 736
    :sswitch_6f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 737
    :sswitch_70
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 738
    :sswitch_71
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 739
    :sswitch_72
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseSMS(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 740
    :sswitch_73
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 741
    :sswitch_74
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 742
    :sswitch_75
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 743
    :sswitch_76
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 744
    :sswitch_77
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 745
    :sswitch_78
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 746
    :sswitch_79
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 747
    :sswitch_7a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 748
    :sswitch_7b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 749
    :sswitch_7c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 750
    :sswitch_7d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseHardwareConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 751
    :sswitch_7e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseICC_IOBase64(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 752
    :sswitch_7f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 753
    :sswitch_80
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 754
    :sswitch_81
    invoke-direct {p0}, Lcom/android/internal/telephony/MediaTekRIL;->responsePhoneId()Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 757
    :sswitch_82
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 758
    :sswitch_83
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 759
    :sswitch_84
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 760
    :sswitch_85
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 761
    :sswitch_86
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 762
    :sswitch_87
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 763
    :sswitch_88
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 767
    :sswitch_89
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    goto/16 :goto_2

    .line 768
    :sswitch_8a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    goto/16 :goto_2

    .line 769
    :sswitch_8b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 770
    :sswitch_8c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 774
    :sswitch_8d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 775
    :sswitch_8e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 778
    :sswitch_8f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 779
    :sswitch_90
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 780
    :sswitch_91
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseIccCardStatus(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 782
    :sswitch_92
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseICC_IO(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 784
    :sswitch_93
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 785
    :sswitch_94
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 788
    :sswitch_95
    const-string v8, "RILJ"

    const-string v9, "RIL_REQUEST_READ_PHB_ENTRY: stub!"

    invoke-static {v8, v9}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 789
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 791
    :sswitch_96
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 792
    :sswitch_97
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 793
    :sswitch_98
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 794
    :sswitch_99
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 795
    :sswitch_9a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 796
    :sswitch_9b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 797
    :sswitch_9c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 800
    :sswitch_9d
    const-string v8, "RILJ"

    const-string v9, "RIL_REQUEST_GET_PHB_MEM_STORAGE: stub!"

    invoke-static {v8, v9}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 801
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 803
    :sswitch_9e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 806
    :sswitch_9f
    const-string v8, "RILJ"

    const-string v9, "RIL_REQUEST_READ_PHB_ENTRY_EXT: stub!"

    invoke-static {v8, v9}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 807
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 809
    :sswitch_a0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 814
    :sswitch_a1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 815
    :sswitch_a2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 816
    :sswitch_a3
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseNetworkInfoWithActs(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 817
    :sswitch_a4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 818
    :sswitch_a5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 819
    :sswitch_a6
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseOperatorInfosWithAct(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 820
    :sswitch_a7
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 823
    :sswitch_a8
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseFemtoCellInfos(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 824
    :sswitch_a9
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 825
    :sswitch_aa
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 829
    :sswitch_ab
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 830
    :sswitch_ac
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 833
    :sswitch_ad
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 834
    :sswitch_ae
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 836
    :sswitch_af
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 837
    :sswitch_b0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 840
    :sswitch_b1
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseSmsParams(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 841
    :sswitch_b2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 842
    :sswitch_b3
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseSimSmsMemoryStatus(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 843
    :sswitch_b4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 844
    :sswitch_b5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 845
    :sswitch_b6
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 846
    :sswitch_b7
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseCbConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 847
    :sswitch_b8
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 849
    :sswitch_b9
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 852
    :sswitch_ba
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseSetupDedicateDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 853
    :sswitch_bb
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 854
    :sswitch_bc
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseModifyDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 855
    :sswitch_bd
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 856
    :sswitch_be
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responsePcscfDiscovery(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 857
    :sswitch_bf
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 859
    :sswitch_c0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 860
    :sswitch_c1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 862
    :sswitch_c2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 863
    :sswitch_c3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 864
    :sswitch_c4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 865
    :sswitch_c5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 868
    :sswitch_c6
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 872
    :sswitch_c7
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseGetNitzTime(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 873
    :sswitch_c8
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 874
    :sswitch_c9
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 875
    :sswitch_ca
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 876
    :sswitch_cb
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 877
    :sswitch_cc
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 878
    :sswitch_cd
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 879
    :sswitch_ce
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 880
    :sswitch_cf
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 881
    :sswitch_d0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 882
    :sswitch_d1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 883
    :sswitch_d2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 884
    :sswitch_d3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 885
    :sswitch_d4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 886
    :sswitch_d5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 887
    :sswitch_d6
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 888
    :sswitch_d7
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 889
    :sswitch_d8
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 890
    :sswitch_d9
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v2

    goto/16 :goto_2

    .line 891
    :sswitch_da
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0

    move-result-object v2

    goto/16 :goto_2

    .line 925
    .end local v2    # "ret":Ljava/lang/Object;
    :pswitch_1
    iget-object v8, p0, Lcom/android/internal/telephony/MediaTekRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    if-eqz v8, :cond_10

    .line 927
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ON enter sim puk fakeSimStatusChanged: reg count="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/android/internal/telephony/MediaTekRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v9}, Landroid/os/RegistrantList;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 930
    iget-object v8, p0, Lcom/android/internal/telephony/MediaTekRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v8}, Landroid/os/RegistrantList;->notifyRegistrants()V

    goto/16 :goto_3

    .line 942
    :sswitch_db
    iget-object v7, p0, Lcom/android/internal/telephony/MediaTekRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    if-eqz v7, :cond_11

    .line 944
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "ON some errors fakeSimStatusChanged: reg count="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/android/internal/telephony/MediaTekRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v8}, Landroid/os/RegistrantList;->size()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 947
    iget-object v7, p0, Lcom/android/internal/telephony/MediaTekRIL;->mIccStatusChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v7}, Landroid/os/RegistrantList;->notifyRegistrants()V

    goto/16 :goto_4

    .line 953
    :sswitch_dc
    const-string v7, "Set phone RAT failed, send response with phone ID"

    invoke-virtual {p0, v7}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 955
    invoke-direct {p0}, Lcom/android/internal/telephony/MediaTekRIL;->responsePhoneId()Ljava/lang/Object;

    move-result-object v2

    .restart local v2    # "ret":Ljava/lang/Object;
    goto/16 :goto_4

    .line 963
    .end local v2    # "ret":Ljava/lang/Object;
    :cond_12
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "< "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v9}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, v3, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v9, v2}, Lcom/android/internal/telephony/MediaTekRIL;->retToString(ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {p0, v8}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 966
    iget-object v8, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    if-eqz v8, :cond_0

    .line 967
    iget-object v8, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-static {v8, v2, v7}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 968
    iget-object v7, v3, Lcom/android/internal/telephony/RILRequest;->mResult:Landroid/os/Message;

    invoke-virtual {v7}, Landroid/os/Message;->sendToTarget()V

    goto/16 :goto_0

    .line 619
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_0
        0x2 -> :sswitch_1
        0x3 -> :sswitch_2
        0x4 -> :sswitch_3
        0x5 -> :sswitch_4
        0x6 -> :sswitch_5
        0x7 -> :sswitch_6
        0x8 -> :sswitch_7
        0x9 -> :sswitch_8
        0xa -> :sswitch_9
        0xb -> :sswitch_a
        0xc -> :sswitch_b
        0xd -> :sswitch_c
        0xe -> :sswitch_d
        0xf -> :sswitch_e
        0x10 -> :sswitch_f
        0x11 -> :sswitch_10
        0x12 -> :sswitch_11
        0x13 -> :sswitch_12
        0x14 -> :sswitch_13
        0x15 -> :sswitch_14
        0x16 -> :sswitch_15
        0x17 -> :sswitch_16
        0x18 -> :sswitch_17
        0x19 -> :sswitch_18
        0x1a -> :sswitch_19
        0x1b -> :sswitch_1a
        0x1c -> :sswitch_1b
        0x1d -> :sswitch_1c
        0x1e -> :sswitch_1d
        0x1f -> :sswitch_1e
        0x20 -> :sswitch_1f
        0x21 -> :sswitch_20
        0x22 -> :sswitch_21
        0x23 -> :sswitch_22
        0x24 -> :sswitch_23
        0x25 -> :sswitch_24
        0x26 -> :sswitch_25
        0x27 -> :sswitch_26
        0x28 -> :sswitch_27
        0x29 -> :sswitch_28
        0x2a -> :sswitch_29
        0x2b -> :sswitch_2a
        0x2c -> :sswitch_2b
        0x2d -> :sswitch_2c
        0x2e -> :sswitch_2d
        0x2f -> :sswitch_2e
        0x30 -> :sswitch_2f
        0x31 -> :sswitch_31
        0x32 -> :sswitch_32
        0x33 -> :sswitch_33
        0x34 -> :sswitch_34
        0x35 -> :sswitch_35
        0x36 -> :sswitch_36
        0x37 -> :sswitch_37
        0x38 -> :sswitch_38
        0x39 -> :sswitch_39
        0x3a -> :sswitch_3a
        0x3b -> :sswitch_3b
        0x3c -> :sswitch_3c
        0x3d -> :sswitch_3d
        0x3e -> :sswitch_3e
        0x3f -> :sswitch_3f
        0x40 -> :sswitch_40
        0x41 -> :sswitch_41
        0x42 -> :sswitch_42
        0x43 -> :sswitch_43
        0x44 -> :sswitch_44
        0x45 -> :sswitch_45
        0x46 -> :sswitch_46
        0x47 -> :sswitch_47
        0x48 -> :sswitch_48
        0x49 -> :sswitch_49
        0x4a -> :sswitch_4a
        0x4b -> :sswitch_4b
        0x4c -> :sswitch_4c
        0x4d -> :sswitch_4d
        0x4e -> :sswitch_4e
        0x4f -> :sswitch_4f
        0x50 -> :sswitch_50
        0x51 -> :sswitch_51
        0x52 -> :sswitch_52
        0x53 -> :sswitch_53
        0x54 -> :sswitch_54
        0x55 -> :sswitch_55
        0x56 -> :sswitch_5e
        0x57 -> :sswitch_56
        0x58 -> :sswitch_57
        0x59 -> :sswitch_58
        0x5a -> :sswitch_59
        0x5b -> :sswitch_5a
        0x5c -> :sswitch_5b
        0x5d -> :sswitch_5c
        0x5e -> :sswitch_5d
        0x5f -> :sswitch_5f
        0x60 -> :sswitch_60
        0x61 -> :sswitch_61
        0x62 -> :sswitch_62
        0x63 -> :sswitch_65
        0x64 -> :sswitch_63
        0x65 -> :sswitch_64
        0x66 -> :sswitch_66
        0x67 -> :sswitch_67
        0x68 -> :sswitch_68
        0x69 -> :sswitch_69
        0x6a -> :sswitch_6a
        0x6b -> :sswitch_6b
        0x6c -> :sswitch_6c
        0x6d -> :sswitch_6d
        0x6e -> :sswitch_6e
        0x6f -> :sswitch_6f
        0x70 -> :sswitch_71
        0x71 -> :sswitch_72
        0x72 -> :sswitch_73
        0x73 -> :sswitch_74
        0x74 -> :sswitch_75
        0x75 -> :sswitch_76
        0x76 -> :sswitch_77
        0x77 -> :sswitch_78
        0x78 -> :sswitch_79
        0x79 -> :sswitch_7a
        0x7a -> :sswitch_7b
        0x7b -> :sswitch_7c
        0x7c -> :sswitch_7d
        0x7d -> :sswitch_7e
        0x80 -> :sswitch_70
        0x81 -> :sswitch_7f
        0x82 -> :sswitch_80
        0x83 -> :sswitch_81
        0x7dc -> :sswitch_93
        0x7dd -> :sswitch_94
        0x7de -> :sswitch_95
        0x7e2 -> :sswitch_8d
        0x7e3 -> :sswitch_8e
        0x7e4 -> :sswitch_af
        0x7e5 -> :sswitch_c2
        0x7e6 -> :sswitch_c3
        0x7e7 -> :sswitch_c4
        0x7e8 -> :sswitch_c5
        0x7e9 -> :sswitch_a1
        0x7ed -> :sswitch_b3
        0x7f0 -> :sswitch_a2
        0x7f1 -> :sswitch_a3
        0x7f2 -> :sswitch_a4
        0x7f3 -> :sswitch_96
        0x7f4 -> :sswitch_99
        0x7f5 -> :sswitch_9a
        0x7f6 -> :sswitch_9b
        0x7f7 -> :sswitch_97
        0x7f8 -> :sswitch_98
        0x7fb -> :sswitch_a5
        0x7fe -> :sswitch_9c
        0x7ff -> :sswitch_9d
        0x800 -> :sswitch_9e
        0x801 -> :sswitch_9f
        0x802 -> :sswitch_a0
        0x803 -> :sswitch_b1
        0x804 -> :sswitch_b2
        0x807 -> :sswitch_ae
        0x808 -> :sswitch_b5
        0x809 -> :sswitch_b6
        0x80a -> :sswitch_b7
        0x80c -> :sswitch_b4
        0x80d -> :sswitch_b0
        0x812 -> :sswitch_ac
        0x813 -> :sswitch_ab
        0x81b -> :sswitch_a7
        0x81c -> :sswitch_a8
        0x81d -> :sswitch_a9
        0x81e -> :sswitch_aa
        0x821 -> :sswitch_30
        0x824 -> :sswitch_82
        0x825 -> :sswitch_83
        0x826 -> :sswitch_84
        0x827 -> :sswitch_85
        0x828 -> :sswitch_86
        0x829 -> :sswitch_87
        0x82a -> :sswitch_8f
        0x82b -> :sswitch_90
        0x82c -> :sswitch_91
        0x82d -> :sswitch_92
        0x82e -> :sswitch_ad
        0x82f -> :sswitch_a6
        0x832 -> :sswitch_ba
        0x833 -> :sswitch_bb
        0x834 -> :sswitch_bc
        0x835 -> :sswitch_bd
        0x836 -> :sswitch_be
        0x837 -> :sswitch_bf
        0x838 -> :sswitch_b8
        0x839 -> :sswitch_b9
        0x83a -> :sswitch_89
        0x83b -> :sswitch_8a
        0x83c -> :sswitch_8b
        0x83d -> :sswitch_8c
        0x83e -> :sswitch_88
        0x83f -> :sswitch_c0
        0x840 -> :sswitch_c1
        0x841 -> :sswitch_c6
        0xfa0 -> :sswitch_c7
        0xfa1 -> :sswitch_c8
        0xfa2 -> :sswitch_c9
        0xfa3 -> :sswitch_ca
        0xfa4 -> :sswitch_cb
        0xfa5 -> :sswitch_cc
        0xfa6 -> :sswitch_cd
        0xfa7 -> :sswitch_ce
        0xfa8 -> :sswitch_cf
        0xfa9 -> :sswitch_d0
        0xfaa -> :sswitch_d1
        0xfab -> :sswitch_d2
        0xfac -> :sswitch_d3
        0xfad -> :sswitch_d4
        0xfae -> :sswitch_d5
        0xfaf -> :sswitch_d6
        0xfb0 -> :sswitch_d7
        0xfb1 -> :sswitch_d8
        0xfb2 -> :sswitch_d9
        0xfb3 -> :sswitch_da
    .end sparse-switch

    .line 922
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_1
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 936
    :sswitch_data_1
    .sparse-switch
        0x2 -> :sswitch_db
        0x4 -> :sswitch_db
        0x6 -> :sswitch_db
        0x7 -> :sswitch_db
        0x2b -> :sswitch_db
        0x83 -> :sswitch_dc
    .end sparse-switch
.end method

.method protected processUnsolicited(Landroid/os/Parcel;)V
    .locals 10
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x0

    .line 978
    invoke-virtual {p1}, Landroid/os/Parcel;->dataPosition()I

    move-result v0

    .line 979
    .local v0, "dataPosition":I
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    .line 981
    .local v2, "response":I
    sparse-switch v2, :sswitch_data_0

    .line 1073
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 1076
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->processUnsolicited(Landroid/os/Parcel;)V

    .line 1291
    :cond_0
    :goto_0
    return-void

    .line 982
    :sswitch_0
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .line 1082
    .local v3, "ret":Ljava/lang/Object;
    :goto_1
    const/4 v4, 0x0

    .line 1083
    .local v4, "rewindAndReplace":Z
    const/4 v1, 0x0

    .line 1085
    .local v1, "newResponseCode":I
    sparse-switch v2, :sswitch_data_1

    .line 1276
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unprocessed unsolicited known MTK response: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 1279
    .end local v3    # "ret":Ljava/lang/Object;
    :cond_1
    :goto_2
    if-eqz v4, :cond_0

    .line 1280
    const-string v6, "RILJ"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Rewriting MTK unsolicited response "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " to "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 1283
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 1284
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 1287
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 1289
    invoke-super {p0, p1}, Lcom/android/internal/telephony/RIL;->processUnsolicited(Landroid/os/Parcel;)V

    goto :goto_0

    .line 983
    .end local v1    # "newResponseCode":I
    .end local v4    # "rewindAndReplace":Z
    :sswitch_1
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 984
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_2
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 985
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_3
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 986
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_4
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 987
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_5
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 988
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_6
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 989
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_7
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 990
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_8
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 992
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_9
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 993
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto :goto_1

    .line 994
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseHardwareConfig(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 997
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_c
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseSetPhoneRatChanged(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 999
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1000
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_e
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseCrssNotification(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1001
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1002
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_10
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1003
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_11
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1004
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_12
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1007
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_13
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1009
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_14
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1010
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_15
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1011
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_16
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1012
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_17
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1013
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_18
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1014
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_19
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1015
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_1a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1016
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_1b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1017
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_1c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1018
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_1d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1020
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_1e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1021
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_1f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1022
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_20
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1024
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_21
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseSetupDedicateDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1025
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_22
    invoke-direct {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseSetupDedicateDataCall(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1026
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_23
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1028
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_24
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1030
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_25
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1031
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_26
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1033
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_27
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1035
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_28
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1039
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_29
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1041
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_2a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1043
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_2b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1046
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_2c
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1047
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_2d
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1049
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_2e
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1050
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_2f
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1053
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_30
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1056
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_31
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1057
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_32
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1059
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_33
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1062
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_34
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1063
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_35
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1064
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_36
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1065
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_37
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseString(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1066
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_38
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1067
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_39
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseInts(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1068
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_3a
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1069
    .end local v3    # "ret":Ljava/lang/Object;
    :sswitch_3b
    invoke-virtual {p0, p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseVoid(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v3

    .restart local v3    # "ret":Ljava/lang/Object;
    goto/16 :goto_1

    .line 1087
    .restart local v1    # "newResponseCode":I
    .restart local v4    # "rewindAndReplace":Z
    :sswitch_3c
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogvRet(ILjava/lang/Object;)V

    .line 1088
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mNeighboringInfoRegistrants:Landroid/os/RegistrantList;

    if-eqz v6, :cond_1

    .line 1089
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mNeighboringInfoRegistrants:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1095
    :sswitch_3d
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogvRet(ILjava/lang/Object;)V

    .line 1096
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mNetworkInfoRegistrants:Landroid/os/RegistrantList;

    if-eqz v6, :cond_1

    .line 1097
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mNetworkInfoRegistrants:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1103
    :sswitch_3e
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 1104
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "mPhoneRatFamilyreg size :"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPhoneRatFamilyChangedRegistrants:Landroid/os/RegistrantList;

    invoke-virtual {v7}, Landroid/os/RegistrantList;->size()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1105
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPhoneRatFamilyChangedRegistrants:Landroid/os/RegistrantList;

    if-eqz v6, :cond_1

    .line 1106
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPhoneRatFamilyChangedRegistrants:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1112
    :sswitch_3f
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 1113
    const-string v6, "RILJ"

    const-string v7, "RIL_UNSOL_PHB_READY_NOTIFICATION: stub!"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 1123
    :sswitch_40
    const-string v6, "RILJ"

    const-string v7, "RIL_UNSOL_STK_EVDL_CALL: stub!"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 1136
    :sswitch_41
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogvRet(ILjava/lang/Object;)V

    .line 1138
    const-string v6, "RILJ"

    const-string v7, "RIL_UNSOL_STK_CALL_CTRL: stub!"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 1147
    :sswitch_42
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 1148
    const-string v6, "RILJ"

    const-string v7, "RIL_UNSOL_STK_SETUP_MENU_RESET: stub!"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 1158
    :sswitch_43
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLog(I)V

    .line 1159
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSessionChangedRegistrants:Landroid/os/RegistrantList;

    if-eqz v6, :cond_1

    .line 1160
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSessionChangedRegistrants:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1167
    :sswitch_44
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 1168
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSimMissing:Landroid/os/RegistrantList;

    if-eqz v6, :cond_1

    .line 1169
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSimMissing:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1175
    :sswitch_45
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 1176
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSimRecovery:Landroid/os/RegistrantList;

    if-eqz v6, :cond_1

    .line 1177
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSimRecovery:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1183
    :sswitch_46
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 1184
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mVirtualSimOn:Landroid/os/RegistrantList;

    if-eqz v6, :cond_1

    .line 1185
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mVirtualSimOn:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1191
    :sswitch_47
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 1192
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mVirtualSimOff:Landroid/os/RegistrantList;

    if-eqz v6, :cond_1

    .line 1193
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mVirtualSimOff:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1199
    :sswitch_48
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 1200
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSimPlugOutRegistrants:Landroid/os/RegistrantList;

    if-eqz v6, :cond_2

    .line 1201
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSimPlugOutRegistrants:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    .line 1204
    :cond_2
    iput-object v8, p0, Lcom/android/internal/telephony/MediaTekRIL;->mCfuReturnValue:Ljava/lang/Object;

    goto/16 :goto_2

    .line 1208
    :sswitch_49
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 1209
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSimPlugInRegistrants:Landroid/os/RegistrantList;

    if-eqz v6, :cond_1

    .line 1210
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSimPlugInRegistrants:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1216
    :sswitch_4a
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLog(I)V

    .line 1217
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mCommonSlotNoChangedRegistrants:Landroid/os/RegistrantList;

    if-eqz v6, :cond_1

    .line 1218
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mCommonSlotNoChangedRegistrants:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v8, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1223
    :sswitch_4b
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogvRet(ILjava/lang/Object;)V

    .line 1224
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPlmnChangeNotificationRegistrant:Landroid/os/RegistrantList;

    if-eqz v6, :cond_1

    .line 1225
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPlmnChangeNotificationRegistrant:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1230
    :sswitch_4c
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogvRet(ILjava/lang/Object;)V

    .line 1231
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mRegistrationSuspendedRegistrant:Landroid/os/Registrant;

    if-eqz v6, :cond_1

    .line 1232
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mRegistrationSuspendedRegistrant:Landroid/os/Registrant;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v3, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    :sswitch_4d
    move-object v6, v3

    .line 1238
    check-cast v6, [I

    check-cast v6, [I

    aget v6, v6, v9

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    .line 1239
    .local v5, "scriResult":Ljava/lang/Integer;
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "s:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ":"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object v6, v3

    check-cast v6, [I

    check-cast v6, [I

    aget v6, v6, v9

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1240
    invoke-virtual {p0, v2, v3}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLogRet(ILjava/lang/Object;)V

    .line 1242
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mScriResultRegistrant:Landroid/os/Registrant;

    if-eqz v6, :cond_1

    .line 1243
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mScriResultRegistrant:Landroid/os/Registrant;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v5, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/Registrant;->notifyRegistrant(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1255
    .end local v5    # "scriResult":Ljava/lang/Integer;
    :sswitch_4e
    check-cast v3, [Ljava/lang/String;

    .end local v3    # "ret":Ljava/lang/Object;
    check-cast v3, [Ljava/lang/String;

    invoke-direct {p0, v3}, Lcom/android/internal/telephony/MediaTekRIL;->setCallIndication([Ljava/lang/String;)V

    .line 1256
    const/4 v4, 0x1

    .line 1257
    const/16 v1, 0x3e9

    .line 1258
    goto/16 :goto_2

    .line 1261
    .restart local v3    # "ret":Ljava/lang/Object;
    :sswitch_4f
    invoke-virtual {p0, v2}, Lcom/android/internal/telephony/MediaTekRIL;->unsljLog(I)V

    .line 1263
    iget-object v6, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPsNetworkStateRegistrants:Landroid/os/RegistrantList;

    new-instance v7, Landroid/os/AsyncResult;

    invoke-direct {v7, v8, v8, v8}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v6, v7}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto/16 :goto_2

    .line 1268
    :sswitch_50
    const-string v6, "RILJ"

    const-string v7, "RIL_UNSOL_SMS_READY_NOTIFICATION: stub!"

    invoke-static {v6, v7}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 981
    nop

    :sswitch_data_0
    .sparse-switch
        0x40e -> :sswitch_9
        0x40f -> :sswitch_a
        0x410 -> :sswitch_b
        0x412 -> :sswitch_c
        0xbb8 -> :sswitch_0
        0xbb9 -> :sswitch_1
        0xbba -> :sswitch_1c
        0xbbf -> :sswitch_24
        0xbc0 -> :sswitch_14
        0xbc3 -> :sswitch_15
        0xbc4 -> :sswitch_16
        0xbc5 -> :sswitch_17
        0xbc6 -> :sswitch_3
        0xbc7 -> :sswitch_2
        0xbc8 -> :sswitch_4
        0xbca -> :sswitch_5
        0xbcb -> :sswitch_6
        0xbcc -> :sswitch_18
        0xbcd -> :sswitch_19
        0xbcf -> :sswitch_25
        0xbd0 -> :sswitch_26
        0xbd1 -> :sswitch_7
        0xbd4 -> :sswitch_1d
        0xbd5 -> :sswitch_13
        0xbd6 -> :sswitch_29
        0xbd7 -> :sswitch_1e
        0xbd8 -> :sswitch_1f
        0xbd9 -> :sswitch_20
        0xbda -> :sswitch_21
        0xbdb -> :sswitch_22
        0xbdc -> :sswitch_23
        0xbdd -> :sswitch_2e
        0xbde -> :sswitch_2a
        0xbdf -> :sswitch_27
        0xbe0 -> :sswitch_d
        0xbe1 -> :sswitch_e
        0xbe2 -> :sswitch_f
        0xbe3 -> :sswitch_10
        0xbe4 -> :sswitch_11
        0xbe5 -> :sswitch_1a
        0xbe6 -> :sswitch_1b
        0xbe7 -> :sswitch_8
        0xbe8 -> :sswitch_28
        0xbe9 -> :sswitch_2b
        0xbea -> :sswitch_2c
        0xbeb -> :sswitch_2d
        0xbec -> :sswitch_12
        0xbed -> :sswitch_30
        0xbee -> :sswitch_2f
        0xbef -> :sswitch_31
        0xbf0 -> :sswitch_32
        0xbf1 -> :sswitch_33
        0x1388 -> :sswitch_34
        0x1389 -> :sswitch_35
        0x138a -> :sswitch_36
        0x138b -> :sswitch_37
        0x138c -> :sswitch_38
        0x138d -> :sswitch_39
        0x138e -> :sswitch_3a
        0x138f -> :sswitch_3b
    .end sparse-switch

    .line 1085
    :sswitch_data_1
    .sparse-switch
        0x412 -> :sswitch_3e
        0xbb8 -> :sswitch_3c
        0xbb9 -> :sswitch_3d
        0xbba -> :sswitch_3f
        0xbbe -> :sswitch_50
        0xbbf -> :sswitch_4d
        0xbc0 -> :sswitch_44
        0xbc3 -> :sswitch_45
        0xbc4 -> :sswitch_46
        0xbc5 -> :sswitch_47
        0xbc7 -> :sswitch_4f
        0xbcc -> :sswitch_48
        0xbcd -> :sswitch_49
        0xbcf -> :sswitch_4b
        0xbd0 -> :sswitch_4c
        0xbd1 -> :sswitch_40
        0xbd4 -> :sswitch_42
        0xbd5 -> :sswitch_43
        0xbe2 -> :sswitch_4e
        0xbe5 -> :sswitch_4a
        0xbe7 -> :sswitch_41
    .end sparse-switch
.end method

.method protected responseOperatorInfos(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 20
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 164
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    if-eqz v15, :cond_0

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    if-nez v15, :cond_1

    .line 165
    :cond_0
    const/4 v15, 0x0

    move-object/from16 v0, p0

    iput v15, v0, Lcom/android/internal/telephony/MediaTekRIL;->mSimId:I

    .line 170
    :goto_0
    invoke-virtual/range {p0 .. p1}, Lcom/android/internal/telephony/MediaTekRIL;->responseStrings(Landroid/os/Parcel;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, [Ljava/lang/String;

    move-object v12, v15

    check-cast v12, [Ljava/lang/String;

    .line 173
    .local v12, "strings":[Ljava/lang/String;
    array-length v15, v12

    rem-int/lit8 v15, v15, 0x4

    if-eqz v15, :cond_2

    .line 174
    new-instance v15, Ljava/lang/RuntimeException;

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "RIL_REQUEST_QUERY_AVAILABLE_NETWORKS: invalid response. Got "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    array-length v0, v12

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " strings, expected multiples of 4"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-direct/range {v15 .. v16}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v15

    .line 167
    .end local v12    # "strings":[Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/android/internal/telephony/MediaTekRIL;->mInstanceId:Ljava/lang/Integer;

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v15

    move-object/from16 v0, p0

    iput v15, v0, Lcom/android/internal/telephony/MediaTekRIL;->mSimId:I

    goto :goto_0

    .line 179
    .restart local v12    # "strings":[Ljava/lang/String;
    :cond_2
    const-string v15, "gsm.cops.lac"

    invoke-static {v15}, Landroid/os/SystemProperties;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 180
    .local v7, "lacStr":Ljava/lang/String;
    const/4 v8, 0x0

    .line 181
    .local v8, "lacValid":Z
    const/4 v6, 0x0

    .line 183
    .local v6, "lacIndex":I
    const-string v15, "RILJ"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "lacStr = "

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " lacStr.length="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " strings.length="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    array-length v0, v12

    move/from16 v17, v0

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v15

    if-lez v15, :cond_3

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v15

    rem-int/lit8 v15, v15, 0x4

    if-nez v15, :cond_3

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v15

    div-int/lit8 v15, v15, 0x4

    array-length v0, v12

    move/from16 v16, v0

    div-int/lit8 v16, v16, 0x5

    move/from16 v0, v16

    if-ne v15, v0, :cond_3

    .line 185
    const-string v15, "RILJ"

    const-string v16, "lacValid set to true"

    invoke-static/range {v15 .. v16}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    const/4 v8, 0x1

    .line 189
    :cond_3
    const-string v15, "gsm.cops.lac"

    const-string v16, ""

    invoke-static/range {v15 .. v16}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    new-instance v10, Ljava/util/ArrayList;

    array-length v15, v12

    div-int/lit8 v15, v15, 0x4

    invoke-direct {v10, v15}, Ljava/util/ArrayList;-><init>(I)V

    .line 193
    .local v10, "ret":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/android/internal/telephony/OperatorInfo;>;"
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v15, v12

    if-ge v2, v15, :cond_9

    .line 194
    add-int/lit8 v15, v2, 0x0

    aget-object v15, v12, v15

    if-eqz v15, :cond_4

    add-int/lit8 v15, v2, 0x0

    aget-object v15, v12, v15

    const-string v16, "uCs2"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    const/16 v16, 0x1

    move/from16 v0, v16

    if-ne v15, v0, :cond_4

    .line 195
    const-string v15, "responseOperatorInfos handling UCS2 format name"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 198
    add-int/lit8 v15, v2, 0x0

    :try_start_0
    new-instance v16, Ljava/lang/String;

    add-int/lit8 v17, v2, 0x0

    aget-object v17, v12, v17

    const/16 v18, 0x4

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lcom/android/internal/telephony/MediaTekRIL;->hexStringToBytes(Ljava/lang/String;)[B

    move-result-object v17

    const-string v18, "UTF-16"

    invoke-direct/range {v16 .. v18}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    aput-object v16, v12, v15
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 204
    :cond_4
    :goto_2
    const/4 v15, 0x1

    if-ne v8, v15, :cond_5

    aget-object v15, v12, v2

    if-eqz v15, :cond_5

    .line 205
    invoke-static {}, Lcom/android/internal/telephony/uicc/UiccController;->getInstance()Lcom/android/internal/telephony/uicc/UiccController;

    move-result-object v14

    .line 206
    .local v14, "uiccController":Lcom/android/internal/telephony/uicc/UiccController;
    move-object/from16 v0, p0

    iget v15, v0, Lcom/android/internal/telephony/MediaTekRIL;->mSimId:I

    const/16 v16, 0x1

    invoke-virtual/range {v14 .. v16}, Lcom/android/internal/telephony/uicc/UiccController;->getIccRecords(II)Lcom/android/internal/telephony/uicc/IccRecords;

    move-result-object v3

    .line 207
    .local v3, "iccRecords":Lcom/android/internal/telephony/uicc/IccRecords;
    const/4 v9, -0x1

    .line 208
    .local v9, "lacValue":I
    const/4 v11, 0x0

    .line 209
    .local v11, "sEons":Ljava/lang/String;
    add-int/lit8 v15, v6, 0x4

    invoke-virtual {v7, v6, v15}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 210
    .local v5, "lac":Ljava/lang/String;
    const-string v15, "RILJ"

    new-instance v16, Ljava/lang/StringBuilder;

    invoke-direct/range {v16 .. v16}, Ljava/lang/StringBuilder;-><init>()V

    const-string v17, "lacIndex="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " lacValue="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " lac="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    move-object/from16 v0, v16

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " plmn numeric="

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    add-int/lit8 v17, v2, 0x2

    aget-object v17, v12, v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    const-string v17, " plmn name"

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    add-int/lit8 v17, v2, 0x0

    aget-object v17, v12, v17

    invoke-virtual/range {v16 .. v17}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    const-string v15, ""

    if-eq v5, v15, :cond_5

    .line 213
    const/16 v15, 0x10

    invoke-static {v5, v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v9

    .line 214
    add-int/lit8 v6, v6, 0x4

    .line 215
    const v15, 0xfffe

    if-eq v9, v15, :cond_8

    .line 227
    .end local v3    # "iccRecords":Lcom/android/internal/telephony/uicc/IccRecords;
    .end local v5    # "lac":Ljava/lang/String;
    .end local v9    # "lacValue":I
    .end local v11    # "sEons":Ljava/lang/String;
    .end local v14    # "uiccController":Lcom/android/internal/telephony/uicc/UiccController;
    :cond_5
    :goto_3
    aget-object v15, v12, v2

    if-eqz v15, :cond_7

    aget-object v15, v12, v2

    const-string v16, ""

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_6

    aget-object v15, v12, v2

    add-int/lit8 v16, v2, 0x2

    aget-object v16, v12, v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_7

    .line 228
    :cond_6
    new-instance v4, Lcom/android/internal/telephony/Operators;

    invoke-direct {v4}, Lcom/android/internal/telephony/Operators;-><init>()V

    .line 229
    .local v4, "init":Lcom/android/internal/telephony/Operators;
    add-int/lit8 v15, v2, 0x2

    aget-object v15, v12, v15

    invoke-virtual {v4, v15}, Lcom/android/internal/telephony/Operators;->unOptimizedOperatorReplace(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 230
    .local v13, "temp":Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "lookup RIL responseOperatorInfos() "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    add-int/lit8 v16, v2, 0x2

    aget-object v16, v12, v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, " gave "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 231
    aput-object v13, v12, v2

    .line 232
    add-int/lit8 v15, v2, 0x1

    aput-object v13, v12, v15

    .line 253
    .end local v4    # "init":Lcom/android/internal/telephony/Operators;
    .end local v13    # "temp":Ljava/lang/String;
    :cond_7
    new-instance v15, Lcom/android/internal/telephony/OperatorInfo;

    add-int/lit8 v16, v2, 0x0

    aget-object v16, v12, v16

    add-int/lit8 v17, v2, 0x1

    aget-object v17, v12, v17

    add-int/lit8 v18, v2, 0x2

    aget-object v18, v12, v18

    add-int/lit8 v19, v2, 0x3

    aget-object v19, v12, v19

    invoke-direct/range {v15 .. v19}, Lcom/android/internal/telephony/OperatorInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    add-int/lit8 v2, v2, 0x4

    goto/16 :goto_1

    .line 199
    :catch_0
    move-exception v1

    .line 200
    .local v1, "ex":Ljava/io/UnsupportedEncodingException;
    const-string v15, "responseOperatorInfos UnsupportedEncodingException"

    move-object/from16 v0, p0

    invoke-virtual {v0, v15}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 222
    .end local v1    # "ex":Ljava/io/UnsupportedEncodingException;
    .restart local v3    # "iccRecords":Lcom/android/internal/telephony/uicc/IccRecords;
    .restart local v5    # "lac":Ljava/lang/String;
    .restart local v9    # "lacValue":I
    .restart local v11    # "sEons":Ljava/lang/String;
    .restart local v14    # "uiccController":Lcom/android/internal/telephony/uicc/UiccController;
    :cond_8
    const-string v15, "RILJ"

    const-string v16, "invalid lac ignored"

    invoke-static/range {v15 .. v16}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_3

    .line 261
    .end local v3    # "iccRecords":Lcom/android/internal/telephony/uicc/IccRecords;
    .end local v5    # "lac":Ljava/lang/String;
    .end local v9    # "lacValue":I
    .end local v11    # "sEons":Ljava/lang/String;
    .end local v14    # "uiccController":Lcom/android/internal/telephony/uicc/UiccController;
    :cond_9
    return-object v10
.end method

.method protected responseSignalStrength(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 10
    .param p1, "p"    # Landroid/os/Parcel;

    .prologue
    .line 1870
    invoke-static {p1}, Landroid/telephony/SignalStrength;->makeSignalStrengthFromRilParcel(Landroid/os/Parcel;)Landroid/telephony/SignalStrength;

    move-result-object v9

    .line 1871
    .local v9, "s":Landroid/telephony/SignalStrength;
    new-instance v0, Landroid/telephony/SignalStrength;

    invoke-virtual {v9}, Landroid/telephony/SignalStrength;->getGsmSignalStrength()I

    move-result v1

    invoke-virtual {v9}, Landroid/telephony/SignalStrength;->getGsmBitErrorRate()I

    move-result v2

    invoke-virtual {v9}, Landroid/telephony/SignalStrength;->getCdmaDbm()I

    move-result v3

    invoke-virtual {v9}, Landroid/telephony/SignalStrength;->getCdmaEcio()I

    move-result v4

    invoke-virtual {v9}, Landroid/telephony/SignalStrength;->getEvdoDbm()I

    move-result v5

    invoke-virtual {v9}, Landroid/telephony/SignalStrength;->getEvdoEcio()I

    move-result v6

    invoke-virtual {v9}, Landroid/telephony/SignalStrength;->getEvdoSnr()I

    move-result v7

    const/4 v8, 0x1

    invoke-direct/range {v0 .. v8}, Landroid/telephony/SignalStrength;-><init>(IIIIIIIZ)V

    return-object v0
.end method

.method public separateConnection(ILandroid/os/Message;)V
    .locals 3
    .param p1, "gsmIndex"    # I
    .param p2, "result"    # Landroid/os/Message;

    .prologue
    .line 513
    const/16 v1, 0x34

    invoke-static {v1, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 516
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 519
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 520
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 523
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/MediaTekRIL;->handleChldRelatedRequest(Lcom/android/internal/telephony/RILRequest;)V

    .line 525
    return-void
.end method

.method public setInitialAttachApn(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 9
    .param p1, "apn"    # Ljava/lang/String;
    .param p2, "protocol"    # Ljava/lang/String;
    .param p3, "authType"    # I
    .param p4, "username"    # Ljava/lang/String;
    .param p5, "password"    # Ljava/lang/String;
    .param p6, "result"    # Landroid/os/Message;

    .prologue
    .line 1977
    const-string v0, "RILJ"

    const-string v1, "setInitialAttachApn: operatorNumeric is required on MTK!"

    invoke-static {v0, v1}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 1978
    const-string v6, ""

    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v8, p6

    invoke-virtual/range {v0 .. v8}, Lcom/android/internal/telephony/MediaTekRIL;->setInitialAttachApn(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/os/Message;)V

    .line 1979
    return-void
.end method

.method public setInitialAttachApn(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLandroid/os/Message;)V
    .locals 3
    .param p1, "apn"    # Ljava/lang/String;
    .param p2, "protocol"    # Ljava/lang/String;
    .param p3, "authType"    # I
    .param p4, "username"    # Ljava/lang/String;
    .param p5, "password"    # Ljava/lang/String;
    .param p6, "operatorNumeric"    # Ljava/lang/String;
    .param p7, "canHandleIms"    # Z
    .param p8, "result"    # Landroid/os/Message;

    .prologue
    .line 1984
    const/16 v1, 0x6f

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 1986
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    const-string v1, "Set RIL_REQUEST_SET_INITIAL_ATTACH_APN"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1988
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1989
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1990
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p3}, Landroid/os/Parcel;->writeInt(I)V

    .line 1991
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1992
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p5}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1995
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p6}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1996
    iget-object v2, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    if-eqz p7, :cond_0

    const/4 v1, 0x1

    :goto_0
    invoke-virtual {v2, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 1999
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", apn:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", protocol:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", authType:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", username:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", password:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", operatorNumeric:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", canHandleIms:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 2004
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/MediaTekRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 2005
    return-void

    .line 1996
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setLocalCallHold(I)V
    .locals 4
    .param p1, "lchStatus"    # I

    .prologue
    .line 396
    const/4 v1, 0x1

    new-array v0, v1, [B

    const/4 v1, 0x0

    and-int/lit8 v2, p1, 0x7f

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 397
    .local v0, "payload":[B
    const-string v1, "RILJ"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setLocalCallHold: lchStatus is "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 400
    const-string v1, "RILJ"

    const-string v2, "setLocalCallHold: stub!"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 401
    return-void
.end method

.method public setPreferredNetworkType(ILandroid/os/Message;)V
    .locals 3
    .param p1, "networkType"    # I
    .param p2, "response"    # Landroid/os/Message;

    .prologue
    .line 1958
    const/16 v1, 0x49

    invoke-static {v1, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 1961
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1962
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeInt(I)V

    .line 1964
    iget v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPreferredNetworkType:I

    iput v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPreviousPreferredType:I

    .line 1965
    iput p1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mPreferredNetworkType:I

    .line 1967
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " : "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1970
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/MediaTekRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 1971
    return-void
.end method

.method public setUiccSubscription(IIIILandroid/os/Message;)V
    .locals 6
    .param p1, "slotId"    # I
    .param p2, "appIndex"    # I
    .param p3, "subId"    # I
    .param p4, "subStatus"    # I
    .param p5, "result"    # Landroid/os/Message;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    const/4 v3, 0x0

    .line 1930
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "setUiccSubscription"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1934
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {p5, v0, v3}, Landroid/os/AsyncResult;->forMessage(Landroid/os/Message;Ljava/lang/Object;Ljava/lang/Throwable;)Landroid/os/AsyncResult;

    .line 1935
    invoke-virtual {p5}, Landroid/os/Message;->sendToTarget()V

    .line 1938
    if-ne p4, v5, :cond_1

    .line 1940
    iget-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSubscriptionStatusRegistrants:Landroid/os/RegistrantList;

    if-eqz v0, :cond_0

    .line 1941
    iget-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSubscriptionStatusRegistrants:Landroid/os/RegistrantList;

    new-instance v1, Landroid/os/AsyncResult;

    new-array v2, v5, [I

    aput v5, v2, v4

    invoke-direct {v1, v3, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    .line 1951
    :cond_0
    :goto_0
    return-void

    .line 1944
    :cond_1
    if-nez p4, :cond_0

    .line 1946
    iget-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSubscriptionStatusRegistrants:Landroid/os/RegistrantList;

    if-eqz v0, :cond_0

    .line 1947
    iget-object v0, p0, Lcom/android/internal/telephony/MediaTekRIL;->mSubscriptionStatusRegistrants:Landroid/os/RegistrantList;

    new-instance v1, Landroid/os/AsyncResult;

    new-array v2, v5, [I

    aput v4, v2, v4

    invoke-direct {v1, v3, v2, v3}, Landroid/os/AsyncResult;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1}, Landroid/os/RegistrantList;->notifyRegistrants(Landroid/os/AsyncResult;)V

    goto :goto_0
.end method

.method public setupDataCall(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Message;)V
    .locals 3
    .param p1, "radioTechnology"    # Ljava/lang/String;
    .param p2, "profile"    # Ljava/lang/String;
    .param p3, "apn"    # Ljava/lang/String;
    .param p4, "user"    # Ljava/lang/String;
    .param p5, "password"    # Ljava/lang/String;
    .param p6, "authType"    # Ljava/lang/String;
    .param p7, "protocol"    # Ljava/lang/String;
    .param p8, "result"    # Landroid/os/Message;

    .prologue
    .line 1846
    const/16 v1, 0x1b

    invoke-static {v1, p8}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 1849
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 1851
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p1}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1852
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1853
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1854
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p4}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1855
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p5}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1856
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p6}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1857
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-virtual {v1, p7}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1858
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    const-string v2, "1"

    invoke-virtual {v1, v2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 1860
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 1865
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/MediaTekRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 1866
    return-void
.end method

.method public startDtmf(CLandroid/os/Message;)V
    .locals 4
    .param p1, "c"    # C
    .param p2, "result"    # Landroid/os/Message;

    .prologue
    .line 427
    iget-object v2, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    monitor-enter v2

    .line 428
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v1}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->hasSendChldRequest()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v1}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->size()I

    move-result v1

    iget-object v3, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v3, 0x20

    if-ge v1, v3, :cond_0

    .line 429
    iget-object v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v1}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->isStart()Z

    move-result v1

    if-nez v1, :cond_1

    .line 430
    const/16 v1, 0x31

    invoke-static {v1, p2}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 432
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v1, v0, Lcom/android/internal/telephony/RILRequest;->mParcel:Landroid/os/Parcel;

    invoke-static {p1}, Ljava/lang/Character;->toString(C)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 433
    iget-object v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v1}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->start()V

    .line 434
    iget-object v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v1, v0}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->add(Lcom/android/internal/telephony/RILRequest;)V

    .line 435
    iget-object v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v1}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->size()I

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    .line 436
    const-string v1, "send start dtmf"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 437
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "> "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 438
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/MediaTekRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 444
    .end local v0    # "rr":Lcom/android/internal/telephony/RILRequest;
    :cond_0
    :goto_0
    monitor-exit v2

    .line 446
    return-void

    .line 441
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DTMF status conflict, want to start DTMF when status is "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v3}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->isStart()Z

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    goto :goto_0

    .line 444
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public stopDtmf(Landroid/os/Message;)V
    .locals 4
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    .line 452
    iget-object v2, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    monitor-enter v2

    .line 453
    :try_start_0
    iget-object v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v1}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->hasSendChldRequest()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v1}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->size()I

    move-result v1

    iget-object v3, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v3, 0x20

    if-ge v1, v3, :cond_0

    .line 454
    iget-object v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v1}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->isStart()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 455
    const/16 v1, 0x32

    invoke-static {v1, p1}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 457
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    iget-object v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v1}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->stop()V

    .line 458
    iget-object v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v1, v0}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->add(Lcom/android/internal/telephony/RILRequest;)V

    .line 459
    iget-object v1, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v1}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->size()I

    move-result v1

    const/4 v3, 0x1

    if-ne v1, v3, :cond_0

    .line 460
    const-string v1, "send stop dtmf"

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 461
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, "> "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v3, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v3}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 462
    invoke-virtual {p0, v0}, Lcom/android/internal/telephony/MediaTekRIL;->send(Lcom/android/internal/telephony/RILRequest;)V

    .line 468
    .end local v0    # "rr":Lcom/android/internal/telephony/RILRequest;
    :cond_0
    :goto_0
    monitor-exit v2

    .line 470
    return-void

    .line 465
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DTMF status conflict, want to start DTMF when status is "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v3, p0, Lcom/android/internal/telephony/MediaTekRIL;->mDtmfReqQueue:Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;

    invoke-virtual {v3}, Lcom/android/internal/telephony/MediaTekRIL$dtmfQueueHandler;->isStart()Z

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    goto :goto_0

    .line 468
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public switchWaitingOrHoldingAndActive(Landroid/os/Message;)V
    .locals 3
    .param p1, "result"    # Landroid/os/Message;

    .prologue
    .line 475
    const/16 v1, 0xf

    invoke-static {v1, p1}, Lcom/android/internal/telephony/RILRequest;->obtain(ILandroid/os/Message;)Lcom/android/internal/telephony/RILRequest;

    move-result-object v0

    .line 479
    .local v0, "rr":Lcom/android/internal/telephony/RILRequest;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lcom/android/internal/telephony/RILRequest;->serialString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "> "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, v0, Lcom/android/internal/telephony/RILRequest;->mRequest:I

    invoke-static {v2}, Lcom/android/internal/telephony/MediaTekRIL;->requestToString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/internal/telephony/MediaTekRIL;->riljLog(Ljava/lang/String;)V

    .line 482
    invoke-direct {p0, v0}, Lcom/android/internal/telephony/MediaTekRIL;->handleChldRelatedRequest(Lcom/android/internal/telephony/RILRequest;)V

    .line 484
    return-void
.end method

.method public updateStackBinding(IILandroid/os/Message;)V
    .locals 4
    .param p1, "stack"    # I
    .param p2, "enable"    # I
    .param p3, "response"    # Landroid/os/Message;

    .prologue
    .line 414
    const/4 v1, 0x2

    new-array v0, v1, [B

    const/4 v1, 0x0

    int-to-byte v2, p1

    aput-byte v2, v0, v1

    const/4 v1, 0x1

    int-to-byte v2, p2

    aput-byte v2, v0, v1

    .line 415
    .local v0, "payload":[B
    const-string v1, "RILJ"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "UpdateStackBinding: on Stack: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ", enable/disable: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 419
    const-string v1, "RILJ"

    const-string v2, "UpdateStackBinding: stub!"

    invoke-static {v1, v2}, Landroid/telephony/Rlog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 420
    return-void
.end method
